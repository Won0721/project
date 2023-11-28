<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_drivingInfoT.jpg) center 0 no-repeat;
	background-size: cover;
}
.table-cell{
	text-align: center; line-height: 3; 
}
.titleDrive{
	font-weight: bold; font-size: 15px;
}
</style>
    <title>운행 일정 목록</title>
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
    
    <div class="page customer">
	    <div class="board_list" style="margin-top : 30px; width: 1000px">
			<table class="table table-hover ">
				<thead>
					<tr>
						<th class="table-cell titleDrive">운행번호</th>
		                <th class="table-cell titleDrive">출발날짜</th>
		                <th class="table-cell titleDrive">출발시간</th>
		                <th class="table-cell titleDrive">도착시간</th>
		                <th class="table-cell titleDrive">총좌석 수</th>
		                <th class="table-cell titleDrive">예매가능 좌석수</th>
		                <th class="table-cell titleDrive">노선</th>
		                <th class="table-cell titleDrive">고속사 및 버스등급</th>
		                <th class="table-cell titleDrive">수정</th>
		                <th class="table-cell titleDrive">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${driveList}" var="drive">
		                <tr>
		                    <td class="table-cell">${drive.dr_num}</td>
		                    <td class="table-cell">${drive.dr_depPlandDate}</td>
		                    <td class="table-cell">
							    <c:choose>
							        <c:when test="${drive.dr_depPlandTime ne null}">
							            <c:set var="hours" value="${drive.dr_depPlandTime.hour}" />
							            <c:set var="minutes" value="${drive.dr_depPlandTime.minute}" />
							            <c:out value="${hours}시${minutes}분"/>
							        </c:when>
							        <c:otherwise>0분</c:otherwise>
							    </c:choose>
							</td>
		                    <td class="table-cell">
							    <c:choose>
							        <c:when test="${drive.dr_arrPlandTime ne null}">
							            <c:set var="hours" value="${drive.dr_arrPlandTime.hour}" />
							            <c:set var="minutes" value="${drive.dr_arrPlandTime.minute}" />
							            <c:out value="${hours}시${minutes}분"/>
							        </c:when>
							        <c:otherwise>0분</c:otherwise>
							    </c:choose>
							</td>
		                    <td class="table-cell">${drive.busVo.bus_totalSeat}석</td>
							<td class="table-cell">${drive.dr_reservationAvailable}석</td>  
							<td class="table-cell">${drive.lineVo.li_te_depTerminalId} - ${drive.lineVo.li_te_arrTerminalId}</td>
							<td class="table-cell">${drive.busVo.co_name} - ${drive.busVo.bus_seatGrade}</td>					
		                    <td class="table-cell">
		                     	<a class="btn btn-outline-info" href="<c:url value='/drive/edit/${drive.dr_num}'/>">수정</a>
		                     </td>
		                     <td class="table-cell">
		                        <a class="btn btn-outline-danger" href="<c:url value='/drive/delete'/>?dr_num=${drive.dr_num}">삭제</a>
		                    </td>
		                </tr>
	          		</c:forEach>
				</tbody>
			</table>
    		<a class="btn btn-outline-dark" href="<c:url value='/drive/insert'/>">운행 등록</a>
		</div>
    </div>
</body>
</html>