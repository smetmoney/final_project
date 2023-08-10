package com.bitc.project.service;

import java.util.List;

import com.bitc.project.vo.ImageBoardVO;

public interface ImageBoardService {
	
	// 전체 이미지 게시글 가져오기
	List<ImageBoardVO> imageBoardList() throws Exception;
	
	
	// 게시글 작성
	int createImageBoard(ImageBoardVO vo) throws Exception;
	
	// 조회수 증가
	void updateCnt(int bno)throws Exception;
	
	// 게시글 상세보기
	ImageBoardVO read(int bno) throws Exception;
}
