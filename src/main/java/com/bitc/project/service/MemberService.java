package com.bitc.project.service;

import com.bitc.project.dto.MemberDTO;  // 추가

public interface MemberService {
    void registerNewMember(MemberDTO memberDTO);  // 추가
    // 다른 회원 관련 메서드도 추가 가능
}
