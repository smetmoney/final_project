package com.bitc.project.service;

import java.util.List;

import com.bitc.project.vo.MemberVO;  

public interface MemberService {
	
    void registerNewMember(MemberVO membervo);  
    
    MemberVO findMemberById(String id);
    
    List<MemberVO> findAllMembers();
    
    void updateMember(MemberVO membervo);
    
    void deleteMember(String id);
}
