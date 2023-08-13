<!-- freeboard_list.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />\
<!-- style 태그는 추후 통합 하겠읍니다. -->
<style>
     #imgBoardTitle{
         text-align: center;
     }
     .imgBoardContent{
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
     #thumbnailImg{
         width: 300px;
         height: 300px;
     }
     #imgBox{
     	width: 350px;
        height: 300px;
        background-size: cover;
     }
     #imgBoardWrap{
     	width:80%;
     	display:inline-block;
     }
     #createButton{
     	display:inline-block;	
     }
</style>
<div class="mainWrap">
    <div id="imgBoardTitle">
        <h1>이미지 게시판</h1>
    </div>
    <div>
    	<a href="imgBoard_form" id="createButton">
			<input type="button" value="글작성하기"/>
	   	</a>
    </div>
    <div id="imgBoardWrap">
	    <c:choose>
		    <c:when test="${!empty imgBoardList}">
		    	<c:forEach items="${imgBoardList}" var="img">
				    <div class="imgBoardContent">
				        <ul class="contentList">
				            <li id="thumbnailImg" class="imgBoard">
					            <div id="imgBox" style="background-image: url('${pageContext.request.contextPath}${img.imageURL}')">
					            </div>
				            </li>
				            <li class="imgBoard">
				            	<a href="read?bno=${img.bno}">제목 : ${img.title}</a>
				            </li>
				            <li class="imgBoard">
				            	<span>작성일 : ${img.date} </span>
			            	</li>
			            	<li class="imgBoard">
					           	<span>조회수 : ${img.vcnt} </span>
				            	<span>좋아용 : ${img.lcnt}</span>
			            	</li>
				        </ul>
				    </div>
			    </c:forEach>
			    <br/>
   	    		<c:if test="${!empty pm and pm.maxPage > 1}">
					<tr>
						<th colspan="5">
							<c:if test="${pm.first}">
								<a href="imgBoard_list?page=1">[&laquo;]</a>
							</c:if>
							<c:if test="${pm.prev}">
								<a href="imgBoard_list?page=${pm.startPage-1}">[&lt;]</a>
							</c:if>
							<c:forEach var="i" 
									   begin="${pm.startPage}" 
									   end ="${pm.endPage}">
								<a href="imgBoard_list?page=${i}">[${i}]</a>
							</c:forEach>
							<c:if test="${pm.next}">
								<a href="imgBoard_list?page=${pm.endPage+1}">[&gt;]</a>
							</c:if>
							<c:if test="${pm.last}">
								<a href="imgBoard_list?page=${pm.maxPage}">[&raquo;]</a>
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