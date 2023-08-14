<!-- qnaPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../common/header.jsp" />
<style>
</style>

<div class="mainWrap">
	<div class="editTitle">
		<h1>질의 응답 추가</h1>
	</div>
	<div class="editQna">
		<form method="POST">
			<label for="title">제목:</label>
	        <input type="text" id="title" name="questionTitle" required><br>
	        <label for="content">내용:</label>
	        <textarea id="content" name="questionContent" required></textarea><br>
	        <input type="submit" id="addBtn" value="등록">
		</form>
		
	</div>
</div>

<jsp:include page="../common/footer.jsp" />
