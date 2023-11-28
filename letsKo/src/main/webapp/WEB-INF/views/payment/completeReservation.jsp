<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_route_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
</style>
<title>예매/확인/취소</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#bk_fee").text(numberFormat('${bookDB.bk_fee}') +" 원");
		$("#bk_usePoint").text(numberFormat('${bookDB.bk_usePoint}') +" POINT");
		$("#bk_totalPrice").text(numberFormat('${bookDB.bk_totalPrice}') +" 원");
		
		// 드라이브 날짜를 가져오기
		const driveDate = new Date('${drive.dr_depPlandDate}');
		const bookDate = new Date('${bookDB.bk_date}');
		// 요일을 추출
		const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
		const dayOfWeek = daysOfWeek[driveDate.getDay()]; // 0(일요일)부터 6(토요일)까지의 숫자를 반환
		const dayOfWeek2 = daysOfWeek[bookDate.getDay()]; // 0(일요일)부터 6(토요일)까지의 숫자를 반환
		// 요일을 해당 요소에 설정
		document.getElementById("dayOfWeek").textContent = dayOfWeek;
		document.getElementById("bk_date").textContent = dayOfWeek2;
	});
</script>
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
	                    <p class="label">고속버스 예매</p>
	                  <b class="button">▾</b>
	                 </a>
	               <div class="selectricItems infor" tabindex="-1" >
	                  <div class="selectricScroll">
	                     <ul>
	                        <li class=""><a class ="link-item" href="<c:url value='#'/>">고속버스 예매</a></li>
	                        <li class="selected"><a class ="link-item" href="<c:url value='#'/>">예매확인</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='#'/>">운행정보</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='#'/>">이용안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/board/boardList'/>">공지사항</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='#'/>">고객센터</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='#'/>">전국고속버스운송사업조합</a></li>
	                        <li class="last"><a class ="link-item" href="<c:url value='#'/>">터미널사업자협회</a></li>
	                     </ul>
	                  </div>
	               </div>
	               <input class="selectricInput" tabindex="0">
	            </div>
	         </div>
	      </li>
	   </ul>
	</div>

	<form action="<c:url value='/payment/CompleteReservation}'/>" method="GET">
		<div class="page ticket_finish depth3">
			<h3 class="hidden">예매완료</h3>
			<div class="noti_wrap N">
				<p class="noti" id="noticeMsgNm">
				<span class="accent">고속버스 티켓</span> 예매가 <span>완료되었습니다.</span>
				</p>
				<p class="desc" id="noticeDtlMsgNm">고속버스 모바일앱의 <strong>예매확인</strong><span>메뉴에서 승차권 확인이 가능합니다.</span>
				</p>
			</div>
		
			<div class="box_detail_info">
				<div class="routeHead">
					<p class="date">${drive.dr_depPlandDate} <span id="dayOfWeek"></span> ${drive.dr_depPlandTime} 출발</p>
					<p class="ticket_number">
						예매번호<span class="num">${bookDB.bk_num}</span>
					</p>
				</div>
				<div class="routeBody">
					<div class="routeArea route_wrap">
						<div class="inner">
							<span class="roundBox departure">${drive.lineVo.li_te_depTerminalId}</span>
							<span class="roundBox arrive">${drive.lineVo.li_te_arrTerminalId}</span>
						</div>
						<div class="detail_info">
							<span id="takeDrtm"> 
								<c:choose>
							        <c:when test="${drive.lineVo.li_travelTime ne null}">
							            <c:set var="hours" value="${drive.lineVo.li_travelTime.hour}" />
							            <c:set var="minutes" value="${drive.lineVo.li_travelTime.minute}" />
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
									<col style="width:68px;">
									<col style="width:*;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">고속사</th>
										<td>${drive.busVo.co_name}</span></td>
									</tr>
									<tr>
										<th scope="row">등급</th>
										<td>${drive.busVo.bus_seatGrade}</td>
									</tr>
									<tr>
										<th scope="row">매수</th>
										<td>
											<c:if test="${bookDB.bk_adult > 0}">
												<span id="">성인 ${bookDB.bk_adult}명 </span>
											</c:if>
											<c:if test="${bookDB.bk_adult > 0 && bookDB.bk_teen > 0}">
												,
											</c:if>
											<c:if test="${bookDB.bk_teen > 0}">
												<span id="">청소년 ${bookDB.bk_teen}명</span>
											</c:if>
										</td>
									</tr>
									<tr>
										<th scope="row">좌석</th>
										<td>${bookDB.bk_reservedSeatNum}번</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
	
			<div class="box_detail_info bgGray">
				
					<div class="routeArea route_wrap mob_route">
						<div class="tbl_type3">
							<table>
								<caption>
									<strong>결제정보</strong>
									<p>결제일시, 결제수단에 대한 정보 제공</p>
								</caption>
								<colgroup>
									<col style="width:80px;">
									<col style="width:*;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">결제일시</th>
										<td>${bookDB.bk_date} (<span id="bk_date"></span>)</td>
									</tr>
									<tr>
										<th scope="row">결제수단</th>
										<td>신용카드</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="routeArea route_wrap mob_route">
						<div class="tbl_type3">
							<table class="taR">
								<caption>
									<strong>결제금액 정보</strong>
									<p>예매금액, 사전할인, 결제금액, 적립예정마일리지에 대한 정보 제공</p>
								</caption>
								<colgroup>
									<col style="width:50%;">
									<col style="width:*;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">예매금액</th>
										<td><strong><span id="bk_fee" style="font-weight:normal;">${bookDB.bk_fee}</span></strong></td>
									</tr>
									<tr>
										<th scope="row">사용마일리지</th>
										<td><strong><span id="bk_usePoint" style="font-weight:normal;">${bookDB.bk_usePoint}</span></td>
									</tr>
									<tr>
										<th scope="row">총결제금액</th>
										<td><strong><span id="bk_totalPrice">${bookDB.bk_totalPrice}</span></strong></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
			</div>
			
			
			<div class="section">
				<ul class="desc_list">
					<li>학생 정기권 이용 고객님은 차량 탑승 시 학생 신분증(학생증, 청소년증, 대학생증등)을 필히 지참하시기 바랍니다.</li> 
					<li>예매하신 승차권의 터미널 발권 시에는 <strong class="txt_puple">반드시 예매에 사용하신 신용카드를 지참</strong>하셔야 하며, 해당 터미널 매표현장에 제시하신 후 예매된 사항이 있다고 말씀하시면 예매하신 승차권을 발권해 드립니다.</li> 
					<li>모바일티켓 발권 혹은 홈티켓으로 발권 하시면 터미널에서 따로 발권하지 않으셔도 승차 가능합니다.</li>
					<li>E-Pass 단말기가 부착된 고속버스에서 단말기에 예매 시 사용한 카드(교통카드 기능이 있는 신용카드만 해당)를 태그하시면 영수증과 승차권을 한번에 발권하실 수 있습니다.</li>
					<li>모바일티켓으로 회원 예매하신 내역은 <strong class="txt_puple">고속버스 티머니 앱</strong>에서도 조회하실 수 있습니다.</li> 
					<li>모바일티켓 발권시 별도의 승차권 발급없이 바로 탑승 하실수 있습니다.</li>
					<li>홈티켓 발행시 PC화면을 휴대폰으로 사진 촬영한 승차권은 효력이 없습니다.</li>
					<li>예매사항을 확인하시려면 상단의 <strong class="txt_puple">예매확인/취소/변경</strong> 메뉴를 클릭하세요.</li> 
					<li>마일리지 승차권은 예매취소는 가능하나 시간변경은 불가합니다.</li>						
					<li>마일리지 승차권 취소 시, 마일리지 수수료 정책에 따라 처리됩니다.
						<ul class="dash_list">
							<li>출발 시간 이전 취소 시 100% 마일리지 환급</li>
							<li>출발 시간 이후 취소 시 100% 마일리지 차감</li>
						</ul>
					</li>
					<li>고속버스 정기권을 이용한 승차권 예매, 취소 안내
						<ul class="dash_list">
							<li>정기권으로 예매한 승차권은 버스 출발 시간 전까지 취소 후 다시 승차권 예매가 가능합니다.</li> 
							<li><strong class="accent2">정기권으로 예매한 승차권을 취소하지 않고 출발 시간이 지났을 경우 해당일의 동일 방향(편도) 재이용이 불가합니다.</strong></li>
							<li>정기권을 이용한 승차권 예매 및 발권은 차량 좌석이 있는 경우에만 사용이 가능합니다.</li>
						</ul>
					</li>
				</ul>
			</div>
			<p class="btns col1" id="mrsInqrTissu">

				<a href="/bookConfirmation/bookConfirmation" class="btnL btn_cancel">예매 확인</a>

			</p>
		</div>
	</form>
</body>
</html>