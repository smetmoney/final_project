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
import com.bitc.project.util.FileUtils;
import com.bitc.project.util.PageMaker;
import com.bitc.project.vo.ImageBoardCommentVO;
import com.bitc.project.vo.ImageBoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/imageBoard")
public class ImageBoardController {

	private final ImageBoardService is;
	private final ImageBoardCommentService ics;
	
	@GetMapping("imgBoard_list")
	public void imgBoardList(Criteria cri, Model model) throws Exception {
		cri.setPerPageNum(6);
		List<ImageBoardVO> list = is.imageBoardList(cri);
		model.addAttribute("imgBoardList",list);
		PageMaker pm = is.getPageMaker(cri);
		model.addAttribute("pm",pm);
	}

	@GetMapping("imgBoard_form")
	public void imgBoardForm() {}
	
	@PostMapping("create")
	public String create(ImageBoardVO vo) throws Exception {
		is.createImageBoard(vo);
		return "redirect:imgBoard_list";
	}
	
	@GetMapping("read")
	public String read(int bno,Model model) throws Exception 
	{
		is.updateCnt(bno);
		ImageBoardVO vo = is.read(bno);
		model.addAttribute("comments",ics.getCommentList(bno));
		model.addAttribute("vo",vo);
		return "/imageBoard/imgBoard_detail";
	}
	
	@PostMapping("delete")
	public String delete(int bno) throws Exception
	{
		is.delete(bno);
		return "redirect:imgBoard_list";
	}
	
	@GetMapping("imgBoard_detail")
	public void imgBoard_detail() {}
	
	@PostMapping("modify")
	public String modify(int bno,Model model) throws Exception {
		model.addAttribute("vo",is.read(bno));
		return "/imageBoard/imgBoard_modify";
	}
	
	@PostMapping("modify_submit")
	public String update(ImageBoardVO vo) throws Exception{
		is.update(vo);
		return "redirect:imgBoard_list";
	}
	
	@PostMapping("commentWrite")
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
	
/*
	@PostMapping("commentDelete") 
	public ResponseEntity<String> commentDelete(int cno){
		 ResponseEntity<String> entity = null;
		 HttpHeaders header = new HttpHeaders();
		 header.setContentType(MediaType.APPLICATION_JSON); 
		 String message = ics.delete(cno); 
		 try { 
			 entity = new ResponseEntity<>(message,header,HttpStatus.OK); 
	 	 } catch (Exception e) {
	 		 entity = new ResponseEntity<>(e.getMessage(),header,HttpStatus.BAD_REQUEST);
	 	 } 
		 return entity; 
	 }
*/	
	@DeleteMapping("{cno}")
	@ResponseBody
	public String commentDelete(@PathVariable(name="cno") int cno) throws Exception{
		String result = ics.delete(cno);
		return result;
	}
	 
	@PatchMapping("commentMod/{cno}")
	@ResponseBody
	public String commentModify(@PathVariable(name="cno") int cno,@RequestBody ImageBoardCommentVO vo) throws Exception{
		vo.setCommentNO(cno);
		return ics.modify(vo);
	}
}
