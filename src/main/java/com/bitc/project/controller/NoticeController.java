package com.bitc.project.controller;

import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.util.PageMaker;
import com.bitc.project.service.NoticeCommentService;
import com.bitc.project.vo.NoticeCommentVO;
import com.bitc.project.service.NoticeService;
import com.bitc.project.util.Criteria;
import com.bitc.project.vo.NoticeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/notice/*")
public class NoticeController {
	
	private final NoticeService ns;
	private final NoticeCommentService ncs;
	
	@GetMapping("noticeList")
	public void noticeList(Model model, Criteria cri) throws Exception {
		cri.setPerPageNum(10);
		List<NoticeVO> noticeList= ns.readNoticeList(cri);
		List<NoticeVO> fixedNoticeList = ns.fixedNoticeList(); 
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("fixedNoticeList", fixedNoticeList);
		model.addAttribute("pm",ns.getPageMaker(cri));
	}
	
	@GetMapping("noticeDetail")
	public void noticeDetail(Model model, int bno)throws Exception{
		ns.updateVcnt(bno);
		NoticeVO vo = ns.readNotice(bno);
		model.addAttribute("vo", vo);
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
	
	
	
	/* ===========댓 글 처 리=========== */

	@PostMapping("")
	@ResponseBody
	public ResponseEntity<String> addComment(NoticeCommentVO vo) {
		System.out.println(vo);
		ResponseEntity<String> entity = null;
		// response header 설정 정보 추가 -- springframework headers
		HttpHeaders headers = new HttpHeaders();
		//   application/json
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setContentType(new MediaType("application","json",Charset.forName("utf-8")));
		try {
			String message = ncs.addComment(vo);
			// 필수 값은 상태 코드
			entity = new ResponseEntity<>(message,headers,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(
					e.getMessage(),
					headers,
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	// 전체 댓글 목록
	@GetMapping("/all/{bno}")
	@ResponseBody
	public List<NoticeCommentVO> list(
			@PathVariable(name="bno") int bno
			) throws Exception{
		System.out.println(bno);
		List<NoticeCommentVO> list = ncs.commentList(bno);
		System.out.println(list);
		return list;
	}
	// comments/{cno}
	@PatchMapping("/{cno}")
	@ResponseBody
	public String update(
			@PathVariable(name="cno") int cno,
			@RequestBody NoticeCommentVO vo
			) throws Exception{
		System.out.println(vo);
		vo.setCno(cno);
		System.out.println(vo);
		String result = ncs.updateComment(vo);
		return result;
	}

	// comments/{cno}
	@DeleteMapping("/{cno}")
	@ResponseBody
	public String delete(
			@PathVariable(name="cno") int cno
			) throws Exception{
		String result = ncs.deleteComment(cno);
		return result;
	}
	
	// 페이징 처리된 게시글 목록
	// comments/bno/page
	@GetMapping("/{bno}/{page}")
	@ResponseBody
	// 페이징 처리된 게시글 목록
	// 이동할 수 있는 페이지 번호의 정보를 저장하는 페이징 블럭
	// List<NoticeCommentVO>, PageMaker
	public Map<String,Object> listPage(
			@PathVariable(name="bno") int bno,
			@PathVariable(name="page") int page
			)throws Exception{
		Map<String, Object> map = new HashMap<>();
		Criteria cri = new Criteria(page,5);
		List<NoticeCommentVO> list = ncs.commentListPage(bno,cri);
		PageMaker pm = ncs.getPageMaker(bno, cri);
		map.put("pm", pm);
		map.put("list", list);
		return map;
	}	

	
}
