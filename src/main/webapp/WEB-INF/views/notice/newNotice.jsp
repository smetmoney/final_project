<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp" />
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>

<style>
.ck.ck-toolbar__items{
	margin-left:20vw;
}
.ck.ck-content{
	width:60%;
	min-height:500px;
	margin-left:20vw;
}
</style>
<div class="mainWrap">
    <h1>새 공지사항 작성하기</h1>
    <form action="newNotice" method="post" onsubmit="uploadData()" >
        <label for="title">제  목 :</label>
        <input type="text" id="title" name="title"" required><br>
		<label for="auth">작성자:</label>
        <input type="text" id="auth" name="auth" value="${vo.id}" required readonly><br>
        <label for=fixedNotice>공지 상단 고정 :</label>
        <label for="fixedNoticeT"> [ 고정 ]  </label>
        <input type="radio" name="fixedNotice" id ="fixedNoticeT" value="true"/>
        <label for="fixedNoticeF"> [ 미고정 ]  </label>
        <input type="radio" name="fixedNotice" id ="fixedNoticeF" value="false" checked="checked"/><br> 
        <label for="content">내용:</label>
        <textarea id="content" name="content"></textarea><br>
        <button type="submit">작성 완료</button>
        <!-- <input type="submit" value="작성"> -->
    </form>
</div> 
<script>
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
    	xhr.open("post", "{path}/notice/newNotice", true);
    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
    	xhr.send("editorData="+editorData);
    }
   

</script>

<jsp:include page="../common/footer.jsp" />
