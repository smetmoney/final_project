package com.bitc.project.service;

import java.util.List;

import com.bitc.project.vo.ImageBoardCommentVO;

public interface ImageBoardCommentService {
	// 전체 댓글목록 가져오기
	List<ImageBoardCommentVO> getCommentList(int bno);
		
	// 댓글 작성
	String create(ImageBoardCommentVO vo);
	
	// 댓글 수정
	int modify(ImageBoardCommentVO vo);
	
	// 댓글 삭제
	String delete(ImageBoardCommentVO vo);
}
