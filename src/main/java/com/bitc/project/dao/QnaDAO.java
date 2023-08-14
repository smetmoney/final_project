package com.bitc.project.dao;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitc.project.vo.QnaVO;


public interface QnaDAO {

		/**
		 * @return 전체 QnA 목록
		 */
		@Select("SELECT * FROM QnA ORDER BY QnAID")
		List<QnaVO> qnaList()throws Exception;
		
		/**
		 * 새 QnA 작성
		 */
		@Insert("INSERT INTO QnA (QuestionTitle,QuestionContent) VALUES(#{questionTitle},#{questionContent})")
		int createQna(QnaVO vo);
		
		/**
		 * 특정 qna 로드
		 */
		@Select("SELECT * FROM QnA WHERE QnAID = #{qnaId}")
		QnaVO qnaload(int qnaId)throws Exception;
		

}
