package com.bitc.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/chat")
@Log4j
public class ChatController {

	private final List<Integer> chatRoom = new ArrayList<>();
	private int i = 1;
	
	@GetMapping("/chat")
	public void chat(Model model, int roomNum) {
		model.addAttribute("roomNum",roomNum);
	}

	// 방생성
	@GetMapping("create")
	public String create(RedirectAttributes rttr) {
		chatRoom.add(i);
		rttr.addAttribute("roomNum",i);
		rttr.addFlashAttribute("roomNum",i);
		i++;
		return "redirect:/chat/chat";
	}
	
	// 방 리스트
	@GetMapping("chatRoom")
	public void chatRoomList(Model model) {
		model.addAttribute("chatRoom",chatRoom);
	}
	
	@GetMapping("joinChat")
	public String join(int roomNum,RedirectAttributes rttr) {
		rttr.addAttribute("roomNum",roomNum);
		rttr.addFlashAttribute("roomNum",roomNum);
		return "redirect:/chat/chat";
	}
		// 주석 꺼냄
		/* ChatVO vo = new ChatVO(1, "admin" ,"admin"); */
		//CustomUser user = (CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		/*
		 * model.addAttribute("userid", vo.getId()); model.addAttribute("username",
		 * vo.getNname());
		 */
	
	/*
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
	*/
	/*
	@MessageMapping("/chat")
	@SendTo("/topic/chat2")
	public String chat(ChatVO vo) {
		return "Hello"+HtmlUtils.htmlEscape(vo.getChat());
	}
  */
}
