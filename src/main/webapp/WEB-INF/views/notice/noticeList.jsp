<!-- qnaPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../common/header.jsp" />
<link rel="stylesheet" href="../resources/css/notice.css">

<div class="mainWrap">
	<div class="noticeTitle">
		<h1>공지사항</h1>
		
	</div>
	<div class="newNotice">
		<c:choose>
			<c:when test="${userInfo.id eq 'admin'}">
				<form action="newNotice" method="Get" >
					<input type="submit" value="공지사항 작성하기" class="newBtn">
				</form>
			</c:when>
		</c:choose>
	</div>
	<hr/>
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
			                <td><a href="noticeDetail?bno=${con.bno}" class="noticeHyper">[ 고정 ] ${con.title}</a></td>
			                <td>
								<c:choose>
									<c:when test="${con.auth eq 'admin'}">
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
			                <td><a href="noticeDetail?bno=${con.bno}" class="noticeHyper">${con.title}</a></td>
			                <td>
			               		 <c:choose>
									<c:when test="${con.auth eq 'admin'}">
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
