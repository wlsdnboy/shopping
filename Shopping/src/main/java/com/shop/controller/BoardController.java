package com.shop.controller;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.domain.BoardAttachVO;
import com.shop.domain.BoardVO;
import com.shop.domain.Criteria;
import com.shop.domain.MemberVO;
import com.shop.domain.PageDTO;
import com.shop.service.BoardService;
import com.shop.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class BoardController {
	private MemberService member;
	private BoardService service;

	/*
	 * @GetMapping : 페이지 요청 방식이 get일 경우.
	 * 
	 * @PostMapping : 페이지 요청 방식이 post일 경우.
	 */
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		/*
		 * // log.info("list"); // model.addAttribute("list", service.getList(cri));
		 * 
		 * log.info("list: " + cri); int total = service.getTotal(cri);
		 * model.addAttribute("list", service.getList(cri));
		 * model.addAttribute("pageMaker", new PageDTO(cri, total));
		 * 
		 * // 과거 jsp에서는 request.setAttribute로 ArrayList를 전달했지만 // , 같은 역할을 model이 대신. //
		 * 컨트롤러 >> 서비스 >> 매퍼 >> mybatis
		 */

		log.info("list");
		model.addAttribute("list", service.getList(cri));
		// 컨트롤러 >>> 서비스 >>> 매퍼 >>> mybatis
		// /WEB-INF/views/list.jsp
		// 컨트롤러에서 리턴하는 문자열이 없다면 요청한 URL과 매칭되는 jsp를 우선 검색.
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		// 임의로 총게시물 190으로 설정.

		log.info("pageMaker :" + (new PageDTO(cri, total)));
	}

	@GetMapping("/index")
	public void index() {

	}

	@GetMapping("/shopdetail")
	public void logintest() {

	}

	@GetMapping("/signUp")
	public void signUp() {

	}

	@PostMapping("/signUp")
	public String newSignUp(MemberVO vo, RedirectAttributes rttr) {

		log.info("signup ");
		member.register(vo);

		return "redirect:/customLogin";
	}

	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {

	}

	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("register : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") Criteria cri) {
		// @ModelAttribut("cri")는 자동으로 객체 할당 저장
		// 자동으로 설정된 Criteria cri를 모델 값으로 저장한다
		// 저장명이 cri

		log.info("/get");

		model.addAttribute("board", service.get(bno));
	}

	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr, Criteria cri) {
		log.info("modify" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "글 수정이 완료되었습니다");

		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/list";
	}

	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr, Criteria cri, String writer) {
		log.info("remove" + bno);

		List<BoardAttachVO> attachList = service.getAttachList(bno);

		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "글 삭제가 완료 되었습니다");
			deleteFiles(attachList);

		}

		/*
		 * rttr.addAttribute("pageNum", cri.getPageNum()); rttr.addAttribute("amount",
		 * cri.getAmount()); rttr.addAttribute("type", cri.getType());
		 * rttr.addAttribute("keyword", cri.getKeyword());
		 */
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/list";

	}

	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
		log.info("getAttachList: " + bno);

		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}

	private void deleteFiles(List<BoardAttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach file......");
		log.info(attachList);
		attachList.forEach(attach -> {
			try {
				java.nio.file.Path file = Paths.get(
						"c:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
	}
}
