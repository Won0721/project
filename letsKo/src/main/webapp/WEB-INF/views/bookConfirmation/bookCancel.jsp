<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.title_wrap {
	background:	url(https://www.kobus.co.kr/images/page/visual_chkTicket_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
</style>
<title>예매 취소</title>

<script type="text/javascript">
	$(document).ready(function() {
		$("#bk_fee").text(numberFormat('${book.bk_fee}') +" 원");
		$("#bk_usePoint").text(numberFormat('${book.bk_usePoint}') +" POINT");
		$("#bk_totalPrice").text(numberFormat('${book.bk_totalPrice}') +" 원");
		
		// 드라이브 날짜를 가져오기
		const driveDate = new Date('${drive.dr_depPlandDate}');
		//const driveDate = new Date('2023-11-18 15:13:00'); // 샘플데이터 
		const bookDate = new Date('${book.bk_date}');
		// 요일을 추출
		const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
		const dayOfWeek = daysOfWeek[driveDate.getDay()]; // 0(일요일)부터 6(토요일)까지의 숫자를 반환
		const dayOfWeek2 = daysOfWeek[bookDate.getDay()]; // 0(일요일)부터 6(토요일)까지의 숫자를 반환
		// 요일을 해당 요소에 설정
		document.getElementById("dayOfWeek").textContent = dayOfWeek;
		document.getElementById("bk_date").textContent = dayOfWeek2;
		
		const cancellationFee = calculateCancellationFee(driveDate);
		const bk_fee = parseInt('${book.bk_fee}');

		// 취소 수수료
		var recallCharge = bk_fee*cancellationFee;
		// 반환 금액
		var ca_refundAmount = bk_fee - recallCharge; 
		var usePoint = parseInt('${book.bk_usePoint}');
		if(ca_refundAmount - usePoint >= 0){
			ca_refundAmount = ca_refundAmount - usePoint;
			$("#ca_refundPoint").text(numberFormat(usePoint)+" POINT");	
			$('input[name=ca_refundPoint]').val(usePoint);
			
		}else if(ca_refundAmount - usePoint < 0){
			usePoint = ca_refundAmount;
			ca_refundAmount = 0;
			$("#ca_refundPoint").text(numberFormat(usePoint)+" POINT");	
			$('input[name=ca_refundPoint]').val(usePoint);
		}
		
		// 취소 수수료
		$('#ca_cancelFee').text(numberFormat(recallCharge)+" 원");
		$('input[name=ca_cancelFee]').val(recallCharge);
		// 반환금액
		$("#ca_refundAmount").text(numberFormat(ca_refundAmount)+" 원");
		$('input[name=ca_refundAmount]').val(ca_refundAmount);
		
	});
	
	function calculateCancellationFee(departureDate) {
	    // 현재 시간을 얻어오기
	    const cancelTime = new Date().getTime();
	    const departureTime = new Date(departureDate).getTime();

	    // 취소 시간과 출발 시간 간의 차이 (밀리초 단위)
	    const timeDifference = departureTime - cancelTime;

	    // 1시간을 밀리초로 환산
	    const oneHourInMillis = 60 * 60 * 1000;

	    // 취소 조건에 따라 수수료 계산
	    if(timeDifference < 0 ){
	    	return 0.1;
	    } else if (timeDifference > oneHourInMillis * 24 * 2 && cancelTime < departureTime) {
	        return 0;
	    } else if (timeDifference <= oneHourInMillis * 1 && cancelTime < departureTime) {
	        return 0.1;
	    } else if (timeDifference <= oneHourInMillis * 24 && cancelTime < departureTime) {
	        return 0.05;
	    } else {
	        return 1;
	    }
	}
	$(document).ready(function(){
		$('form').submit(function() {
		    if (confirm('취소하시겠습니까?')) {
		        return true; 
		    } else {
		        return false; 
		    }
		});
	});
</script>

</head>
<body>
	<form action="<c:url value='/bookConfirmation/bookCancel'/>" method="POST">
		<input type="hidden" name="ca_bk_num" value='${book.bk_num}'/>
		<input type="hidden" name="dr_num" value='${drive.dr_num}'/>
		
		<div class="cont" style="margin: 30px;">
			<div class="box_detail_info">
				<div class="routeHead">
					<p class="date">${drive.dr_depPlandDate}
						(<span id="dayOfWeek"></span>) ${drive.dr_depPlandTime}
					</p>
				</div>
				<div class="routeBody">
					<div class="routeArea route_wrap">
						<div class="inner">
						
							<span class="roundBox departure">${drive.lineVo.li_te_depTerminalId}</span>
							<span class="roundBox arrive">${drive.lineVo.li_te_arrTerminalId}</span>
						</div>
						<div class="detail_info">
							<!-- 예상소요시간 -->
							<span> 
								<c:choose>
									<c:when test="${drive.lineVo.li_travelTime ne null}">
										<c:set var="hours" value="${drive.lineVo.li_travelTime.hour}" />
										<c:set var="minutes"
											value="${drive.lineVo.li_travelTime.minute}" />
										<c:out value="${hours}시간 ${minutes}분 소요" />
									</c:when>
									<c:otherwise>0분</c:otherwise>
								</c:choose>
							</span>
						</div>
					</div>
					<div class="routeArea route_wrap mob_route">
						<div class="tbl_type2">
							<table>
								<colgroup>
									<col style="width: 68px;">
									<col style="width: *;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">고속사</th>
										<td>${drive.busVo.co_name}</td>
									</tr>
									<tr>
										<th scope="row">등급</th>
										<td>${drive.busVo.bus_seatGrade}</td>
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
									<tr>
										<th scope="row">좌석</th>
										<td>${book.bk_reservedSeatNum}</td>
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
							<colgroup>
								<col style="width: 80px;">
								<col style="width: *;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">결제일시</th>

									<td>${book.bk_date} (<span id="bk_date"></span>)</td>

								</tr>
								<tr>
									<th scope="row">결제수단</th>
									<td>카드</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="routeArea route_wrap mob_route">
					<div class="tbl_type3">
						<table class="taR">

							<tbody>
								<tr>
									<th scope="row">예매금액</th>
									<td><span id="bk_fee">${book.bk_fee}</span></td>
								</tr>
								<tr>
									<th scope="row">사용마일리지</th>
									<td><span id="bk_usePoint">${book.bk_usePoint}</span></td>
								</tr>
								<tr>
									<th scope="row">총결제금액</th>
									<td><span id="bk_totalPrice">${book.bk_totalPrice}</span></td>
								</tr>
								<tr>
									<th scope="row" style="border-top: 1px solid #ced4da">취소 수수료(예상)</th>
									<td style="border-top: 1px solid #ced4da"><strong><span id="ca_cancelFee"></span></strong></td>
									<input type="hidden" name="ca_cancelFee" value=0/>
								</tr>
								<tr>
									<th scope="row">반환금액</th>
									<td><strong><span id="ca_refundAmount">얼마</span></strong></td>
									<input type="hidden" name="ca_refundAmount" value=0/>
								</tr>
								<tr>
									<th scope="row">반환 마일리지</th>
									<td><strong><span id="ca_refundPoint">${book.bk_usePoint}</span></strong></td>
									<input type="hidden" name="ca_refundPoint" value=0/>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="mob_pad marT30">
				<h3 class="pop_h3 mob_h3">취소수수료</h3>
				<div class="tbl_type1">
					<table>
						<colgroup>
							<col style="width: 60%;">
							<col style="width: auto">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">취소시기</th>
								<th scope="col">수수료</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>예매 당일 또는 승차일 2일전 취소
								</td>
								<td>없음</td>
							</tr>
							<tr>
								<td>예매 후 출발일 1일 전일부터 지정차 출발 1시간 전 취소
								</td>
								<td>승차권 요금의 5%</td>
							</tr>
							<tr>
								<td>예매 후 지정차 출발 1시간 이내 취소</td>
								<td>승차권 요금의 10%</td>
							</tr>
						</tbody>
					</table>
				</div>
				<ul class="desc_list">
					<li>취소수수료 산정은 날짜를 기준(시간 기준이 아님)으로 합니다.</li>
					<li>사용하지 않은 모든 승차권은 지정차 출발 시간이 지나면 환불하실 수 없습니다.</li>
					<li>마일리지를 사용한 결제건은 사용 마일리지 우선으로 반환됩니다.</li>
					<li>취소 수수료는 취소가 완료되는 시점을 기준으로 발행하니 유의하시기 바랍니다.</li>
					<li>신용(체크)카드 환불은 카드사 정책에 따라 평일(은행영업일)기준 3~5일 소요될 수 있습니다.</li>
				</ul>
			</div>
		</div>
		<div class="btns col1">
			<button class="btnL btn_orange">예매취소</button>
		</div>
	</form>
</body>
</html>