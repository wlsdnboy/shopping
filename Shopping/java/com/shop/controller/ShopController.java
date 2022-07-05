package com.shop.controller;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.domain.CartListVO;
import com.shop.domain.CartVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.MemberVO;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;
import com.shop.service.ShopService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/shopdetail/*")
@AllArgsConstructor
public class ShopController {

	private ShopService service;

	@GetMapping("/list")
	public void shoppingList(@RequestParam("c") int cateCode, Model model) {

		List<GoodsViewVO> list = null;
		list = service.list(cateCode);

		model.addAttribute("list", list);
	}

	@GetMapping("/home")
	public void test(Model model) {

		List<GoodsViewVO> list = null;
		list = service.home();

		model.addAttribute("list", list);
	}

	@GetMapping("/view")
	public void getView(@RequestParam("gdsNum") int gdsNum, Model model, @RequestParam("c") int cateCode) {
		GoodsViewVO view = service.goodsView(gdsNum);
		model.addAttribute("view", view);

		service.changeGdsCnt(gdsNum);

		List<GoodsViewVO> list = null;
		list = service.list(cateCode);

		model.addAttribute("list", list);
	}

	@GetMapping("/view1")
	public void getView1(@RequestParam("gdsNum") int gdsNum, Model model) {
		GoodsViewVO view = service.goodsView(gdsNum);
		model.addAttribute("view", view);

		service.changeGdsCnt(gdsNum);

		List<GoodsViewVO> list = null;
		list = service.home();

		model.addAttribute("list", list);

	}

	@ResponseBody
	@PostMapping("/view/addCart")
	public void addCart(CartVO cart, Principal principal) {

		cart.setUserId(principal.getName());

		service.addCart(cart);

	}

	@GetMapping("/cartList")
	public void getCartList(Principal principal, Model model, MemberVO member) {
		String userId = principal.getName();

		List<CartListVO> cartList = service.cartList(userId);

		model.addAttribute("cartList", cartList);

		model.addAttribute("member", member);
	}

	@ResponseBody
	@PostMapping("/deleteCart")
	public int deleteCart(@RequestParam(value = "chbox[]") List<String> chArr, CartVO cart, Principal principal) {
		String userId = principal.getName();
		log.info("삭제 완료");
		int result = 0;
		int cartNum = 0;

		if (principal.getName() != null) {
			cart.setUserId(userId);

			for (String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}
			result = 1;
		}
		return result;
	}

	@PostMapping("/cartList")
	public String order(OrderVO order, OrderDetailVO orderDetail, Principal principal) {

		String userId = principal.getName();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}
		String orderId = ymd + "_" + subNum;

		order.setOrderId(orderId);
		order.setUserId(userId);

		service.orderInfo(order);
		orderDetail.setOrderId(orderId);
		service.orderInfo_Details(orderDetail);

		service.cartAllDelete(userId);

		return "redirect:/shopdetail/orderList";

	}

	@GetMapping("/orderList")
	public void getOrderList(OrderVO order, Model model, Principal principal) {

		String userId = principal.getName();

		order.setUserId(userId);

		List<OrderVO> orderList = service.orderList(order);

		model.addAttribute("orderList", orderList);

	}

	@GetMapping("/orderView")
	public void getOrderList(@RequestParam("n") String orderId, OrderVO order, Model model, Principal principal) {
		String userId = principal.getName();

		order.setUserId(userId);
		order.setOrderId(orderId);

		List<OrderListVO> orderView = service.orderView(order);

		log.info(orderView);
		model.addAttribute("orderView", orderView);

	}

	@PostMapping("/orderView")
	public String deleteOrderView(@RequestParam("n") String orderId) {

		service.orderDelete(orderId);
		service.orderDelete1(orderId);

		return "redirect:/shopdetail/orderList";
	}

	@GetMapping("/ranking")
	public void ranking(Model model) {

		List<GoodsViewVO> list = null;
		list = service.goodViewCnt();

		model.addAttribute("list", list);

	}

}
