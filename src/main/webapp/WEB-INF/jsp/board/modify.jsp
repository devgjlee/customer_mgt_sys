<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.divHide {
 display:none;
 visibility:hidden;
}
.dataPrint {
	font-family: hanaL;
	font-size: 18px;
}
</style>
</head>
<script>
function checkFile() {
	var file1 = document.getElementById("attachfile1");
	var file2 = document.getElementById("attachfile2");
	var file3 = document.getElementById("attachfile3");
	var file4 = document.getElementById("attachfile4");
	var file5 = document.getElementById("attachfile5");
	
	if(file1.value == "") {
		file1.className = "divHide";
	} 
	if(file2.value == "") {
		file2.className = "divHide";
	}
	if(file3.value == "") {
		file3.className = "divHide";
	}
	if(file4.value == "") {
		file4.className = "divHide";
	}
	if(file5.value == "") {
		file5.className = "divHide";
	}
	
}
</script>
<body>
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	<div class="content">
		<div class="container2">
			<br />
			<img alt="" src="${pageContext.request.contextPath }/resources/images/menu3.png" style="width: 350px;"> 
			<input
				type="button" class="btn"
				style="background-color: #1abc9c; border-radius: 10em; font-family: hanaCM; color: white"
				value="상담 이력 관리" onClick="location.href='/board/${ no }/consult'">
			<form:form method="post" commandName="modifyBoard" action="/board/${ no }/modify" enctype="multipart/form-data" onsubmit="checkFile()">
			<form:input type="hidden" value="${ no }" path="no" id ="no" name="no" />
			<table class="table table-striped">
				<tr>
					<td class="oneView" width="15%">기업명(국문)</td>
					<td width="35%"><form:input type="text" value="${ modifyBoard.companyKor }" class="form-control" path="companyKor" name="companyKor" /></td>
					<td class="oneView" width="15%">기업명(영문)</td>
					<td width="35%"><form:input type="text" value="${ modifyBoard.companyEng }" class="form-control" path="companyEng" name="companyEng" /></td>
				</tr>
				<tr>
					<td class="oneView">법인 등록 번호</td>
					<td width="35%"><form:input type="text" value="${ modifyBoard.corporationNum }" class="form-control" path="corporationNum" name="corporationNum" /></td>
					<td class="oneView">사업자 번호</td>
					<td width="35%"><form:input type="text" value="${ modifyBoard.bizRegisNum }" class="form-control" path="bizRegisNum" name="bizRegisNum" /></td>
				</tr>
				<tr>
					<td class="oneView">법인 구분</td>
					<td class="dataPrint">${ bizCategory }</td>
					<td class="oneView">대표자명</td>
					<td width="35%"><form:input type="text" value="${ modifyBoard.representName }" class="form-control" path="" name="representName" /></td>
				</tr>
				<tr>
					<td class="oneView">홈페이지</td>
					<td width="35%"><form:input type="text" value="${ modifyBoard.homepage }" class="form-control" path="homepage" name="homepage" /></td>
					<td class="oneView">Phone/FAX</td>
					<td width="35%"><form:input type="text" value="${ modifyBoard.phone }" class="form-control" path="phone" name="phone" /></td>
				</tr>
				<tr>
					<td class="oneView">업종</td>
					<td width="35%"><form:input type="text" value="${ modifyBoard.category }" class="form-control" path="category" name="category" /></td>
					<td class="oneView">담당 행원</td>
					<td>${ modifyBoard.name }</td>
				</tr>
				<tr>
					<td class="oneView">담당자 성명</td>
					<td><form:input type="text" value="${ board.customerName }" class="form-control" path="customerName" name="customerName" /></td>
					<td class="oneView">담당자 전화번호</td>
					<td><form:input type="text" value="${ board.customerPhone }" class="form-control" path="customerPhone" name="customerPhone" /></td>
				</tr>
				<tr>
					<td class="oneView">주소</td>
					<td colspan="3"><form:input type="text" value="${ modifyBoard.address }" class="form-control" path="address" name="address" /></td>
				</tr>
				<tr>
					<td class="oneView">첨부파일1</td>
					<td colspan="3"><form:input type="file" path="attachfile1" id="attachfile1" name="attachfile1" /></td>
				</tr>
				<tr>
					<td class="oneView">첨부파일2</td>
					<td colspan="3"><form:input type="file" path="attachfile2" id="attachfile2" name="attachfile2"/></td>
				</tr>
				<tr>
					<td class="oneView">첨부파일3</td>
					<td colspan="3"><form:input type="file" path="attachfile3" id="attachfile3" name="attachfile3"/></td>
				</tr>
				<tr>
					<td class="oneView">첨부파일4</td>
					<td colspan="3"><form:input type="file" path="attachfile4" id="attachfile4" name="attachfile4"/></td>
				</tr>
				<tr>
					<td class="oneView">첨부파일5</td>
					<td colspan="3"><form:input type="file" path="attachfile5" id="attachfile5" name="attachfile5"/></td>
				</tr>
				
			</table>
			<div align="right">
				<button type="submit" class="btn btn-info">수정</button>
			</div>
			</form:form>
		</div>
	</div>

	
	
</body>
</html>