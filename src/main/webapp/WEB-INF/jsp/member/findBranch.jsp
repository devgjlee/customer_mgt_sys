<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>지점 검색 - KEB 하나은행</title>
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js" charset="utf-8"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/mycss.css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.js" charset="utf-8"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/bootstrap.css">
<style>
p {
	font-weight: bold;
}
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

<script>
	/* function search() {
		var text = $("#keyword").val();
	alert(text);
	} */

	function closePopup() {
		self.close();
	}

	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();

		var url = "${pageContext.request.contextPath}/findBranchResult";
		url = url + "?keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});

	function fn_prev(page, range, rangeSize) {

		   var page = page - 1;
		   var url = "${pageContext.request.contextPath}/findBranchResult";
		   url = url + "?page=" + page;
		   url = url + "&range=" + range;
		   
		   if($('#keyword').val() != null | $('#keyword').val() != '') {
			   url = url + "&keyword=" + $('#keyword').val();
		   }
		   
		   location.href = url;

		}
		//페이지 번호 클릭

		function fn_pagination(page, range, rangeSize, searchType, keyword) {

		   var url = "${pageContext.request.contextPath}/findBranchResult";
		   url = url + "?page=" + page;
		   url = url + "&range=" + range;
		   
		   if($('#keyword').val() != null | $('#keyword').val() != '') {
			   url = url + "&keyword=" + $('#keyword').val();
		   }
		   
		   location.href = url;   

		}
		//다음 버튼 이벤트

		function fn_next(page, range, rangeSize) {

		   var page = parseInt(page) + 1;
//		   var range = parseInt(range) + 1;
		   var url = "${pageContext.request.contextPath}/findBranchResult";
		   url = url + "?page=" + page;
		   url = url + "&range=" + range;
		   
		   if($('#keyword').val() != null | $('#keyword').val() != '') {
			   url = url + "&keyword=" + $('#keyword').val();
		   }
		   
		   location.href = url;
		}
</script>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div class="content">
			<div class="container2">

				<section>
					<b>지점 검색</b><br> <br> <br>

					<table
						style="margin: auto; margin-bottom: 10%; vertical-align: middle"
						class="table">
						<tr>
							<td><c:choose>
									<c:when test="${ keyword ne null }">
										<input type="text" id="keyword" name="keyword" maxlength="15" style="width: 75%; display: inline-block" value="${ keyword }">
									</c:when>
									<c:otherwise>
										<input type="text" id="keyword" name="keyword" maxlength="15" style="width: 75%; display: inline-block" />
									</c:otherwise>
								</c:choose> 
								<input type="button" value="검색" style="width: 20%" id="btnSearch" onClick="search()" style="font-family: hanaM" /></td>
						</tr>
					</table>

					<c:if test="${ not empty param.keyword }">
						<p>* '${ param.keyword }'의 검색결과</p>
					</c:if>
					<div>
					<table style="margin: auto" class="table table-hover">
						<thead>
							<th width=20% class="oneView">지점명</th>
							<th width=50% class="oneView">주소</th>
							<th width=10%></th>
						</thead>
						<tbody>
							<c:forEach items="${ branchVO }" var="result">
								<tr>
									<td class="dataPrint">${ result.branchname }</td>
									<td class="dataPrint">${ result.address }</td>
									<td class="dataPrint"><a href="#"
										onClick="setParentText('${ result.branchname }')">선택</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
					<br> <br>


					<!-- 페이지 네이션 -->
			<div align="center" >
				<div style="text-align: center" class="pagination2">
					<c:if test="${pagination6.curPage ne 1}">
						<a href="#" onClick="fn_prev('${pagination6.curPage}', '${pagination6.curRange}', '${pagination6.rangeSize}')">[이전]</a>
					</c:if>
					<c:forEach var="pageNum" begin="${pagination6.startPage }" end="${pagination6.endPage }">
						<c:choose>
							<c:when test="${pageNum eq  pagination6.curPage}">
								<span style="font-weight: bold;">
									<a  href="#" class="active" onClick="fn_pagination('${pageNum}', '${pagination6.curRange}', '${pagination6.rangeSize}', keyword)">${pageNum }</a>
								</span>
							</c:when>
							<c:otherwise>
								<a href="#" onClick="fn_pagination('${pageNum }', '${pagination6.curRange}', '${pagination6.rangeSize}', keyword)">${pageNum }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if
						test="${pagination6.curPage ne pagination6.pageCnt && pagination6.pageCnt > 0}">
						<a href="#" onClick="fn_next('${pagination6.curPage}', '${pagination6.curRange}', '${pagination6.rangeSize}')">[다음]</a>
					</c:if>
				</div>
			</div>
			<!-- 페이지 네이션 -->
					<div align='center'>
						<input type="button" value="닫기" onClick="closePopup();"
							style="width: 15%" />
						<!--<a href='#'><input type="button" value="취소" /></a>-->
					</div>
				</section>
			</div>
		</div>
	</div>
	<script>
		function setParentText(myBranch) {
			opener.document.getElementById("branch").value = myBranch;

			self.close();
			session.removeAttribute("keyword2");
			// 		opener.changeDate();
		}
	</script>
</body>

</html>
</body>
</html>