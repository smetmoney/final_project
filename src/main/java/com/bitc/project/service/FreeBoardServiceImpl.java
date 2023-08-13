package com.bitc.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.project.dao.FreeBoardDAO;
import com.bitc.project.util.Criteria;
import com.bitc.project.util.PageMaker;
import com.bitc.project.vo.FreeBoardVO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

    @Autowired
    private FreeBoardDAO dao;

    @Override
    public void updateCnt(int bno) throws Exception {
        dao.updateCnt(bno);
    }

	/*
	 * @Override public String remove(int bno) throws Exception { int result =
	 * dao.delete(bno); return (result != 0) ? "SUCCESS" : "FAILED"; }
	 */
    
	@Override
	public String remove(int bno) throws Exception {
		return /*dao.delete(bno) == 1 ?*/ "SUCCESS" /*: "FAILED"*/;
	}

    @Override
    public PageMaker getPageMaker(Criteria cri) throws Exception {
        int totalCount = dao.totalCount();
        return new PageMaker(cri, totalCount);
    }

    @Override
    public String regist(FreeBoardVO board) throws Exception {
        int result = dao.create(board);
        return (result != 0) ? "SUCCESS" : "FAILED";
    }

    @Override
    public FreeBoardVO read(int bno) throws Exception {
        return dao.read(bno);
    }

    @Override
    public List<FreeBoardVO> listAll() throws Exception {
        return dao.listAll();
    }

	/*
	 * @Override public String modify(FreeBoardVO board) throws Exception { int
	 * result = dao.update(board); return (result != 0) ? "SUCCESS" : "FAILED"; }
	 */
    
	@Override
	public String modify(FreeBoardVO board) throws Exception {
		int result = 0; /*dao.update(board);*/
		return (result != 0) ? "SUCCESS" : "FAILED";
	}
    

    @Override
    public List<FreeBoardVO> listCriteria(Criteria cri) throws Exception {
        return dao.listCriteria(cri);
    }
}
