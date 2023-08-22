package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.project.util.Criteria;
import com.bitc.project.vo.FreeBoardVO;

@Mapper
public interface FreeBoardDAO {

	@Insert("INSERT INTO FreeBoard VALUES(0,#{title},#{content},#{auth},now(),0,0)")
    int createFreeBoard(FreeBoardVO board);
	/*
	@Update("UPDATE FreeBoard SET cnt = vnt + 1 WHERE bno = #{bno}")
    void update(@Param("board") FreeBoardVO board);
	*/
	@Delete("DELETE FROM FreeBoard WHERE bno = #{bno}")
    void delete(int bno);

    @Select("SELECT * FROM FreeBoard WHERE bno = #{bno}")
    FreeBoardVO read(int bno);

    // 이건 같은거 같은데 쌤거 보고 해서 그런가 더있네 - 1
    List<FreeBoardVO> listAll(); 

    @Select("SELECT * FROM FreeBoard ORDER BY bno DESC limit #{startRow},#{perPageNum}")
    List<FreeBoardVO> listCriteria(Criteria cri);

    @Select("SELECT count(*) FROM FreeBoard")
    int totalCount();

    // 이건 같은거 같은데 쌤거 보고 해서 그런가 더있네 - 2
    @Update("UPDATE freeBoard SET vnt = vnt + 1 WHERE bno = #{bno}")
    void updateCnt(int bno);
	
}