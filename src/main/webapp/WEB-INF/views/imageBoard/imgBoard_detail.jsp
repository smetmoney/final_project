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
		<form id="modifyForm" action="modify" method="post">
			<input type="hidden" name="bno" value="${vo.bno}">
		</form>
		
	    <div id="commentWrap">
	    	<h4>댓글 목록 : </h4>
			<c:if test="${!empty comments}">
				<c:forEach var="comment" items="${comments}">
	    		<table border=1 id="commentTable${comment.commentNO}">
	    			<tr>
	    				<td>작성자 :</td>
	    				<td> ${comment.commenterID}</td>
	    				<td>
	    					<button class="commentModify" data-commenter="${comment.commenterID}" data-cno="${comment.commentNO}" data-bno="${comment.imageBoardBNO}" data-text="${comment.commentContent}">
	    						수정
	    					</button>
    					</td>
	    				<td>
	    					<button class="commentDelete" data-cno="${comment.commentNO}" data-bno="${comment.imageBoardBNO}">
	    						삭제
	    					</button>
    					</td>
	    			</tr>
	    			<tr>
						<td>내&nbsp;&nbsp;&nbsp;용 :</td>
						<td id="commentContent"> ${comment.commentContent}</td>
	    			</tr>
	    			<tr>
	    				<td>작성일 :</td>
	    				<td> ${comment.commentDate}</td>
	    			</tr>
	    		</table>
				</c:forEach>
			</c:if>
    		<div id="commentWriteBox">
    			<ul>
    				<!-- 추후 로그인멤버로 수정 -->
    				<li>${vo.auth}</li>
    				<li>
    					<input id="commentWriteArea" type="text" name="commentContent" placeholder="댓글을 남겨보세요">
						<input type="hidden" id="commenterID" name="commenterID" value="${vo.auth}">
						<input type="hidden" id="bno" name="imageBoardBNO" value="${vo.bno}">
   					</li>
    				<li>
    					<button id="commentWrite">등록</button>
    				</li>
    			</ul>
    		</div>
    	</div>
    </div>
<jsp:include page="../common/footer.jsp" />
<script>
	// 게시글 수정 (게시글작성자 == 로그인멤버)
	$("#modify_btn").on("click",function(e){
		$("#modifyForm").attr("action","modify");
		$("#modifyForm").submit();
	})
	// 게시글 삭제 (게시글작성자 == 로그인멤버)
	$("#delete_btn").on("click",function(e){
		$("#modifyForm").attr("action","delete");
		$("#modifyForm").submit();
	})
	// 댓글 수정(진행중)
	$(".commentModify").on("click",function(){
		let cno = $(this).attr('data-cno');
		let bno = $(this).attr('data-bno');
		let text = $(this).attr('data-text');
		let commenter = $(this).attr('data-commenter');
		let table = $(this).closest('table');
		
		let str = "<div><ul><li>`\${commenter}`</li><ul><div>"
		table.append(str);
		
		console.log(`\${cno}:\${bno}:\${text}`);
	})
	// 댓글 삭제
	$(".commentDelete").on("click",function(){
		let cno = $(this).attr('data-cno');
		let bno = $(this).attr('data-bno');
		if(confirm('정말로 삭제?')){
	 		$.ajax({
				type : "POST",
				url : "commentDelete",
				data : {
					imageBoardBNO : bno,
					commentNO : cno
				},
				dataType : "text",
				success : function(result){
					alert(result);
					location.reload();
				}
			}); 
		}else{
			return;
		}
	})
	
	// 댓글 삽입 요청 처리
	$("#commentWrite").click(function(){
		let auth = $("#commenterID").val();
		let text = $("#commentWriteArea").val();
		let bno = $("#bno").val();
					
		console.log(auth,bno,text);
		
		if(text.trim() == ''){
			alert('댓글 내용을 입력하세요!');
			return;
		}
		
 		$.ajax({
			type : "POST",
			url : "commentWrite",
			data : {
				imageBoardBNO : bno,
				commentContent : text,
				commenterID : auth
			},
			dataType : "text",
			success : function(result){
				alert(result);
				location.reload();
			}
		}); 
	});
	
    $("#commentWriteArea").on('keydown', function(e) {
        if (e.keyCode === 13) { // 13 == enter
            e.preventDefault(); 
            $("#commentWrite").click();
        }
    });
</script>
