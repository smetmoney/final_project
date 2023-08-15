<!-- qnaPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
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
	.qnaList{
		padding-left:15%;
		background-color:skyblue;	
		padding-top:20px;
	}
	.qnaList table{width:75%;}
	.qnaList table tr{
		display:block;
		border: 1px solid black;
		padding :10px;
	}
	.qnaList table th{
		width:100%;
		display:inline-block;
		font-size : 20px;
	}
	.qnaList table tr td{font-size:18px;}
	.editQna form{
		display:inline-block;
		width:20%;	
	}
	.editQna{display:inline-block;}
	
</style>

<div class="mainWrap">
	<div class="qnaTitle">
		<h1>자주 들어오는 질문</h1>
	</div>
	<div class="newQna">
		<c:choose>
			<c:when test="${userId eq 'admin'}">
				<form action="newQna" method="Get" >
					<input type="submit" value="새로운 QnA 작성하기">
				</form>
			</c:when>
		</c:choose>
	</div>
	<div class="qnaList">
		<c:choose>
			<c:when test="${!empty noticeList}">
				<table>
					<colgroup>
						<col style="width:70%"/>
						<col style="width:10%"/>
						<col style="width:20%"/>
					</colgroup>
			        <c:forEach items="${noticeList}" var="con">
			        	<tr>
			            	<th>제목</th>
			            	<th>작성자</th>
			            	<th>작성일</th>
			        	</tr>
			            <tr class="noticeContent">
			                <td>${con.title}</td>
			                <td>${con.title}</td>
			                <td>${con.title}</td>
			            </tr>
			        </c:forEach>
			    </table>
			</c:when>
			<c:otherwise>
				<h3>공지사항을 준비 중입니다 ...</h3>
			</c:otherwise>
		</c:choose>
	
		
	</div>
</div>

<script>
/* 작업 수행 결과 출력 */
var resultMessage = "${result}"; // 서버에서 전달된 메시지
if (resultMessage !== "") {
    alert(resultMessage); // 메시지 팝업 표시
}
</script>


</script>


<jsp:include page="../common/footer.jsp" />
