package com.bitc.project.service;

import com.bitc.project.dto.MemberDTO;
import com.bitc.project.model.Member; 					 // 추가
import com.bitc.project.repository.MemberRepository; 	 // 추가
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public MemberServiceImpl(MemberRepository memberRepository, PasswordEncoder passwordEncoder) {
        this.memberRepository = memberRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void registerNewMember(MemberDTO memberDTO) {
        Member newMember = new Member();
        newMember.setId(memberDTO.getId());
        newMember.setNname(memberDTO.getNname());
        newMember.setPass(passwordEncoder.encode(memberDTO.getPass()));  // 비밀번호 인코딩
        newMember.setEmail(memberDTO.getEmail());
        newMember.setName(memberDTO.getName());
        // 나머지 정보도 설정
        
        memberRepository.save(newMember);
    }
}
