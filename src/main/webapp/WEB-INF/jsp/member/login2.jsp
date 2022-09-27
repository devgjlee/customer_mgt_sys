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
		<div align="center">
		<br>
		<hr>
		<h2>로그인</h2>
		<hr>
		<br>
		<form method="post">
			<table style="width:40%;">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id">
					</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>
						<input type="password" name="password">
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="로그인">
		</form>
		</div>
	</section>
	<footer>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>










