package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bitc.project.util.Criteria;
import com.bitc.project.vo.FreeBoardVO;

@Mapper
public interface FreeBoardDAO {

    int create(@Param("board") FreeBoardVO board);

    void update(@Param("board") FreeBoardVO board);

    void delete(int bno);

    FreeBoardVO read(int bno);

    List<FreeBoardVO> listAll();

    List<FreeBoardVO> listCriteria(@Param("cri") Criteria cri);

    int totalCount();

    void updateCnt(int bno);
}