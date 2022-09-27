<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>고객 관리 시스템</title>
<style type="text/css">
.dataPrint {
font-family: hanaL;
font-size: 20px;
}
</style>
<script	src="${ pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 
<script type="text/javascript">
function ajaxData() {
// 	alert(${empInfo.id});
    $.ajax({
        url: './${empInfo.id}/chartData.do',
        type: 'post',
        dataType: 'json',
        async: false,
        success: function(lists) {
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var dataChart = [['고객번호', '상담 수']];
                if(lists.length != 0) {
                    $.each(lists, function(i, item){
                        dataChart.push([item.item, item.number]);
                    });
                }else {
                    dataChart.push(['상담 내역이 없습니다.', 0]);
                }
                var data = google.visualization.arrayToDataTable(dataChart);
                var view = new google.visualization.DataView(data);
                var options = {
                        title: "고객 당 상담 수",
                        hAxis: {
                        	title: '고객번호',
                        },
                        vAxis: {
                            minValue:0,
                            format:'# 개',
                            viewWindow: {
                                min: 0
                            }
                        },
                        width: 900, // 넓이 옵션
                        height: 300, // 높이 옵션
                };
                var chart = new google.visualization.ColumnChart(document.getElementById('piechart'));
                chart.draw(view, options);
            }
        }
    });
}
$(document).ready(function(){
    ajaxData();
});
</script>
</head>
	
<script>
	$(document).on('click', '#btnSearch', function(e) {
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
	<div class="content">
		<div class="container2">
			<br />
			<div style="display: grid; grid-template-columns: 27% 14% 25% 25%;">
				<div>
				<span style="font-family: hanaCM; font-size: 35px">행원 상세 정보 조회   </span>
				</div>
				<%-- <div>
				<input type="button" class="btn" style="background-color: #1abc9c; border-radius: 10em; font-family: hanaM; 
				color: white; margin-bottom: 10px; margin-top: 7px" value="상담 이력 관리" onClick="location.href='/admin/empId/${empInfo.id}/consultHistory'">
				</div> --%>
				<div><input type="button" class="btn" style="background-color: #1abc9c; border-radius: 10em; font-family: hanaM; 
				color: white; margin-bottom: 10px; margin-top: 7px" value="내 정보 수정" onClick="location.href='/${empInfo.id}/modifyMyInfo'">
				</div>
				<div></div>
			</div>
			<br/><br/>
			<table class="table table-striped">
				<tr>
					<td class="oneView" width="15%">이름</td>
					<td width="35%"><span class="dataPrint">${ empInfo.name }</span></td>
					<td class="oneView" width="15%">근무 영업점</td>
					<td width="35%"><span class="dataPrint"><c:out value="${ empInfo.branch }"/></span></td>
				</tr>
				<tr>
					<td class="oneView">사번</td>
					<td><span class="dataPrint"><c:out value="${ empInfo.id }" /></span></td>
					<td class="oneView">성별</td>
					<td><span class="dataPrint">
						<c:choose>
							<c:when test="${ empInfo.gender eq 'F' }">
								여자
							</c:when>
							<c:otherwise>
								남자
							</c:otherwise>
						</c:choose>
					</span></td>
				</tr>
				<tr>
					<td class="oneView">E-mail</td>
					<td><span class="dataPrint"><c:out value="${ empInfo.email }" /></span></td>
					<td class="oneView">Phone</td>
					<td><span class="dataPrint">${ phone }</span></td>
				</tr>
				<tr>
					<td class="oneView">담당 고객 수</td>
					<td><span class="dataPrint"><c:out value="${ customerCnt }" /></span></td>
					<td class="oneView">상담 비율</td>
					<td>${ board.representName }</td>
				</tr>
				<%-- <tr>
					<td class="oneView" colspan="2">담당 고객 업종 비율</td>
					<td colspan="2">${ board.homepage }</td>
				</tr> --%>
				<%-- <tr>
					<td class="oneView">업종</td>
					<td>${ board.category }</td>
					<td class="oneView">담당 행원</td>
					<td>${ board.name }</td>
				</tr> --%>
			</table>
			<div align="center">
			<div id="piechart"></div>
			</div>
		</div>
	</div>
	
</body>
</html>