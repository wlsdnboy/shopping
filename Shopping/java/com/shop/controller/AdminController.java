package com.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.MemberVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;
import com.shop.service.CategoryService;
import com.shop.utils.UploadFileUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Log4j
@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {

	private CategoryService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@GetMapping("/adminIndex")
	public void adminIndex() {

	}

	@GetMapping("/goods/register")
	public void shopRegster(Model model) {

		List<CategoryVO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	@PostMapping("/goods/register")
	public String shopRegster(GoodsVO vo, MultipartHttpServletRequest request) throws Exception {

		MultipartFile file = request.getFile("file");
		String imgUploadPath = uploadPath + File.separator + "imgUpload"; // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름

		if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) { // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된
																							// 파일이 이름이 없다면)

			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			// gdsImg에 원본 파일 경로 + 파일명 저장
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName); // gdsThumbImg에 썸네일 파일 경로
																								// + 썸네일 파일명 저장
			vo.setGdsThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 첨부된 파일이 없으면 log.info(true);

			fileName = File.separator + "images" + File.separator + "none.jpg"; // 미리 준비된 none.png파일을 대신 출력함

			vo.setGdsImg(fileName);
			vo.setGdsThumbImg(fileName);

		}
		service.register(vo);

		return "redirect:/admin/adminIndex";
	}

	@GetMapping("/goods/list")
	public void goodslist(Model model) {
		List<GoodsViewVO> list = service.goodslist();
		model.addAttribute("list", list);
	}

	@GetMapping("/goods/view")
	public void goodsView(@RequestParam("gdsNum") int gdsNum, Model model) {
		GoodsViewVO goods = service.goodsView(gdsNum);

		model.addAttribute("goods", goods);

	}

	@GetMapping("/goods/modify")
	public void goodsViewModiy(@RequestParam("gdsNum") int gdsNum, Model model) {
		GoodsViewVO goods = service.goodsView(gdsNum);

		model.addAttribute("goods", goods);

		List<CategoryVO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	@PostMapping("/goods/modify")
	public String goodsModify(GoodsVO vo, MultipartFile file, HttpServletRequest req) throws IOException, Exception {

		if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {

			// 기존 파일 삭제
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("gdsThumbImg")).delete();

			// 새로운 파일 등록 //seporator란 실행중인 os에 해당하는 구분자를 리턴한다
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			// 날짜 폴더에 저장
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setGdsThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else {
			vo.setGdsImg(req.getParameter("gdsImg"));
			vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
		}

		service.goodsModify(vo);

		return "redirect:/admin/adminIndex";
	}

	@PostMapping("/goods/delete")
	public String goodsDelete(@RequestParam("gdsNum") int gdsNum) {
		service.goodsDelete(gdsNum);

		return "redirect:/admin/adminIndex";

	}

	@GetMapping("/shop/orderList")
	public void getOrderList(Model model) {
		List<OrderVO> orderList = service.orderList();

		model.addAttribute("orderList", orderList);
	}

	@GetMapping("/shop/orderView")
	public void getOrderList(@RequestParam("n") String orderId, OrderVO order, Model model) {

		order.setOrderId(orderId);
		List<OrderListVO> orderView = service.orderView(order);

		model.addAttribute("orderView", orderView);

	}

	@GetMapping("/shop/orderView1")
	public void getOrderList1(@RequestParam("n") String orderId, OrderVO order, Model model) {

		order.setOrderId(orderId);
		List<OrderListVO> orderView = service.orderView(order);

		model.addAttribute("orderView", orderView);

	}

	@PostMapping("/shop/orderView")
	public String delivery(OrderVO order) {
		service.delivery(order);

		return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
	}

	@PostMapping("/shop/orderView1")
	public String delivery1(OrderVO order) {
		service.delivery(order);

		List<OrderListVO> orderView = service.orderView(order);
		GoodsVO goods = new GoodsVO();

		for (OrderListVO i : orderView) {
			goods.setGdsNum(i.getGdsNum());
			goods.setGdsStock(i.getCartStock());
			service.changeStock(goods);

		}

		return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
	}

	@GetMapping("/member/list")
	public void memberList(Model model) {
		model.addAttribute("memberList", service.getMemberList());
	}

	@PostMapping("/member/list")
	public void postMemberList(MemberVO vo) {
		service.memberUpdate(vo);
	}

	@GetMapping("/member/memberView")
	public void memberView(@RequestParam("n") String userid, MemberVO vo, Model model) {

		vo.setUserid(userid);

		List<MemberVO> member = service.getMember(vo);
		log.info(vo);
		model.addAttribute("member", member);

	}

	@PostMapping("/member/memberView")
	public String memberView(MemberVO vo) {

		service.memberUpdate(vo);

		return "redirect:/admin/member/list";

	}

	@GetMapping("/member/delete")
	public void memberDelete(@RequestParam("n") String userid, Model model) {
		MemberVO vo = service.read(userid);

		model.addAttribute("member", vo);
	}

	@PostMapping("/member/delete")
	public String deletePost(MemberVO vo, @RequestParam("n") String userid) {
		vo.setUserid(userid);

		service.deleteMember(vo);

		return "redirect:/admin/member/list";
	}

}
