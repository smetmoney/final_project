<!-- qnaPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../common/header.jsp" />
<style>
	.newQna{
		text-align: right;
  		padding-right:50px;
  		padding-top: 10px;
  		width :100%;
		height: 50px;
		background-color:blue;
	}
	.qnaList{
		padding-left:15%;
		background-color:skyblue;	
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
	}
	.qnaList table tr td{font-size:18px;}
	.editQna form{
		display:inline-block;
		width:20%;	
	}
	.editQna{display:inline-block;}
	
</style>

<div class="mainWrap">
	<div class="qnaTitle">
		<h1>자주 들어오는 질문</h1>
	</div>
	<div class="newQna">
		<c:choose>
			<c:when test="${userId eq 'admin'}">
				<form action="newQna" method="Get" >
					<input type="submit" value="새로운 QnA 작성하기">
				</form>
			</c:when>
		</c:choose>
	</div>
	<div class="qnaList">
		<c:choose>
			<c:when test="${!empty qnaList}">
				<table>
			        <c:forEach items="${qnaList}" var="con">
			        	<tr>
			            	<th>
			            	<div class="editQna">
								<c:choose>
									<c:when test="${userId eq 'admin'}">
										<form action="editQna" method="GET" >
										 	<input type="hidden" name="qnaId" value="${con.qnaId}">
											<input type="submit" value="QnA 수정">
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
$(document).ready(function() {
    $(".qnaList table tr th").click(function() {
        var contentRow = $(this).closest("tr").next(".qnaContent");
        contentRow.slideToggle("slow", function() {
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
</script>


<jsp:include page="../common/footer.jsp" />
