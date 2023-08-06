<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 목록</title>
</head>
<body>
    <h1>게시글 목록</h1>
    <ul>
        <c:forEach items="${posts}" var="post">
            <li><a href="<c:url value='/posts/${post.id}'/>"><c:out value="${post.title}"/></a></li>
        </c:forEach>
    </ul>
</body>
</html>
