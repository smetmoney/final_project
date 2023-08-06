<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 작성</title>
</head>
<body>
    <h1>게시글 작성</h1>
		<%--     
		<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/create">
        <label>제목: <input type="text" name="title" value="${freeBoard.title}"/></label><br/>
        <label>내용: <textarea name="content">${freeBoard.content}</textarea></label><br/>
        <label>이미지: <input type="file" name="imageFile"/></label><br/>
        <span style="color: red;"><c:out value="${errors['imageFile']}"/></span><br/> 
        --%>
        <input type="submit" value="작성"/>
    </form>
</body>
</html>
