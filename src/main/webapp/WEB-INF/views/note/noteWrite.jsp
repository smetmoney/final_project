<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../common/note_header.jsp" />

<div class="mainWrap">
	
    <h1>쪽지 보내기</h1>
    
    <form action="${pageContext.request.contextPath}/note/noteWrite" method="post">
        <input type="hidden" name="fromId" value="${sessionScope.userInfo.id}" />
        <input type="text" name="toId" placeholder="받는 사람" />
        <input type="text" name="title" placeholder="제목" />
        <input type="text" name="content" placeholder="내용" />
        <input type="submit" value="보내기" />
    </form>
    
</div>
<jsp:include page="../common/footer.jsp" />
