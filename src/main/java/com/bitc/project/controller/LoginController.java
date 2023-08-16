package com.bitc.project.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitc.project.dao.MemberDAO;
import com.bitc.project.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/login")
@RequiredArgsConstructor
public class LoginController {
	
	@GetMapping("login") 
	public void join() {}
	
    @Autowired
    private MemberDAO memberDAO;

    @PostMapping("login")
    public String loginProcess(HttpServletRequest request,
    						   HttpServletResponse response,
                               @RequestParam String ID, 
                               @RequestParam String pass,
                               @RequestParam(required = false) String autoLogin
                               ) {
        
        if (ID != null) {
        	
        	ID = request.getParameter("ID");
            MemberVO member = memberDAO.selectMemberById(ID);

            if (member != null && member.getPass().equals(pass)) {
                // 로그인 성공
            	
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", member); // 세션에 사용자 정보 저장
                
                if (autoLogin != null && autoLogin.equals("on")) {
                    // 자동 로그인 체크박스를 체크했다면
                	
                    Cookie cookie = new Cookie("autoLogin", ID);
                    cookie.setPath("/");
                    cookie.setMaxAge(60 * 60 * 24); 				// 24시간 동안 자동 로그인
                    // cookie.setMaxAge(Integer.MAX_VALUE); //     	 쿠키를 영구적으로 저장합니다.
                    response.addCookie(cookie);
                    
                    System.out.println(cookie);
                }

                // 로그인 성공 시 이동할 페이지
                return "redirect:/";
                
            } else {
            	
                // 로그인 실패
            	
                String message = "아이디 또는 비밀번호가 올바르지 않습니다.";
                request.setAttribute("message", message);
                return "login"; // 로그인 실패 시 다시 로그인 페이지로 이동
            }
        }
        return null;
    }
    
    // 로그아웃
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.invalidate();
        
        // 로그아웃 시 쿠키 삭제
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("autoLogin")) {
                    cookie.setMaxAge(0); 
                    response.addCookie(cookie);
                    break;
                }
            }
        }
        
        return "redirect:/";
    }


}
