package com.bitc.project.controller;

import java.nio.charset.Charset;
import java.util.List;

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

import com.bitc.project.service.ImageBoardCommentService;
import com.bitc.project.service.ImageBoardService;
import com.bitc.project.util.Criteria;
import com.bitc.project.util.SearchCriteria;
import com.bitc.project.vo.ImageBoardCommentVO;
import com.bitc.project.vo.ImageBoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/imageBoard")
public class ImageBoardController {

	private final ImageBoardService is;
	private final ImageBoardCommentService ics;
	
	// 페이징 처리된 게시글 리스트 목록 가져오기
	@GetMapping("imgBoard_list")
	public void imgBoardList(SearchCriteria cri, Model model) throws Exception {
		cri.setPerPageNum(6);
		model.addAttribute("imgBoardList",is.imageBoardList(cri));
		model.addAttribute("pm",is.getPageMaker(cri));
	}
	
	// 검색결과 리스트
	@PostMapping("imgBoard_list")
	public void SearchList(SearchCriteria cri, Model model) throws Exception{
		cri.setPerPageNum(6);
		List<ImageBoardVO> list = is.searchList(cri);
		model.addAttribute("imgBoardList",list);
		model.addAttribute("pm",is.getSearchPM(cri));
	}

	// 게시글 작성 페이지
	@GetMapping("imgBoard_form")
	public void imgBoardForm() {}
	
	// 게시글 작성 처리
	@PostMapping("create")
	public String create(ImageBoardVO vo) throws Exception {
		is.createImageBoard(vo);
		return "redirect:imgBoard_list";
	}
	
	// 게시글 상세보기
	@GetMapping("read/{bno}")
	public String read(@PathVariable int bno,Criteria cri,Model model) throws Exception 
	{
		// 조회수 증가
		is.updateCnt(bno);
		cri.setPerPageNum(10);
		model.addAttribute("pm",ics.getPageMaker(cri, bno));
		model.addAttribute("comments",ics.getCommentList(cri,bno));
		model.addAttribute("vo",is.read(bno));
		return "/imageBoard/imgBoard_detail";
	}
	
	// 게시글 삭제 처리 -> DB 삭제 여부 추가(boolean) 
	// (댓글 DB가 게시글 DB를 참조하고 있어서 물리적 삭제 x)
	// 0 : false(안삭제)
	// 1 : true(삭제)
	@PostMapping("read/delete")
	public String delete(int bno) throws Exception
	{
		is.delete(bno);
		return "redirect:/imageBoard/imgBoard_list";
	}
	
	// 게시글 상세보기 페이지 이동
	@GetMapping("imgBoard_detail")
	public void imgBoard_detail() {}
	
	// 게시글 수정 페이지 이동(해당 게시글 정보 vo객체로 전달)
	@PostMapping("read/modify")
	public String modify(int bno,Model model) throws Exception {
		model.addAttribute("vo",is.read(bno));
		return "/imageBoard/imgBoard_modify";
	}
	
	// 게시글 수정 요청
	@PostMapping("read/modify_submit")
	public String update(ImageBoardVO vo) throws Exception{
		is.update(vo);
		return "redirect:"+vo.getBno();
	}
	
	/**
	 *  댓글요청 처리 (ajax) 
	 *  ics가 처리해줌 
	 */
	// 댓글작성 요청 처리 
	@PostMapping("read/commentWrite")
	public ResponseEntity<String> commentWrite(ImageBoardCommentVO vo) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));
		try {
			String message = ics.create(vo);
			entity = new ResponseEntity<>(message,headers,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(),headers,HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 삭제 요청 처리
	@DeleteMapping(value="read/commentDel/{cno}", produces="application/json; charset=utf8")
	@ResponseBody
	public String commentDelete(@PathVariable(name="cno") int cno) throws Exception{
		return ics.delete(cno);
	}
	
	// 댓글 수정 요청 처리
	@PatchMapping(value = "read/commentMod" , produces="application/json; charset=utf8")
	@ResponseBody
	public String commentModify(@RequestBody ImageBoardCommentVO vo) throws Exception{
		return ics.modify(vo);
	}
}
