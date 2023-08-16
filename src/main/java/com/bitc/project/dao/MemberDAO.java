package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.project.vo.MemberVO;

@Mapper
public interface MemberDAO {
	
	@Insert("INSERT INTO member (id, nname, pass, email, name, birthdate,gender) VALUES (#{id}, #{nname}, #{pass}, #{email}, #{name}, #{birthdate}, #{gender})")
	void insertMember(MemberVO member);
	
	@Select("SELECT * FROM member WHERE id = #{id}")
	MemberVO selectMemberById(String id);
	
	@Select("SELECT * FROM member")
	List<MemberVO> selectAllMember();

	@Update("UPDATE member SET nname = #{nname}, pass = #{pass}, email = #{email}, name = #{name}, stopu = #{stopu} WHERE id = #{id}")
	void updateMember(MemberVO member);

	@Delete("DELETE FROM member WHERE id = #{id}")
	void deleteMember(String id);
	
}
