package com.bitc.project.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.service.QnaService;
import com.bitc.project.vo.QnaVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/qna/*")
@RequiredArgsConstructor
public class QnaController {
	
	private final QnaService qs;
	
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
	public String makeNewQna(QnaVO vo, RedirectAttributes rttr) throws Exception {
		String result = qs.newQna(vo);
		rttr.addFlashAttribute("result",result);
		return "redirect:/qna/qnaPage"; 
	}
	
	
	@GetMapping("editQna")
	public void editQna(@RequestParam("qnaId") int qnaId, Model model) throws Exception {
		QnaVO vo = qs.qnaLoad(qnaId);
		model.addAttribute("QnaVO", vo);
		String qc = vo.getQuestionContent();
		System.out.println(qc);
	}
	
	
}
