package com.bitc.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/freeBoard")
@RequiredArgsConstructor
public class freeBoardController {
	
	@GetMapping("freeBoard_list")
	public void freeBoardList() {}
	
}
