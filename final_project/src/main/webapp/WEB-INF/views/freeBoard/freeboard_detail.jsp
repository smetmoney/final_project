<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title><c:out value="${post.title}"/></title>
</head>
<body>
    <h1><c:out value="${post.title}"/></h1>
    <p><c:out value="${post.content}"/></p>
    <c:if test="${not empty post.imageUrl}">
        <img src="<c:url value='/uploads/${post.imageUrl}'/>" alt="Image"/>
    </c:if>
</body>
</html>
