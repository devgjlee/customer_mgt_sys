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
			location.href = "${ pageContext.request.contextPath }/board/modify/${board.no}";
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
	
	function getReplyList() {
		$.ajax({
			url : '${ pageContext.request.contextPath }/reply/${ board.no }',
			success : function(data) {
				var replyList = JSON.parse(data);
				$('#replylist').empty();
				$(replyList).each(function(index, reply) {
					var str = '<hr>';
					str += '<div>';
					str += '<strong>' + reply.content + '</strong>';
					str += '(' + reply.writer + ')';
					str += '&nbsp;&nbsp;' + '<button id=' + reply.no + '>삭제</button>';
					str += '</div>';
					
					$('#replylist').append(str);
				});
			}
		});
	}
	
	$(document).ready(function() {
		// 댓글 조회
		getReplyList();
	});
	
	$(document).ready(function() {
		// 댓글 추가
		$('#replyAddBtn').click(function() {
			var content = document.replyForm.content;
			var writer = document.replyForm.writer;
			
			var data = {
				boardNo : ${ board.no },
				content : content.value,
				writer : writer.value
			};
			
			$.ajax({
				url : '${ pageContext.request.contextPath }/reply',
				type: 'post',
				data: data,
				success : function() {
				
					content.value = '';
					writer.value = '';
					
					getReplyList();
				}
			});
		});
	});
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
		
		<br>
		<hr>
		<form name="replyForm">
			댓글 : <input type="text" name="content" size="50">
			이름 : <input type="text" name="writer" size="10">
			<input type="button" value="댓글추가" id="replyAddBtn">
		</form>
		<hr>
		<div id="replylist"></div>
		</div>
	</section>
	<footer>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>











