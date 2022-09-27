<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
</head>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();

		var url = "${pageContext.request.contextPath}/myCustomer";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});	
	
	function fn_prev(page, range, rangeSize) {

// 		   var page = ((range - 2) * rangeSize) + 1;
		   var page = page - 1;
// 		   var range = range - 1;
		   var url = "${pageContext.request.contextPath}/myCustomer";
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

		   var url = "${pageContext.request.contextPath}/myCustomer";
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
		   var url = "${pageContext.request.contextPath}/myCustomer";
		   url = url + "?page=" + page;
		   url = url + "&range=" + range;
		   
		   if($('#keyword').val() != null | $('#keyword').val() != '') {
			   url = url + "&searchType=" + $('#searchType').val();
			   url = url + "&keyword=" + $('#keyword').val();
		   }
		   
		   location.href = url;
		}

function doAction(no, star) {
		if ( star == 'N' ){
// 			즐겨찾기 전일때 ! 누르면 'Y'로 바꾸기! 
 			$.ajax({
						url : '/myCustomer/changeNtoY/' + no,
						type : "get",
						success : function(data) {
						location.href = "${ pageContext.request.contextPath }/myCustomer";
						}
					}); 

		}
		 if ( star == 'Y' ) {
// 			즐겨찾기 후일때 ! 누르면 'No'로 바꾸기! 
			 $.ajax({ 
						url : '/myCustomer/changeYtoN/' + no,
						type : "get",
						success : function(data) {
						location.href = "${ pageContext.request.contextPath }/myCustomer";
						}
					}); 
		} 
}
</script>
<body>
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>

	<div class="content">
		<div class="container2">
			<br />
			<img alt=""
				src="${ pageContext.request.contextPath }/resources/images/menu2.png"
				style="width: 300px;">
			
			<table class="table table-hover">
				<thead>
					<tr align="center">
						<th width="5%">No</th>
						<th width="45%">기업명(국/영문)</th>
						<th width="10%">상담 이력 관리</th>
						<th width="5%">수정</th>
						<th width="5%">즐겨찾기</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${ myCustomerList }" var="board">
						<tr>
							<td>${ board.no } <input type="hidden" value="${board.star }" name = "star"> </td>
							<td><a href="/board/${ board.no }"> <c:out value="${ board.companyKor }" /> / <c:out value=" ${board.companyEng }" /></a></td>
							<td><a href="/board/${ board.no }/consult"> <img src="/resources/images/sangdam.png" style="width: 20%"></a></td>
							<td><a href="/board/${board.no}/modify"> <img src="/resources/images/modify.png" style="width: 40%"></a></td>
							<td>
							<button onclick="doAction('${board.no}', '${board.star}')" id="starBtn" class="Btn btn btn-border">
								<!-- 즐겨찾기 여부에 따른 이미지 표현 달리하기 !  -->
								<c:choose>
									<c:when test="${board.star eq 'N'}">
										<img id="starOff" class="star"
											style="padding-bottom: 0.1rem; width: 1.4rem;"
											src="${ pageContext.request.contextPath }/resources/images/star_off.png" />
									</c:when>
									<c:otherwise>
										<img id="starOn" class="star"
											style="padding-bottom: 0.1rem; width: 1.4rem;"
											src="${ pageContext.request.contextPath }/resources/images/star_on.png" />
									</c:otherwise>
								</c:choose>
							</button>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			
			<div align="center" >
				<div style="text-align: center" class="pagination2">
					<c:if test="${pagination2.curPage ne 1}">
						<a href="#" onClick="fn_prev('${pagination2.curPage}', '${pagination2.curRange}', '${pagination2.rangeSize}')">[이전]</a>
					</c:if>
					<c:forEach var="pageNum" begin="${pagination2.startPage }" end="${pagination2.endPage }">
						<c:choose>
							<c:when test="${pageNum eq  pagination2.curPage}">
								<span style="font-weight: bold;">
									<a  href="#" class="active" onClick="fn_pagination('${pageNum}', '${pagination2.curRange}', '${pagination2.rangeSize}', searchType, keyword)">${pageNum }</a>
								</span>
							</c:when>
							<c:otherwise>
								<a href="#" onClick="fn_pagination('${pageNum }', '${pagination2.curRange}', '${pagination2.rangeSize}', searchType, keyword)">${pageNum }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if
						test="${pagination2.curPage ne pagination2.pageCnt && pagination2.pageCnt > 0}">
						<a href="#" onClick="fn_next('${pagination2.curPage}', '${pagination2.curRange}', '${pagination2.rangeSize}')">[다음]</a>
					</c:if>
				</div>
			</div>
			
  
			
			
			<!-- search 칸 -->
			<div class="form-group row justify-content-center">
				<div class="w100" style="padding-right: 10px">
					<select class="form-control form-control-sm" name="searchType"
						id="searchType">
						<option value="companyKor">기업명(국문)</option>
						<option value="companyEng">기업명(영문)</option>
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
