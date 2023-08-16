package com.bitc.project.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.service.MemberService;
import com.bitc.project.vo.MemberVO;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@GetMapping("user")
	public void User() throws Exception {
		
	}
	
	@GetMapping("/info")
	public String memberInfo(Model model, Principal principal) {
	    MemberVO member = MemberService.findMember(principal.getName());
	    model.addAttribute("member", member);
	    return "member/info";
	}

	@PostMapping("/withdraw")
	public String memberWithdraw(MemberVO member, RedirectAttributes redirectAttributes) {
	    MemberService.withdraw(member);
	    redirectAttributes.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다.");
	    return "redirect:/";
	}

}
