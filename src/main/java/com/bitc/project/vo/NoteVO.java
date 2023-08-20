package com.bitc.project.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class NoteVO {
	
	private int id;
    private int fromId;
    private int toId;
    private String content;
    private LocalDateTime createdAt;
    private LocalDateTime readAt;
    private String title;

}
