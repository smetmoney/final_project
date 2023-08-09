package com.bitc.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/chat")
public class ChatController {

	@GetMapping("/chat")
	public void chat(Model model) {

		
		//CustomUser user = (CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 

		//log.info("==================================");
		
		//log.info("@ChatController, GET Chat / Username : " + user.getUsername());
		 
		//model.addAttribute("userid", user.getUsername());
		
	}
}
