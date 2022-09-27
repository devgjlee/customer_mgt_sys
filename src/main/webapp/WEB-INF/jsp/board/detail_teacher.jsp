<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function doAction(type) {
		switch(type) {
		case 'U' : 
			break;
		case 'D' : 
			if(confirm('${board.no}번을 삭제하시겠습니까?')) {
				// 해당 게시물 삭제후 목록페이지로 이동
				
				$.ajax({
					url: '${ pageContext.request.contextPath }/board/${board.no}',
					type: "delete",
					success : function(data) {
						alert(JSON.parse(data).msg);
						location.href = "${ pageContext.request.contextPath}/board";
					}
				});
				
			
			} 
			break;
		case 'L' : 
			location.href = "${ pageContext.request.contextPath}/board";
			break;
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"/>
	</header>
	<section>
		<div align="center">
		<br>
		<hr>
		<h2>게시물 상세 페이지</h2>
		<hr>
		<br>
		
		<table>
			<tr>
				<th width="25%">번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td>${ board.title }</td>
			</tr>
			<tr>
				<th width="25%">글쓴이</th>
				<td>${ board.writer }</td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td>${ board.content }</td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td>${ board.viewCnt }</td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td>${ board.regDate }</td>
			</tr>
		</table>
		<br>
		<button onclick="doAction('U')">수정</button>&nbsp;&nbsp;
		<button onclick="doAction('D')">삭제</button>&nbsp;&nbsp;
		<button onclick="doAction('L')">목록</button>
		</div>
	</section>
	<footer>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>











