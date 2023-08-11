package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitc.project.vo.ImageBoardVO;

public interface ImageBoardDAO {
	
	@Select("SELECT * FROM test_imageBoard limit 0,6")
	List<ImageBoardVO> imageBoardList()throws Exception;
	
	@Insert("INSERT INTO test_imageBoard VALUES(0,#{title},#{content},#{auth},now(),0,0,#{imageURL})")
	int createImageBoard(ImageBoardVO vo);
	
}
