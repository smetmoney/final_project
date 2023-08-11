<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="../common/header.jsp" />
<style>
	#boardWrap{
		text-align: center;
		background: white;
	}
</style>
	<div id="boardWrap">
		<a href="imgBoard_list">뒤로가기</a>
	    <h1>제목 : ${vo.title}</h1>
	    <p><span>작성자 : ${vo.auth}</span><span>작성일 : ${vo.date}</span></p>
		<img src="${path}${vo.imageURL}"/>
	    <p>내용 : <br/>${vo.content}</p>
	    <span>조회수 : ${vo.vcnt}</span>
	    <span>좋아용 : ${vo.lcnt}</span>
    </div>
<jsp:include page="../common/footer.jsp" />
