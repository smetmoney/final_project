package com.bitc.project.service;

import java.util.List;

import com.bitc.project.vo.MemberVO;  

public interface MemberService {
	
	// 가입
    void registerNewMember(MemberVO membervo);  
    
    // 찾기
    MemberVO findMemberById(String ID);
    
    // 전부찾기
    List<MemberVO> findAllMembers();
    
    // 정보 업데이트
    void updateMember(MemberVO membervo);
    
    // 정보 삭제
    void deleteMember(String ID);

    // 여기서 부터는 User
    
	static void withdraw(MemberVO member) {
		
	}

	static MemberVO findMember(String name) {
		return null;
	}

}
