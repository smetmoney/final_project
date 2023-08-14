package com.bitc.project.vo;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class FreeBoardVO {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String title;
    
    private String content;
    
    private String imageUrl;
    
    private String auth;
    
    private Date date;
    
    private int vnt;
    
    private int likeCount;
    
}
