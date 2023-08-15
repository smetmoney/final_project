package com.bitc.project.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int bno;
	private String title;
	private String content;
	private String auth;
	private Date regdate;
	private int vnt;
	private int likeCount;
	private boolean fixedNotice;	
}
