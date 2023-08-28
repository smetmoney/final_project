<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../common/note_header.jsp" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../resources/css/note.css">
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

<div class="noteList">
	
    <h1>쪽지함</h1>
	
	   <form action="${pageContext.request.contextPath}/note/delete" method="post">
	    <c:forEach items="${notes}" var="note">
	        <c:choose>
	            <c:when test="${note.to_Id eq sessionScope.userInfo.id}">
	                <div class="note checks etrans">
	                    <%-- <p>${note.nno}</p> --%>
	                    <input type="checkbox" name="nno" value="${note.nno}" id="check${note.nno}"  /> 
	                    <!--  id="ex_chk3" --> 
	                    <label for="check${note.nno}">체크박스</label> 
	                    <a href="noteDetail?nno=${note.nno}">
	                        <h2>${note.title}</h2>
	                        <p>${note.content}</p>
	                    </a>
	                </div>
	            </c:when>
	        </c:choose>
	    </c:forEach>
	    
	     <c:if test="${!empty pm and pm.maxPage > 1}">
        <div class="pagination">
            <table>
                <tr>
                    <th colspan="3">
                        <c:if test="${pm.first}">
                            <a href="note?page=1">&lt;처음</a>
                        </c:if>
                        <c:if test="${pm.prev}">
                            <a href="note?page=${pm.startPage-1}&id=${userInfo.id}">&lt;이전</a>
                        </c:if>
                        <c:forEach var="i" begin="${pm.startPage}" end ="${pm.endPage}">
                            <a href="note${pm.mkQueryStr(i)}&id=${userInfo.id}">${i}</a>
                        </c:forEach>
                        <c:if test="${pm.next}">
                            <a href="note?page=${pm.endPage+1}&id=${userInfo.id}">다음&gt;</a>
                        </c:if>
                        <c:if test="${pm.last}">
                            <a href="note?page=${pm.maxPage}&id=${userInfo.id}">마지막&gt;</a>
                        </c:if>
                    </th>
                </tr>
            </table>
        </div>
        <hr/>
    </c:if>
	    
   		<button type="submit">선택한 쪽지 삭제</button>
	</form>

    
    
</div>
<jsp:include page="../common/footer.jsp" />
