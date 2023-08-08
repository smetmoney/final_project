<!-- freeboard_list.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />\
<!-- style 태그는 추후 통합 하겠읍니다. -->
<style>
     #imgBoardTitle{
         text-align: center;
     }
     #imgBoardContent{
         width: 400px;
         height: 400px;
         display: inline-block;
         border: black solid 1px;
     }
     #contentList{
         list-style-type: none;
         margin: 0;
         padding: 20px;
     }
     #thumbnailImg{
         width: 300px;
         height: 300px;
     }
</style>
<div class="mainWrap">
    <div id="imgBoardTitle">
        <h1>이미지 게시판</h1>
    </div>
    <c:choose>
    <c:when test="${!empty imgBoardList}">
    	<c:forEach items="${imgBoardList}" var="img">
		    <div id="imgBoardContent">
		        <ul id="contentList">
		            <li id="thumbnailImg" class="imgBoard"><img src="${img.url}" alt="ThumbnailImg"></li>
		            <li class="imgBoard">제목 : ${img.title}</li>
		            <li class="imgBoard"><span>작성일 : ${img.date}</span><span>조회수 : ${img.count}</span></li>
		        </ul>
		    </div>
	    </c:forEach>
    </c:when>
    <c:otherwise>
    	<h2>게시글이 존재하지 않습니다.</h2>
    </c:otherwise>
    </c:choose>
   	<a href="imgBoard_form">
		<input type="button" value="글작성하기"/>
   	</a>
</div>
<jsp:include page="../common/footer.jsp" />