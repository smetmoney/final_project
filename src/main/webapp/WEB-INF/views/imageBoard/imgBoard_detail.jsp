<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="../common/header.jsp" />
<style>
	#boardWrap{
		text-align: center;
		background: white;
		padding: 10px;
	}
	#contentWrap{
		display: inline-block;
		border: 1px black solid;
		padding: 10px;
		text-align: left;
		width: 60%;
	}
	#contentWrap a{
		float: right;
	}
	#commentWrap{
		width: 60%;
		border: 1px black solid;
		display: inline-block;
		padding: 10px;
		text-align: left;
	}
	#commentWriteBox{
		border: 1px black solid;
		border-radius: 5px;
		height: 100px;
		padding:5px;
	}
	#commentWriteBox #commentWriteArea{
		border: none;
		width:100%;
		height: 30px;
	}
	table{
		margin-bottom: 10px;
	}
	#modifyWrap{
		margin: 10px 0;
		text-align: right;
		width: 60%;
		display: inline-block;
	} 
</style>
	<div id="boardWrap">
		<div id="contentWrap">
			<a href="imgBoard_list">뒤로가기</a>
		    <h1>제목 : ${vo.title}</h1>
		    <p><span>작성자 : ${vo.auth}</span><span>작성일 : ${vo.date}</span></p>
			<img src="${path}${vo.imageURL}"/>
		    <p>내용 : <br/>${vo.content}</p>
		    <span>조회수 : ${vo.vcnt}</span>
		    <span>좋아용 : ${vo.lcnt}</span>
		</div>	
		<div id="modifyWrap">
			<a id="modify_btn">
				<button>수정</button>
			</a>
			<a id="delete_btn">
				<button>삭제</button>
			</a>
		</div>	
		<form id="infoForm" action="modify" method="post">
			<input type="hidden" name="bno" value="${vo.bno}">
		</form>
	    <div id="commentWrap">
    		<h3>댓글 : </h3>
    		<table border=1>
    			<tr>
    				<td>작성자 : </td>
    				<td>(gd)</td>
    			</tr>
    			<tr>
					<td>내&nbsp;&nbsp;&nbsp;용 : </td>
					<td>(뭘보노)</td>
    			</tr>
    			<tr>
    				<td>작성일 : </td>
    				<td>(2023/01/01)</td>
    			</tr>
    		</table>
    		<div id="commentWriteBox">
    			<ul>
    				<li>(닉네임)</li>
    				<li>
    					<input id="commentWriteArea" type="text" placeholder="댓글을 남겨보세요">
   					</li>
    				<li>
    					<input type="button" value="등록">
    				</li>
    			</ul>
    		</div>
    	</div>
    </div>
<jsp:include page="../common/footer.jsp" />
<script>
	$("#modify_btn").on("click",function(e){
		$("form").attr("action","modify");
		$("form").submit();
	})
	$("#delete_btn").on("click",function(e){
		$("form").attr("action","delete");
		$("form").submit();
	})
</script>
