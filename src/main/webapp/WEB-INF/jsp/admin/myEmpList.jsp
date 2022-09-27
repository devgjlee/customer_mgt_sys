<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>고객 관리 시스템</title>
</head>
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js" charset="utf-8"></script>

<script>
function deleteCheck(no) {	//확인
// 	alert(no);
// 	alert('${ pageContext.request.contextPath }/admin/' + no +'/empDel');
	if (confirm("정말 삭제하시겠습니까??") == false){ 
	 return false;
	} else {
		$.ajax({
			url: '${ pageContext.request.contextPath }/admin/' + no +'/empDel',
			type: "delete",
			success : function(data) {
// 				alert(JSON.parse(data).msg);
				location.href = "${ pageContext.request.contextPath}/admin/myEmpList";
			}
		});
	}
}
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();

		var url = "${pageContext.request.contextPath}/myEmpList";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		
		
		location.href = url;
		console.log(url);
	});

	function fn_prev(page, range, rangeSize) {
		var page = page - 1;
		var url = "${pageContext.request.contextPath}/myEmpList";
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
		var url = "${pageContext.request.contextPath}/myEmpList";
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
		var url = "${pageContext.request.contextPath}/myEmpList";
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
			<span style="font-family: hanaCM"><h2>지점별 행원 조회</h2></span>
			<br/>
			<table class="table table-hover">
				<thead>
					<tr align="center">
						<th width="10%" style="font-family: hanaM">사번</th>
						<th width="30%" style="font-family: hanaM">이름</th>
						<th width="10%" style="font-family: hanaM">근무 영업점</th>
						<th width="10%" style="font-family: hanaM">삭제</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${ boardList }" var="board">
						<tr>
							<td><a href="/empDetail/${ board.id }"> <c:out value="${ board.id }" /></a></td>
							<td><a href="/empDetail/${ board.id }"><c:out value="${ board.name }" /></a></td>
							<td><a href="/empDetail/${ board.id }"><c:out value="${ board.branch }" /></a></td>
							<td>
								<a href="" onclick="deleteCheck(${board.id})"><img src="${ pageContext.request.contextPath }/resources/images/empDel.jpg" style="width: 10%"/></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- 페이지 네이션  -->
			<div align="center" >
				<div style="text-align: center" class="pagination2">
					<c:if test="${pagination4.curPage ne 1}">
						<a href="#" onClick="fn_prev('${pagination4.curPage}', '${pagination4.curRange}', '${pagination4.rangeSize}')">[이전]</a>
					</c:if>
					<c:forEach var="pageNum" begin="${pagination4.startPage }" end="${pagination4.endPage }">
						<c:choose>
							<c:when test="${pageNum eq  pagination4.curPage}">
								<span style="font-weight: bold;">
									<a  href="#" class="active" onClick="fn_pagination('${pageNum}', '${pagination4.curRange}', '${pagination4.rangeSize}', searchType, keyword)">${pageNum }</a>
								</span>
							</c:when>
							<c:otherwise>
								<a href="#" onClick="fn_pagination('${pageNum }', '${pagination4.curRange}', '${pagination4.rangeSize}', searchType, keyword)">${pageNum }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if
						test="${pagination4.curPage ne pagination4.pageCnt && pagination4.pageCnt > 0}">
						<a href="#" onClick="fn_next('${pagination4.curPage}', '${pagination4.curRange}', '${pagination4.rangeSize}')">[다음]</a>
					</c:if>
				</div>
			</div>
			<!-- 페이지 네이션  -->
			<!-- search 칸 -->
			<div class="form-group row justify-content-center">
				<div class="w100" style="padding-right: 10px">
					<select class="form-control form-control-sm" name="searchType" id="searchType">
						<option value="empId">담당 행원 사번</option>
						<option value="name">담당 행원 성명</option>
						<option value="branch">근무 영업점</option>
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
