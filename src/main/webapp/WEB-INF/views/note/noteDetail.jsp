<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../common/note_header.jsp" />

<h1>쪽지 상세 보기</h1>

<div class="noteDetail">
    <h2>${note.title}</h2> <br/>
    
    <p>보낸 사람: ${note.fromId == '' ? '없음' : note.fromId}</p> <br/>
    
    <p>${note.content}</p> <br/>
    
    <p>받은 사람: ${note.toId == '' ? '없음' : note.toId}</p>
</div>


<a href="note" class="button">메세지함으로 돌아가기</a>

<jsp:include page="../common/footer.jsp" />
