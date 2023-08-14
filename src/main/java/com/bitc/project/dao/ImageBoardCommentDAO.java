package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.project.vo.ImageBoardCommentVO;

public interface ImageBoardCommentDAO {
	// 전체 댓글목록 가져오기
	@Select("SELECT * FROM test_Comments WHERE ImageBoardbno = #{imageBoardBNO}")
	List<ImageBoardCommentVO> getCommentList(int bno);
		
	// 댓글 작성
	@Insert("INSERT INTO test_Comments VALUES(0,#{imageBoardBNO},#{commentContent},#{commenterID},now())")
	int create(ImageBoardCommentVO vo);

	// 댓글 수정
	@Update("UPDATE test_Comments SET commentContent = #{commentContent},commentDate = #{commentDate} WHERE imageBoardBNO = #{imageBoardBNO} AND commentNO = #{commentNO}")
	int modify(ImageBoardCommentVO vo);
	
	// 댓글 삭제
	@Delete("DELETE FROM test_Comments WHERE imageBoardBNO = #{imageBoardBNO} AND commentNO = #{commentNO}")
	int delete(ImageBoardCommentVO vo);
}
