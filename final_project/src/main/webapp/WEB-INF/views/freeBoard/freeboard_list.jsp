<!-- freeboard_list.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>자유게시판</title>
</head>
<body>
    <h1>자유게시판 목록</h1>
    <table>
        <tr>
            <th>글 번호</th>
            <th>제목</th>
        </tr>
        <c:forEach items="${posts}" var="post">
            <tr>
                <td>${post.id}</td>
                <td><a href="/freeboard/${post.id}">${post.title}</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
