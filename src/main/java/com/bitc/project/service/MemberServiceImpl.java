package com.bitc.project.service;

import com.bitc.project.dto.MemberDTO;
import com.bitc.project.model.Member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    private final PasswordEncoder passwordEncoder;

    @Autowired
    public MemberServiceImpl(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    public void registerNewMember(MemberDTO memberDTO) {
        Member newMember = new Member();
        newMember.setId(Long.valueOf(memberDTO.getId()));
        newMember.setNname(memberDTO.getNname());
        newMember.setPass(passwordEncoder.encode(memberDTO.getPass()));  // 비밀번호 인코딩
        newMember.setEmail(memberDTO.getEmail());
        newMember.setName(memberDTO.getName());
        newMember.setStopu(Boolean.valueOf(memberDTO.getStopu()));
        
        memberRepository.save(newMember);
    }


	@Override
	public MemberDTO findMemberById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberDTO> findAllMembers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(String id) {
		// TODO Auto-generated method stub
		
	}
}
