<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<script>
 function showPopup() {
         window.open("/findBranch", "지점 검색", "width=1000, height=500, left=100, top=50");
      }
</script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	<div class="content">
		<div class="container2">
			<br />
				<div>
				<span style="font-family: hanaCM; font-size: 35px">행원 정보 수정   </span>
				</div>
			<br/><br/>
			<form method="post" action="${ pageContext.request.contextPath }/${ empInfo.id }/modifyEmp" >
			<table class="table table-striped">
				<tr>
					<td class="oneView">사번</td>
					<td><input type="text" path="id" class="form-control" name="id" readonly="readonly" value="${ empInfo.id }"/></td>
					<td class="oneView">이름</td>
					<td><input type="text" path="name" class="form-control" name="name" value="${ empInfo.name }"/></td>
				</tr>
				 <tr>
					<td class="oneView">E-mail</td>
					<td><input type="text" class="form-control" path="email"  name="email" value="${ empInfo.email }"/></td>
					<td class="oneView">Phone</td>
					<td><input type="text" class="form-control" path="phone"  name="phone" value="${ empInfo.phone }"/></td>
				</tr>
				<tr>
					<td class="oneView">성별</td>
					<td>
						<select name="gender" class="form-control" path="gender">
						<c:choose>
							<c:when test="${ empInfo.gender eq 'M' }">
								<option value="M" selected="selected">남자</option>
								<option value="F">여자</option>
							</c:when>
							<c:otherwise>
								<option value="M">남자</option>
								<option value="F" selected="selected">여자</option>
							</c:otherwise>
						</c:choose>
						</select>
					</td>
					<td class="oneView">근무 영업점</td>
					<td>
						<div style="display: grid; grid-template-columns: 80% 20%;">
							<input type="text" class="form-control" path="branch" id="branch" name="branch" value="${ empInfo.branch }" readonly/>
							<input type="button" value="검색" onclick="showPopup()" class="btn btn-info" style="font-family: hanaM;">
						</div>
					</td>
				</tr>
			</table>
			<div align="right">
			<button type="submit" class="btn btn-info" style="font-family: hanaCM; font-size: 20px">회원 정보 수정</button>
			</div>
			</form>
		
		</div>
	</div>
</body>
</html>