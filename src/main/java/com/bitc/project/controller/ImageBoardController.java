package com.bitc.project.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.project.service.ImageBoardService;
import com.bitc.project.vo.ImageBoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/imageBoard")
public class ImageBoardController {

	private final ImageBoardService is;
	// application context
	private final ServletContext context;
	private final String uploadDir;
	
	@GetMapping("imgBoard_list")
	public void imgBoardList(Model model) throws Exception {
		List<ImageBoardVO> list = is.imageBoardList();
		model.addAttribute("imgBoardList",list);
	}

	@GetMapping("imgBoard_form")
	public void imgBoardForm() {}
	
	@PostMapping("create")
	public void create(ImageBoardVO vo,Model model) throws Exception {
		System.out.println(vo.getFile().getOriginalFilename());
		System.out.println(context.getRealPath(File.separator)+uploadDir);
//		int result = is.createImageBoard(vo); 
//		if(result > 0) {
//			model.addAttribute("message","게시글 등록 성공!"); 
//		}
//		return "/imageBoard/imgBoard_list";
	}
}
