package com.bitc.project.vo;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class MemberVO {
	
	private int IDN;		// 식별값
	
	@NotNull
	private String ID;		// 로그인용 아이디
	
	private String NNAME;	// 닉네임
	private String PASS;   	// 비밀번호
	private String EMAIL;	// 이메일
	private String NAME;	// 이름
	private boolean STOPU;	// 정지 유저
    private Date BIRTHDATE; // 생년월일
    private String GENDER;  // 성별
	
	public String getPass() {
		return PASS;
	}

	public String getStopu() {
		return null;
	}
	
}
