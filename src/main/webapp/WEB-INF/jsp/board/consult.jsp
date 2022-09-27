<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
var a = $("#checkBox").val()

$.datepicker.setDefaults({
	dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년',
    maxDate: 0
});

  $( function() {
	  $("#datepicker").datepicker();
	  $("#datepicker").datepicker('setDate', new Date);
  } );
 
function modify(id) {
	var data = "textarea[name=\"" +id+"\"]";
	$(data).removeAttr("disabled");
}

 function updateCheck(no, boardNo) {	//확인
	if (confirm("수정하시겠습니까??") == true){
		return true;
	 } else{   //취소
	     return false;
	 } 
} 

 </script>
</head>
<body>
<div class="content">
		<div class="container2">
			<form method="post" action="${ pageContext.request.contextPath }/board/${no}/consult">
			<input type="hidden" value="${ writer }" id="writer" name="writer"/>
			<br />
			<img alt="" src="${ pageContext.request.contextPath }/resources/images/menu4.png" style="width: 250px;"> 
			<input
				type="button" class="btn"
				style="background-color: #1abc9c; border-radius: 10em; font-family: hanaCM; color: white"
				value="기업고객 정보 상세 조회" onClick="location.href='/board/${no}'">
			<table class="table table-striped">
				<tr>
					<td class="oneView" width="15%">기업명(국문)</td>
					<td width="35%">${ boardForConsult.companyKor }</td>
					<td class="oneView" width="15%">기업명(영문)</td>
					<td width="35%">${ boardForConsult.companyEng }</td>
				</tr>
				
				<tr>
					<td class="oneView">방문일자</td>
					<td colspan="3"><input type="text" id="datepicker" name="consultDate" size="10" style="font-family: hanaCM" readonly></td>
				</tr>
				<tr>
					<td class="oneView">상담 내용</td> 
					<td colspan="3"><textarea rows="5" cols="115" id="history" name="history"></textarea></td>
				</tr>
				<tr align="right">
					<td colspan="4">
						<button type="submit" class="btn btn-info" 
						style="font-family: hanaCM; padding-left: 18px;padding-right: 18px;padding-top: 3px;padding-bottom: 3px;">저장</button>
					</td>
				</tr>
			</table>
			</form>
			
					<span class="oneView">상담 내역 목록</span>
				<c:forEach items="${ consult }" var="consult">
				<form id="consultUpdateForm" name="consultUpdateForm" method="post" action="/board/${ no }/${consult.list_no}/consult/update">
					<table class="table">
					<tr align=center>
						<td width="20%"><c:out value= "${ consult.consultDate }" /> </td>
						<td colspan="3" rowspan="3">
							<textarea rows="5" cols="110" class="form-control" disabled name="modifyInput${ consult.list_no }" id="modifyInput${ consult.list_no }"><c:out value= "${ consult.history }" /></textarea>
						</td>
					</tr>
					<tr align="center">
						<td><c:out value="${ consult.writer }" /></td>
					</tr>
					
					<tr>
					<c:if test="${ consult.id eq userVO.id }">
							<td>
								<button type="button" class="btn btn-info"   onclick="modify('modifyInput${ consult.list_no }')"
								style="font-family: hanaM; padding-left: 18px;padding-right: 18px;padding-top: 3px;padding-bottom: 3px;">수정</button>
								
								<button type="submit" class="btn btn-info"  onclick="updateCheck(${consult.list_no}, ${no})"
								style="font-family: hanaM; padding-left: 18px;padding-right: 18px;padding-top: 3px;padding-bottom: 3px;">수정 완료</button>
							</td>
					</c:if>
					</tr>
				</table>
				</form>
				</c:forEach>
<!-- 					<hr/> -->
		</div>
	</div>
</body>
</html>