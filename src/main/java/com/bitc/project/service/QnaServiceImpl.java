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
	public String newQna(QnaVO vo) throws Exception {
		int result = dao.createQna(vo);
		String message = (result != 0) ? "SUCCESS" : "FAILED";
		return message;
	}

	@Override
	public QnaVO qnaLoad(int qnaId) throws Exception {
		return dao.qnaload(qnaId);
	}

}
