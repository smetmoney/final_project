package com.bitc.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int bno;
	private String title;
	private String content;
	private String auth;
	private Date regdate;
	private int vcnt;
	private int likeCount;
	private boolean fixedNotice;
	
	

}

	