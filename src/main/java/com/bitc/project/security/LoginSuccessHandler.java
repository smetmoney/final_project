package com.bitc.project.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.bitc.project.security.user.CustomUser;
import com.bitc.project.vo.MemberVO;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	/*
	@Autowired
	private final MemberService ms;
	*/

	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Authentication auth)
			throws IOException, ServletException {
		System.out.println(auth);
		System.out.println(auth.getPrincipal());
		CustomUser user = (CustomUser) auth.getPrincipal();
		System.out.println(user);
		MemberVO vo = user.getVo();
		System.out.println(vo);
		
		request.getSession().setAttribute("userInfo", vo);

		/* 당장 필요 없는거 수정
		try {
			 로그인이 성공한 사용자의
			 최종 방문시간 업데이트
			 ms.updateMember(vo.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/

		String context = request.getContextPath();
		response.sendRedirect(context);
		System.out.println("redirect : " + context);

	}

}
