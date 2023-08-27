package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.project.util.Criteria;
import com.bitc.project.vo.LoginDTO;
import com.bitc.project.vo.MemberVO;
import com.bitc.project.vo.NoteVO;

@Mapper
public interface MemberDAO {
	
	/**
	 * 회원가입
	 * @return 
	 * */
	@Insert("INSERT INTO member (id, nname, pass, email, name, birthdate,gender) VALUES (#{id}, #{nname}, #{pass}, #{email}, #{name}, #{birthdate}, #{gender})")
	void insertMember(MemberVO member) throws Exception;
	
	/**
	 * 아이디 검색
	 * */
	@Select("SELECT * FROM member WHERE id = #{id}")
	MemberVO selectMemberById(String id);
	
	/**
	 * 리스트 정보 전부 검색
	 * */
	@Select("SELECT * FROM member")
	List<MemberVO> selectAllMember();

	/**
	 * 정보 업데이트
	 * */
	@Update("UPDATE member SET nname = #{nname}, pass = #{pass}, email = #{email}, name = #{name}, stopu = #{stopu} WHERE id = #{id}")
	void updateMember(MemberVO member);

	/**
	 * 정보 삭제
	 * */
	@Delete("DELETE FROM member WHERE id = #{id}")
	void deleteMember(String id);
	
	/**
	 * 아이디 비밀번호 검색
	 * @return MemberVO
	 */
	
	@Select("SELECT * FROM member WHERE id = #{id} AND pass = #{pass}")
	MemberVO selectIdAndPass(LoginDTO dto);

	 /**
	  * LoginDTO 로그인 요청 처리
	  * */
	@Select("SELECT * FROM member WHERE id = #{id} AND pw = #{pw}")
	MemberVO login(LoginDTO dto) throws Exception;

	@Select("SELECT nname FROM member WHERE nname = #{nname}")
	String checkNick(@Param("nname")String nname);
	
	
	/*
	 * @Select("SELECT count(*) FROM member WHERE id = #{id}") int
	 * totalCount(List<MemberVO> members);
	 * 
	 * @Select("SELECT * FROM member WHERE id = #{id} limit #{cri.startRow},#{cri.perPageNum}"
	 * ) List<MemberVO> memberVOList(@Param("cri")Criteria cri,@Param("id") String
	 * id);
	 */
	
}
