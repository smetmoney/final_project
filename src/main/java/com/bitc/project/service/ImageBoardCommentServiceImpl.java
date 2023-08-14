package com.bitc.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.project.dao.ImageBoardCommentDAO;
import com.bitc.project.vo.ImageBoardCommentVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ImageBoardCommentServiceImpl implements ImageBoardCommentService {
	
	private final ImageBoardCommentDAO dao;
	
	@Override
	public List<ImageBoardCommentVO> getCommentList(int bno) {
		return dao.getCommentList(bno);
	}

	@Override
	public String create(ImageBoardCommentVO vo) {
		return dao.create(vo) > 0 ? "댓글 등록 완료" : "댓글 등록 실패";
	}

	@Override
	public String modify(ImageBoardCommentVO vo) {
		return dao.modify(vo) > 0 ? "댓글 수정 완료" : "댓글 수정 실패";
	}

	@Override
	public String delete(int cno) {
		return dao.delete(cno) > 0 ? "success" : "fail";
	}

}
