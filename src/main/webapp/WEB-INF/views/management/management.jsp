<link rel="stylesheet" href="../resources/css/common.css">

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../common/header.jsp" />

<div class="mainWrap">

    <h1>관리자 페이지</h1>
    
    <table>
        <thead>
            <tr>
                <th>회원번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>닉네임</th>
                <th>성별</th>
                <th>회원등록일</th>
                <th>이메일</th>
                <th>포인트</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${members}" var="member">
                <tr>
                    <td>${member.idn}</td>
                    <td>${member.id}</td>
                    <td>${member.name}</td>
                    <td>${member.nname}</td>
                    <td>${member.gender}</td>
                    <td>${member.birthdate}</td>
                    <td>${member.email}</td>
                    <td>${member.point}</td>
                    <td>
                        <a href="detail.jsp?id=${member.id}">상세보기</a>
                        <a href="modify.jsp?id=${member.id}">수정</a>
                        <a href="delete.jsp?id=${member.id}">삭제</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
	
</div>
<jsp:include page="../common/footer.jsp" />
