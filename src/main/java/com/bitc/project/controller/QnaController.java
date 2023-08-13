package com.bitc.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.project.service.QnaServiceImpl;
import com.bitc.project.vo.QnaVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/qna/*")
@RequiredArgsConstructor
public class QnaController {
	
	private final QnaServiceImpl qs;
	
	@GetMapping("qna_page")
	public void qna(Model model) {
		model.addAttribute("userId", "admin");
		List<QnaVO> qnaList= new ArrayList<QnaVO>();
		try {
			qnaList = qs.qnaList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("qnaList", qnaList);
	}
	
	@GetMapping("new_qna")
	public void newQna() {
	}
}
