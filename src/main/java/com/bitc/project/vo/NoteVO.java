package com.bitc.project.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class NoteVO {
	
	private int nno;
    private String fromId;
    private String toId;
    private String content;
    private LocalDateTime createdAt;
    private LocalDateTime readAt;
    private String title;

}
