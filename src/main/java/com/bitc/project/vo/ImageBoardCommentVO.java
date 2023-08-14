package com.bitc.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ImageBoardCommentVO {
	private int commentNO;
	private int imageBoardBNO;
	private String commentContent;
	private String commenterID;
	private String commentDate;
	
	public void setCommentDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
		this.commentDate = sdf.format(date);
	}
}
