package com.bitc.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/imageBoard")
@RequiredArgsConstructor
public class ImageBoardController {

	@GetMapping("imgBoard_list")
	public void go() {}
}
