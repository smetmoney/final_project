package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.bitc.project.vo.ImageBoardVO;

public interface ImageBoardDAO {
	
	@Select("SELECT * FROM test_imageBoard")
	List<ImageBoardVO> imageBoardList()throws Exception;
	
}
