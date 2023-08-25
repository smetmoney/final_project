<!-- qnaPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../common/header.jsp" />
<style>
	/* 구역 정리  */
	.title{padding-top : 25px;}
	.newQna{
		text-align: right;
  		padding-right:20%;
  		padding-top: 10px;
  		width :100%;
		height: 50px;
	}
	/* 리스트 정리 */
	.qnaList{
		padding-left:20%;
		padding-top:20px;
	}
	.qnaList table{width:75%;}
	.qnaList table tr{
		display:block;
		border: 1px solid black; 
		padding :10px;
	}
	.qnaList table th{
		width:100%;
		display:inline-block;
		font-size : 20px;
		margin:4px 0;
	}
	.qnaList table tr td{font-size:18px;}
	.editQna form{
		display:inline-block;
		width:20%;	
	}
	.editQna{display:inline-block;}
	.blank_tr{padding:3px !important; border: none !important;}
	
	/* 리스트 색상 */
	.qnaTitle{
		background-color: #ced4da;
		/* color: #fff; */
		border-radius:10px 10px 0 0;
	}
	.qnaContent{border-top:none !important;}
	
	
	/* 버튼 */
	.newBtn{
		margin-top: 10px;
		padding: 10px 10px;
        border: none;
        background: #495057;
        color: #fff;
        border-radius: 3px;
        cursor: pointer;
	}
	
	.newBtn:hover {
	    background-color: #868e96;
	}
	
	.editBtn{
		padding: 5px 10px;
        border: none;
        background: #fff;
        color: #868296;
        border-radius: 3px;
        cursor: pointer;
	}
	
	.editBtn:hover {
	    background-color: #dee2e6;
	}
	
	
	
</style>

<div class="mainWrap">
	<div class="title">
		<h1>자주 들어오는 질문</h1>
	</div>
	<div class="newQna">
		<c:choose>
			<c:when test="${userInfo.id eq 'admin'}">
				<form action="newQna" method="Get" >
					<input type="submit" value="새로운 QnA 작성하기" class="newBtn">
				</form>
			</c:when>
		</c:choose>
	</div>
	<div class="qnaList">
		<c:choose>
			<c:when test="${!empty qnaList}">
				<table>
			        <c:forEach items="${qnaList}" var="con">
			        	<tr class="qnaTitle">
			            	<th>
			            	<div class="editQna">
								<c:choose>
									<c:when test="${userInfo.id eq 'admin'}">
										<form action="editQna" method="GET" >
										 	<input type="hidden" name="qnaId" value="${con.qnaId}">
											<input type="submit" value="QnA 수정" class="editBtn">
										</form>
									</c:when>
								</c:choose>
							</div>
			            	Q. ${con.questionTitle}
			            	</th>
			        	</tr>
			            <tr class="qnaContent" style="display:none;">
			                <td>A. ${con.questionContent}</td>
			            </tr>
			            <tr class="blank_tr">
			            	<td class="blank_td"></td>
			            </tr>
			        </c:forEach>
			    </table>
			</c:when>
			<c:otherwise>
				<h3>자주 물어보는 질문과 답변을 준비 중입니다 ...</h3>
			</c:otherwise>
		</c:choose>
	
		
	</div>
</div>

<script>
/* mainWrap사이즈 조절 */
 var mainWrap = document.querySelector('.mainWrap');

// 내부 컨텐츠 크기를 측정
var contentHeight = mainWrap.scrollHeight;

// 요소의 크기를 내부 컨텐츠 크기에 맞게 조절
mainWrap.style.height = contentHeight + 'px';
 
 
$(document).ready(function() {
    $(".qnaList table tr th").click(function() {
        var contentRow = $(this).closest("tr").next(".qnaContent");
        contentRow.slideToggle("fast", function() {
            if (contentRow.is(":visible")) {
                adjustBodyHeight(contentRow.outerHeight());
            } else {
                resetBodyHeight(contentRow.outerHeight());
            }
        });
    });

    function adjustBodyHeight(newHeight) {
        $(".mainWrap").css("height", "+=" + newHeight);
    }

    function resetBodyHeight(newHeight) {
        $(".mainWrap").css("height", "-=" + newHeight);
    }
});
/* 작업 수행 결과 출력 */
var resultMessage = "${result}"; // 서버에서 전달된 메시지
if (resultMessage !== "") {
    alert(resultMessage); // 메시지 팝업 표시
}
</script>


</script>


<jsp:include page="../common/footer.jsp" />
