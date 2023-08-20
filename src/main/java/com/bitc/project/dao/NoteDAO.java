package com.bitc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.project.util.SearchCriteria;
import com.bitc.project.vo.NoteVO;

public interface NoteDAO {

	@Insert("INSERT INTO note (from_id, to_id, content, created_at) VALUES (#{fromId}, #{toId}, #{content}, #{createdAt})")
	int createNote(NoteVO noteVO);

	@Select("SELECT * FROM note")
    List<NoteVO> noteVOList(SearchCriteria cri);

	@Select("SELECT count(*) FROM note WHERE del = false")
    int totalCount(SearchCriteria cri);

    @Select("SELECT COUNT(*) FROM note WHERE ...") // 검색 조건에 맞게 쿼리 작성
    int searchTotalCount(SearchCriteria cri);

    @Select("SELECT * FROM note WHERE ...") // 검색 조건에 맞게 쿼리 작성
    List<NoteVO> searchList(SearchCriteria cri);
    
    @Select("SELECT count(*) FROM note WHERE content LIKE CONCAT('%',#{searchValue},'%') AND del = false")
	int searchContentCount(SearchCriteria cri);

    @Select("SELECT * FROM note WHERE nno = #{nno}")
    NoteVO read(int nno);

    @Update("UPDATE note SET ... WHERE nno = #{nno}") // 업데이트할 내용에 맞게 쿼리 작성
    int update(NoteVO vo);

    @Update("DELETE FROM note WHERE nno = #{nno}")
    int delete(int nno);

	int totalCount();

	int searchTitleCount(SearchCriteria cri);



	
}
