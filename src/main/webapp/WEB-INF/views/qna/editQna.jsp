-<!-- qnaPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../common/header.jsp" />
<style>
</style>

<div class="mainWrap">
	<div class="editTitle">
		<h1>질의 응답 수정·삭제</h1>
	</div>
	<div class="editQna">
		<form method="POST">
			<input type="hidden" name="qnaId" value="${QnaVO.qnaId}" required><br>
			<label for="title">제목:</label>
	        <input type="text" id="title" name="questionTitle" value="${QnaVO.questionTitle}" required><br>
	        <label for="content">내용:</label>
	        <textarea id="content" name="questionContent" required>${QnaVO.questionContent}</textarea><br>
	        <input type="submit" id="addBtn" value="등록">
	        <a href="delete?qnaId=${QnaVO.qnaId}">삭제하기</a>
		</form>
		
	</div>
</div>

<jsp:include page="../common/footer.jsp" />
