package com.bitc.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.project.dao.MemberDAO;
import com.bitc.project.vo.LoginDTO;
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
    public MemberVO registerNewMember(MemberVO membervo) throws Exception {
        memberDAO.insertMember(membervo); // 회원 등록
        return membervo; 				  // 등록된 회원 정보 반환
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

    @Override
    public MemberVO selectIdAndPass(LoginDTO dto) {
        return memberDAO.selectIdAndPass(dto);
    }

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return memberDAO.login(dto);
	}

	@Override
	public String checkNick(String nname) {
		return memberDAO.checkNick(nname) == null ? "OK" : "X";
	}



}
