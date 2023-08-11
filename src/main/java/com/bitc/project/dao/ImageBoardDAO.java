package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.project.util.Criteria;
import com.bitc.project.vo.ImageBoardVO;

public interface ImageBoardDAO {
	
	@Insert("INSERT INTO test_imageBoard VALUES(0,#{title},#{content},#{auth},now(),0,0,#{imageURL})")
	int createImageBoard(ImageBoardVO vo);
	
	@Update("UPDATE test_imageBoard SET vcnt = vcnt + 1 WHERE bno = #{bno}")
	void updateCnt(int bno);
	
	@Select("SELECT * FROM test_imageBoard WHERE bno = #{bno}")
	ImageBoardVO read(int bno);

	@Select("SELECT count(*) FROM test_imageBoard")
	int totalCount();

	@Select("SELECT * FROM test_imageBoard ORDER BY bno DESC limit #{startRow},#{perPageNum}")
	List<ImageBoardVO> imageBoardList(Criteria cri);
}
