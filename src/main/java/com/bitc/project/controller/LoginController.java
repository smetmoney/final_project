package com.bitc.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitc.project.dao.MemberDAO;
import com.bitc.project.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping	("/login")
@RequiredArgsConstructor
public class LoginController {
	
	@GetMapping("login") public 
	void join() {}
	
    @Autowired
    private MemberDAO memberDAO;
    
    /*
    @GetMapping("login")
    public String loginForm() {
        return "login"; 								// 로그인 페이지로 이동
    }
    */

    @PostMapping("login")
    public String loginProcess(HttpServletRequest request,
    						   HttpServletResponse response,
                               @RequestParam String ID, 
                               @RequestParam String pass
                               ) {
        
        if (ID != null) {
        	
        	ID = request.getParameter("ID");
            MemberVO member = memberDAO.selectMemberById(ID);

            if (member != null && member.getPass().equals(pass)) {
                // 로그인 성공
            	
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", member); // 세션에 사용자 정보 저장

                // 로그인 성공 시 이동할 페이지
                return "redirect:/";
                
            } else {
                return "login"; // 로그인 실패 시 다시 로그인 페이지로 이동
            }
        } else {
        	
            return "login"; // 아이디가 없음
            
        }

    }

    // 로그인 에러 처리
    @GetMapping("loginError")
    public String loginError() {
        return "loginError";
    }

}
