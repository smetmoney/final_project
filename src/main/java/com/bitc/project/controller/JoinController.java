package com.bitc.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.project.dao.MemberDAO;
import com.bitc.project.vo.MemberVO;

@Controller
@RequestMapping	("/join")
public class JoinController {
	
	/*
	 * @GetMapping("join") 
	 * public void join() {}
	 */
	
    @Autowired
    private MemberDAO memberDAO;

    @GetMapping("/join")
    public String joinForm() {
        return "joinForm"; 				// 회원 가입 페이지로 이동
    }

    @PostMapping("/join")
    public String join(MemberVO member) {
        memberDAO.insertMember(member); // 회원 정보 데이터베이스에 삽입
        return "redirect:/login"; 		// 로그인 페이지로 리다이렉트
    }

}
