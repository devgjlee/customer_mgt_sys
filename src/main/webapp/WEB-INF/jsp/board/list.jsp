<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
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
	
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		
		var url = "${pageContext.request.contextPath}/board";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});	
	
	function fn_prev(page, range, rangeSize) {

		   var page = page - 1;
		   var url = "${pageContext.request.contextPath}/board";
		   url = url + "?page=" + page;
		   url = url + "&range=" + range;
		   
		   if($('#keyword').val() != null | $('#keyword').val() != '') {
			   url = url + "&searchType=" + $('#searchType').val();
			   url = url + "&keyword=" + $('#keyword').val();
		   }
		   
		   location.href = url;

		}
		//페이지 번호 클릭

		function fn_pagination(page, range, rangeSize, searchType, keyword) {

		   var url = "${pageContext.request.contextPath}/board";
		   url = url + "?page=" + page;
		   url = url + "&range=" + range;
		   
		   if($('#keyword').val() != null | $('#keyword').val() != '') {
			   url = url + "&searchType=" + $('#searchType').val();
			   url = url + "&keyword=" + $('#keyword').val();
		   }
		   
		   location.href = url;   

		}
		//다음 버튼 이벤트

		function fn_next(page, range, rangeSize) {

		   var page = parseInt(page) + 1;
// 		   var range = parseInt(range) + 1;
		   var url = "${pageContext.request.contextPath}/board";
		   url = url + "?page=" + page;
		   url = url + "&range=" + range;
		   
		   if($('#keyword').val() != null | $('#keyword').val() != '') {
			   url = url + "&searchType=" + $('#searchType').val();
			   url = url + "&keyword=" + $('#keyword').val();
		   }
		   
		   location.href = url;
		}

</script>
<body>
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	<input type="hidden" id="id" name="id" value="${ userVO.id }" />
	<div class="content">
		<div class="container2">
			<br />
			<span style="font-family: hanaCM"><h2>전체 기업고객 조회</h2></span>
			<br/>
			<table class="table table-hover">
				<thead>
					<tr align="center">
						<th width="10%" style="font-family: hanaM">고객번호</th>
						<th width="50%" style="font-family: hanaM">기업명(국/영문)</th>
						<th width="10%" style="font-family: hanaM">상담 이력 관리</th>
					</tr>
				</thead>
				<tbody align="center">

					<c:forEach items="${ boardList }" var="board">
						<tr>
							<td>${ board.no }</td>
							<td><a href="/board/${ board.no }"> <c:out
										value="${ board.companyKor }" /> / <c:out
										value=" ${board.companyEng }" />
							</a></td>
							<td><a href="/board/${ board.no }/consult"> <img
									src="/resources/images/sangdam.png" style="width: 20%">
							</a></td>
							<%-- <td><a href="/board/${ board.no }/modify"> <img
									src="/resources/images/modify.png" style="width: 40%">
							</a></td> --%>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			
			<!-- 페이지 네이션 -->
			<div align="center" >
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
				<div class="w300" style="padding-right: 10px" id="divId">
					<c:choose>
						<c:when test="${ keyword ne null }">
							<input type="text" class="form-control form-control-sm"
								name="keyword" id="keyword" value="${ keyword }">
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control form-control-sm"
								name="keyword" id="keyword">
						</c:otherwise>
					</c:choose>
				</div>
				<div>
					<button class="btn btn-sm btn-primary" name="btnSearch"
						id="btnSearch">검색</button>
				</div>
			</div>
			<!-- search 칸 -->


		</div>
	</div>

	
</body>
</html>
