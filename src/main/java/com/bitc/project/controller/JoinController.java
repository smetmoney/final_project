package com.bitc.project.controller;

import com.bitc.project.dto.MemberDTO;  		// 추가
import com.bitc.project.service.MemberService;  // 추가
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/join")
public class JoinController {

    private final MemberService memberService;  // 추가

    @Autowired
    public JoinController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping("join")
    public String joinForm(Model model) {
        model.addAttribute("memberDTO", new MemberDTO());  // 추가
        return "join/joinForm";
    }

    @PostMapping("join")
    public String join(MemberDTO memberDTO) {
        memberService.registerNewMember(memberDTO);  // 추가
        return "redirect:/login/login";  // 회원가입 후 로그인 페이지로 리다이렉트
    }
}
