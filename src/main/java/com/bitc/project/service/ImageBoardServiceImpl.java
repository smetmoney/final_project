package com.bitc.project.service;

import java.util.List;

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
	public String createImageBoard() throws Exception {

		return null;
	}

}
