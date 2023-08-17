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
import com.bitc.project.service.MemberService;
import com.bitc.project.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("login")
@RequiredArgsConstructor
public class LoginController {
	
    @Autowired
    private MemberDAO memberDAO;
    
    private final MemberService ms;
    
    @GetMapping("login") 
	public void join() {}

    @PostMapping("login")
    public String loginProcess(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestParam String ID,
                               @RequestParam String pass,
                               @RequestParam(required = false) String autoLogin) {

        if (ID != null) {

            ID = request.getParameter("ID");
            MemberVO member = memberDAO.selectMemberById(ID);

            if (member != null) { 	// 회원이 존재하는 경우
                if (member.getPass().equals(pass)) {
                    // 로그인 성공

                    HttpSession session = request.getSession();
                    session.setAttribute("loggedInUser", member); // 세션에 사용자 정보 저장

                    if (autoLogin != null && autoLogin.equals("on")) {
                        // 자동 로그인 체크박스를 체크했다면

                        Cookie cookie = new Cookie("autoLogin", ID);
                        cookie.setPath("/");
                        cookie.setMaxAge(60 * 60 * 24); // 24시간 동안 자동 로그인
                        response.addCookie(cookie);

                        System.out.println(cookie);
                    }

                    // 로그인 성공 시 이동할 페이지
                    return "redirect:/";
                    
                } else {
                    // 비밀번호가 일치하지 않는 경우
                    String message = "비밀번호가 올바르지 않습니다.";
                    request.setAttribute("message", message);
                    return "redirect:/";
                }
                
            } else {
                // 회원이 없는 경우
                String message = "존재하지 않는 회원입니다.";
                request.setAttribute("message", message);
                return "redirect:/";
            }
        }
        return "redirect:/";
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
