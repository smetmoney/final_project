<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp" />
<div class="mainWrap">
    <h1>글 수정</h1>
    <form action="modify_submit" method="post" enctype="multipart/form-data">
    	<input type="hidden" id="title" name="bno" value="${vo.bno}" required><br>
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" value="${vo.title}" required><br>
		<label for="auth">작성자:</label>
        <input type="text" id="auth" name="auth" value="${vo.auth}" required disabled><br>
        <label for="content">내용:</label>
        <textarea id="content" name="content" required>${vo.content}</textarea><br>
        <label for="imageFile">이미지 첨부:</label>
        <input type="file" id="imageFile" name="file" accept="image/*" required><br>
        <input type="submit" value="작성">
    </form>
</div> 
<jsp:include page="../common/footer.jsp" />
