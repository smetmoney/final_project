package com.bitc.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.handler.ChattingHandler;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
    @Autowired
    private ChattingHandler chattingHandler;
	
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
		model.addAttribute("list",chattingHandler.getRoom());
	}
	
	@GetMapping("joinChat")
	public String join(int roomNum,RedirectAttributes rttr) {
		rttr.addAttribute("roomNum",roomNum);
		rttr.addFlashAttribute("roomNum",roomNum);
		return "redirect:/chat/chat";
	}
}
