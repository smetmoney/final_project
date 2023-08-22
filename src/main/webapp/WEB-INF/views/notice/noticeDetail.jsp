<!-- qnaPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../common/header.jsp" />
<style>
	.newNotice{
		text-align: right;
  		padding-right:50px;
  		padding-top: 10px;
  		width :100%;
		height: 50px;
		background-color:blue;
	}
	.noticeDetail{
		border: 1px solid black;
		width:80%;
		padding:20px;
		padding-left:35px;
		text-align:left;
		display:inline-block;
	}
	.mainWrap{
		text-align:center;
	}
</style>

<div class="mainWrap">
	<div class="noticeTitle">
		<h1>공지사항</h1>
		
	</div>
	<div class="newNotice">
		<c:choose>
			<c:when test="${userId eq 'admin'}">
				<form action="newNotice" method="Get" >
					<input type="submit" value="공지사항 작성하기">
				</form>
			</c:when>
		</c:choose>
	</div>
	<div class="noticeDetail">
		<a href="${path}/project/notice/noticeList">[목록으로]</a>
		    <h6>제목 : ${vo.title}</h6>
		    <p><span>작성자 : ${vo.auth}</span></p>
		    <p><span>작성일 : <fmt:formatDate value="${vo.regdate}" type="date" dateStyle="full"/></span></p>
		    <p>내용 : <br/>${vo.content}</p>
		    <span>조회수 : ${vo.vcnt}</span>
		   <%--  <span><a href="${path}/project/notice/likeCount?bno=${vo.bno}">[ 좋아요 ]</a>${vo.likeCnt}</span> --%>
		    <c:choose>
			<c:when test="${userId eq 'admin'}">
				<form action="editNotice" method="Get" >
					<input type="hidden" name="bno" value="${vo.bno}"/> 
					<input type="submit" value="[공지사항 편집하기]">
					<a href="deleteNotice?bno=${vo.bno}">[게시물 삭제하기]</a>
				</form>
			</c:when>
		</c:choose>
	</div>
</div>

<script>
/* 작업 수행 결과 출력 */
var resultMessage = "${result}"; // 서버에서 전달된 메시지
if (resultMessage !== "") {
    alert(resultMessage); // 메시지 팝업 표시
}
function adjustMainWrapSize() {
    // .noticeDetail 요소 가져오기
    var noticeDetail = document.querySelector('.noticeDetail');
    
    // .mainWrap 요소 가져오기
    var mainWrap = document.querySelector('.mainWrap');
    
    // .noticeDetail의 높이 가져오기
    var noticeDetailHeight = noticeDetail.offsetHeight;
    
    // .mainWrap의 높이 설정
    mainWrap.style.height = (noticeDetailHeight + 150) + 'px';
}

// 함수 호출
adjustMainWrapSize();

</script>




<jsp:include page="../common/footer.jsp" />
