package com.bitc.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitc.project.dao.MemberDAO;
import com.bitc.project.service.MemberService;
import com.bitc.project.vo.MemberVO;

@Controller
@RequestMapping("/management")
public class ManagementController {
	
	@Autowired
    private MemberDAO memberDAO;
	
    @Autowired
    private MemberService memberService;
	
    @GetMapping("/management")
    public String list(Model model) {
        List<MemberVO> members = memberDAO.selectAllMember();
        model.addAttribute("members", members);
        return "management/management";
    }

    @RequestMapping(value = "user", method = RequestMethod.GET)
    public String detail(Model model, String id) {
        MemberVO member = memberService.findMemberById(id);
        model.addAttribute("member", member);
        return "management/detail";
    }
	
}
