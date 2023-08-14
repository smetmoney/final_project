package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.project.vo.MemberVO;

@Mapper
public interface MemberDAO {

	@Insert("INSERT INTO member (id, nname, pass, email, name, stopu) VALUES (#{vo.id}, #{vo.nname}, #{vo.pass}, #{vo.email}, #{vo.name}, #{vo.stopu})")
	int createMember(@Param("vo") MemberVO vo);

	void updateMember(@Param("vo") MemberVO vo);

	void deleteMember(@Param("id") String id);

	@Select("SELECT * FROM MEMBER WHERE id = #{id}")
	MemberVO getMemberById(@Param("id") String id);

	List<MemberVO> selectAllMember();

	void insertMember(MemberVO member);

	MemberVO selectMemberById(String id);

	List<MemberVO> selectAllMembers();

	@Select("SELECT COUNT(*) FROM MEMBER")
	int getTotalMemberCount();

	@Select("SELECT * FROM MEMBER WHERE ID = #{id}")
	MemberVO getMemberByIdWithBLOBs(@Param("id") String id);

	@Update("UPDATE MEMBER SET nname = #{nname}, pass = #{pass}, email = #{email}, name = #{name}, stopu = #{stopu} WHERE id = #{id}")
	int updateMemberWithBLOBs(@Param("member") MemberVO member);
}
