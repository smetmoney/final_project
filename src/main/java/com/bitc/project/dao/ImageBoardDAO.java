package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.project.util.Criteria;
import com.bitc.project.util.SearchCriteria;
import com.bitc.project.vo.ImageBoardVO;

public interface ImageBoardDAO {
	
	@Insert("INSERT INTO test_imageBoard VALUES(0,#{title},#{content},#{auth},now(),0,0,#{imageURL},false,0)")
	int createImageBoard(ImageBoardVO vo);
	
	@Update("UPDATE test_imageBoard SET vcnt = vcnt + 1 WHERE bno = #{bno}")
	void updateCnt(int bno);
	
	@Select("SELECT * FROM test_imageBoard WHERE bno = #{bno}")
	ImageBoardVO read(int bno);
 
	@Select("SELECT count(*) FROM test_imageBoard WHERE del = false")
	int totalCount();
	
	@Select("SELECT count(*) FROM test_imageBoard WHERE ${searchType} LIKE CONCAT('%',#{searchValue},'%') AND del = false")
	int searchCount(SearchCriteria cri);
	
	@Select("SELECT * FROM test_imageBoard WHERE del = false ORDER BY bno DESC limit #{startRow},#{perPageNum}")
	List<ImageBoardVO> imageBoardList(Criteria cri);
	
	@Update("Update test_imageBoard SET del = true WHERE bno = #{bno}")
	int delete(int bno);
	
	@Update("UPDATE test_imageBoard SET title = #{title}, content = #{content}, imageURL = #{imageURL} WHERE bno = #{bno}")
	int update(ImageBoardVO vo);
	
	@Select("SELECT * FROM test_imageBoard WHERE ${searchType} LIKE CONCAT('%',#{searchValue},'%') AND del = false ORDER BY bno limit #{startRow},#{perPageNum}")
	List<ImageBoardVO> searchList(SearchCriteria cri);
}


