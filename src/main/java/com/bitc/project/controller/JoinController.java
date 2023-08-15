package com.bitc.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.project.dao.MemberDAO;
import com.bitc.project.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/join")
@RequiredArgsConstructor
public class JoinController {

	private final MemberDAO memberDAO;
	
	@GetMapping("join") 
	public void join() {}

	/*
	 * @GetMapping("join") 
	 * public String joinForm() { 
	 * return "join"; // 회원 가입 페이지로
	 * 이동 }
	 */

	/**
	 * 회원가입 처리완료
	 * 중복 아이디로 인해 회원가입 실패한 경우는 따로 처리 필요
	 * */
	@PostMapping("join")
	public String join(MemberVO member) {
		
		System.out.println(member);
		
		memberDAO.insertMember(member);  // 회원 정보 데이터베이스에 삽입
		
		return "redirect:/login/login";		 // 로그인 페이지로 리다이렉트
	}

}
