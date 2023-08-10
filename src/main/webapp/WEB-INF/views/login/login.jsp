<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nike KR L</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
</head>
<body>
  <section id="side_logo">
    
  </section>
  
    <section class="login-form">
       <img src="${pageContext.request.contextPath}/resources/images/loginIMG/login2.png/">
      <br><br><br>
        <h1>환영합니다</h1>
        <form action="nike_log.html" method="get">
            <div class="int-area">
                <input type="text" name="id" id="id" autocomplete="off" required>
                <label for="id">ID</label>
            </div>
            <div class="int-area">
                <input type="password" name="pw" id="pw" autocomplete="off" required>
                <label for="pw">PASSWORD</label>
            </div>
            <div class="login_btn">
                <button id="btn" type="submit">로그인</button>
                
            </div>
        </form>
        
        <!-- 에러 메시지가 있다면 표시 -->
		<c:if test="${not empty error}">
		    <p class="error">${error}</p>
		</c:if>

        <div class="caption">
            <a href="${pageContext.request.contextPath}/">홈으로</a>
            <a href="${pageContext.request.contextPath}/join/join">회원가입</a>
        </div>
    </section>
    </body>
    </html>