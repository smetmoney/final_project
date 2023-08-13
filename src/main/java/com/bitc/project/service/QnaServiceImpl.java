package com.bitc.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.project.dao.QnaDAO;
import com.bitc.project.vo.QnaVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService {

	private final QnaDAO dao;
	
	@Override
	public List<QnaVO> qnaList() throws Exception {
		return dao.qnaList();
	}

	@Override
	public int newQna(QnaVO vo) throws Exception {
		return dao.createImageBoard(vo);
	}

}
