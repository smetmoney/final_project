package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bitc.project.vo.MemberVO;

@Mapper
public interface MemberDAO {
	
	int createMember(@Param("vo") MemberVO vo);
	
	void updateMember(@Param("vo") MemberVO vo);
	
	void deleteMember(@Param("id") String id);
	
	MemberVO getMemberById(@Param("id") String id);
	
	List<MemberVO> selectAllMember();

	void insertMember(MemberVO member);
	
}