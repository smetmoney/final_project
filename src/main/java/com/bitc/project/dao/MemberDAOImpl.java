package com.bitc.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.bitc.project.vo.MemberVO;  // 패키지명 수정

@Repository
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public MemberVO getMemberById(String id) {
        return sqlSession.selectOne("com.bitc.project.dao.MemberDAO.getMemberById", id);
    }

    @Override
    public void insertMember(MemberVO member) {
        sqlSession.insert("com.bitc.project.dao.MemberDAO.insertMember", member);
    }
}
