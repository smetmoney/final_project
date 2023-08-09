package com.bitc.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.project.vo.ChatVO;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/chat")
public class ChatController {

	@GetMapping("/chat")
	public void chat(Model model) {
		
		ChatVO vo = new ChatVO(1, "admin" ,"admin");
		//CustomUser user = (CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 

		log.info("==================================");
		
		log.info("@ChatController, GET Chat / Username : " + vo.getNname());
		 
		model.addAttribute("userid", vo.getId());
		model.addAttribute("username", vo.getNname());		
	}
}
