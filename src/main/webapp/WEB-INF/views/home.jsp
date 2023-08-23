<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!-- css파일은 header에서 불러옵니다!! -->
<jsp:include page="common/header.jsp" />
<div class="mainWrap">
	<h1>
		db 외래키 전부 member id -> nname으로 바꿔주세요
		안그러면 게시글 작성자가 닉네임이 아닌 id로 나와서 보기안좋음 
	</h1>
	<form action="game/start" method="post">
		<!-- <input type="hidden" value="${MemberVO.id}" /> -->
		<button type="submit">GAME START</button>
	</form>
	<form action="game/game" method="post">
		<!-- <input type="hidden" value="${MemberVO.id}" /> -->
		<button type="submit">THRES.JS</button>
	</form>
</div>
<jsp:include page="common/footer.jsp" />