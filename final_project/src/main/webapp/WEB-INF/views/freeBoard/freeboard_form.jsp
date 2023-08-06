<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>자유게시판 - 글 작성</title>
</head>
<body>
    <h1>글 작성</h1>
    <form action="/create" method="post" enctype="multipart/form-data">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required><br>
        <label for="content">내용:</label>
        <textarea id="content" name="content" required></textarea><br>
        <label for="imageFile">이미지 첨부:</label>
        <input type="file" id="imageFile" name="imageFile" accept="image/*"><br>
        <input type="submit" value="작성">
    </form>
</body>
</html>
