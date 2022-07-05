package com.shop.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.domain.CartListVO;
import com.shop.domain.MemberVO;
import com.shop.domain.OrderVO;
import com.shop.service.MemberService;
import com.shop.service.ShopService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/my/*")
@AllArgsConstructor
public class MyController {

	private MemberService service;
	private ShopService shopservice;

	@GetMapping("/index")
	public void index(Principal principal, Model model, OrderVO ordervo) {
		String id = (String) principal.getName();
		log.info(id);

		MemberVO vo = service.read(id);

		String userid = principal.getName();

		ordervo.setUserId(userid);

		List<OrderVO> orderList = shopservice.orderList(ordervo);

		model.addAttribute("orderList", orderList);

		List<CartListVO> cartList = shopservice.cartList(userid);

		model.addAttribute("cartList", cartList);

		log.info(cartList);
		model.addAttribute("vo", vo);
		log.info("C: 회원정보보기 GET의 VO " + vo);

	}

	@Inject
	BCryptPasswordEncoder pwdEncoder;

	@PostMapping("/index")
	public String updateIndex(Principal principal, MemberVO vo) {

		String inputpw = vo.getUserpw();
		String pwd = pwdEncoder.encode(inputpw);
		vo.setUserpw(pwd);

		service.updateMember(vo);

		return "redirect:/my/index";
	}

	@GetMapping("/delete")
	public void delete(Principal principal, Model model) {
		String id = principal.getName();

		MemberVO vo = service.read(id);

		model.addAttribute("member", vo);
	}

	@PostMapping("/delete")
	public String deletePost(MemberVO vo, Principal principal) {
		service.deleteMember(vo);

		SecurityContextHolder.clearContext();

		return "redirect:/index";
	}
}
