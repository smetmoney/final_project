package com.bitc.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.project.dao.MemberDAO;
import com.bitc.project.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberDAO memberDAO;

	/*
	 * public MemberServiceImpl(MemberDAO memberDAO) { this.memberDAO = memberDAO; }
	 */

    @Override
    public void registerNewMember(MemberVO membervo) {
        memberDAO.insertMember(membervo);
    }

    @Override
    public MemberVO findMemberById(String id) {
        return memberDAO.selectMemberById(id);
    }

    @Override
    public List<MemberVO> findAllMembers() {
        return memberDAO.selectAllMember();
    }

    @Override
    public void updateMember(MemberVO membervo) {
        memberDAO.updateMember(membervo);
    }

    @Override
    public void deleteMember(String ID) {
        memberDAO.deleteMember(ID);
    }
}
