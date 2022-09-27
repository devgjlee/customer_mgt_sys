<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>고객 관리 시스템</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	
	<div class="content">
		<div class="container2">
			<br/><img alt="" src="${ pageContext.request.contextPath }/resources/images/menu1.png" style="width: 300px;">
		  <table class="table table-hover">
		    <thead>
		      <tr align="center">
		        <th width="5%">No</th>
		        <th width="50%">기업명(국/영문)</th>
		        <th width="10%">상담 이력 관리</th>
		        <th width="5%">수정</th>
		      </tr>
		    </thead>
		    <tbody align="center">
		    <c:forEach items="${ boardList }" var="board">
				<tr>
					<td>${ board.no }</td>
					<td>
						<a href="${ pageContext.request.contextPath }/${ board.no }">
							<c:out value="${ board.companyKor }" />
							<c:out value=" ${board.companyEng }"/>
						</a>
					</td>
					<td>
			        <a href="#">
			        <img src="${ pageContext.request.contextPath }/resources/images/sangdam.png" style="width: 20%">
			        </a>
		        </td>
		        <td>
		        	<img src="${ pageContext.request.contextPath }/resources/images/modify.png" style="width: 40%">
		        </td>
				</tr>
			</c:forEach>
		      
		    </tbody>
		  </table>				
			<div class="pagination justify-content-center" align=center style="text-align: center">
			  <a href="#">&laquo;</a>
			  <a href="#">1</a>
			  <a class="active" href="#">2</a>
			  <a href="#">3</a>
			  <a href="#">4</a>
			  <a href="#">5</a>
			  <a href="#">6</a>
			  <a href="#">&raquo;</a>
			</div>		
		</div>
	</div>
	
	<div class="footer">
	footer
	</div>
</body>
</html>
