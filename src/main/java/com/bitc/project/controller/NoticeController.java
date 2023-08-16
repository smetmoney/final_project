package com.bitc.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.project.service.NoticeService;
import com.bitc.project.util.Criteria;
import com.bitc.project.vo.NoticeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/notice/*")
public class NoticeController {
	
	private final NoticeService ns;
	
	@GetMapping("noticeList")
	public void qna(Model model, Criteria cri) throws Exception {
		cri.setPerPageNum(10);
		List<NoticeVO> noticeList= ns.readNoticeList(cri);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pm",ns.getPageMaker(cri));
	}
}
