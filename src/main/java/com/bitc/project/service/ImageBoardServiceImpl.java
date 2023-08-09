package com.bitc.project.service;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import com.bitc.project.dao.ImageBoardDAO;
import com.bitc.project.vo.ImageBoardVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ImageBoardServiceImpl implements ImageBoardService {

	private final ImageBoardDAO dao;
	
	@Override
	public List<ImageBoardVO> imageBoardList() throws Exception {
		List<ImageBoardVO> list = dao.imageBoardList();
		return list;
	}

	@Override
	public int createImageBoard(ImageBoardVO vo) throws Exception {
		return dao.createImageBoard(vo);
	}
	
}
