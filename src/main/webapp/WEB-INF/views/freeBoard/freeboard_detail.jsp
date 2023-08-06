<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>자유게시판 - 글 상세보기</title>
</head>
<body>
    <h1>${post.title}</h1>
    <p>${post.content}</p>
    <img src="/uploads/${post.imageUrl}" alt="이미지">
</body>
</html>
