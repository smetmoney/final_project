package com.bitc.project.service;

import java.io.File;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;

import com.bitc.project.dao.ImageBoardDAO;
import com.bitc.project.util.Criteria;
import com.bitc.project.util.FileUtils;
import com.bitc.project.util.PageMaker;
import com.bitc.project.vo.ImageBoardVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ImageBoardServiceImpl implements ImageBoardService {

	private final ImageBoardDAO dao;
	private final String uploadDir;
	private final ServletContext context;
	private String realPath;
	
	@PostConstruct
	public void initPath() {
		realPath = context.getRealPath(File.separator+uploadDir);
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
	}
	
	@Override
	public List<ImageBoardVO> imageBoardList(Criteria cri) throws Exception {
		return dao.imageBoardList(cri);
	}

	@Override
	public int createImageBoard(ImageBoardVO vo) throws Exception {
		String imageURL = FileUtils.uploadFile(realPath, vo.getFile());
		vo.setImageURL(uploadDir+imageURL);
		System.out.println(vo.getImageURL());
		return dao.createImageBoard(vo);
	}

	@Override
	public void updateCnt(int bno) throws Exception {
		dao.updateCnt(bno);
		
	}

	@Override
	public ImageBoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public PageMaker getPageMaker(Criteria cri) throws Exception {
		return new PageMaker(cri,dao.totalCount());
	}

}
