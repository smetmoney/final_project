<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../common/note_header.jsp" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../resources/css/note.css">

<div class="mainWrap">

	<div id=createForm>
	
    <h1>답장하기</h1>
     
     <form action="${pageContext.request.contextPath}/note/noteWrite" method="post">
     	<input type="hidden" id="from_Id" name="from_Id" class="height" value="${sessionScope.userInfo.id}" />
	    <label for="fromId">보내는 회원</label>
	    <input type="text" id="from_Id" name="from_Id" class="height" value="${sessionScope.userInfo.id}" readonly /> <br/>
	    <label for="toId">받는 사람</label>
	    <input type="text" name="to_Id" name="to_Id" class="height" value="${note.from_Id}" /> <br/>
	    <label for="title">제목</label>
	    <input type="text" name="title" class="height" placeholder="제목" /> <br/>
	    <label for="content">내용</label>
	    <textarea id="editor" name="content" class="height" placeholder="내용"></textarea> <br/>
	    <input type="submit" value="보내기" />
	</form>
	
	</div>
     
</div>

<script src="https://cdn.tiny.cloud/1/txisexjqogc2o5hq1mpsl5obcf0exfbgxj0f053sshq2xiu1/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>

<script>
let plugins = ["link" ,"image"];
let edit_toolbar = "blocks fontfamily fontsize | link image forecolor backcolor"

tinymce.init({
	language : "ko_KR",
	selector: '#editor',
	height: 400,
	menubar : false,
	plugins: plugins,
	  toolbar: edit_toolbar,
	  image_title: true,
	  automatic_uploads: true,
	  file_picker_types: 'image',
	  file_picker_callback: (cb, value, meta) => {
	    const input = document.createElement('input');
	    input.setAttribute('type', 'file');
	    input.setAttribute('accept', 'image/*');

	    input.addEventListener('change', (e) => {
	      const file = e.target.files[0];

	      const reader = new FileReader();
	      reader.addEventListener('load', () => {
	        const id = 'blobid' + (new Date()).getTime();
	        const blobCache =  tinymce.activeEditor.editorUpload.blobCache;
	        const base64 = reader.result.split(',')[1];
	        const blobInfo = blobCache.create(id, file, base64);
	        blobCache.add(blobInfo);
	        cb(blobInfo.blobUri(), { title: file.name });
	      });
	      reader.readAsDataURL(file);
	    });
	    input.click();
	  },
	  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
	});
</script>

<!-- <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
<script>
  ClassicEditor
    .create(document.querySelector('#editor'))
    .catch( error => {
      console.error( error );
    } );
</script> -->
<jsp:include page="../common/footer.jsp" />
