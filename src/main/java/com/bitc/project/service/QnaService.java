package com.bitc.project.service;

import java.util.List;

import com.bitc.project.vo.QnaVO;

public interface QnaService {
	
	/**
	 * 질의응답 불러오기
	 */
	public List<QnaVO> qnaList() throws Exception;
	
	/**
	 * 질의응답 등록하기
	 */
	public int newQna(QnaVO vo) throws Exception;
	
	/**
	 * 특정 질의응답 불러오기
	 */
	public QnaVO qnaLoad(int qnaId) throws Exception;
}
