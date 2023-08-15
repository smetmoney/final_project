package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.project.vo.FreeBoardCommentVO;

public interface FreeBoardCommentDAO {

	// 전체 댓글목록 가져오기
	@Select("SELECT * FROM test_Comments WHERE FreeBoardbno = #{freeBoardBNO}")
	List<FreeBoardCommentVO> getCommentList(int bno);
		
	// 댓글 작성
	@Insert("INSERT INTO test_Comments VALUES(0,#{freeBoardBNO},#{commentContent},#{commenterID},now())")
	int create(FreeBoardCommentVO vo);

	// 댓글 수정
	@Update("UPDATE Comments SET commentContent = #{commentContent} WHERE commentNO = #{commentNO}")
	int modify(FreeBoardCommentVO vo);
	
	// 댓글 삭제
	@Delete("DELETE FROM Comments WHERE commentNO = #{cno}")
	int delete(int cno);
	
}
