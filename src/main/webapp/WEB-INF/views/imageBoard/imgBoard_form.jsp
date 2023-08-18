<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- <jsp:include page="../common/header.jsp" /> --%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	let check = '${userInfo.nname}' == '';
	if(check){
		alert('잘못된 접근입니다.');
		location.href = "/project";
	}
</script>
<div class="mainWrap">
    <h1>글 작성</h1>
    <form action="create" method="post" enctype="multipart/form-data">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required><br>
		<label for="auth">작성자:</label>
        <input type="text" value='${userInfo.nname}' disabled><br>
        <input type="hidden" id="auth" name="auth" value='${userInfo.nname}'>
        <label for="content">내용:</label>
        <textarea id="editor" name="content"></textarea><br>
        <label for="imageFile">이미지 첨부:</label>
        <input type="file" id="imageFile" name="file" accept="image/*" required><br>
        <input type="submit" value="작성">
    </form>   
</div>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
<script>
  ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .catch( error => {
      console.error( error );
    } );
</script>
<%-- <jsp:include page="../common/footer.jsp" /> --%>
