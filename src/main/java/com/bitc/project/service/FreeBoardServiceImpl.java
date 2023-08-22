package com.bitc.project.service;

import java.io.File;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.project.dao.FreeBoardDAO;
import com.bitc.project.util.Criteria;
import com.bitc.project.util.FileUtils;
import com.bitc.project.util.PageMaker;
import com.bitc.project.vo.FreeBoardVO;
import com.bitc.project.vo.ImageBoardVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FreeBoardServiceImpl implements FreeBoardService {

    private final FreeBoardDAO dao;
    /*
	private final String uploadDir;
	private final ServletContext context;
	private String realPath;
     */
    
	/*
	@PostConstruct
	public void initPath() {
		realPath = context.getRealPath(File.separator+uploadDir);
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
	}*/
	
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
		return dao.remove(bno) == 1 ? "게시글 삭제 완료" : "게시글 삭제 실패?";
	}

    @Override
    public PageMaker getPageMaker(Criteria cri) throws Exception {
        int totalCount = dao.totalCount();
        return new PageMaker(cri, totalCount);
    }

    @Override
    public String regist(FreeBoardVO board) throws Exception {
        int result = dao.createFreeBoard(board);
        return (result != 0) ? "SUCCESS" : "FAILED";
    }

    @Override
    public FreeBoardVO read(int bno) throws Exception {
        return dao.read(bno);
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
	public List<FreeBoardVO> freeBoardList(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
	
//	public FreeBoardVO saveFile(FreeBoardVO vo) throws Exception {
//		String imageURL = FileUtils.uploadFile(realPath, vo.getFile());
//		vo.setFreeBoardURL(uploadDir+imageURL);
//		return vo;
//	}
}
