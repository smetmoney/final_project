<!-- qnaPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../common/header.jsp" />
<style>
	.newQna{
		text-align: right;
  		padding-right:50px;
  		padding-top: 10px;
  		width :100%;
		height: 50px;
		background-color:blue;
	}
</style>

<div class="mainWrap">
	<div class="editTitle">
		<h1>질의 응답 추가</h1>
	</div>
	<div class="editQna">
		<form action="qnaPage" method="POST">
			<input type="hidden" name="qnaId" value="${qnaVO.qnaId}" required><br>
			<label for="title">제목:</label>
	        <input type="text" id="title" name="title" required><br>
			<label for="auth">작성자:</label>
	        <input type="text" id="auth" name="auth" value="${userId}" required disabled><br>
	        <label for="content">내용:</label>
	        <textarea id="content" name="content" required></textarea><br>
	        <input type="submit" value="등록">
		</form>
		
	</div>
</div>


<jsp:include page="../common/footer.jsp" />
