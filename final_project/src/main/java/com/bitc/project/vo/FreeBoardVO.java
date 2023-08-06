package com.bitc.project.vo;

public class FreeBoardVO {

	@Entity
	public class Post {
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	    private String title;
	    private String content;
	    private String imageUrl; // 이미지 파일의 경로를 저장할 필드
	    
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getImageUrl() {
			return imageUrl;
		}
		public void setImageUrl(String imageUrl) {
			this.imageUrl = imageUrl;
		}
		
		@Override
		public String toString() {
			return "Post [id=" + id + ", title=" + title + ", content=" + content + ", imageUrl=" + imageUrl + "]";
		}
		
		

	    
	}
	
}
