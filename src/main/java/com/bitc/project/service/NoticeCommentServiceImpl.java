package com.bitc.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.project.util.Criteria;
import com.bitc.project.util.PageMaker;
import com.bitc.project.vo.NoticeCommentVO;
import com.bitc.project.dao.NoticeCommentDAO;

import lombok.RequiredArgsConstructor;

// Service Spring Bean  등록
@Service
@RequiredArgsConstructor
public class NoticeCommentServiceImpl implements NoticeCommentService{
	
	// CommentDAO 의존성 주입
	private final NoticeCommentDAO dao;

	@Override
	public List<NoticeCommentVO> commentList(int bno) throws Exception {
		return dao.commentList(bno);
	}

	private String getResult(int result) {
		return result == 1 ? "SUCCESS" : "FAILED";
	}
	
	@Override
	public String addComment(NoticeCommentVO vo) throws Exception {
		int result = dao.insert(vo);
		return getResult(result);
	}

	@Override
	public String updateComment(NoticeCommentVO vo) throws Exception {
		return getResult(dao.update(vo));
	}

	@Override
	public String deleteComment(int cno) throws Exception {
		return getResult(dao.delete(cno));
	}

	@Override
	public List<NoticeCommentVO> commentListPage(int bno, Criteria cri) throws Exception {
		return dao.listPage(bno, cri);
	}

	@Override
	public PageMaker getPageMaker(int bno, Criteria cri) throws Exception {
		int totalCount = dao.totalCount(bno);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(5);
		pageMaker.setTotalCount(totalCount);
		return pageMaker;
	}

}










