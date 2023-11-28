<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_informationT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
label{ display: none; }
input[type=text], input[type=password] {
	width: 50% !important; height: 35px !important; 
}
.titleDrive{
	font-weight: bold; font-size: 15px; line-height: 3;
}
</style>
<script type="text/javascript">
    function parseTime(input) {
        const parts = input.split(':');
        return {
            hour: parseInt(parts[0], 10),
            minute: parseInt(parts[1], 10)
        };
    }

	 // 폼이 서버로 전송되기 전에 실행될 함수
    function onSubmit() {
        // dr_depPlandTime 값을 가져와서 LocalTime으로 변환
        const inputTime = document.getElementById('dr_depPlandTime').value;
        
        // 변환된 값을 숨겨진 input에 설정
        document.getElementById('hiddenDrDepPlandTimeHour').value = inputTime.split(':')[0];
        document.getElementById('hiddenDrDepPlandTimeMinute').value = inputTime.split(':')[1];
        // 폼을 서버로 전송
        document.getElementById('driveForm').submit();
    }
</script>
<title>운행 일정 등록</title>
</head>
<body>
	<!-- 헤더 밑 드랍다운 -->
    <div class="breadcrumb">
	   <ul class="breadcrumb_list">
	      <li><a href="/" class ="selectric tag1">HOME</a></li>
	      <li>
	         <div class="select-box">
	            <div class="selectricWrapper selectric-select">      
	                 <a class="selectric tag2">
	                    <p class="label">운행 관리</p>
	                  	<b class="button">▾</b>
	                 </a>
	               <div class="selectricItems infor" tabindex="-1" >
	                  <div class="selectricScroll">
	                     <ul class ="selectricLink">
	                        <li class=""><a class ="link-item" href="<c:url value='/company/companyList'/>">고속사 관리</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/bus/busList'/>">고속버스 관리</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/terminal/list'/>">터미널 관리</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/line/list'/>">노선 관리</a></li>
	                        <li class="selected"><a class ="link-item" href="<c:url value='/drive/list'/>">운행 관리</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/board/boardList'/>">공지사항 조회</a></li>
	                        <li class="last"><a class ="link-item" href="<c:url value='/board/boardListAdmin'/>">공지사항 등록</a></li>
	                     </ul>
	                  </div>
	               </div>
	               <input class="selectricInput" tabindex="0">
	            </div>
	         </div>
	      </li>
	   </ul>
	</div>

	<form:form modelAttribute="driveVo" action="/drive/insert" method="post">
		<input type="hidden" id="hiddenDrDepPlandTimeHour" name="hiddenDrDepPlandTimeHour">
		<input type="hidden" id="hiddenDrDepPlandTimeMinute" name="hiddenDrDepPlandTimeMinute">
		
		<div class="container">
			<table class="table" style="margin-top: 30px;">
				<tr>
					<td class="table-cell titleDrive">노선 선택</td>
					<td class="table-cell">
						<form:select path="dr_li_num" required="required" style="width: 50%; height: 35px; margin-top: 6px;">
						    <c:forEach var="line" items="${lineList}">
						        <c:if test="${line.li_use}">
						            <form:option value="${line.li_num}">${line.fullRoute}</form:option>
						        </c:if>
						    </c:forEach>
						</form:select>
				    </td>
				</tr>
				<tr>
					<td class="table-cell titleDrive">출발 날짜</td>
					<td class="table-cell">
						<label for="dr_depPlandDate">출발 날짜</label>
						<input type="date" name="dr_depPlandDate" required="required"/ style="width: 50%; height: 35px; margin-top: 6px;">	
					</td>
				</tr>
				<tr>
					<td class="table-cell titleDrive">출발 시간</td>
					<td class="table-cell">
						<label for="dr_depPlandTime">출발 시간</label>
						<input type="text" id="dr_depPlandTime" name="dr_depPlandTime" placeholder="예: 01:10" required style="margin-top: 6px;">
					</td>
				</tr>
				<tr>
					<td class="table-cell titleDrive">버스 선택</td>
					<td class="table-cell">
						<label for="driveVo.dr_bus_num">버스 선택</label>
						<form:select id="driveVo.dr_bus_num" path="dr_bus_num" required="required" style="width: 50%; height: 35px; margin-top: 6px;">
						    <c:forEach items="${busList}" var="bus">
						        <option value="${bus.bus_num}">
						            ${bus.bus_num}, ${bus.co_name} - ${bus.bus_seatGrade}
						        </option>
						    </c:forEach>
						</form:select>
					</td>
				</tr>
			</table>
		</div>
		<p class="btns col1">
        <button type="submit" class="btnL btn_normal" onclick="onSubmit()">등록</button>
    </form:form>
</body>
</html>