package com.bitc.project.service;

import java.util.List;

import com.bitc.project.util.Criteria;
import com.bitc.project.util.PageMaker;
import com.bitc.project.vo.NoticeCommentVO;

public interface NoticeCommentService {
	/**
	 * 게시글 번호를 전달 받아서  
	 * bno 값이 일치하는 전체 댓글 리스트 
	 */
	List<NoticeCommentVO> commentList(int bno)throws Exception;
	
	/**
	 *  댓글 삽입
	 */
	String addComment(NoticeCommentVO vo) throws Exception;
	
	/**
	 * 댓글 수정
	 */
	String updateComment(NoticeCommentVO vo) throws Exception;
	
	/**
	 * 댓글 삭제
	 */
	String deleteComment(int cno)throws Exception;
	
	/**
	 * 페이징 처리된 댓글 리스트
	 */
	List<NoticeCommentVO> commentListPage(
			int bno, Criteria cri
			)throws Exception;
	
	/**
	 * 페이징 블럭 정보
	 */
	PageMaker getPageMaker(int bno, Criteria cri) throws Exception;
}











