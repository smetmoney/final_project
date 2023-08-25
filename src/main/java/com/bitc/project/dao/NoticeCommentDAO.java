package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.project.util.Criteria;
import com.bitc.project.vo.NoticeCommentVO;

public interface NoticeCommentDAO {

	
	/**
	 * 전체 댓글 목록
	 * @param 댓글이 저장된 게시글 번호
	 * @return 해당 게시글의 전체 게시글 목록
	 */
	@Select("SELECT * FROM notice_comment WHERE bno = #{bno} ORDER BY cno DESC")
	List<NoticeCommentVO> commentList(int bno)throws Exception;
	
	/**
	 * @param 삽입될 댓글 정보
	 * @return - 삽입된 행의 개수
	 */
	@Insert("INSERT INTO notice_comment(bno,commentText,commentAuth) "
			+ "VALUES(#{bno},#{commentText},#{commentAuth})")
	int insert(NoticeCommentVO vo) throws Exception;
	
	/**
	 * @param  수정할 댓글 정보
	 * @return  수정된 행의 개수
	 */
	@Update("UPDATE notice_comment SET "
			+ " commentAuth = #{commentAuth} , "
			+ " commentText = #{commentText} , "
			+ " updatedate = now() "
			+ " WHERE cno = #{cno}")
	int update(NoticeCommentVO vo) throws Exception;
	
	/**
	 * @param 삭제할 댓글 번호
	 * @return 삭제된 행의 개수
	 */
	@Delete("DELETE FROM notice_comment WHERE cno = #{cno}")
	int delete(int cno) throws Exception;
	
	/**
	 * 페이징 처리 
	 */
	/**
	 * @param bno - 검색할 게시글 번호
	 * @param cri - 요청한 페이지에 따른 페이징 정보
	 * @return - 페이징 처리된 게시글 목록
	 */
	@Select("SELECT * FROM notice_comment "
			+ " WHERE bno = #{bno} ORDER BY cno DESC "
			+ " limit #{cri.startRow}, #{cri.perPageNum}") 
	List<NoticeCommentVO> listPage(
			@Param("bno") int bno, 
			@Param("cri")Criteria cri) throws Exception;
	
	/**
	 * @param bno 검색할 게시글 번호
	 * @return 해당 게시글에 작성된 댓글 개수
	 */
	@Select("SELECT count(*) FROM notice_comment WHERE bno = #{bno}")
	int totalCount(int bno) throws Exception;
	

}
