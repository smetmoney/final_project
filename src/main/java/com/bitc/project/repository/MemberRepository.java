package com.bitc.project.repository;

import com.bitc.project.model.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Integer> {
    Member findByEmail(String email);  // 추가
    // 다른 회원 관련 메서드도 추가 가능
}
