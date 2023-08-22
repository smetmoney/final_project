package com.bitc.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class FreeBoardCommentVO {
	
	private int commentID;
	private int freeBoardBNO;
	private String commentContent;
	private String commenterID;
	private String commentDate;
	
	public void setCommentDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
		this.commentDate = sdf.format(date);
	}

}
