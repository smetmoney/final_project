package com.bitc.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.service.NoticeService;
import com.bitc.project.util.Criteria;
import com.bitc.project.vo.MemberVO;
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
		// 추후 삭제 
		model.addAttribute("userId", "admin");
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
	public void newNotice(MemberVO vo, Model model) {
		// 추후 삭제
		vo = new MemberVO();
		vo.setId("ADMIN");
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("newNotice")
	public String newNoticePost(NoticeVO vo, RedirectAttributes rttr
			//, String editor
			) throws Exception {
		//vo.setContent(editor);
		String result = ns.newNotice(vo);
		rttr.addFlashAttribute("result", result);
		return "redirect:noticeList";
	}
	
	
	@GetMapping("editNotice")
	public void editNoitce(int bno, Model model) throws Exception {
		NoticeVO vo = ns.readNotice(bno);
		model.addAttribute("vo", vo);
		
	}
	
	@PostMapping("editNotice")
	public String editNoticePost(NoticeVO vo, RedirectAttributes rttr) throws Exception {
		String result = ns.editNotice(vo);
		rttr.addFlashAttribute("result", result);
		return "redirect:noticeList";
	}
	
	
	@GetMapping("deleteNotice")
	public String deleteNotice(int bno, RedirectAttributes rttr) throws Exception{
		String result = ns.deleteNotice(bno);
		rttr.addFlashAttribute("result",result);
		return "redirect:/notice/noticeList";
	}
	

	
}
