package com.bitc.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping	("/login")
public class LoginController {
	
	/*
	 * @GetMapping("login") public 
	 * void join() {}
	 */
	
    @Autowired
    private MemberDAO memberDAO;

    @GetMapping("/login")
    public String loginForm() {
        return "loginForm"; 								// 로그인 페이지로 이동
    }

    @PostMapping("/login")
    public String loginProcess(HttpServletRequest request, HttpServletResponse response,
                               @RequestParam String id, @RequestParam String pass) {
        MemberVO member = memberDAO.getMemberById(id);
        if (member != null && member.getPass().equals(pass)) {
        	
            // 로그인 성공
        	
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", member); // 세션에 사용자 정보 저장
            return "redirect:/dashboard"; 				 // 로그인 성공 시 이동할 페이지
        } else {
        	
            return "loginForm"; 						// 로그인 실패 시 다시 로그인 페이지로 이동
        }
    }

}
