<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title><c:out value="${freeBoard.title}"/></title>
</head>
<body>
    <h1><c:out value="${freeBoard.title}"/></h1>
    <p><c:out value="${freeBoard.content}"/></p>
    <c:if test="${not empty freeBoard.imageUrl}">
        <img src="<c:url value='/uploads/${freeBoard.imageUrl}'/>" alt="Image"/>
    </c:if>
</body>
</html>
