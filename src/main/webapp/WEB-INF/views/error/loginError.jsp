<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../common/header.jsp" />
<head>
<meta charset="UTF-8">
<title>loginError</title>
</head>
<script>
    alert('${param.message}');
    location.href = "${pageContext.request.contextPath}/login/login";
</script>
<body>

<h1>Login Error</h1>

<p>
${message}
</p>

<a href="login">Login</a>

</body>
<jsp:include page="../common/footer.jsp" />