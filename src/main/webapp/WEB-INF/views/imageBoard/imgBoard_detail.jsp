<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="../common/header.jsp" />
<!-- http://sample.paged.kr/purewhite/bbs/board.php?bo_table=gallery_box&wr_id=9 -->
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    #boardWrap {
        margin: 0px auto;
        text-align: center;
        background: #f9f9f9;
        padding: 20px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    
    #modifyWrap {
    	display: inline;
    	margin: 0;
    }

	button {
        margin-top: 10px;
        padding: 5px 10px;
        border: none;
        background: #3498db;
        color: #fff;
        border-radius: 3px;
        cursor: pointer;
	}
	
	button:hover {
	    background-color: #2980b9;
	}
	
    #contentWrap {
        border: 1px solid #ddd;
        padding: 20px;
        text-align: left;
    }
    #contentWrap a {
        float: right;
        color: #3498db;
        text-decoration: none;
    }
    #contentWrap a:hover{
    	color: #3498db94;
    }
    #commentWrap {
        margin-top: 20px;
        border: 1px solid #ddd;
        padding: 20px;
        text-align: left;
    }
    .commentBox {
        margin-bottom: 20px;
        border: 1px solid #ccc;
        padding: 15px;
        border-radius: 5px;
        background: #f9f9f9;
    }
    .commentBox ul {
        list-style: none;
        padding: 0;
    }
    .commentBox li {
        margin-bottom: 5px;
    }
    #commentWriteBox {
	    background-color: #f2f2f2;
	    padding: 10px;
	    border-radius: 5px;
	}

	#commentWriteBox ul {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}
	
	#commentWriteBox ul li {
	    margin-bottom: 10px;
	}
	
	#commentWriteArea {
	    width: 100%;
	    padding: 10px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    font-size: 14px;
	}
</style>
	<div id="boardWrap">
		<div id="contentWrap">
			<a href="${path}/imageBoard/imgBoard_list">뒤로가기</a>
		    <h1>제목 : ${vo.title}</h1>
		    <p><span>작성자 : ${vo.auth}</span></p>
		    <p><span>작성일 : ${vo.date}</span></p>
			<img src="${path}${vo.imageURL}"/>
		    <p>${vo.content}</p>
		    <div id="viewAndMod">
		    	<div id="viewWrap">
				    <span>조회수 : ${vo.vcnt}</span>
				    <span>좋아용 : ${vo.lcnt}</span>
			    </div>
	   		    <c:if test="${vo.auth == userInfo.nname}">
				<div id="modifyWrap">
					<button id="modify_btn">수정</button>
					<button id="delete_btn">삭제</button>
				</div>
				<form id="modifyForm" action="modify" method="post">
					<input type="hidden" name="bno" value="${vo.bno}">
				</form>
				</c:if>
			</div>
		</div>	
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
							<c:if test="${comment.commenterID == userInfo.nname}">
								<button class="commentModify" data-cno='${comment.commentNO}'>
									수정
								</button>
								<button class="commentDelete" data-cno='${comment.commentNO}'>
									삭제
								</button>
							</c:if>
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
	   	    		<c:if test="${!empty pm and pm.maxPage > 1}">
					<tr>
						<th colspan="5">
							<c:if test="${pm.first}">
								<a href="?bno=${vo.bno}&page=1">[&laquo;]</a>
							</c:if>
							<c:if test="${pm.prev}">
								<a href="?bno=${vo.bno}&page=${pm.startPage-1}">[&lt;]</a>
							</c:if>
							<c:forEach var="i" 
									   begin="${pm.startPage}" 
									   end ="${pm.endPage}">
								<a href="?bno=${vo.bno}&page=${i}">[${i}]</a>
							</c:forEach>
							<c:if test="${pm.next}">
								<a href="?bno=${vo.bno}&page=${pm.endPage+1}">[&gt;]</a>
							</c:if>
							<c:if test="${pm.last}">
								<a href="?bno=${vo.bno}&page=${pm.maxPage}">[&raquo;]</a>
							</c:if>
						</th>
					</tr>
				</c:if>
			</c:if>
			<c:if test="${!empty userInfo}">
	    		<div id="commentWriteBox">
	    			<ul>
	    				<li>${userInfo.nname}</li>
	    				<li>
	    					<input id="commentWriteArea" type="text" name="commentContent" placeholder="댓글을 남겨보세요">
							<input type="hidden" id="commenterID" name="commenterID" value="${userInfo.nname}">
							<input type="hidden" id="bno" name="imageBoardBNO" value="${vo.bno}">
	   					</li>
	    				<li>
	    					<button id="commentWrite">등록</button>
	    				</li>
	    			</ul>
	    		</div>
    		</c:if>
    	</div>
    	<div>
    		<ul id="test"></ul>
    	</div>
    </div>
<jsp:include page="../common/footer.jsp" />
<script>
	
	var bno = ${vo.bno};

	// 게시글 수정 (게시글작성자 == 로그인멤버)
	$("#modify_btn").on("click",function(e){
		$("#modifyForm").attr("action","modify");
		$("#modifyForm").submit();
	})
	// 게시글 삭제 (게시글작성자 == 로그인멤버)
	$("#delete_btn").on("click",function(e){
		if(confirm('정말로 삭제?')){
			$("#modifyForm").attr("action","delete");
			$("#modifyForm").submit();
			alert('게시글 삭제완료!');
		}
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
			url : "commentMod",
			data : JSON.stringify({
				commentNO : cno,
				commentContent : text
			}),
			dataType : "text",
			contentType : "application/json",
			success : function(data){
				alert(data);
				getComments();
			}
		});
	});
	// 댓글 삭제
	$(".commentDelete").on("click", function () {
	    let cno = $(this).attr('data-cno');
	    if(confirm("정말로 삭제?")){
	        $.ajax({
	            type: "DELETE",
	            url: "commentDel/"+cno,
	            dataType: "text",
	            contentType : "application/json",
	            success: function (result) {
	                alert(result);
	                getComments();
	            }
	        });
	    }else{
	    	return;	
	    }
    });
	// 댓글 삽입 요청 처리
	$("#commentWrite").click(function(){
		let auth = $("#commenterID").val();
		let text = $("#commentWriteArea").val();
		let bno = $("#bno").val();
		
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
				getComments();
			}
		}); 
	});
	
    $("#commentWriteArea").on('keydown', function(e) {
        if (e.keyCode === 13) { // 13 == enter
            e.preventDefault(); 
            $("#commentWrite").click();
        }
    });
    
 	// AJAX로 댓글 목록 가져오기
    function getComments() {
        $.getJSON('getComments?bno='+bno,function(data){
        	if(data.length === 0){
        		$('#test').html('<h1>등록된 댓글이 없습니다.</h1>');
        	}else{
        		let str = "";
        		$(data).each(function(){
        			let id = this.commenterID;
        			let date = this.commentDate;
        			let content = this.commentContent;
        			let num = this.commentNO;
        			
        			str += "<li>작성자 : "+id+"<li>";
        			str += "<li>작성일 : "+date+"</li>";
        			str += "<li id="+content+num+">";
        			str += "내 용 : "+content+"</li>"
        		})
  				$(".commentBox").append(str);
        	}
        })
    }

    // 페이지 로드 시 댓글 목록을 가져옴
    $(document).ready(function() {
        getComments();
    });
</script>
