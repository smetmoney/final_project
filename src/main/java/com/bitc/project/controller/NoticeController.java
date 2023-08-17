package com.bitc.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public void noticeList(Model model, Criteria cri) throws Exception {
		cri.setPerPageNum(10);
		List<NoticeVO> noticeList= ns.readNoticeList(cri);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pm",ns.getPageMaker(cri));
	}
	
	@GetMapping("noticeDetail")
	public void noticeDetail(Model model, int bno)throws Exception{
		ns.updateVcnt(bno);
		NoticeVO vo = ns.readNotice(bno);
		model.addAttribute("vo", vo);
		// 추후 삭제 
		model.addAttribute("userId", "admin");
	}
	/*
	 * @GetMapping("likeCount") public String likeCount (Model model, int bno,
	 * RedirectAttributes rttr)throws Exception{ String result =
	 * ns.upadateLcnt(bno); rttr.addFlashAttribute("result",result);
	 * model.addAttribute("result", result); return
	 * "redirect:noticeDetail?bno="+bno; }
	 */
	@GetMapping("newNotice")
	public void newNotice() {
		
	}
	
	@GetMapping("editNotice")
	public void editNoitce() {
		
	}
	
	@GetMapping("deleteNotice")
	public String deleteNotice(int bno, RedirectAttributes rttr) throws Exception{
		String result = ns.deleteNotice(bno);
		rttr.addFlashAttribute("result",result);
		return "redirect:/notice/noticeList";
	}
	
}
