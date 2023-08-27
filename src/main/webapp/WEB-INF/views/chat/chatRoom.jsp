<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />
	<div class="mainWrap">
    <div id="titleBox">
        <h1>채팅</h1>
        <hr/>
    </div>
	<div id="chatList">
		<c:if test="${!empty chatRoom}">
			<c:forEach items="${chatRoom}" var="room">
				<div style="border:solid 1px black; width: 200px; height: 200px;">
					<a href="joinChat?roomNum=${room}">${room}번방</a>
				</div>
			</c:forEach>
		</c:if>
		<input type="button" value="방만들기" onclick='create()'>
	</div>
	</div>
<script>
	function create(){
		location.href="/project/chat/create";
	}
</script>
<jsp:include page="../common/footer.jsp" />