<!-- qna_page.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp" />
<body>
    <h1>자주 들어오는 질문</h1>
    <table>
        <c:forEach items="${posts}" var="post">
        	<tr>
            	<th>Q. </th>
        	</tr>
            <tr>
                <td>${post.id}</td>
            </tr>
        </c:forEach>
    </table>
</body>
<jsp:include page="../common/footer.jsp" />
