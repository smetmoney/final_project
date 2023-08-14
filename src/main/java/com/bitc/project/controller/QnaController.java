package com.bitc.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitc.project.service.QnaServiceImpl;
import com.bitc.project.vo.QnaVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/qna/*")
@RequiredArgsConstructor
public class QnaController {
	
	private final QnaServiceImpl qs;
	
	@GetMapping("qnaPage")
	public void qna(Model model) throws Exception {
		// 추후 삭제
		model.addAttribute("userId", "admin");
		List<QnaVO> qnaList= qs.qnaList();
		model.addAttribute("qnaList", qnaList);
	}
	
	@GetMapping("newQna")
	public void newQna(Model model) throws Exception {	
		// 추후 삭제 
		model.addAttribute("userId", "admin");
	}
	@PostMapping("newQna")
	public String makeNewQna(QnaVO vo) throws Exception {
		qs.newQna(vo);
		return "qnaPage";
	}
	
	
	@GetMapping("editQna")
	public void editQna(Model model,
			@RequestParam int qnaId) {
		// 추후 삭제 
		model.addAttribute("userId", "admin");
	}
}
