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
	public int modify(ImageBoardCommentVO vo) {
		return dao.modify(vo);
	}

	@Override
	public String delete(ImageBoardCommentVO vo) {
		return dao.delete(vo) > 0 ? "댓글 삭제 완료" : "댓글 삭제 실패";
	}

}
