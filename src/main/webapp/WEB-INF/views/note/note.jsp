<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../common/note_header.jsp" />
<
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
    
    <div class="noteList">
        <c:forEach items="${notes}" var="note">
            <div class="note">
            	 <p>${note.nno}</p>
                <a href="notedetail.jsp?noteId=${note.nno}">
                    <h2>${note.title}</h2>
                    <p>${note.content}</p>
                </a>
            </div>
        </c:forEach>
    </div>
    
    <a href="noteWrite.jsp">
    	<button>작성하기</button>
    </a>
</div>
</body>

<jsp:include page="../common/footer.jsp" />
