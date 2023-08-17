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
    <form action="editNotice" method="post" >
    	<input type="hidden" id="title" name="bno" " required><br>
        <label for="title">제  목 :</label>
        <input type="text" id="title" name="title"" required><br>
		<label for="auth">작성자:</label>
        <input type="text" id="auth" name="auth"" required><br>
        <label for="content">내용:</label>
        <textarea id="content" name="content" required></textarea><br>
        <input type="submit" value="작성">
    </form>
</div> 
<script>
    ClassicEditor
        .create( document.querySelector( '#content' ) )
        .catch( error => {
            console.error( error );
        } );
   
</script>

<jsp:include page="../common/footer.jsp" />