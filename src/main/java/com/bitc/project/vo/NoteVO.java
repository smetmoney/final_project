package com.bitc.project.vo;

import lombok.Data;

@Data
public class NoteVO {
	
	private int nno;
    private String fromId;
    private String toId;
    private String content;
    private String title;

}
