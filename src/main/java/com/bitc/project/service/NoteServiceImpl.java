package com.bitc.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.project.dao.NoteDAO;
import com.bitc.project.util.PageMaker;
import com.bitc.project.util.SearchCriteria;
import com.bitc.project.util.SearchPageMaker;
import com.bitc.project.vo.NoteVO;

@Service
public class NoteServiceImpl implements NoteService {

    private final NoteDAO nd;

    @Autowired
    public NoteServiceImpl(NoteDAO noteDAO) {
        this.nd = noteDAO;
    }

    @Override
    public List<NoteVO> noteVOList(SearchCriteria cri) throws Exception {
        return nd.noteVOList(cri);
    }

    @Override
    public PageMaker getPageMaker(SearchCriteria cri) throws Exception {
        int totalCount = nd.totalCount(cri);
        return new PageMaker(cri, totalCount);
    }

    @Override
    public SearchPageMaker getSearchPM(SearchCriteria cri) throws Exception {
    	SearchPageMaker spm = new SearchPageMaker();
		spm.setCri(cri);
		if(cri.getSearchType() == null) {
			spm.setTotalCount(nd.totalCount());
		}else {
			if(cri.getSearchType().equals("title")) {
				spm.setTotalCount(nd.searchTitleCount(cri));
			}else {
				spm.setTotalCount(nd.searchContentCount(cri));
			}
		}
		return spm;
    }

    @Override
    public List<NoteVO> searchList(SearchCriteria cri) throws Exception {
        return nd.searchList(cri);
    }

    @Override
    @Transactional
    public String createNote(NoteVO vo) throws Exception {
        // 필요한 로직 구현 (예: 보내는 회원, 받는 회원 확인 후 쪽지 생성)
        nd.createNote(vo);
        return "쪽지를 보냈습니다"; // 작업 완료 후 성공 메시지 반환
    }

    @Override
    public NoteVO read(int nno) throws Exception {
        return nd.read(nno);
    }

    @Override
    public int delete(int nno) throws Exception {
        return nd.delete(nno);
    }

    @Override
    public int update(NoteVO vo) throws Exception {
        return nd.update(vo);
    }
}
