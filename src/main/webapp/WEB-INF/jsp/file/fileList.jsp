<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/mycss.css">
<title>고객 관리 시스템</title>
<style type="text/css">
.pagination2 {
  display: inline-block;
}

.pagination2 a {
  font-family: hanaM;
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination2 a.active {
  background-color: #28b2a5;
  color: white;
  border-radius: 5px;
}

.pagination2 a:hover:not(.active) {
  background-color: #ddd;
  border-radius: 5px;
}
</style>
</head>
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js" charset="utf-8"></script>
<script>
	function noDelete() {
		if (confirm("정말 삭제하시겠습니까??") == true){ 
			return true;
		} else {
			return false;
		}
	}
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();

		var url = "${pageContext.request.contextPath}/board";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});	
	
	function fn_prev(page, range, rangeSize) {

// 		   var page = ((range - 2) * rangeSize) + 1;
		   var page = page - 1;
// 		   var range = range - 1;
		   var url = "${pageContext.request.contextPath}/board";
		   url = url + "?page=" + page;
		   url = url + "&range=" + range;
		   location.href = url;

		}
		//페이지 번호 클릭

		function fn_pagination(page, range, rangeSize, searchType, keyword) {

		   var url = "${pageContext.request.contextPath}/board";
		   url = url + "?page=" + page;
		   url = url + "&range=" + range;
		   location.href = url;   

		}
		//다음 버튼 이벤트

		function fn_next(page, range, rangeSize) {

		   var page = parseInt(page) + 1;
// 		   var range = parseInt(range) + 1;
		   var url = "${pageContext.request.contextPath}/board";
		   url = url + "?page=" + page;
		   url = url + "&range=" + range;
		   location.href = url;
		}
</script>
<body>
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	<input type="hidden" id="id" name="id" value="${ userVO.id }" />
	<div class="content">
		<div class="container2">
			<br />
			<span style="font-family: hanaCM"><h2>첨부 파일 목록</h2></span>
			<br/>
			<table class="table table-hover">
				<thead>
					<tr align="center">
						<th width="10%" style="font-family: hanaM">No</th>
<!-- 						<th width="10%" style="font-family: hanaM">고객 번호</th> -->
						<th width="50%" style="font-family: hanaM">첨부파일명</th>
						<th width="10%" style="font-family: hanaM">삭제</th>
					</tr>
				</thead>
				<tbody align="center">

					<c:forEach items="${ fileList }" var="file">
						<c:if test="${ null ne file.originFileName }">
						<tr>
							<td>${ file.no }</td>
<%-- 							<td>${ file.customer_no }</td> --%>
							<td><a href="/download/${ file.no }"> <c:out value="${ file.originFileName }" /> 
							</a></td>
							<td>
								<a href="/fileDelete/${ file.customer_no }/${file.no}" onclick="return noDelete();"><img src="/resources/images/delete.png" style="width: 20%"></a>
							</td>
						</tr>
						</c:if>
					</c:forEach>

				</tbody>
			</table>
			
			<!-- 페이지 네이션 -->
			<%-- <div align="center" >
				<div style="text-align: center" class="pagination2">
					<c:if test="${pagination.curPage ne 1}">
						<a href="#" onClick="fn_prev('${pagination.curPage}', '${pagination.curRange}', '${pagination.rangeSize}')">[이전]</a>
					</c:if>
					<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
						<c:choose>
							<c:when test="${pageNum eq  pagination.curPage}">
								<span style="font-weight: bold;">
									<a  href="#" class="active" onClick="fn_pagination('${pageNum}', '${pagination.curRange}', '${pagination.rangeSize}', searchType, keyword)">${pageNum }</a>
								</span>
							</c:when>
							<c:otherwise>
								<a href="#" onClick="fn_pagination('${pageNum }', '${pagination.curRange}', '${pagination.rangeSize}', searchType, keyword)">${pageNum }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if
						test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
						<a href="#" onClick="fn_next('${pagination.curPage}', '${pagination.curRange}', '${pagination.rangeSize}')">[다음]</a>
					</c:if>
				</div>
			</div>
			<!-- 페이지 네이션 -->
			
			<!-- search 칸 -->
			<div class="form-group row justify-content-center">
				<div class="w100" style="padding-right: 10px">
					<select class="form-control form-control-sm" name="searchType"
						id="searchType">
						<option value="companyKor">기업명(국문)</option>
						<option value="companyEng">기업명(영문)</option>
						<option value="empId">담당 행원 사번</option>
						<option value="name">담당 행원 성명</option>
					</select>
				</div>
				<div class="w300" style="padding-right: 10px">
					<input type="text" class="form-control form-control-sm"
						name="keyword" id="keyword">
				</div>
				<div>
					<button class="btn btn-sm btn-primary" name="btnSearch"
						id="btnSearch">검색</button>
				</div>
			</div> --%>
			<!-- search 칸 -->

		</div>
	</div>

</body>
</html>
