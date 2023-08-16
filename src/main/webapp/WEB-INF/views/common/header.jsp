<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Text Game</title>
<head>
<script>
    // 쿠키를 가져오는 함수
    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
    }

    // 쿠키 값을 가져와서 출력하는 부분
    const savedAutoLoginValue = getCookie("autoLogin");
    if (savedAutoLoginValue) {
        document.getElementById("savedAutoLoginValue").innerText = `Saved Auto Login: ${savedAutoLoginValue}`;
    }
</script>
<header>
	<div id="memberBox">
	
		<c:choose>
		    <c:when test="${loggedInUser != null}">
		        <h1>Hello, ${loggedInUser.nname}</h1>
		        <c:choose>
		            <c:when test="${loggedInUser.nname eq 'ADMIN'}">
		                <a href="${pageContext.request.contextPath}/management/management">관리하기</a>
		                <a href="${pageContext.request.contextPath}/login/logout">로그아웃</a>
		            </c:when>
		            <c:otherwise>
		                <a href="${pageContext.request.contextPath}/user/user">내 정보</a>
		                <a href="${pageContext.request.contextPath}/login/logout">로그아웃</a>
		            </c:otherwise>
		        </c:choose>
		    </c:when>
		    <c:otherwise>
		        <a id="loginLink" href="${pageContext.request.contextPath}/login/login">로그인</a>
		        <a id="joinLink" href="${pageContext.request.contextPath}/join/join">회원가입</a>
		    </c:otherwise>
		</c:choose>
		
		<div id="savedAutoLoginValue">
		    <c:choose>
		        <c:when test="${autoLoginCookie != null}">
		            <p>Saved Auto Login: ${autoLoginCookie.value}</p>
		        </c:when>
		        <c:otherwise>
		            <p>No Auto Login Cookie Found</p>
		        </c:otherwise>
		    </c:choose>
		</div>
		
	    
	</div>
    <!-- logo image -->
    <div id="logoBox">
		<a href="${pageContext.request.contextPath}/">
		    <img src="${pageContext.request.contextPath}/resources/images/headerIMG/poe_logo6.png" id="logo_image">
		</a>
	</div>
    <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
<!--         토글 버튼
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button> -->
        <!-- 네비게이션 메뉴 -->
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="chat/chat">채팅</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="notice/noticePage">공지사항</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="qna/qnaPage">QNA</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                게시판
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/freeBoard/freeBoard_list">자유게시판</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/imageBoard/imgBoard_list">이미지게시판</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
</header>