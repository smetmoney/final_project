package com.bitc.project.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.bitc.project.dao.ImageBoardDAO;
import com.bitc.project.util.FileUtils;
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
	public List<ImageBoardVO> imageBoardList() throws Exception {
		List<ImageBoardVO> list = dao.imageBoardList();
		return list;
	}

	@Override
	public int createImageBoard(ImageBoardVO vo) throws Exception {
		String imageURL = FileUtils.uploadFile(realPath, vo.getFile());
		vo.setImageURL(uploadDir+imageURL);
		System.out.println(vo.getImageURL());
		return dao.createImageBoard(vo);
	}

<<<<<<< HEAD
	@Override
	public void updateCnt(int bno) throws Exception {
		dao.updateCnt(bno);
		
	}

	@Override
	public ImageBoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}

=======
>>>>>>> branch 'master' of https://github.com/hyejeongspace/final_project.git
}
