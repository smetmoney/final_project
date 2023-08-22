<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div class="mainWrap">
    <h1>글 수정</h1>
    <form action="editNotice" method="post" d="modifyForm">
   		<input type="hidden" name="uno" value="${userInfo.uno}"/>
    	<input type="hidden" id="title" name="bno" value="${vo.bno}" required><br>
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" value="${vo.title}" required><br>
		<label for="auth">작성자:</label>
        <input type="text" id="auth" name="auth" value="${vo.auth}" required readonly><br>
        <label for=fixedNotice>공지 상단 고정 :</label>
        <label for="fixedNoticeT"> [ 고정 ]  </label>
        <input type="radio" name="fixedNotice" id ="fixedNoticeT" value="true" ${vo.fixedNotice eq true ? 'checked="checked"' : ''}/>
        <label for="fixedNoticeF"> [ 미고정 ]  </label>
        <input type="radio" name="fixedNotice" id ="fixedNoticeF" value="false" ${vo.fixedNotice eq false ? 'checked="checked"' : ''}/><br> 
        <label for="content">내용:</label>
        <textarea id="content" name="content">${vo.content}</textarea><br>
        <input type="submit" value="작성" id="saveBtn">
		<div>
			<label>FILE DROP HERE</label>
			<div class="fileDrop">
			
			</div>
			<div>
				<!-- 첨부파일 목록 추가 -->
				<ul class="uploadList">
					<c:if test="${!empty board.files}">
						<c:forEach var="file" items="${board.files}">
							<li data-src='${file}'>
								<c:choose>
									<c:when test="${fn:contains(file,'s_')}">
										<!-- 이미지 파일 -->
										<img src='${path}/displayFile?fileName=${file}'/>
										<div>
											<a href='${path}/displayFile?fileName=${fn:replace(file,"s_","")}' target='blank'>
											<!-- /2023/08/21/s_95e278a2fdd048f8a25fcc68352449c3_SQL Injection.jpg -->
											<!-- /2023/08/21/95e278a2fdd048f8a25fcc68352449c3_SQL Injection.jpg -->
											<!-- SQL Injection.jpg -->
												${fn:substringAfter(fn:replace(file,"s_",""),'_')}
											</a>
										</div>
									</c:when>
									<c:otherwise>
										<!-- 일반 파일 -->
										<img src='${path}/resources/img/file.png'/>
										<div>
											<a href='${path}/displayFile?fileName=${file}'>
											<!-- /2023/08/21/95e278a2fdd048f8a25fcc68352449c3_SQL Injection.jpg -->
											<!-- SQL Injection.jpg -->
												${fn:substringAfter(file,'_')}
											</a>
										</div>
									</c:otherwise>
								</c:choose>
								<div>
									<a href="${file}" class='delBtn'>[삭제]</a>
								</div>
							</li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
	</form>
</div> 
	<script>
		function resizeMainWrap() {
		    var mainWrap = document.getElementById("mainWrap");
		    var children = mainWrap.children;
	
		    if (children.length >= 2) { // 적어도 두 개의 자식이 있어야 함
		        var secondChild = children[1]; // 두 번째 자식 요소 선택
		        var contentHeight = secondChild.scrollHeight; // 두 번째 자식 요소의 실제 높이
		        mainWrap.style.height = contentHeight + "px";
		    }
		}
	
		// 페이지 로드 후 자동으로 크기 조절
		window.addEventListener("load", resizeMainWrap);
	
		// 내부 컨텐츠가 변경될 때 크기 조절
		window.addEventListener("resize", resizeMainWrap);

	</script>
	<script src="https://cdn.tiny.cloud/1/txisexjqogc2o5hq1mpsl5obcf0exfbgxj0f053sshq2xiu1/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
	<script>
	let plugins = ["link" ,"image"];
	let edit_toolbar = "blocks fontfamily fontsize | link image forecolor backcolor"
	
	tinymce.init({
		language : "ko_KR",
		selector: '#content',
		width : 600,
		height: 500,
		menubar : false,
		plugins: plugins,
		  toolbar: edit_toolbar,
		  /* enable title field in the Image dialog*/
		  image_title: true,
		  /* enable automatic uploads of images represented by blob or data URIs*/
		  automatic_uploads: true,
		  /*
		    URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
		    images_upload_url: 'postAcceptor.php',
		    here we add custom filepicker only to Image dialog
		  */
		  file_picker_types: 'image',
		  /* and here's our custom image picker*/
		  file_picker_callback: (cb, value, meta) => {
		    const input = document.createElement('input');
		    input.setAttribute('type', 'file');
		    input.setAttribute('accept', 'image/*');

		    input.addEventListener('change', (e) => {
		      const file = e.target.files[0];

		      const reader = new FileReader();
		      reader.addEventListener('load', () => {
		        /*
		          Note: Now we need to register the blob in TinyMCEs image blob
		          registry. In the next release this part hopefully won't be
		          necessary, as we are looking to handle it internally.
		        */
		        const id = 'blobid' + (new Date()).getTime();
		        const blobCache =  tinymce.activeEditor.editorUpload.blobCache;
		        const base64 = reader.result.split(',')[1];
		        const blobInfo = blobCache.create(id, file, base64);
		        blobCache.add(blobInfo);

		        /* call the callback and populate the Title field with the file name */
		        cb(blobInfo.blobUri(), { title: file.name });
		      });
		      reader.readAsDataURL(file);
		    });

		    input.click();
		  },
		  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
		});
  </script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script>
  	var contextPath = '${pageContext.request.contextPath}';
  </script>
  <script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
  <script>
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
  	
  	var arr = [];
  	
  	// 첨부파일 삭제
  	$(".uploadList").on("click",".delBtn",function(event){
  		event.preventDefault();
  		// event가 발생한 a tag 요소
  		let target = $(this);
  		// target 요소의 속성값 href == fullName
  		let fullName = target.attr("href");
  		arr.push(fullName);
	  	// 선택자로 지정된 가장 가까운 부모요소를 검색
  		target.closest("li").remove();
  	});
  	
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
  		$("#modifyForm").append(str);
  		
  		$.post(contextPath+"/deleteAllFiles",{files : arr}, function(data){
  			alert(data);
  		})
  		
  		$("#modifyForm").submit();
  	});
  	
  </script>	
<!-- <script>
	let editor;
	
    ClassicEditor
        .create( document.querySelector( '#content' ) )
        .then( newEditor => {
        editor = newEditor;
    } )
	.then( editor => {
		window.editor = editor;
	} )
    .catch( error => {
           console.error( error );
    } );
    
    function uploadData() {
    
    	const editorData = editor.getData();
    	console.log(typeof(editorData));
    	
    	var xhr = new XMLHttpRequest();
    	
    	xhr.onreadystatechange = function() {
    		if(xhr.readyState==4&&xhr.status==200) {
    			
    		}
    	}
    	xhr.open("post", "{path}/notice/editNotice", true);
    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
    	xhr.send("editorData="+editorData);
    }
   

</script> -->

<jsp:include page="../common/footer.jsp" />
