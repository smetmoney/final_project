package com.bitc.project.service;

import java.util.List;

import com.bitc.project.util.PageMaker;
import com.bitc.project.util.SearchCriteria;
import com.bitc.project.util.SearchPageMaker;
import com.bitc.project.vo.NoteVO;

public interface NoteService {
	
	// 쪽지 리스트 출력
	List<NoteVO> noteVOList(SearchCriteria cri) throws Exception;
	
	// 페이징 정보 처리
	PageMaker getPageMaker(SearchCriteria cri)throws Exception;
	
	// 검색결과 페이징 정보 처리
	SearchPageMaker getSearchPM(SearchCriteria cri)throws Exception;
	
	// 검색 리스트
	List<NoteVO> searchList(SearchCriteria cri)throws Exception; 
	
	// 쪽지 작성
	String createNote(NoteVO vo) throws Exception;
	
	// 쪽지 보기
	NoteVO read(int nno) throws Exception;
	
	int delete(int nno) throws Exception;
	
	int update(NoteVO vo) throws Exception;
	
}
