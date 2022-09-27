<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.dataPrint {
font-family: hanaL;
font-size: 20px;
}
.oneView{
	font-family: hanaCM;
	font-size: 18px;
}
</style>
<script>
var geocoder;
var map;
function initialize() {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(37.384931, 127.123249);
  var mapOptions = {
    zoom: 18,
    center: latlng
  }
  map = new google.maps.Map(document.getElementById('map'), mapOptions);
}

function codeAddress() {
	  geocoder = new google.maps.Geocoder();
	  var latlng = new google.maps.LatLng(37.384931, 127.123249);
	  var mapOptions = {
	    zoom: 17,
	    center: latlng
	  }
	  map = new google.maps.Map(document.getElementById('map'), mapOptions);
	  
  var address = document.getElementById('address').value;
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      alert('부정확한 주소로 마킹을 할 수 없습니다.');
    }
  });
}

function deleteCheck() {	//확인
	if (confirm("정말 삭제하시겠습니까??") == true){ 
		$.ajax({
			url: '${ pageContext.request.contextPath }/board/${board.no}/delete',
			type: "delete",
			success : function(data) {
				alert(JSON.parse(data).msg);
				location.href = "${ pageContext.request.contextPath}/board";
			}
		});
	 }else{   //취소
	     return false;
	 }
}
</script>
</head>
<body onload="codeAddress()">
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
<div id="message"></div>
	<div class="content">
		<div class="container2">
			<br />
			<div style="display: grid; grid-template-columns: 0.7fr 0.3fr 0.4fr 1.4fr;">
				<div><span style="font-family: hanaCM"><h2>기업고객 상세 정보</h2></span></div>
				<div>
					<input type="button" class="btn" style="background-color: #1abc9c; border-radius: 10em; font-family: hanaL; color: white; font-size: 18px"
					value="상담 이력" onClick="location.href='/board/${ board.no }/consult'">
				</div>
				<div>
					<input type="button" class="btn" style="background-color: #1abc9c; border-radius: 10em; font-family: hanaL; color: white; font-size: 18px"
					value="첨부 파일 목록" onClick="location.href='/board/${ board.no }/fileList'">
				</div>
				<div align="right"></div>
			</div>
			<br/>
			<table class="table table-striped">
				<tr>
					<td class="oneView" width="15%">기업명(국문)</td>
					<td width="35%" class="dataPrint">${ board.companyKor }</td>
					<td class="oneView" width="15%">기업명(영문)</td>
					<td width="35%" class="dataPrint">${ board.companyEng }</td>
				</tr>
				<tr>
					<td class="oneView">법인 등록 번호</td>
					<td class="dataPrint">${ board.corporationNum }</td>
					<td class="oneView">사업자 번호</td>
					<td class="dataPrint">${ board.bizRegisNum }</td>
				</tr>
				<tr>
					<td class="oneView">법인 구분</td>
					<td class="dataPrint">${bizCategory }</td>
					<td class="oneView">대표자명</td>
					<td class="dataPrint">${ board.representName }</td>
				</tr>
				<tr>
					<td class="oneView">홈페이지</td>
					<td class="dataPrint">${ board.homepage }</td>
					<td class="oneView">Phone/FAX</td>
					<td class="dataPrint">${ board.phone }</td>
				</tr>
				<tr>
					<td class="oneView">업종</td>
					<td class="dataPrint">${ board.category }</td>
					<td class="oneView">담당 행원</td>
					<td class="dataPrint">${ board.name }</td>
				</tr>
				<tr>
					<td class="oneView">담당자 성명</td>
					<td class="dataPrint">${ board.customerName }</td>
					<td class="oneView">담당자 전화번호</td>
					<td class="dataPrint">${ board.customerPhone }</td>
				</tr>
				<%-- <c:forEach items="${ fileList }" var="file">
						<c:if test="${ file.originFileName != null}">
					<tr>
						<td class="oneView">첨부파일</td>
							<td colspan="3" class="dataPrint"><a href="/download/${ file.no }"><c:out value="${ file.originFileName }" /></a></td>
					</tr>
						</c:if>
				</c:forEach> --%>
				
				<tr>
					<td class="oneView">주소</td>
					<td colspan="3" class="dataPrint">${ board.address }</td>
				</tr>
				<tr>
				<td colspan="4">
					<div class="map">
						<div class="doumMap">
							<div id="map" style="width: 100%; height: 378px;"></div>
					  </div>
					</div>
					</td>
				</tr>
			</table>
			<!-- 담당 행원만 삭제 요청 가능 -->
			<c:if test="${ board.id eq userVO.id }">
			<div align="right">
			<input type="button" class="btn btn-danger" style="border-radius: 10em; font-family: hanaCM;" value="삭제요청" onclick="deleteCheck()"/>
			</div>
			</c:if>
					<input type="hidden" id="address" value="${ board.address }">
		</div>
	</div>


	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAjLskm47EtxsKk0Q1PyWtZzWxZZnJkH74&callback=initMap"
		async defer>
		
	</script> 
</body>
</html>