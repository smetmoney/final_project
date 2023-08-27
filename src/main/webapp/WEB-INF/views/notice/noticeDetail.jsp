<!-- qnaPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../common/header.jsp" />
<link rel="stylesheet" href="../resources/css/notice.css">
<style>
	.newNotice{
  		padding-right:10%;
	}
	/* 이미지 최대 크기 제한 */
	img{
		max-width:100%;
		height: auto;
	}
</style>

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
	<div class="noticeDetail">
		<div class="backBtnDiv">
			<a href="${path}/project/notice/noticeList" class="backBtn">[목록으로]</a>
		</div>
		    <h6>제목 : ${vo.title}</h6>
		    <p><span>작성자 : 
			    <c:choose>
					<c:when test="${vo.auth eq 'admin'}">
						관리자
					</c:when>
					<c:otherwise>
						${vo.auth}
					</c:otherwise>
				</c:choose>
		    </span></p>
		    <p><span>최종수정일 : <fmt:formatDate value="${vo.updatedate}" type="date" dateStyle="full"/></span></p>
		    <p>내용 : <br/>${vo.content}</p>
		    <span>조회수 : ${vo.vcnt}</span>
		   <%--  <span><a href="${path}/project/notice/likeCount?bno=${vo.bno}">[ 좋아요 ]</a>${vo.likeCnt}</span> --%>
		    <c:choose>
			<c:when test="${userInfo.id eq 'admin'}">
				<form action="editNotice" method="Get" >
					<input type="hidden" name="bno" value="${vo.bno}"/> 
					<input type="submit" value="편집하기" id="editBtn">
					<a href="deleteNotice?bno=${vo.bno}" id="delBtn">삭제하기</a>
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
    mainWrap.style.height = (noticeDetailHeight + 400) + 'px';
}

// 함수 호출
adjustMainWrapSize();

</script>




<jsp:include page="../common/footer.jsp" />
