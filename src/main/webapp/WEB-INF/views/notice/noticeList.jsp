<!-- qnaPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<jsp:include page="../common/header.jsp" />
<style>
	h1{padding-top : 25px;}
	.newNotice{
		text-align: right;
  		padding-right:15%;
  		padding-top: 10px;
  		width :100%;
		height: 50px;
	}
	.noticeList table{width:75%; margin:20px auto;}
	.noticeList *{padding: 8px 5px;}
	.noticeList table tr{
		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}
	.noticeList table th{
		margin-right:7px;
		font-size : 18px;
		background-color : rgb(97, 76, 76);;
		color: white;
		border-bottom: 3px solid black;
	}
	.noticeList table tr td{
		font-size:16px;
	}
	.editNotice form{
		display:inline-block;
		width:20%;	
	}
	.editNotice{display:inline-block;}
	.fixedContent{
		background-color: rgba(173, 173, 173, 0.76);
	}
	
</style>

<div class="mainWrap">
	<div class="noticeTitle">
		<h1>공지사항</h1>
		
	</div>
	<div class="newNotice">
		<c:choose>
			<c:when test="${userInfo.id eq 'ADMIN'}">
				<form action="newNotice" method="Get" >
					<input type="submit" value="공지사항 작성하기">
				</form>
			</c:when>
		</c:choose>
	</div>
	<div class="noticeList">
		<c:choose>
			<c:when test="${!empty noticeList}">
				<table>
					<colgroup>
						<col style="width:55%"/>
						<col style="width:15%"/>
						<col style="width:15%"/>
						<col style="width:15%"/>
					</colgroup>
			        	<tr>
			            	<th>제목</th>
			            	<th>작성자</th>
			            	<th>최종수정일</th>
			            	<th>조회수</th>
			        	</tr>
			        <!-- 고정 공지 출력 for문 -->
			        <c:forEach items="${fixedNoticeList}" var="con">
			            <tr class="fixedContent">
			                <td><a href="noticeDetail?bno=${con.bno}">[ 고정 ] ${con.title}</a></td>
			                <td>
								<c:choose>
									<c:when test="${con.auth eq 'ADMIN'}">
										관리자
									</c:when>
									<c:otherwise>
										${con.auth}
									</c:otherwise>
								</c:choose>
							</td>
			                <td><fmt:formatDate value="${con.updatedate}" type="date" dateStyle="short"/></td>
			                <td>${con.vcnt}</td>
			            </tr>
			        </c:forEach>
			        <!-- 공지 전체 출력 for문 -->
			        <c:forEach items="${noticeList}" var="con">
			            <tr class="noticeContent">
			                <td><a href="noticeDetail?bno=${con.bno}">${con.title}</a></td>
			                <td>
			               		 <c:choose>
									<c:when test="${con.auth eq 'ADMIN'}">
										관리자
									</c:when>
									<c:otherwise>
										${con.auth}
									</c:otherwise>
								</c:choose>
			                </td>
			                <td><fmt:formatDate value="${con.updatedate}" type="date" dateStyle="short"/></td>
			                <td>${con.vcnt}</td>
			            </tr>
			        </c:forEach>
			    </table>
			    <br/>
   	    		<c:if test="${!empty pm and pm.maxPage > 1}">
					<tr>
						<th colspan="5">
							<c:if test="${pm.first}">
								<a href="noticeList?page=1">[&laquo;]</a>
							</c:if>
							<c:if test="${pm.prev}">
								<a href="noticeList?page=${pm.startPage-1}">[&lt;]</a>
							</c:if>
							<c:forEach var="i" 
									   begin="${pm.startPage}" 
									   end ="${pm.endPage}">
								<a href="noticeList?page=${i}">[${i}]</a>
							</c:forEach>
							<c:if test="${pm.next}">
								<a href="noticeList?page=${pm.endPage+1}">[&gt;]</a>
							</c:if>
							<c:if test="${pm.last}">
								<a href="noticeList?page=${pm.maxPage}">[&raquo;]</a>
							</c:if>
						</th>
					</tr>
				</c:if>
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




<jsp:include page="../common/footer.jsp" />
