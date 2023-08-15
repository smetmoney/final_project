package com.bitc.project.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private int idn;		// 식별값
	private String id;		// 로그인용 아이디
	private String nname;	// 닉네임
	private String pass;   	// 비밀번호
	private String email;	// 이메일
	private String name;	// 이름
	private boolean stopu;	// 정지 유저
    private Date birthdate; // 생년월일
    private String gender;  // 성별
	
	public String getPass() {
		return pass;
	}

	public String getStopu() {
		return null;
	}
	
}
