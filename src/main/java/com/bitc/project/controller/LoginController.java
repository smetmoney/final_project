package com.bitc.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.model.Member;
import com.bitc.project.repository.MemberRepository;

@Controller
@RequestMapping("/login")
public class LoginController {

    private final MemberRepository memberRepository;

    @Autowired
    public LoginController(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    @GetMapping("login")
    public String loginForm(Model model) {
        model.addAttribute("error", ""); // 에러 메시지 초기화
        return "login/loginForm";
    }

    @PostMapping("login")
    public String login(@RequestParam String id, @RequestParam String pw, RedirectAttributes redirectAttributes) {
        // 여기서 로그인 처리 및 에러 처리 로직을 구현
        Member member = memberRepository.findById(id);
        if (member != null && member.getPass().equals(pw)) {
            // 로그인 성공 시 세션 등록 등의 처리
            // 이후 세션 등록 후 리다이렉트 처리 등을 구현해주세요.
            return "redirect:/home"; // 로그인 성공 후 홈 페이지로 리다이렉트
        } else {
            // 로그인 실패 시 에러 메시지를 전달하여 화면에 표시
            redirectAttributes.addFlashAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "redirect:/login/login"; // 로그인 실패 시 로그인 페이지로 리다이렉트
        }
    }

}
