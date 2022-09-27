<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>고객 관리 시스템</title>
<style>
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
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js" charset="utf-8"></script>
<script>
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();

		var url = "${pageContext.request.contextPath}/admin";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});

	function fn_prev(page, range, rangeSize) {
		var page = page - 1;
		var url = "${pageContext.request.contextPath}/admin";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	
	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/admin";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt(page) + 1;
		// 		   var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/admin";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	<input type="hidden" id="id" name="id" value="${ userVO.id }" />
	<div class="content">
		<div class="container2">
			<br />
			<span style="font-family: hanaCM"><h2>전체 행원 조회</h2></span>
			<br/>
			<table class="table table-hover">
				<thead>
					<tr align="center">
						<th width="10%" style="font-family: hanaM">사번</th>
						<th width="30%" style="font-family: hanaM">이름</th>
						<th width="10%" style="font-family: hanaM">근무 영업점</th>
						
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${ boardList }" var="board">
						<tr>
							<td><a href="/empDetail/${ board.id }"> <c:out value="${ board.id }" /></a></td>
							<td><a href="/empDetail/${ board.id }"><c:out value="${ board.name }" /></a></td>
							<td><a href="/empDetail/${ board.id }"><c:out value="${ board.branch }" /></a></td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div align="center" >
				<div style="text-align: center" class="pagination2">
					<c:if test="${pagination3.curPage ne 1}">
						<a href="#" onClick="fn_prev('${pagination3.curPage}', '${pagination3.curRange}', '${pagination3.rangeSize}')">[이전]</a>
					</c:if>
					<c:forEach var="pageNum" begin="${pagination3.startPage }" end="${pagination3.endPage }">
						<c:choose>
							<c:when test="${pageNum eq  pagination3.curPage}">
								<span style="font-weight: bold;">
									<a  href="#" class="active" onClick="fn_pagination('${pageNum}', '${pagination3.curRange}', '${pagination3.rangeSize}', searchType, keyword)">${pageNum }</a>
								</span>
							</c:when>
							<c:otherwise>
								<a href="#" onClick="fn_pagination('${pageNum }', '${pagination3.curRange}', '${pagination3.rangeSize}', searchType, keyword)">${pageNum }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if
						test="${pagination3.curPage ne pagination3.pageCnt && pagination3.pageCnt > 0}">
						<a href="#" onClick="fn_next('${pagination3.curPage}', '${pagination3.curRange}', '${pagination3.rangeSize}')">[다음]</a>
					</c:if>
				</div>
			</div>

			<!-- search 칸 -->
			 <div class="form-group row justify-content-center">
				<div class="w100" style="padding-right: 10px">
					<select class="form-control form-control-sm" name="searchType"
						id="searchType">
						<option value="empId">담당 행원 사번</option>
						<option value="name">담당 행원 성명</option>
						<option value="branch">영업점</option>
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
			</div> 
			<!-- search 칸 -->


		</div>
	</div>

</body>
</html>
