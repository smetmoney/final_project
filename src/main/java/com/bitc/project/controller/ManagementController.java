package com.bitc.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitc.project.dao.MemberDAO;
import com.bitc.project.service.MemberService;
import com.bitc.project.util.Criteria;
import com.bitc.project.util.PageMaker;
import com.bitc.project.vo.MemberVO;

@Controller
@RequestMapping("/management")
public class ManagementController {
	
	@Autowired
    private MemberDAO md;
	
    @Autowired
    private MemberService ms;
	
    @GetMapping("/management")
    public String list(Model model, Criteria cri, HttpServletRequest request) throws Exception {
        List<MemberVO> members = md.selectAllMember();
        cri.setPerPageNum(10);
        model.addAttribute("members", members);
		/* PageMaker pm = ms.getPageMaker(cri,members); */
        return "management/management";
    }

    @RequestMapping(value = "user", method = RequestMethod.GET)
    public String detail(Model model, String id) {
        MemberVO member = ms.findMemberById(id);
        model.addAttribute("member", member);
        return "detail";
    }
    
    
	
}
