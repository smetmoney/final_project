<link rel="stylesheet" href="../resources/css/common.css">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="../common/header.jsp" />

<div class="mainWrap">
	<div id="titleBox">
    	<h1>관리자 페이지</h1>
		<hr/>
	</div>
    <table>
        <thead>
            <tr>
                <th>회원번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>닉네임</th>
                <th>성별</th>
                <th>생년월일</th>
                <th>이메일</th>
                <th>멤버관리</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${members}" var="member">
                <tr class="memberInfo">
                    <td>${member.idn}</td>
                    <td>${member.id}</td>
                    <td>${member.name}</td>
                    <td>${member.nname}</td>
                    <td>${member.gender}</td>
                    <td>${member.birthdate}</td>
                    <td>${member.email}</td>
                    <td>
                        <a href="detail?id=${member.id}">상세보기</a>
                    </td>
                 </tr>
            </c:forEach>
        </tbody>
    </table>
    
     <%-- <c:if test="${!empty pm and pm.maxPage > 1}">
        <div class="pagination">
            <table>
                <tr>
                    <th colspan="3">
                        <c:if test="${pm.first}">
                            <a href="member_list?page=1">&lt;처음</a>
                        </c:if>
                        <c:if test="${pm.prev}">
                            <a href="member_list?page=${pm.startPage-1}&id=${userInfo.id}">&lt;이전</a>
                        </c:if>
                        <c:forEach var="i" begin="${pm.startPage}" end ="${pm.endPage}">
                            <a href="member_list${pm.mkQueryStr(i)}&id=${userInfo.id}">${i}</a>
                        </c:forEach>
                        <c:if test="${pm.next}">
                            <a href="member_list?page=${pm.endPage+1}&id=${userInfo.id}">다음&gt;</a>
                        </c:if>
                        <c:if test="${pm.last}">
                            <a href="member_list?page=${pm.maxPage}&id=${userInfo.id}">마지막&gt;</a>
                        </c:if>
                    </th>
                </tr>
            </table>
        </div>
        <hr/>
    </c:if> --%>
    
	
</div>

<jsp:include page="../common/footer.jsp" />
<script>
	$(".memberInfo").on("click",function(){
		location.href = $(this).find('a').attr('href');
	})
</script>
