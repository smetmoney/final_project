<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../common/note_header.jsp" />

<div class="mainWrap">
	
    <h1>쪽지함</h1>
    
    <div class="noteList">
        <c:forEach items="${notes}" var="note">
            <div class="note">
                <a href="note-detail.jsp?noteId=${note.id}">
                    <h2>${note.title}</h2>
                    <p>${note.content}</p>
                </a>
            </div>
        </c:forEach>
    </div>
    
    <a href="notewrite.jsp">
    	<button>작성하기</button>
    </a>
    
</div>
<jsp:include page="../common/footer.jsp" />
