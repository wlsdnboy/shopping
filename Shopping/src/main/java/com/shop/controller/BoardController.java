package com.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.domain.BoardVO;
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
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
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
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get");
		model.addAttribute("board", service.get(bno));
	}

}
