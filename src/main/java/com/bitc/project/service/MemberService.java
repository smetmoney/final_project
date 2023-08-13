package com.bitc.project.service;

import java.util.List;

import com.bitc.project.dto.MemberDTO;  

public interface MemberService {
    void registerNewMember(MemberDTO memberDTO);  
    
    MemberDTO findMemberById(String id);
    List<MemberDTO> findAllMembers();
    void updateMember(MemberDTO memberDTO);
    void deleteMember(String id);
}
