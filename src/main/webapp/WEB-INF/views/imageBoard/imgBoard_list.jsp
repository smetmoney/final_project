<!-- freeboard_list.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- style 태그는 추후 통합 하겠읍니다. --> 

<style>

#titleBox{
	text-align: left;
}

.imgBoardContainer{
	padding: 40px 0;
}

.imgBox {
    position: relative;
    width: 100%;
    height: 100%; 
    overflow: hidden;
    border-radius: 8px 8px 0 0;
}

.imgBox img{
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.mainWrap {
    height: 1200px;
    margin: 0;
    padding: 20px;
    text-align: center;
}

.imgBoardGrid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 50px;
    max-width: 90%;
    margin: 0 auto;
    height: 80vh;
}

.imgBoardContent {
    position: relative;
    border: 1px solid #eaeaea;
    overflow: hidden;
    cursor: pointer;
    transition: transform 0.2s ease-in-out;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

.imgBoardContent:hover {
    transform: scale(1.05);
}

.imgBoardContent img {
    max-width: 100%;
    height: auto;
    border-radius: 8px 8px 0 0;
}

.contentList {
    background-color: rgba(0, 0, 0, 0.8);
    color: white;
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    padding: 10px;
    border-radius: 0 0 8px 8px;
}

.imageBoard {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 5px;
}

.title {
    font-size: 18px;
    font-weight: bold;
}

.commentCount {
    margin-left: 5px;
    font-size: 14px;
}

.author {
    font-size: 14px;
}

.date,
.viewCount,
.likeCount {
    font-size: 14px;
    margin-right: 10px;
}

.pagination {
    text-align: center;
}

.pagination a {
    display: inline-block;
    padding: 5px 10px;
    background-color: #f0f0f0;
    color: #333;
    text-decoration: none;
    border: 1px solid #ccc;
    margin-right: 5px;
    border-radius: 4px;
    transition: background-color 0.2s ease-in-out;
}

.pagination a:hover {
    background-color: #ddd;
}

.searchBar table {
    width: 100%;
}

.searchBar td {
    padding: 10px;
}

#option {
    padding: 5px;
    border-radius: 4px;
}

input[type="text"] {
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
    margin-top: 20px;
}

.writeButton input[type="button"] {
    padding: 10px 20px;
    border: none;
    background-color: #28a745;
    color: white;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.2s ease-in-out;
}

.writeButton input[type="button"]:hover {
    background-color: #1f8329;
}

</style>

<script>
	window.onload = ()=>{
		let msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
		console.log(msg);
		$("input[name='writeBtn']").on("click",function(){
			let loginCheck = '${userInfo.id}' != '';
			if(!loginCheck){
				alert('로그인 후 이용해주세요!');
				return;
			}else{
				location.href = "imgBoard_form";
			}
		})
		$("#searchBtn").on("click",function(){
			let option = $('select').val();
			let value = $('input[name="searchValue"]').val();
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
    function triggerLinkClick(bno) {
        var link = document.querySelector('#click'+bno);
        if (link) {
            link.click();
        }
	}
</script>
<div class="mainWrap">
	<div id="titleBox">
	    <h1>갤러리</h1>
	    <hr/>
    </div>
    <div class="imgBoardContainer">
        <c:choose>
            <c:when test="${!empty imgBoardList}">
                <div class="imgBoardGrid">
                    <c:forEach items="${imgBoardList}" var="img">
                        <div class="imgBoardContent" onclick="triggerLinkClick(${img.bno})" style="background-image: url(${pageContext.request.contextPath}${img.imageURL}); background-size: cover;">
                            <div class="contentList">
                                <div class="imageBoard">
                                    <a href="imgBoard_detail?bno=${img.bno}" id="click${img.bno}">
                                        <div class="title">${img.title}</div>
                                        <c:if test="${img.commentCount > 0}">
                                            <span class="commentCount">[${img.commentCount}]</span>
                                        </c:if>
                                        <div class="author">작성자 : ${img.auth}</div>
                                    </a>
                                </div>
                                <div class="imgBoard">
                                    <span class="info">작성일 : ${img.date}</span>
                                    <span class="info">조회수 : ${img.vcnt}</span>
                                    <span class="info">좋아요 : ${img.lcnt}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
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
                    <th colspan="3">
                        <c:if test="${pm.first}">
                            <a href="imgBoard_list?page=1">[&laquo;]</a>
                        </c:if>
                        <c:if test="${pm.prev}">
                            <a href="imgBoard_list?page=${pm.startPage-1}">[&lt;]</a>
                        </c:if>
                        <c:forEach var="i" begin="${pm.startPage}" end ="${pm.endPage}">
                            <a href="imgBoard_list${pm.mkQueryStr(i)}">[${i}]</a>
                        </c:forEach>
                        <c:if test="${pm.next}">
                            <a href="imgBoard_list?page=${pm.endPage+1}">[&gt;]</a>
                        </c:if>
                        <c:if test="${pm.last}">
                            <a href="imgBoard_list?page=${pm.maxPage}">[&raquo;]</a>
                        </c:if>
                    </th>
                </tr>
            </table>
        </div>
    </c:if>
    
    <div class="searchBar">
        <table>
            <tr>
                <td>
                    <select id="option" name="searchType">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </td>
                <td><input type="text" name="searchValue"></td>
                <td><button type="button" id="searchBtn" name="search">검색</button></td>
            </tr>
        </table>
    </div>
    
    <div class="writeButton">
        <input type="button" value="글작성하기" name="writeBtn"/>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />