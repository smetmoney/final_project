<!-- freeboard_list.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />
<!-- style 태그는 추후 통합 하겠읍니다. -->
<style>
     #freeBoardTitle{
         text-align: center;
     }
     .freeBoardContent{
         width: 400px;
         height: 400px;
         display: inline-block;
         border: black solid 1px;
         margin:20px;
     }
     .contentList{
         list-style-type: none;
         margin: 0;
         padding: 20px;
         text-align: left;
     }

     #freeBoardWrap{
     	width:80%;
     	display:inline-block;
     }
     #createButton{
     	display:inline-block;	
     }
     
     table{
    	border-collapse: separate; 
    	margin: 0 auto;
     }
</style>
<div class="mainWrap">
    <div id="freeBoardTitle">
        <h1>자유 게시판</h1>
    </div>
    <div>
    	<a href="create" id="createButton">
			<input type="button" value="글작성하기"/>
	   	</a>
    </div>
    <div id="freeBoardWrap">
	    <c:choose>
		    <c:when test="${!empty freeBoardList}">
		    	<table border="1">
		    		<tr>
		    			<th>제목</th>
		    			<th>작성자</th>
		    			<th>작성일</th>
		    			<th>조회수</th>
		    			<th>좋아여</th>
		    		</tr>
		    	<c:forEach items="${freeBoardList}" var="freeBoard">
		    		<c:choose>
		    			<c:when test="${freeBoard.del}">
		    				<tr>
		    					<td colspan="5">삭제된 게시글 입니다.<td>
		    				<tr/>
		    			</c:when>
		    			<c:otherwise>
				    		<tr>
				    			<td>
				    				<a href="freeBoard_detail?bno=${freeBoard.bno}">
				    					제목 : ${freeBoard.title}
				    					<c:if test="${freeBoard.commentCount > 0}">
				    						[${freeBoard.commentCount}]
				    					</c:if>
				    				</a>
				    			</td>
								<td>${freeBoard.auth}</td>
				    			<td>${freeBoard.date}</td>
				    			<td>${freeBoard.vcnt}</td>
				    			<td>${freeBoard.lcnt}</td>
				    		</tr>
		    			</c:otherwise>
		    		</c:choose>

		            <%-- <li id="thumbnailImg" class="freeBoard">
			            <div id="imgBox" style="background-image: url('${pageContext.request.contextPath}${free.imageURL}')">
			            </div>
		            </li> --%>
			    </c:forEach>
			    </table>
			    <br/>
   	    		<c:if test="${!empty pm and pm.maxPage > 1}">
					<tr>
						<th colspan="5">
							<c:if test="${pm.first}">
								<a href="freeBoard_list?page=1">[&laquo;]</a>
							</c:if>
							<c:if test="${pm.prev}">
								<a href="freeBoard_list?page=${pm.startPage-1}">[&lt;]</a>
							</c:if>
							<c:forEach var="i" 
									   begin="${pm.startPage}" 
									   end ="${pm.endPage}">
								<a href="freeBoard_list?page=${i}">[${i}]</a>
							</c:forEach>
							<c:if test="${pm.next}">
								<a href="freeBoard_list?page=${pm.endPage+1}">[&gt;]</a>
							</c:if>
							<c:if test="${pm.last}">
								<a href="freeBoard_list?page=${pm.maxPage}">[&raquo;]</a>
							</c:if>
						</th>
					</tr>
				</c:if>
		    </c:when>
		    <c:otherwise>
		    	<h2>게시글이 존재하지 않습니다.</h2>
		    </c:otherwise>
	    </c:choose>
   	</div>
</div>
<jsp:include page="../common/footer.jsp" />