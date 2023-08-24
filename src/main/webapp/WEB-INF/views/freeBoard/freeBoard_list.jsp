<!-- freeboard_list.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../common/header.jsp" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- style 태그는 추후 통합 하겠읍니다. -->
<style>
/* 기본 스타일링 */
.mainWrap {
  padding: 20px;
  border: 1px solid #ccc;
  background-color: #f9f9f9;
}

.title{
	width: 40%;
	text-align: left;
}

#freeBoardTitle{
	text-align: left;
}

#freeBoardTitle h1 {
  margin-bottom: 10px;
}

#freeBoardWrap{
	width: 65%;
	margin: 50px auto 0px auto;
}

#freeBoardWrap table {
  width: 100%;
  border-collapse: collapse;
  border: 1px solid #ccc;
}

#freeBoardWrap th, #freeBoardWrap td {
  padding: 10px;
  border: 1px solid #ccc;
}

#freeBoardWrap th {
  background-color: #f2f2f2;
  font-weight: bold;
}

/* 링크 스타일링 */
a {
  color: #007bff;
  text-decoration: none;
}

#freeBoardWrap a:hover {
  text-decoration: underline;
}

/* 페이징 스타일링 */
.pagination {
	justify-content: center;
}

.pagination a {
    display: inline-block;
    padding: 5px 10px;
    margin: 0 2px;
    border: 1px solid #ccc;
    text-decoration: none;
    border-radius: 3px;
}

.pagination a:hover {
    background-color: #ddd;
}

.pagination a.active {
    background-color: #007bff;
    color: #fff;
}

/* 삭제된 게시글 스타일링 */
#freeBoardWrap tr.deleted {
  background-color: #ffe6e6;
}

.searchBar{
	display: flex;
	justify-content: space-between;
}

.searchBar table {
    max-width: 90%;
}

.searchBar td {
    padding: 10px;
}

#option {
    padding: 5px;
    border-radius: 4px;
}

#searchValue {
    padding: 5px;
    border-radius: 4px;
    border: 1px solid #ccc;
}

#searchBtn {
    padding: 5px 10px;
    border: none;
    background-color: #007bff;
    color: white;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.2s ease-in-out;
}

#searchBtn:hover {
    background-color: #0056b3;
}

.writeButton {
    text-align: center;
    margin-top: 10px;
}

.writeButton input[type="button"] {
    padding: 5px 10px;
    border: none;
    background-color: #007bff;
    color: white;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.2s ease-in-out;
}

.writeButton input[type="button"]:hover {
    background-color: #0056b3;
}


</style>
<div class="mainWrap">
    <div id="freeBoardTitle">
        <h1>자유게시판</h1>
        <hr/>
    </div>
    <div id="freeBoardWrap">
	    <c:choose>
		    <c:when test="${!empty freeBoardList}">
		    	<table border="1">
		    		<tr>
		    			<th>글번호</th>
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
		    					<td colspan="6">삭제된 게시글 입니다.</td>
		    				</tr>
		    			</c:when>
		    			<c:otherwise>
				    		<tr>
				    			<td>${freeBoard.bno}</td>
				    			<td class="title">
				    				<a href="freeBoard_detail?bno=${freeBoard.bno}">
				    					${freeBoard.title}
				    					<c:if test="${freeBoard.commentCount > 0}">
				    						[${freeBoard.commentCount}]
				    					</c:if>
				    				</a>
				    			</td>
								<td>${freeBoard.auth}</td>
				    			<td class="date">${freeBoard.date}</td>
				    			<td>${freeBoard.vcnt}</td>
				    			<td>${freeBoard.lcnt}</td>
				    		</tr>
		    			</c:otherwise>
		    		</c:choose>
			    </c:forEach>
			    </table>
			    <br/>
		    </c:when>
		    <c:otherwise>
		    	<h2>게시글이 존재하지 않습니다.</h2>
		    </c:otherwise>
	    </c:choose>
   	</div>
	<c:if test="${!empty pm and pm.maxPage > 1}">
		<div class="pagination">
   			<table>
				<tr>
					<td colspan="5">
						<c:if test="${pm.first}">
							<a href="freeBoard_list?page=1">&laquo;</a>
						</c:if>
						<c:if test="${pm.prev}">
							<a href="freeBoard_list?page=${pm.startPage-1}">&lt;</a>
						</c:if>
						<c:forEach var="i" 
								   begin="${pm.startPage}" 
								   end ="${pm.endPage}">
							<a href="freeBoard_list?page=${i}">${i}</a>
						</c:forEach>
						<c:if test="${pm.next}">
							<a href="freeBoard_list?page=${pm.endPage+1}">&gt;</a>
						</c:if>
						<c:if test="${pm.last}">
							<a href="freeBoard_list?page=${pm.maxPage}">&raquo;</a>
						</c:if>
						</td>
					</tr>
			</table>
		</div>
		<hr/>
	</c:if>
    <div class="searchBar">
        <table>
            <tr>
                <td>
                    <select id="option" name="searchType">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchValue" id='searchValue'><button type="button" id="searchBtn" name="search">검색</button>
                </td>
            </tr>
        </table>
        <div class="writeButton">
        	<input type="button" value="글작성하기" name="writeBtn"/>
    	</div>
    </div>
</div>
<script>
	window.onload = ()=>{
		$(".writeButton").on("click",function(){
			let loginCheck = '${userInfo.id}' != '';
			if(!loginCheck){
				alert('로그인 후 이용해주세요!');
				return;
			}else{
				location.href = "create";
			}
		});
		
		$("#searchBtn").on("click",function(){
			let option = $('select').val();
			let value = $('#searchValue').val();
			if(value.trim() == ''){
				alert('검색어를 입력하세요!');
				return;
			}
			location.href = "imgBoard_list?searchValue="+value+"&searchType="+option;
		});
		
	    $("input[name='searchValue']").on('keydown', function(e) {
	        if (e.keyCode === 13) {
	            e.preventDefault(); 
	            $("#searchBtn").click();
	        }
	    });
	    
	}
</script>
<jsp:include page="../common/footer.jsp" />