package com.bitc.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FreeBoardVO {
	
	private int bno;			// 글번호
	
	private String title;		// 제목
	
	private String content;		// 글내용
	
	private String auth;		// 작성자
	
	private String date;		// 작성일
	
	private int vcnt;			// 조회수
	
	private int lcnt;			// 좋아요수
	
	private boolean del;		// 삭제여부
	
	private int commentCount;	// 댓글갯수
	/*
	private String freeBoardURL;	// 이미지 경로
	
	private MultipartFile file;
	*/
	
	public void setDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");
		this.date = sdf.format(date);
	}
	
}
