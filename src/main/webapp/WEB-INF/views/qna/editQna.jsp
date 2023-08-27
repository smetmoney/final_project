-<!-- qnaPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../common/header.jsp" />
<style>
	h1{padding-top:25px}
	form{
		width : 75%;
		max-width : 800px;
		text-align:left;
		margin: 0 auto;
	}
	input[type="text"],
	textarea{
	    width: 100%;
	    padding: 10px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	}
	textarea{height:45%;}
	label{
		margin: 17px 0 7px 0;
	}
	#editBtn, #delBtn{
		margin-top: 10px;
		padding: 10px 10px;
        border: none;
        background: #495057;
        color: #fff;
        border-radius: 3px;
        cursor: pointer;
        display:inline-block;
	}
	#delBtn{background-color:#868e96; }
	#delBtn:hover{background-color:adb5bd;} 
	#editBtn:hover{
	    background-color: #868e96;
	}
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
	        <input type="submit" id="editBtn" value="등록하기">
	        <a href="delete?qnaId=${QnaVO.qnaId}", id="delBtn">삭제하기</a>
		</form>
		
	</div>
</div>

<jsp:include page="../common/footer.jsp" />
