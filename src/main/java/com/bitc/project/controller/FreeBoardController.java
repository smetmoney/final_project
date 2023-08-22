package com.bitc.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.service.FreeBoardCommentSerivce;
import com.bitc.project.service.FreeBoardService;
import com.bitc.project.util.Criteria;
import com.bitc.project.util.PageMaker;
import com.bitc.project.vo.FreeBoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/freeBoard")
@RequiredArgsConstructor
public class FreeBoardController {
	
	private final FreeBoardService fs;
	private final FreeBoardCommentSerivce fcs;
	
	@GetMapping("freeBoard_list")
	public void freeBoardList(Criteria cri, Model model) throws Exception {
		cri.setPerPageNum(10);
		List<FreeBoardVO> list = fs.freeBoardList(cri);
		model.addAttribute("freeBoardList",list);
		PageMaker pm = fs.getPageMaker(cri);
		model.addAttribute("pm",pm);
	}
	
	@GetMapping("create")
	public String create() throws Exception {
		return "/freeBoard/freeBoard_form";
	}
	
	@PostMapping("create")
	public String create(FreeBoardVO vo) throws Exception {
		fs.regist(vo);
		return "redirect:freeBoard_list";
	}
	
	@GetMapping("read")
	public String read(int bno,Model model) throws Exception 
	{
		FreeBoardVO vo = fs.read(bno);
		// model.addAttribute("comments",fcs.getCommentList(bno));
		model.addAttribute("post",vo);
		return "/freeBoard/freeBoard_detail";
	}
	
	// 게시글 상세보기 페이지 이동
	@GetMapping("freeBoard_detail")
	public String imgBoard_detail(int bno, RedirectAttributes rttr) throws Exception {
		// 조회수 증가
		fs.updateCnt(bno);
		rttr.addAttribute("bno",bno);
		return "redirect:read";
	}
	
}
