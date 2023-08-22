package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.project.util.SearchCriteria;
import com.bitc.project.vo.NoteVO;

public interface NoteDAO {

	@Insert("INSERT INTO note (from_id, to_id, content, title) VALUES (#{fromId}, #{toId}, #{content}, #{title})")
	void createNote(NoteVO noteVO);

	@Select("SELECT * FROM note")
    List<NoteVO> noteVOList(SearchCriteria cri);

	@Select("SELECT count(*) FROM note WHERE del = false")
    int totalCount(SearchCriteria cri);

    @Select("SELECT * FROM note WHERE nno = #{nno}")
    NoteVO read(int nno);

    @Update("DELETE FROM note WHERE nno = #{nno}")
    int delete(int nno);

	
}
