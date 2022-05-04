package com.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.domain.BoardVO;
import com.shop.domain.Criteria;
import com.shop.domain.PageDTO;
import com.shop.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;

	/*
	 * @GetMapping : 페이지 요청 방식이 get일 경우.
	 * 
	 * @PostMapping : 페이지 요청 방식이 post일 경우.
	 */
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 550));
		// 과거 jsp에서는 request.setAttribute로 ArrayList를 전달했지만
		// , 같은 역할을 model이 대신.
		// 컨트롤러 >> 서비스 >> 매퍼 >> mybatis
	}

	@GetMapping("/index")
	public void index() {

	}

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		//@ModelAttribut("cri")는 자동으로 객체 할당 저장
		//자동으로 설정된 Criteria cri를 모델 값으로 저장한다
		//저장명이 cri
		
		log.info("/get");
		
		
		
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "글 수정이 완료되었습니다");

		}
		return "redirect:/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove" + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "글 삭제가 완료 되었습니다");
		}
		return "redirect:/list";

	}

}
