package com.bitc.project.controller;

import java.util.Map;

import org.apache.logging.log4j.message.Message;
import org.springframework.messaging.MessageHeaders;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Headers;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.project.vo.ChatVO;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/chat")
@Log4j
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
	
	@MessageMapping("chat")
	public String handle(Message message, MessageHeaders messageHeaders, 
		MessageHeaderAccessor messageHeaderAccessor, SimpMessageHeaderAccessor simpMessageHeaderAccessor, 
		StompHeaderAccessor stompHeaderAccessor, @Payload String payload, 
		@Header("destination") String destination, @Headers Map<String, String> headers,
		@DestinationVariable String id) {

		System.out.println("---- Message ----");
		System.out.println(message);

		System.out.println("---- MessageHeaders ----");
		System.out.println(messageHeaders);

		System.out.println("---- MessageHeaderAccessor ----");
		System.out.println(messageHeaderAccessor);

		System.out.println("---- SimpMessageHeaderAccessor ----");
		System.out.println(simpMessageHeaderAccessor);

		System.out.println("---- StompHeaderAccessor ----");
		System.out.println(stompHeaderAccessor);

		System.out.println("---- @Payload ----");
		System.out.println(payload);

		System.out.println("---- @Header(\"destination\") ----");
		System.out.println(destination);

		System.out.println("----  @Headers ----");
		System.out.println(headers);

		System.out.println("----  @DestinationVariable ----");
		System.out.println(id);

		return payload;
	}
	
}
