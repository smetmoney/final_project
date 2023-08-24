<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>\
<!-- 할일... 이미지 업로드 방식 수정 -->
<script>
	let check = '${userInfo.nname}' == '';
	if(check){
		alert('잘못된 접근입니다.');
		location.href = "/project";
	}
</script>
<style>
	.fileDrop{
		width:100%;
		height:150px;
		border:1px solid gray;
		background-color:lightgray;
		margin:auto;
	}
	
	.uploadList{
		width:100%;
	}
	
	.uploadList li{
		float:left;
		padding:20px;
		list-style:none;
	}
	
</style>
<style>
#mainWrap {
    width:100%;
    height:1200px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f2f2f2;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    margin-bottom: 20px;
}

li{
	margin:10px;
}

.ck-editor__editable_inline{
	height: 500px;
}

form{
	width: 65%;
	margin: 0 auto;
}

input[type="text"],
textarea,
input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="file"] {
    padding: 5px;
}

input[type="submit"] {
    background-color: #3498db;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #2980b9;
}

#btn{
	text-align: right;
}
</style>
<div id="mainWrap">
    <h1>게시글작성</h1>
    <hr/>
    <form action="create" method="post" enctype="multipart/form-data">
    	<ul>
	        <li>
	        	제목:<input type="text" id="title" name="title" required>
        	</li>
			<li>
				작성자:<input type="text" value='${userInfo.nname}' disabled>
				<input type="hidden" id="auth" name="auth" value='${userInfo.nname}'>
			</li>
	        <li id="content">
	        	<textarea id="editor" name="content"></textarea>
	        	<ul class="uploadList"></ul>
        	</li>
        	<li>
        		이미지 첨부:<input type="file" id="imageFile" name="file" accept="image/*" required>
        	</li>
        	<li id="btn">
	        	<input type="submit" value="작성">
	        </li>
        </ul>
   		<div>
			<label>FILE DROP HERE</label>
			<div class="fileDrop">
			
			</div>
		</div>
    </form>   
</div>
<script src="https://cdn.tiny.cloud/1/txisexjqogc2o5hq1mpsl5obcf0exfbgxj0f053sshq2xiu1/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
<script>
let plugins = ["link"];
let edit_toolbar = "blocks fontfamily fontsize | forecolor backcolor"

tinymce.init({
	language : "ko_KR",
	selector: '#editor',
	height: 600,
	menubar : false,
	plugins: plugins,
	toolbar: edit_toolbar,
	content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
});
</script>
<script>
  	var contextPath = '${pageContext.request.contextPath}';
  </script>
  <script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
  <script>
  	$("#saveBtn").click(function(){
  		/*
  		let content = tinymce.activeEditor.getContent();
  		console.log(content);
  		*/
  		let str = "";
  		console.log("click");
  		let fileList = $(".uploadList .delBtn");
  		console.log(fileList);
  		$(fileList).each(function(){
  			str += "<input type='hidden' name='files' value='"+$(this).attr("href")+"'/>";
  		});
  		
  		$("#registerForm").append(str);
  		$("#registerForm").submit();
  	});
  	
  	// file drop 파일 첨부
  	$(".fileDrop").on("dragenter dragover" , function(e){
  		e.preventDefault();
  	});
  	
  	$(".fileDrop").on("drop", function(event){
  		event.preventDefault();
  		
  		let files = event.originalEvent.dataTransfer.files;
  		console.log(files);
  		
  		let maxSize = 10485760; // 10MB
  		
  		let formData = new FormData();
  		
  		for(let i = 0; i < files.length; i++){
  			if(files[i].size > maxSize){
  				alert("파일 용량이 너무 큽니다.");
  				return;
  			}
  	        if (files[i].type.startsWith("image/")) {
  	            let reader = new FileReader();
  	            reader.onload = function(event) {
  	                let img = new Image();
  	                img.src = event.target.result;
  	                
  	                // 에디터 내에 이미지 삽입
  	                tinymce.activeEditor.insertContent(img.outerHTML);
  	            };
  	            reader.readAsDataURL(files[i]);
  	        }
  			
  			formData.append("file",files[i]);
  		}
  		
  		$.ajax({
  			type : "POST",
  			data : formData,
  			processData : false,
  			contentType : false,
  			url : contextPath+"/uploadFile",
  			dataType : "json",
  			success : function(data){
  				// upload 된 파일 이름 목록을 list로 전달
  				console.log(data);
  				
  				for(let i = 0; i < data.length; i++){
  					console.log(data[i]);
  					let fileInfo = getFileInfo(data[i]);
  					console.log(fileInfo);
  					// upload 된 파일 게시글 작성 페이지에 출력
  					let html = "<li>";
  					html += "<img src='"+fileInfo.imgSrc+"' alert='attachment'/>";
  					html += "<div>";
  					html += "<a href='"+fileInfo.getLink+"' target='_blank'>";
  					html += fileInfo.fileName
  					html += "<a/>";
  					html += "</div>"
					html += "<div>";
					// fullName
					html += "<a href='"+data[i]+"' class='delBtn'>[X]</a>";
					html += "</div>"
  					html +=	"</li>";
  					$(".uploadList").append(html);
  				}
  			}
  		});
  	}); // file drop upload end
  	
  	// 첨부파일 삭제
  	$(".uploadList").on("click",".delBtn",function(event){
  		event.preventDefault();
  		// event가 발생한 a tag 요소
  		let target = $(this);
  		// target 요소의 속성값 href == fullName
  		let fullName = target.attr("href");
  		
  		$.ajax({
  			type : "POST",
  			url : contextPath+"/deleteFile",
  			data : {
  				fileName : fullName
  			},
  			success : function(data){
  				console.log(data);
  				// target을 기준으로 부모요소들 중에
  				// 선택자로 지정된 가장 가까운 부모요소를 검색
  				target.closest("li").remove();
  			}
  		});
  	});
  </script>	
<jsp:include page="../common/footer.jsp" />