package com.bitc.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.project.dao.NoticeDAO;
import com.bitc.project.dao.QnaDAO;
import com.bitc.project.util.Criteria;
import com.bitc.project.util.PageMaker;
import com.bitc.project.vo.NoticeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private final NoticeDAO dao;
	
	@Override
	public List<NoticeVO> readNoticeList(Criteria cri) throws Exception {
		return dao.noticeList(cri);
	}

	@Override
	public NoticeVO readNotice(int bno) throws Exception {
		return dao.readNotice(bno);
	}

	@Override
	public String newNotice(NoticeVO vo) throws Exception {
		return dao.newNotice(vo) == 1 ? "공지사항 등록 성공" : "공지사항 등록 실패";
	}

	@Override
	public String editNotice(NoticeVO vo) throws Exception {
		return dao.newNotice(vo) == 1 ? "공지사항 수정 성공" : "공지사항 수정 실패";
	}

	@Override
	public String deleteNotice(int bno) throws Exception {
		return dao.deleteNotice(bno) == 1 ? "공지사항 삭제 성공" : "공지사항 삭제 실패";
	}

	@Override
	public void updateVcnt(int bno) throws Exception {
		dao.updateVcnt(bno);
	}

	@Override
	public String upadateLcnt(int bno) throws Exception {
		return dao.updateLikeCnt(bno) ==1 ? "좋아요를 눌렀습니다. " : "좋아요 누르기 실패" ;
	}

	@Override
	public String fixedNotice(NoticeVO vo, int bno) throws Exception {
		return dao.updateFixedNotice(vo) == 1? "공지사항 고정 여부 수정 완료":"공지사항 고정 여부 수정 실패" ;
	}
	
	@Override
	public PageMaker getPageMaker(Criteria cri) throws Exception {
		return new PageMaker(cri,dao.totalCount());
	}

}
