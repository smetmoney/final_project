package com.bitc.project.vo;

import lombok.Data;

@Data
public class MemberVO {
	
	private int IDN;		// 식별값
	private String ID;		// 로그인용 아이디
	private String NNAME;	// 닉네임
	private String PASS;   	// 비밀번호
	private String EMAIL;	// 이메일
	private String NAME;	// 이름
	private boolean STOPU;	// 정지 유저
	
}
