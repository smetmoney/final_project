<!-- qnaPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../common/header.jsp" />
<link rel="stylesheet" href="../resources/css/notice.css">
<style>
	*{
		margin:0;
		padding:0;
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
	<hr/>
	<div class="noticeDetail">
		<div class="backBtnDiv">
			<a href="${path}/project/notice/noticeList" class="backBtn">[목록으로]</a>
		</div>
		    <span class="nameSpace">제목</span> <span class="space">&nbsp;&nbsp;&nbsp;${vo.title}</span>
		    <span class="nameSpace">작성자</span>
			    <c:choose>
					<c:when test="${vo.auth eq 'admin'}">
						<span class="space">&nbsp;&nbsp;&nbsp;관리자</span>
					</c:when>
					<c:otherwise>
						<span class="space">&nbsp;&nbsp;&nbsp;${vo.auth}</span>
					</c:otherwise>
				</c:choose>
		    <span class="nameSpace">최종수정일</span><span class="space">&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${vo.updatedate}" type="both" dateStyle="full"/></span>
		    <!-- <span class="nameSpace">내용</span> -->  <br/>${vo.content}
		    
		  

		    
		    <div class="countDiv">
			    <span class="nameSpace">조회수</span><br/><div class="viewDiv"><b>${vo.vcnt}</b></div>
		    </div>
		   <%--  <span><a href="${path}/project/notice/likeCount?bno=${vo.bno}">[ 좋아요 ]</a>${vo.likeCnt}</span> --%>
			<div class="backBtnDiv">
				<a href="${path}/project/notice/noticeList" class="backBtn">[목록으로]</a>
			</div>
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
	<c:if test="${!empty userInfo}">
    		<div id="commentWriteBox">
    			<ul>
    				<li>${userInfo.nname}</li>
    				<li>
    					<input id="commentWriteArea" type="text" name="commentContent" placeholder="댓글을 남겨보세요">
						<input type="hidden" id="commenterID" name="commenterID" value="${userInfo.nname}">
						<input type="hidden" id="bno" name="imageBoardBNO" value="${vo.bno}">
   					</li>
    				<li>
    					<button id="commentWrite">등록</button>
    				</li>
    			</ul>
    		</div>
   		</c:if>
	<div id="commentWrap">
	    	<h4>댓글 목록 : </h4>
			<c:if test="${!empty comments}">
 				<c:forEach var="comment" items="${comments}">
					<div class="commentBox">
						<div id="show${comment.commentNO}">
							<ul>
								<li>작성자 : ${comment.commenterID}</li>
								<li>작성일 : <fmt:formatDate value="${comment.commentDate}" pattern="yyyy-MM-dd HH:mm" /></li>
						        <li id="commentContent${comment.commentNO}">
						            내 용 : ${comment.commentContent}
						        </li>
							</ul>
							<c:if test="${comment.commenterID == userInfo.nname}">
								<button class="commentModify" data-cno='${comment.commentNO}'>
									수정
								</button>
								<button class="commentDelete" data-cno='${comment.commentNO}'>
									삭제
								</button>
							</c:if>
						</div>
						<div id="hide${comment.commentNO}" style="display: none">
							<ul>
								<li>작성자 : ${comment.commenterID}</li>
								<li>작성일 : <fmt:formatDate value="${comment.commentDate}" pattern="yyyy-MM-dd HH:mm" /></li>
						        <li>
						            내 용 : <input type="text" id="modText${comment.commentNO}" value="${comment.commentContent}">
						        </li>
							</ul>
							<button class="modSubmit" data-cno='${comment.commentNO}'>
								수정완료
							</button>
							<button class="modCancle" data-cno='${comment.commentNO}'>
								취소
							</button>
						</div>
					</div>
				</c:forEach>
	   	    		<c:if test="${!empty pm and pm.maxPage > 1}">
	   	    		<div class="pagination">
					<tr>
						<th colspan="5">
							<c:if test="${pm.first}">
								<a href="?bno=${vo.bno}&page=1">&laquo;</a>
							</c:if>
							<c:if test="${pm.prev}">
								<a href="?bno=${vo.bno}&page=${pm.startPage-1}">&lt;</a>
							</c:if>
							<c:forEach var="i" 
									   begin="${pm.startPage}" 
									   end ="${pm.endPage}">
								<a href="?bno=${vo.bno}&page=${i}">${i}</a>
							</c:forEach>
							<c:if test="${pm.next}">
								<a href="?bno=${vo.bno}&page=${pm.endPage+1}">&gt;</a>
							</c:if>
							<c:if test="${pm.last}">
								<a href="?bno=${vo.bno}&page=${pm.maxPage}">&raquo;</a>
							</c:if>
						</th>
					</tr>
				</div>
			</c:if>
			</c:if>
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
	// .commentWrap 요소 가져오기 
    var commentWrap = document.querySelector('.commentWrap');
	
    // .noticeDetail의 높이 가져오기
    var noticeDetailHeight = noticeDetail.offsetHeight;
    // .commentWrap의 높이 가져오기
    var commentWrapHeight = commentWrap.offsetHeight;
    
    // .mainWrap의 높이 설정
    mainWrap.style.height = (noticeDetailHeight + commentWrap + 400) + 'px';
}

// 함수 호출
adjustMainWrapSize();

</script>




<jsp:include page="../common/footer.jsp" />