<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 관리 시스템</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js" charset="utf-8"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/mycss.css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.js" charset="utf-8"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/bootstrap.css">
</head>
<body>
<div>
		<hr style="border: solid 3px #008485; margin: 0;" />
	</div>
	<div class="container-fluid">
		<div class="header">
			<div style="display: grid; grid-template-columns: 0.5fr 1.5fr 0.5fr 0.4fr;">
			<c:choose>
				<c:when test="${ sessionScope.userVO.type == 'U ' }">
				<div align=left>
					<a href="${ pageContext.request.contextPath }/board"><img src="${ pageContext.request.contextPath }/resources/images/logo_hana.png" style="width: 200px;"></a>
				</div>
				<div align=left>
					<a href="${ pageContext.request.contextPath }/board"><img src="${ pageContext.request.contextPath }/resources/images/logo2.png" style="width: 200px;"></a>
				</div>
				</c:when>
				<c:otherwise>
				<div align=left>
					<a href="${ pageContext.request.contextPath }/admin"><img src="${ pageContext.request.contextPath }/resources/images/logo_hana.png" style="width: 200px;"></a>
				</div>
				<div align=left>
					<a href="${ pageContext.request.contextPath }/admin"><img src="${ pageContext.request.contextPath }/resources/images/logo2.png" style="width: 200px;"></a>
				</div>
				</c:otherwise>
			</c:choose>
				
				<div align="right"><span style="font-family: hanaM; font-size: 20px">${ userVO.id }님 로그인중..</span></div>
				<div align=right>
				<c:if test="${userVO.id  != null }"> <!--  로그인이 되있으면 -->
				<input type="button" class="btn" style="background-color: #1abc9c; border-radius: 10em; font-family: hanaCM; color: white" value="My Page" onclick="location.href='/mypage'">
				<input type="button" class="btn" style="background-color: #1abc9c; border-radius: 10em; font-family: hanaCM; color: white" value="Logout" onclick="location.href='/login'"></div>
				</c:if>
			</div>
		</div>
	</div>
	
	<hr style="margin: 0; border: solid 0.3px #b5b5b5" />
	<nav class="navbar navbar-expand-sm  navbar-dark sticky-top" style="background-color: #f4f6f7;">
		<div  style="margin-left: 10%">
		<ul class="navbar-nav" style="font-family: hanaM; font-size: 20px">
		<c:choose>
		<c:when test="${userVO.id  != null }"> <!-- 로그인 사용자 -->
			<c:choose>
					<c:when test="${ sessionScope.userVO.type == 'U ' }">
					<li class="nav-item"><a class="nav-link" href="/board" style="color:black">전체 기업고객 조회</a></li>
					<li class="nav-item"><a class="nav-link" href="/myCustomer" style="color:black">담당 기업고객 조회</a></li>
					<li class="nav-item"><a class="nav-link" href="/regist" style="color:black">신규 기업고객 등록</a></li>
					</c:when>
					
				 <c:otherwise>
					<li class="nav-item"><a class="nav-link" href="/admin" style="color:black">전체 행원 조회</a></li>
					<li class="nav-item"><a class="nav-link" href="/myEmpList" style="color:black">지점별 행원 조회</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/deleteList" style="color:black">기업고객 정보 삭제 결재</a></li> 
					<li class="nav-item"><a class="nav-link" href="/admin/registEmp" style="color:black">신규 행원 등록</a></li> 
				</c:otherwise> 
			</c:choose>
		</c:when>
		
		<c:when test="${userVO.id  == null }"> <!-- 비로그인 사용자 -->
			<li class="nav-item"><a class="nav-link" href="/login" style="color:black">첫화면으로</a></li>
		</c:when>
		
		</c:choose>
		</ul>
		</div>
	</nav>
	<hr style="margin: 0; border: solid 0.3px #b5b5b5" />
</body>
</html>