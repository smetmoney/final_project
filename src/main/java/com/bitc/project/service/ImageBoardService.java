package com.bitc.project.service;

import java.util.List;

import com.bitc.project.util.Criteria;
import com.bitc.project.util.PageMaker;
import com.bitc.project.vo.ImageBoardVO;

public interface ImageBoardService {
	// 전체 이미지 게시글 가져오기
	public List<ImageBoardVO> imageBoardList(Criteria cri) throws Exception;
	
	// 페이징 정보 처리
	PageMaker getPageMaker(Criteria cri)throws Exception;
	
	// 게시글 작성
	public int createImageBoard(ImageBoardVO vo) throws Exception;
	
	// 조회수 증가
	public void updateCnt(int bno)  throws Exception;
	
	// 게시글 상세보기 
	public ImageBoardVO read(int bno) throws Exception;
	
}
