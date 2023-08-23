<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Museum Background with Three.js</title>
<style>
	#gameCanvas{
		border : 1px solid black;
		margin:auto;
	}
</style>
</head>
<body>
    <canvas id="gameCanvas" width="960" height="512"></canvas>
    <script src="${path}/resources/game/js/runWigoAndEmily.js"></script>
</body>
</html>