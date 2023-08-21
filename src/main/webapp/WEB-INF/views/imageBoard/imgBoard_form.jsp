<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	let check = '${userInfo.nname}' == '';
	if(check){
		alert('잘못된 접근입니다.');
		location.href = "/project";
	}
</script>
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
	        	내용:<textarea id="editor" name="content"></textarea>
        	</li>
        	<li>
        		이미지 첨부:<input type="file" id="imageFile" name="file" accept="image/*" required>
        	</li>
        	<li id="btn">
	        	<input type="submit" value="작성">
	        </li>
        </ul>
    </form>   
</div>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
<script>
  ClassicEditor
    .create(document.querySelector('#editor'))
    .catch( error => {
      console.error( error );
    } );
</script>
<jsp:include page="../common/footer.jsp" />