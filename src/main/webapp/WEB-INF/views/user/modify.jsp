<link rel="stylesheet" href="../resources/css/common.css">

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../common/header.jsp" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../resources/css/modify.css">

<div class="mainWrap">
	
    <h1>수정 페이지</h1>
    
    <section class="wrap">
			<form action="/user/modify" method="post">
				<input type="hidden" name="id" value="${member.id}">
				<input type="text" name="name" value="${member.name}">
				<input type="text" name="nname" value="${member.nname}">
				<input type="email" name="email" value="${member.email}">
				<input type="password" name="pass">
				<input type="submit" value="수정하기">
		</form>
		
		
		<%-- <c:forEach items="${members}" var="member"> --%>
		
<%-- 		<table class="info">
				<tr>
				<td>회원번호</td>
				<td>${member.idn}</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${member.id}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.name}</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${member.nname}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${member.gender}</td>
			</tr>
			<tr>
				<td>회원등록일</td>
				<td>
					${member.birthdate}
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${member.email}</td>
			</tr>
			<tr>
				<td>포인트</td>	
				<td>${member.point}</td>
			</tr>
			<tr>
				<td colspan=2>
					<c:url value="/index.jsp" var="index"/>
					<input type="button" onclick="location.href='${pageContext.request.contextPath}/';" value="수정완료" /> |
				</td>
			</tr>
		</table> --%>
		
		<%-- </c:forEach> --%>
		
		</section>
</div>
<jsp:include page="../common/footer.jsp" />