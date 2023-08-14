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
	.commentBox{
		padding: 10px;
		margin-bottom: 10px;
		border: 1px black solid;
	}
	#modifyWrap{
		margin: 10px 0;
		text-align: right;
		width: 60%;
		display: inline-block;
	} 
	.hide2{
		display: none;
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
					<div class="commentBox">
						<div id="show${comment.commentNO}">
							<ul>
								<li>작성자 : ${comment.commenterID}</li>
								<li>작성일 : ${comment.commentDate}</li>
						        <li id="commentContent${comment.commentNO}">
						            내 용 : ${comment.commentContent}
						        </li>
							</ul>
								<button class="commentModify" data-cno='${comment.commentNO}'>
									수정
								</button>
								<button class="commentDelete" data-cno='${comment.commentNO}'>
									삭제
								</button>
						</div>
						<div id="hide${comment.commentNO}" style="display: none">
							<ul>
								<li>작성자 : ${comment.commenterID}</li>
								<li>작성일 : ${comment.commentDate}</li>
						        <li>
						            내 용 : <input type="text" id="modText${comment.commentNO}" value="${comment.commentContent}">
						        </li>
							</ul>
								<button class="modSubmit" data-cno='${comment.commentNO}'>
									수정완료
								</button>
								<button class="modCancle" data-cno='${comment.commentNO}'>
									취소
								</button>
						</div>
					</div>
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
		let cno = $(this).data('cno');
		$(this).parent("div").hide();
		$("#hide"+cno).show();
	})
	$(".modCancle").on("click",function(){
		let cno = $(this).data('cno');
		$(this).parent("div").hide();
		$("#show"+cno).show();
	})
	$(".modSubmit").on("click",function(){
		let cno = $(this).data('cno');
		let text = $("#modText"+cno).val();
		$.ajax({
			type : "PATCH",
			url : "commentMod/"+cno,
			headers : {
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				commentNO : cno,
				commentContent : text
			}),
			dataType : "text",
			success : function(data){
				alert(data);
				location.reload();
			}
		});
	});
	// 댓글 삭제
	$(".commentDelete").on("click", function () {
	    let cno = $(this).attr('data-cno');
	        $.ajax({
	            type: "DELETE",
	            url: cno,
	            dataType: "text",
	            success: function (result) {
	                alert(result);
	                location.reload();
	            }
	        });
	    }
	);
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
