<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_chkTicket_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
</style>

<title>예매 내역</title>
<script type="text/javascript">
	//요일 메이커
	$(function(){
		$('.dayOfWeek').each(function(){
			var date = $(this).data('date');
			showDayOfWeek(this, date);
		})
	})
	
	function showDayOfWeek(obj,date){
	
		const driveDate = new Date(date);
		// 요일을 추출
		const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
		const dayOfWeek = daysOfWeek[driveDate.getDay()]; // 0(일요일)부터 6(토요일)까지의 숫자를 반환
		// 요일을 해당 요소에 설정
		$(obj).text(dayOfWeek)
	
	}
	
	function compareDateTimeWithOneHourAhead(departureDate, departureTime) {
	    // 출발일과 출발시간을 Date 객체로 변환
	    var departureDateTime = new Date(departureDate + ' ' + departureTime);

	    // 현재 시간에 1시간을 더한 시간을 구하기
	    var currentDate = new Date();
	    var oneHourAhead = new Date(departureDateTime.getTime() + 60 * 60 * 1000); // 1시간을 밀리초로 계산

	    // 출발시간이 현재 시간 + 1시간 이후인지 확인
	    if (currentDate < oneHourAhead) {
	        return true; // 출발시간이 1시간 이내
	    } else {
	        return false; // 출발시간이 1시간 이후
	    }
	}
	
	function fn_book_cancel(dr_num, bk_num, dr_depPlandDate, dr_depPlandTime) {
	    if (compareDateTimeWithOneHourAhead(dr_depPlandDate, dr_depPlandTime)) {
	        location.href = "/bookConfirmation/bookCancel?dr_num=" + dr_num + "&bk_num=" + bk_num;
	    } else {
	        alert('출발 시간에서 1시간이 지났을 경우 환불이 불가합니다.');
	    }
	}
</script>

</head>
<body>
	<!-- 헤더 밑 드랍다운 -->
	<div class="breadcrumb">
		<ul class="breadcrumb_list">
			<li><a href="/" class="selectric tag1">HOME</a></li>
			<li>
				<div class="select-box">
					<div class="selectricWrapper selectric-select">
						<a class="selectric tag2">
							<p class="label">예매확인</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="<c:url value='/book/bookSearch'/>">고속버스 예매</a></li>
							 <li class=""><a class="link-item" href="<c:url value='/bookConfirmation/bookConfirmation'/>">예매확인</a></li>
							 <li class="selected"><a class="link-item" href="<c:url value='/inforSchedule/timeList'/>">운행정보</a></li>
							 <li class=""><a class="link-item" href="<c:url value='/informationUse/reservationInfo'/>">이용안내</a></li>
							 <li class=""><a class="link-item" href="<c:url value='/board/boardList'/>">공지사항</a></li>
							 <li class=""><a class="link-item" href="<c:url value='/customerCenter/question'/>">고객센터</a></li>
							 <li class=""><a class="link-item" href="<c:url value='/busAssociation/chairmansMsg'/>">전국고속버스운송사업조합</a></li>
							 <li class="last"><a class="link-item" href="<c:url value='/terminalOperator/presidentsMessage'/>">터미널사업자협회</a></li>
								</ul>
							</div>
						</div>
						<input class="selectricInput" tabindex="0">
					</div>
				</div>
			</li>
			<li>
				<div class="select-box">
					<div class="selectricWrapper selectric-select">
						<a class="selectric tag2">
							<p class="label">예매확인/취소</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class="selected"><a class="link-item" href="<c:url value='/bookConfirmation/bookConfirmation'/>">예매확인/취소</a></li>
								</ul>
							</div>
						</div>
						<input class="selectricInput" tabindex="0">
					</div>
				</div>
			</li>
		</ul>
	</div>

	<div class="page">
		<div class="tab_wrap tab_type1" style="border-bottom:1px solid #e6e6e6;">
			<span style="color:#5691bd; font-size: 20px; margin-left: 20px;">예매내역</span>
		</div>

		<c:forEach items="${bookList}" var="book" varStatus="vs">	
			<section class="detail_info_wrap newMobileTicket marT30 ">
				<div class="ticketInfo">
					<div class="type">
						<span class="mobile">고속버스 티켓</span> 
						<span class="desc">고속버스 모바일앱에서 승차권 확인 가능</span>
					</div>
					<div class="typeDetail">
						<span class="desc">결제수단</span> <span>카드</span>
					</div>
				</div>
	
				<!-- 발권 -->
				<div class="box_detail_info">
					<div class="routeHead">
						<p class="date">${book.driveVo.dr_depPlandDate} (<span id="dayOfWeek" class="dayOfWeek" data-date="${book.driveVo.dr_depPlandDate}"></span>) ${book.driveVo.dr_depPlandTime} 출발 / ${book.driveVo.dr_arrPlandTime} 도착</p>
						
					</div>
					<div class="routeBody">
						<div class="routeArea route_wrap">
							<div class="inner">
								<span class="roundBox departure">${book.driveVo.lineVo.li_te_depTerminalId}</span> 
								<span class="roundBox arrive">${book.driveVo.lineVo.li_te_arrTerminalId}</span>
							</div>
							<div class="detail_info">
								<!-- 예상소요시간 -->
								<span>
									<c:choose>
								        <c:when test="${book.driveVo.lineVo.li_travelTime ne null}">
								            <c:set var="hours" value="${book.driveVo.lineVo.li_travelTime.hour}" />
								            <c:set var="minutes" value="${book.driveVo.lineVo.li_travelTime.minute}" />
								            <c:out value="${hours}시간 ${minutes}분 소요"/>
								        </c:when>
								        <c:otherwise>0분</c:otherwise>
							    	</c:choose>
							    </span>
							</div>
						</div>
						<div class="routeArea route_wrap mob_route">
							<div class="tbl_type2">
								<table class="tbl_info">
									<caption>
										<strong>버스 정보</strong>
										<p>고속사, 등급, 출발</p>
									</caption>
									<colgroup>
										<col style="width: 68px;">
										<col style="width: *;">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">예매번호</th>
											<td>&nbsp;${book.bk_num}</td>
										</tr>
										<tr>
											<th scope="row">고속사</th>
											<td>${book.driveVo.busVo.co_name}</td>
										</tr>
										<tr>
											<th scope="row">등급</th>
											<td>${book.driveVo.busVo.bus_seatGrade}</td>
										</tr>
										<tr>
											<th scope="row">매수</th>
											<td>
												<c:if test="${book.bk_adult > 0}">
													<span id="">성인 ${book.bk_adult}명 </span>
												</c:if>
												<c:if test="${book.bk_adult > 0 && book.bk_teen > 0}">
													,
												</c:if>
												<c:if test="${book.bk_teen > 0}">
													<span id="">청소년 ${book.bk_teen}명</span>
												</c:if>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- 좌석상세내역 -->
				<div class="seat_detail">
					<ul>
						<li class="" style="border-top: none;">
							<span class="seatNum">${book.bk_reservedSeatNum}</span>
							<span class="txt_blue" style="margin-left: 50px;">결제</span> 
							<span class="box_ticketNum"> 
								<span class="ticketNum">${book.bk_payNum}</span>
							</span>
							<div class="btnBox"></div>
						</li>
					</ul>	
				</div>
				<!-- //좌석상세내역 -->
			</section>
		
		<p class="btns multi clfix col3">
			<a href="#" onclick="javascript:fn_book_cancel('${book.driveVo.dr_num}','${book.bk_num}','${book.driveVo.dr_depPlandDate}', '${book.driveVo.dr_depPlandTime}');" class="btnL btn_cancel last">예매취소</a>
		</p>
		</c:forEach>

		<ul class="desc_list marT30">
			<li>과거 예매 내역은 승차일 도착시간 전까지, 예매 취소 내역은 과거 3개월까지 조회 가능합니다.</li>
			<li>신용카드 예매 취소 또는 변경 시 일주일 내로 예매했던 카드로 청구 취소 처리가 되면서 반환됩니다.</li>
			<li>모바일앱에서 예매하신 내역의 변경을 원하시면 고속버스 티머니 앱으로 접속하셔서 시도하시기 바랍니다.</li>
			<li>모바일 환경에서는 홈티켓 발행 및 재발행 기능이 지원되지 않으니 PC로 접속하셔서 이용하시기 바랍니다.</li>

			<li>승차권 예매, 취소 안내
				<ul class="dash_list">
					<li>예매한 승차권은 버스 출발 시간 전까지 취소 후 다시 승차권 예매가 가능합니다.</li>
					<li><strong class="accent2">예매한 승차권을 취소하지 않고 출발 시간에서 1시간이 지났을 경우 환불이 불가합니다.</strong></li>
					<li>승차권 예매 및 발권은 차량 좌석이 있는 경우에만 사용이 가능합니다.</li>
				</ul>
			</li>
		</ul>
	</div>
</body>
</html>