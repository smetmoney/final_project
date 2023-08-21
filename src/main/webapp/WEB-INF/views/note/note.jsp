<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../common/note_header.jsp" />

<style>
    .note {
        border: 1px solid #ccc;
        padding: 10px;
        margin-bottom: 10px;
        background-color: #f9f9f9;
    }

    .note h2 {
        margin: 0;
    }
</style>


<div class="mainWrap">
	
    <h1>쪽지함</h1>
	<c:forEach items="${notes}" var="note">
    <c:choose>
        <c:when test="${note.fromId eq id}">
            <div class="note">
                <p>${note.nno}</p>
                <input type="checkbox" name="noteIds" value="${note.nno}" />
                <a href="notedetail?noteId=${note.nno}&fromId=${note.fromId}">
                    <h2>${note.title}</h2>
                    <p>${note.content}</p>
                </a>
            </div>
        </c:when>
      	  <c:otherwise>
            <!-- 해당 조건에 맞지 않으면 건너뜁니다. -->
            <h2>hi</h2>
       	 </c:otherwise>
    	</c:choose>
	</c:forEach>
    
    <a href="noteWrite?fromId=${id}">
    	<button>작성하기</button>
    </a>
    
    <form action="${pageContext.request.contextPath}/note/deleteNotes" method="post">
    <button type="submit">선택한 쪽지 삭제</button>
	</form>
    
    
</div>
</body>

<jsp:include page="../common/footer.jsp" />
