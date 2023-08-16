<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp" />
<div class="mainWrap">
    <h1>글 작성</h1>
    <form action="create" method="post" enctype="multipart/form-data">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required><br>
		<label for="auth">작성자:</label>
        <input type="text" value='${loggedInUser.nname}' disabled><br>
        <input type="hidden" id="auth" name="auth" value='${loggedInUser.nname}'>
        <label for="content">내용:</label>
        <textarea id="content" name="content" required></textarea><br>
        <label for="imageFile">이미지 첨부:</label>
        <input type="file" id="imageFile" name="file" accept="image/*" required><br>
        <input type="submit" value="작성">
    </form>
</div>
<jsp:include page="../common/footer.jsp" />
