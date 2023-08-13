package com.bitc.project.dao;

import com.bitc.project.vo.MemberVO;

public interface MemberDAO {
	
    MemberVO getMemberById(String id);
    void insertMember(MemberVO member);
}

