<!-- freeboard_list.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp" />
<body>
    <h1>사진게시판 목록</h1>
    <table>
        <tr>
            <th>글 번호</th>
            <th>제목</th>
        </tr>
        <c:forEach items="${posts}" var="post">
            <tr>
                <td>${post.id}</td>
                <td><a href="/freeBoard/${post.id}">${post.title}</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
<jsp:include page="../common/footer.jsp" />