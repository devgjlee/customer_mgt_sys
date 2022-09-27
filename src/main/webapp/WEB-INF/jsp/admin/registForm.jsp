<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
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
		<span style="font-family: hanaCM"><h2>신규 행원 등록</h2></span>
		<br/>
		<form:form method="post" action="${ pageContext.request.contextPath }/admin/registEmp" commandName="empRegisBoard">
		<input type="hidden" name="userID" value="${ userVO.id }">
		<table class="table table-striped">
				<tr>
					<td class="oneView">사번</td>
					<td><form:input type="text" path="id" class="form-control" name="id"/></td>
					<td class="oneView">이름</td>
					<td><form:input type="text" path="name" class="form-control" name="name"/></td>
				</tr>
				 <tr>
					<td class="oneView">E-mail</td>
					<td><form:input type="text" class="form-control" path="email"  name="email"/></td>
					<td class="oneView">Phone</td>
					<td><form:input type="text" class="form-control" path="phone"  name="phone"/></td>
				</tr>
				<tr>
					<td class="oneView">성별</td>
					<td>
						<form:select name="gender" class="form-control" path="gender">
							<option value="M">남자</option>
							<option value="F">여자</option>
						</form:select>
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
			<button type="submit" class="btn btn-info" style="font-family: hanaCM; font-size: 20px">신규 등록</button>
			</div>
			</form:form>
		</div>
</div>
</body>
</html>