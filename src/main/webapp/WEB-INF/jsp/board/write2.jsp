<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css">
<script>
	function checkForm() {
		
		var f = document.inputForm;
		
		if(f.title.value == "") {
			alert('제목은 필수항목입니다');
			f.title.focus();
			return false;
		}
		
		if(f.writer.value == "") {
			alert('작성자는 필수항목입니다');
			f.writer.focus();
			return false;
		}
		
		if(f.content.value == "") {
			alert('내용은 필수항목입니다');
			f.content.focus();
			return false;
		}
		
		return true;
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
			<h2>게시판 등록폼</h2>
			<hr>
			<br>
			<form method="post" action="${ pageContext.request.contextPath }/board/write2"
				  onsubmit="return checkForm()"
				  name="inputForm" >
				<table>
					<tr>
						<th width="25%">제목</th>
						<td>
							<input type="text" name="title" size="80" >
						</td>
					</tr>
					<tr>
						<th width="25%">작성자</th>
						<td>
							<input type="text" name="writer" size="80">
						</td>
					</tr>
					<tr>
						<th width="25%">내용</th>
						<td>
							<textarea rows="8" cols="80" name="content"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" value="등록">
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>












