package com.bitc.project.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
public class ImageBoardVO {
	private String title;
	private String content;
	private Date date;
	private String url;
	private int count;
}
