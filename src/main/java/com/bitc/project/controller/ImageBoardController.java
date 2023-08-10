package com.bitc.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.project.service.ImageBoardService;
import com.bitc.project.vo.ImageBoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/imageBoard")
public class ImageBoardController {

	private final ImageBoardService is;

	@GetMapping("imgBoard_list")
	public void imgBoardList(Model model) throws Exception {
		List<ImageBoardVO> list = is.imageBoardList();
		model.addAttribute("imgBoardList",list);
	}

	@GetMapping("imgBoard_form")
	public void imgBoardForm() {}
	
	@PostMapping("create")
	public String create(ImageBoardVO vo,Model model) throws Exception {
		is.createImageBoard(vo);
		return "redirect:imgBoard_list";
	}
}
