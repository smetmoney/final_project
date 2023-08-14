package com.bitc.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.project.service.ImageBoardService;
import com.bitc.project.util.Criteria;
import com.bitc.project.util.FileUtils;
import com.bitc.project.util.PageMaker;
import com.bitc.project.vo.ImageBoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/imageBoard")
public class ImageBoardController {

	private final ImageBoardService is;
	
	
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
}
