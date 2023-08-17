package com.bitc.project.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bitc.project.dao.MemberDAO;
import com.bitc.project.service.MemberService;
import com.bitc.project.session.MySessionEventListener;
import com.bitc.project.vo.LoginDTO;
import com.bitc.project.vo.MemberVO;

public class LoginInInterceptor implements HandlerInterceptor{

	MemberDAO DAO;
	
	MemberService ms;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") != null) {
			session.removeAttribute("userInfo");
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("userInfo");
		System.out.println("interceptor user Info : " + vo);
		
		if(modelAndView != null) {
		ModelMap modelObj = modelAndView.getModelMap();
		LoginDTO dto = (LoginDTO)modelObj.get("loginDTO");
		
		
		if(vo != null) {
			// 로그인 성공 시 기존에 동일한 id로 로그인된 사용자 정보가 존재하면 삭제
			boolean result = MySessionEventListener.expireDuplicatedSession(
				vo.getId(),
				session.getId()
				);
			
			if(result) {
				System.out.println("중복 제거");
			}else {
				System.out.println("첫 로그인");
			}
				
			// 자동 로그인 요청 처리
			if(vo.isAutoLogin()) {
				Cookie cookie = new Cookie("autoLogin",vo.getId());
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(cookie);
			}
		}else {
			// 로그인 실패
			String message = "로그인 실패";
			modelAndView.addObject("message",message);
			modelAndView.setViewName("/login/login");
		}
		
		
		modelAndView.addObject("loginDTO",dto);
		
		}
	}
	
	
	
}
