<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"/>
	</header>
	<section>
		<a href="${ pageContext.request.contextPath }/board/write2">Front-end에서 새글등록 체크</a><br>
		<a href="${ pageContext.request.contextPath }/board/write">Back-end에서 새글등록 체크</a><br>
	</section>
	<footer>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>












