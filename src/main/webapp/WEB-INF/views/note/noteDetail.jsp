<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../common/note_header.jsp" />

<h1>쪽지 상세 보기</h1>

<div class="notedetail">
    <h2>${note.title}</h2>
    <p>${note.content}</p>
    <p>보낸 사람: ${note.fromId}</p>
    <p>받은 사람: ${note.toId}</p>
    <p>보낸 시간: ${note.createdAt}</p>
    <p>읽은 시간: ${note.readAt}</p>
</div>


<a href="note" class="button">목록으로 돌아가기</a>

<jsp:include page="../common/footer.jsp" />
