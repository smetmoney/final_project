<!-- qnaPage.jsp -->
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
	
	#addBtn{
		margin-top: 10px;
		padding: 10px 10px;
        border: none;
        background: #495057;
        color: #fff;
        border-radius: 3px;
        cursor: pointer;
	}
	
	#addBtn:hover {
	    background-color: #868e96;
	}
	
</style>

<div class="mainWrap">
	<div class="editTitle">
		<h1>질의 응답 추가</h1>
	</div>
	<div class="editQna">
		<form method="POST">
			<label for="title">제목:</label>
	        <input type="text" id="title" name="questionTitle" placeholder="질문 내용을 입력해주세요." required><br>
	        <label for="content">내용:</label>
	        <textarea id="content" name="questionContent" placeholder="답변 내용을 입력해주세요." required></textarea><br>
	        <input type="submit" id="addBtn" value="등록">
		</form>
		
	</div>
</div>

<jsp:include page="../common/footer.jsp" />
