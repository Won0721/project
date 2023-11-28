<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_route_bg.jpg)
		center 0 no-repeat;
	background-size: cover;
}
</style>
<script type="text/javascript">
	function validationCnt(){
		var adltCntElement = document.getElementById("adltCnt");
		var chldCntElement = document.getElementById("chldCnt");

		var adltCnt = parseInt(adltCntElement.textContent);
		var chldCnt = parseInt(chldCntElement.textContent);
		var totalSeatCnt = parseInt('${drive.dr_reservationAvailable}');
		
		if((adltCnt + chldCnt + 1) > totalSeatCnt){
			return false;
		}
		return true;
	}
	
	// +버튼 클릭: 성인 1 증가 
	function adltAdd(){
		var adltCntElement = document.getElementById("adltCnt");

		// 요소에서 현재 카운트를 가져와 숫자로 변환
		var currentCount = parseInt(adltCntElement.textContent);
		
		// 카운트를 1 증가
		currentCount++;
		
		// 일반 + 청소년 합이 총좌석수가 넘지 않는지 체크 
		if(!validationCnt()){
			alert('좌석이 모자랍니다.');
			return false;
		}
		
		// 요소의 텍스트 내용을 새로운 카운트로 업데이트
		adltCntElement.textContent = currentCount;
		
		 // 동시에 adltSeatCnt 업데이트
	    var adltSeatCntElement = document.getElementById("adltSeatCnt");
	    adltSeatCntElement.textContent = currentCount;
	    $('input[name=adltSeatCnt]').val(currentCount);
	    
		// 'adltSeatCnt'의 값을 가져옴
        var adltSeatCntValue = parseInt(adltSeatCntElement.textContent);

        // 24600을 곱합니다.
        var adultPrice = document.getElementById("price").value;
        var totalPrice = adltSeatCntValue * adultPrice;

        // 결과를 'adltTotAmt'에 적용
        var adltTotAmtElement = document.getElementById("adltTotAmt");
        adltTotAmtElement.textContent = numberFormat(totalPrice) + "원";
        // 총결제금액 업데이트 
        updateTotalPrice();
	    
	}
	// -버튼 클릭: 성인 1 감소 
	function adltMinus() {
		var adltCntElement = document.getElementById("adltCnt");
		var chldCntElement = document.getElementById("chldCnt");
		var adltCount = parseInt(adltCntElement.textContent);
		var chldCount = parseInt(chldCntElement.textContent);
		
		// 클릭된 좌석 수 구하기
		var selectedSeatCount = document.querySelectorAll("input[name='seatBoxDtl']:checked").length;
		
		// 일반 좌석 수가 0 이상이고 청소년 좌석 수와 클릭된 좌석 수가 같거나 작을 때만 -버튼 동작
		if (adltCount > 0 && (adltCount + chldCount >= selectedSeatCount)) {
			adltCount--;
			adltCntElement.textContent = adltCount;
		  
			// 관련 좌석 수를 업데이트
	        var adltSeatCntElement = document.getElementById("adltSeatCnt");
	        adltSeatCntElement.textContent = adltCount;
		} else {
		  alert('매수를 먼저 선택해 주세요.');
		}
		// 'adltSeatCnt'의 값을 가져옴
	    var adltSeatCntElement = document.getElementById("adltSeatCnt");
	    var adltSeatCntValue = parseInt(adltSeatCntElement.textContent);
	    $('input[name=adltSeatCnt]').val(adltSeatCntValue);
	    
	    // 24600을 곱합니다.
	    var totalPrice = adltSeatCntValue * 24600;

	    // 결과를 'adltTotAmt'에 적용
	    var adltTotAmtElement = document.getElementById("adltTotAmt");
	    adltTotAmtElement.textContent = numberFormat(totalPrice) + "원";
	 	// 총 결제금액 업데이트
	    updateTotalPrice();
	}
	
	// +버튼 클릭: 청소년 1 증가 
	function chldAdd(){
		var chldCntElement = document.getElementById("chldCnt");
		var currentCount = parseInt(chldCntElement.textContent);
		currentCount++;
		
		// 일반 + 청소년 합이 총좌석수가 넘지 않는지 체크 
		if(!validationCnt()){
			alert('좌석이 모자랍니다.');
			return false;
		}
		chldCntElement.textContent = currentCount;
		
		// 동시에 chldSeatCnt 업데이트
	    var chldSeatCntElement = document.getElementById("chldSeatCnt");
	    chldSeatCntElement.textContent = currentCount;
	    $('input[name=chldSeatCnt]').val(currentCount);
	    
		// 'chldSeatCnt'의 값을 가져옴
        var chldSeatCntValue = parseInt(chldSeatCntElement.textContent);

        // 21000을 곱합니다.
        var childPrice = document.getElementById("price").value * 0.8;
        var totalPrice = chldSeatCntValue * childPrice;

        // 결과를 'chldtTotAmt'에 적용
        var chldTotAmtElement = document.getElementById("chldTotAmt");
        chldTotAmtElement.textContent = numberFormat(totalPrice) + "원";
     	// 총 결제금액 업데이트	
        updateTotalPrice();
		
	}
	// -버튼 클릭: 청소년 1 감소 
	function chldMinus() {
		var adltCntElement = document.getElementById("adltCnt");
		var chldCntElement = document.getElementById("chldCnt");
		var adltCount = parseInt(adltCntElement.textContent);
		var chldCount = parseInt(chldCntElement.textContent);
	
		// 클릭된 좌석 수 구하기
		var selectedSeatCount = document.querySelectorAll("input[name='seatBoxDtl']:checked").length;
		
		// 청소년 좌석 수가 0 이상이고 일반 좌석 수와 클릭된 좌석 수가 같거나 작을 때만 -버튼 동작
		if (chldCount > 0 && (adltCount + chldCount >= selectedSeatCount)) {
		    chldCount--;
		    chldCntElement.textContent = chldCount;
		    
			// 관련 좌석 수를 업데이트
	        var chldSeatCntElement = document.getElementById("chldSeatCnt");
	        chldSeatCntElement.textContent = chldCount;
		} else {
		  alert('매수를 먼저 선택해 주세요.');
		}
		// 'chldSeatCnt'의 값을 가져옴
	    var chldSeatCntElement = document.getElementById("chldSeatCnt");
	    var chldSeatCntValue = parseInt(chldSeatCntElement.textContent);
	    $('input[name=chldSeatCnt]').val(chldSeatCntValue);
	    
	    // 21000을 곱합니다.
	    var totalPrice = chldSeatCntValue * 21000;

	    // 결과를 'chldTotAmt'에 적용
	    var chldTotAmtElement = document.getElementById("chldTotAmt");
	    chldTotAmtElement.textContent = numberFormat(totalPrice) + "원";
	 	// 총 결제금액 업데이트
	    updateTotalPrice();
	}
	
	function fnSeatChc(seatCheckbox, seatId) {
		// 선택된 좌석 수를 계산
		var selectedSeatCount = document.querySelectorAll("input[name='seatBoxDtl']:checked").length;
		
		// 현재 일반 및 청소년 좌석 수
		var adltCntElement = document.getElementById("adltCnt");
		var chldCntElement = document.getElementById("chldCnt");
		var currentAdltCount = parseInt(adltCntElement.textContent);
		var currentChldCount = parseInt(chldCntElement.textContent);
		
		// 만약 일반 좌석과 청소년 좌석의 합이 선택된 좌석 수보다 작으면 알림을 띄우기
		if (currentAdltCount + currentChldCount < selectedSeatCount) {
		  alert('매수를 먼저 선택해 주세요.');
		  // 선택을 해제
		  seatCheckbox.checked = false;
		}
		
		// 선택한 좌석 텍스트 업데이트
	    var selectedSeats = [];
	    var selectedSeatCheckboxes = document.querySelectorAll("input[name='seatBoxDtl']:checked");
	    
	    for (var i = 0; i < selectedSeatCheckboxes.length; i++) {
	        var seatNum = selectedSeatCheckboxes[i].value;
	        selectedSeats.push(seatNum);
	    }

	    // 'selectedSeatNum' ID를 가진 요소의 텍스트를 업데이트
	    var selectedSeatNumElement = document.getElementById("selectedSeatNum");
	    selectedSeatNumElement.textContent = selectedSeats.join(", ") + "번";
	    
	    // 'selectedSeatNum'을 name에 넣음 
	    $("input[name=selectedSeatNum]").val(selectedSeats.join(","));
	}
	
	// 총 결제금액 업데이트 
	function updateTotalPrice() {
	    var adltTotAmtElement = document.getElementById("adltTotAmt");
	    var chldTotAmtElement = document.getElementById("chldTotAmt");
	    var dayMrsDcElement = document.getElementById("dayMrsDc");
	    var allTotAmtLocD = document.getElementById("allTotAmtLocD");

	    var adltTotAmt = parseInt(adltTotAmtElement.textContent.replace(/[^0-9]/g, ''));
	    var chldTotAmt = parseInt(chldTotAmtElement.textContent.replace(/[^0-9]/g, ''));

	    var estimatedAmount = adltTotAmt + chldTotAmt 

	    allTotAmtLocD.textContent = numberFormat(estimatedAmount) + "원";
	    
	    
	    $("input[name=estimatedAmount]").val(estimatedAmount);
	}
	
	// 새로고침 버튼 
	function fnReload() {
		// 모든 값을 기본 값으로 재설정
		var adltCntElement = document.getElementById("adltCnt");
		adltCntElement.textContent = "0";
		
		var chldCntElement = document.getElementById("chldCnt");
		chldCntElement.textContent = "0";
		
		var adltSeatCntElement = document.getElementById("adltSeatCnt");
		adltSeatCntElement.textContent = "0";
		
		var chldSeatCntElement = document.getElementById("chldSeatCnt");
		chldSeatCntElement.textContent = "0";
		
		var selectedSeatNumElement = document.getElementById("selectedSeatNum");
		selectedSeatNumElement.textContent = "좌석을 선택해주세요";
		
		var adltTotAmtElement = document.getElementById("adltTotAmt");
		adltTotAmtElement.textContent = "0원";
		
		var chldTotAmtElement = document.getElementById("chldTotAmt");
		chldTotAmtElement.textContent = "0원";
		
		var allTotAmtLocD = document.getElementById("allTotAmtLocD");
		allTotAmtLocD.textContent = "0원";
		
		// 좌석 선택 체크박스 초기화
		var seatCheckboxes = document.querySelectorAll("input[name='seatBoxDtl']");
		seatCheckboxes.forEach(function(checkbox) {
		  checkbox.checked = false;
		});
	}
	
	// 요일 메이커
	// 페이지가 로드될 때 스크립트 실행
	window.addEventListener('load', function() {
	// 드라이브 날짜를 가져오기
	const driveDate = new Date('${drive.dr_depPlandDate}');
	// 요일을 추출
	const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
	const dayOfWeek = daysOfWeek[driveDate.getDay()]; // 0(일요일)부터 6(토요일)까지의 숫자를 반환
	// 요일을 해당 요소에 설정
	document.getElementById("dayOfWeek").textContent = dayOfWeek;
	});
	

	$(document).ready(function(){
		$('form').submit(function(){
			var adltCntElement = document.getElementById("adltCnt");
		    var adltSeatCntElement = document.getElementById("adltSeatCnt");
		    var chldCntElement = document.getElementById("chldCnt");
		    var chldSeatCntElement = document.getElementById("chldSeatCnt");
		    var selectedSeatNumElement = document.getElementById("selectedSeatNum");
		
		    var adltCount = parseInt(adltCntElement.textContent);
		    var adltSeatCount = parseInt(adltSeatCntElement.textContent);
		    var chldCount = parseInt(chldCntElement.textContent);
		    var chldSeatCount = parseInt(chldSeatCntElement.textContent);
		    var selectedSeatCount = document.querySelectorAll("input[name='seatBoxDtl']:checked").length;
		
		    if (adltCount == adltSeatCount && chldCount == chldSeatCount && adltCount + chldCount == selectedSeatCount) {
		    } else {
		        alert('매수 및 좌석수를 확인해주세요.');
		        return false;
		    }
	    });	
	});
	
	$(document).ready(function(){
		var seatArray = '${seatArray}';
		var seat = seatArray.split(",");
	
		for (var i = 0; i < seat.length; i++) {
		    var num = seat[i];
		    
		    // 숫자로 변환
		    var parsedNum = parseInt(num);
	
		    // 10 미만의 경우 앞에 0을 추가
		    if (parsedNum < 10) {
		        num = "0" + parsedNum;
		    }
	
		    var grade = "41";

		    if ("${drive.busVo.bus_seatGrade}" === "일반") {
		        grade = "41";
		    } else if ("${drive.busVo.bus_seatGrade}" === "우등") {
		        grade = "28";
		    } else if ("${drive.busVo.bus_seatGrade}" === "프리미엄") {
		        grade = "21";
		    } 
		    
		    // 해당 ID의 요소를 선택하고 disabled 속성을 true로 설정
		    $("#seatNum_"+grade+"_" + num).prop("disabled", true);
		    $("#seatNum_"+grade+"_" + num).parent().addClass("disabled");
		}
	})
	
</script>
<title>매수 및 좌석선택</title>
</head>
<body>
	<form action="<c:url value='/payment/inputPaymentInfoView'/>" method="post">
	<input type="hidden" name="dr_num" value="${drive.dr_num}">
		<div class="page" id="seatChcPage">
			<h3>매수 및 좌석선택</h3>
			<div class="selectSeat_wrap">
				<!-- compareBox -->
				<div class="compare_wrap">
				
					<!-- 좌측 infoBox -->
					<div class="infoBox">
						<p class="date" id="satsDeprDtm">${drive.dr_depPlandDate} <span id="dayOfWeek"></span></p> 
						<div class="route_wrap" id="satsRotInfo">
							<div class="inner">
								<!-- 출발지 -->
								<p class="roundBox departure" id="satsDeprTmlNm">${drive.lineVo.li_te_depTerminalId}</p>
								<!-- 도착지 -->
								<p class="roundBox arrive" id="satsArvlTmlNm">${drive.lineVo.li_te_arrTerminalId}</p>
							</div>
							<div class="detail_info">
								<span id="satsTakeDrtm">
									<c:choose>
								        <c:when test="${drive.lineVo.li_travelTime ne null}">
								            <c:set var="hours" value="${drive.lineVo.li_travelTime.hour}" />
								            <c:set var="minutes" value="${drive.lineVo.li_travelTime.minute}" />
								            <c:out value="${hours}시간 ${minutes}분 소요"/>
								        </c:when>
								        <c:otherwise>0분</c:otherwise>
						    		</c:choose>
								</span> 
								<span id="satsDist">${drive.lineVo.li_distance}Km</span>
							</div>
							<div class="btn_r">
								<a href="book/bookSearch" class="btn btn_modify white" onclick="fnUpdRot();">수정</a>
							</div>
						</div>
					</div>
					<!-- //좌측 infoBox -->

					<!-- 우측 detailBox -->
					<div class="detailBox">
						
						<div class="detailBox_head" style="height: 66px;">
							<div class="box_refresh">
								<button type="button" class="btn btn_refresh" onclick="fnReload();">
									<span class="ico_refresh">새로고침</span>
								</button>
							</div>
							<div class="count_seat">
								<div class="inner">
									<div class="box_count">
										<span class="count_num">잔여 ${drive.dr_reservationAvailable}석 / 전체 ${drive.busVo.bus_totalSeat}석</span> 
										<span class="count_desc"> 
											<span class="ico_square orange">여성/노약자 우선</span> 
										</span>
									</div>
								</div>`
							</div>
						</div>
						
						<!-- 매수선택 -->
						<div class="detailBox_body">
							<div class="ticketBox ">
								<ul class="sel_list">
									<li>
										<div class="countBox">
											<p class="division">
												<em>성인</em>	<span class="text_num count" id="adltCnt">0</span>
											</p>
											<div class="btn_wrap">
												<ul>
													<li>
														<button type="button" class="btn btn_add" onclick="adltAdd();">
															<span class="ico_plus">증가</span>
														</button>
													</li>
													<li>
														<button type="button" class="btn btn_minus" onclick="adltMinus();">
															<span class="ico_minus">감소</span>
														</button>
													</li>
												</ul>
											</div>
										</div>
									</li>
									<li>
										<div class="countBox">
											<p class="division">
												<em>청소년</em><span class="text_num count" id="chldCnt">0</span>
											</p>
											<div class="btn_wrap">
												<ul>
													<li>
														<button type="button" class="btn btn_add" onclick="chldAdd();">
															<span class="ico_plus">증가</span>
														</button>
													</li>
													<li>
														<button type="button" class="btn btn_minus" onclick="chldMinus();">
															<span class="ico_minus">감소</span>
														</button>
													</li>
												</ul>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<!-- //매수선택 -->
							
							<!--일반 좌석선택 -->
							<!-- 41석 클래스 seat41 -->
							<c:if test='${drive.busVo.bus_seatGrade eq "일반"}'>
							<div class="selectSeat_box">
								<div class="bg_seatBox seat41" style="display: block;">
									<div class="seatList">
										<span class="seatBox"> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_01" value="1" onclick="fnSeatChc(this, 'seatNum_41_01');"> 
											<label for="seatNum_41_01">1</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_02" value="2" onclick="fnSeatChc(this, 'seatNum_41_02');"> 
											<label for="seatNum_41_02">2</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_03" value="3" onclick="fnSeatChc(this, 'seatNum_41_03');"> 
											<label for="seatNum_41_03">3</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_04" value="4" onclick="fnSeatChc(this, 'seatNum_41_04');"> 
											<label for="seatNum_41_04">4</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_05" value="5" onclick="fnSeatChc(this, 'seatNum_41_05');"> 
											<label for="seatNum_41_05">5</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_06" value="6" onclick="fnSeatChc(this, 'seatNum_41_06');"> 
											<label for="seatNum_41_06">6</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_07" value="7" onclick="fnSeatChc(this, 'seatNum_41_07');"> 
											<label for="seatNum_41_07">7</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_08" value="8" onclick="fnSeatChc(this, 'seatNum_41_08');"> 
											<label for="seatNum_41_08">8</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_09" value="9" onclick="fnSeatChc(this, 'seatNum_41_09');"> 
											<label for="seatNum_41_09">9</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_10" value="10" onclick="fnSeatChc(this, 'seatNum_41_10');"> 
											<label for="seatNum_41_10">10</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_11" value="11" onclick="fnSeatChc(this, 'seatNum_41_11');"> 
											<label for="seatNum_41_11">11</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_12" value="12" onclick="fnSeatChc(this, 'seatNum_41_12');"> 
											<label for="seatNum_41_12">12</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_13" value="13" onclick="fnSeatChc(this, 'seatNum_41_13');"> 
											<label for="seatNum_41_13">13</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_14" value="14" onclick="fnSeatChc(this, 'seatNum_41_14');"> 
											<label for="seatNum_41_14">14</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_15" value="15" onclick="fnSeatChc(this, 'seatNum_41_15');"> 
											<label for="seatNum_41_15">15</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_16" value="16" onclick="fnSeatChc(this, 'seatNum_41_16');"> 
											<label for="seatNum_41_16">16</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_17" value="17" onclick="fnSeatChc(this, 'seatNum_41_17');"> 
											<label for="seatNum_41_17">17</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_18" value="18" onclick="fnSeatChc(this, 'seatNum_41_18');"> 
											<label for="seatNum_41_18">18</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_19" value="19" onclick="fnSeatChc(this, 'seatNum_41_19');"> 
											<label for="seatNum_41_19">19</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_20" value="20" onclick="fnSeatChc(this, 'seatNum_41_20');"> 
											<label for="seatNum_41_20">20</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_21" value="21" onclick="fnSeatChc(this, 'seatNum_41_21');"> 
											<label for="seatNum_41_21">21</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_22" value="22" onclick="fnSeatChc(this, 'seatNum_41_22');"> 
											<label for="seatNum_41_22">22</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_23" value="23" onclick="fnSeatChc(this, 'seatNum_41_23');"> 
											<label for="seatNum_41_23">23</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_24" value="24" onclick="fnSeatChc(this, 'seatNum_41_24');"> 
											<label for="seatNum_41_24">24</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_25" value="25" onclick="fnSeatChc(this, 'seatNum_41_25');"> 
											<label for="seatNum_41_25">25</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_26" value="26" onclick="fnSeatChc(this, 'seatNum_41_26');"> 
											<label for="seatNum_41_26">26</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_27" value="27" onclick="fnSeatChc(this, 'seatNum_41_27');"> 
											<label for="seatNum_41_27">27</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_28" value="28" onclick="fnSeatChc(this, 'seatNum_41_28');"> 
											<label for="seatNum_41_28">28</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_29" value="29" onclick="fnSeatChc(this, 'seatNum_41_29');">  
											<label for="seatNum_41_29">29</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_30" value="30" onclick="fnSeatChc(this, 'seatNum_41_30');"> 
											<label for="seatNum_41_30">30</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_31" value="31" onclick="fnSeatChc(this, 'seatNum_41_31');"> 
											<label for="seatNum_41_31">31</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_32" value="32" onclick="fnSeatChc(this, 'seatNum_41_32');"> 
											<label for="seatNum_41_32">32</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_33" value="33" onclick="fnSeatChc(this, 'seatNum_41_33');"> 
											<label for="seatNum_41_33">33</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_34" value="34" onclick="fnSeatChc(this, 'seatNum_41_34');"> 
											<label for="seatNum_41_34">34</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_35" value="35" onclick="fnSeatChc(this, 'seatNum_41_35');"> 
											<label for="seatNum_41_35">35</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_36" value="36" onclick="fnSeatChc(this, 'seatNum_41_36');"> 
											<label for="seatNum_41_36">36</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_37" value="37" onclick="fnSeatChc(this, 'seatNum_41_37');"> 
											<label for="seatNum_41_37">37</label>
										</span> 
										<span class="seatBox last_seat "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_38" value="38" onclick="fnSeatChc(this, 'seatNum_41_38');">
											<label for="seatNum_41_38">38</label>
										</span> 
										<span class="seatBox last_seat "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_39" value="39" onclick="fnSeatChc(this, 'seatNum_41_39');">
											<label for="seatNum_41_39">39</label>
										</span> 
										<span class="seatBox last_seat "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_40" value="40" onclick="fnSeatChc(this, 'seatNum_41_40');">
											<label for="seatNum_41_40">40</label>
										</span> 
										<span class="seatBox last_seat last "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_41_41" value="41" onclick="fnSeatChc(this, 'seatNum_41_41');">
											<label for="seatNum_41_41">41</label>
										</span>
									</div>
								</div>
							</div>
							</c:if>
							<!-- //일반 좌석선택 -->
							
							<!--우등 좌석선택 -->
							<!-- 28석 클래스 seat28 -->
							<c:if test='${drive.busVo.bus_seatGrade eq "우등"}'>
							<div class="selectSeat_box">
								<div class="bg_seatBox seat28 " style="display: block;">
									<div class="seatList">
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_01" value="1" onclick="fnSeatChc(this, 'seatNum_28_01');"> 
											<label for="seatNum_28_01">1</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_02" value="2" onclick="fnSeatChc(this, 'seatNum_28_02');"> 
											<label for="seatNum_28_02">2</label>
										</span> 
											<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_03" value="3" onclick="fnSeatChc(this, 'seatNum_28_03');"> 
											<label for="seatNum_28_03">3</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_04" value="4" onclick="fnSeatChc(this, 'seatNum_28_04');"> 
											<label for="seatNum_28_04">4</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_05" value="5" onclick="fnSeatChc(this, 'seatNum_28_05');"> 
											<label for="seatNum_28_05">5</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_06" value="6" onclick="fnSeatChc(this, 'seatNum_28_06');"> 
											<label for="seatNum_28_06">6</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_07" value="7" onclick="fnSeatChc(this, 'seatNum_28_07');"> 
											<label for="seatNum_28_07">7</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_08" value="8" onclick="fnSeatChc(this, 'seatNum_28_08');"> 
											<label for="seatNum_28_08">8</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_09" value="9" onclick="fnSeatChc(this, 'seatNum_28_09');"> 
											<label for="seatNum_28_09">9</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_10" value="10" onclick="fnSeatChc(this, 'seatNum_28_10');"> 
											<label for="seatNum_28_10">10</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_11" value="11" onclick="fnSeatChc(this, 'seatNum_28_11');"> 
											<label for="seatNum_28_11">11</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_12" value="12" onclick="fnSeatChc(this, 'seatNum_28_12');"> 
											<label for="seatNum_28_12">12</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_13" value="13" onclick="fnSeatChc(this, 'seatNum_28_13');"> 
											<label for="seatNum_28_13">13</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_14" value="14" onclick="fnSeatChc(this, 'seatNum_28_14');"> 
											<label for="seatNum_28_14">14</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_15" value="15" onclick="fnSeatChc(this, 'seatNum_28_15');"> 
											<label for="seatNum_28_15">15</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_16" value="16" onclick="fnSeatChc(this, 'seatNum_28_16');"> 
											<label for="seatNum_28_16">16</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_17" value="17" onclick="fnSeatChc(this, 'seatNum_28_17');"> 
											<label for="seatNum_28_17">17</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_18" value="18" onclick="fnSeatChc(this, 'seatNum_28_18');"> 
											<label for="seatNum_28_18">18</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_19" value="19" onclick="fnSeatChc(this, 'seatNum_28_19');"> 
											<label for="seatNum_28_19">19</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_20" value="20" onclick="fnSeatChc(this, 'seatNum_28_20');"> 
											<label for="seatNum_28_20">20</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_21" value="21" onclick="fnSeatChc(this, 'seatNum_28_21');"> 
											<label for="seatNum_28_21">21</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_22" value="22" onclick="fnSeatChc(this, 'seatNum_28_22');"> 
											<label for="seatNum_28_22">22</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_23" value="23" onclick="fnSeatChc(this, 'seatNum_28_23');"> 
											<label for="seatNum_28_23">23</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_24" value="24" onclick="fnSeatChc(this, 'seatNum_28_24');"> 
											<label for="seatNum_28_24">24</label>
										</span> 
										<span class="seatBox last_seat "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_25" value="25" onclick="fnSeatChc(this, 'seatNum_28_25');">
											<label for="seatNum_28_25">25</label>
										</span> 
										<span class="seatBox last_seat "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_26" value="26" onclick="fnSeatChc(this, 'seatNum_28_26');">
											<label for="seatNum_28_26">26</label>
										</span> 
										<span class="seatBox last_seat "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_27" value="27" onclick="fnSeatChc(this, 'seatNum_28_27');">
											<label for="seatNum_28_27">27</label>
										</span> 
										<span class="seatBox last_seat last "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_28_28" value="28" onclick="fnSeatChc(this, 'seatNum_28_28');">
											<label for="seatNum_28_28">28</label>
										</span>
									</div>
								</div>
							</div>
							</c:if>
							<!-- //우등 좌석선택 -->
							
							<!-- 프리미엄 좌석선택 -->
							<!-- 21석 클래스 seat21 -->
							<c:if test='${drive.busVo.bus_seatGrade eq "프리미엄"}'>
							<div class="selectSeat_box">
								<div class="bg_seatBox seat21" style="display: block;">
									<div class="seatList">
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_01" value="1" onclick="fnSeatChc(this, 'seatNum_21_01');"> 
											<label for="seatNum_21_01">1</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_02" value="2" onclick="fnSeatChc(this, 'seatNum_21_02');"> 
											<label for="seatNum_21_02">2</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_03" value="3" onclick="fnSeatChc(this, 'seatNum_21_03');"> 
											<label for="seatNum_21_03">3</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_04" value="4" onclick="fnSeatChc(this, 'seatNum_21_04');"> 
											<label for="seatNum_21_04">4</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_05" value="5" onclick="fnSeatChc(this, 'seatNum_21_05');"> 
											<label for="seatNum_21_05">5</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_06" value="6" onclick="fnSeatChc(this, 'seatNum_21_06');"> 
											<label for="seatNum_21_06">6</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_07" value="7" onclick="fnSeatChc(this, 'seatNum_21_07');"> 
											<label for="seatNum_21_07">7</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_08" value="8" onclick="fnSeatChc(this, 'seatNum_21_08');"> 
											<label for="seatNum_21_08">8</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_09" value="9" onclick="fnSeatChc(this, 'seatNum_21_09');"> 
											<label for="seatNum_21_09">9</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_10" value="10" onclick="fnSeatChc(this, 'seatNum_21_10');"> 
											<label for="seatNum_21_10">10</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_11" value="11" onclick="fnSeatChc(this, 'seatNum_21_11');"> 
											<label for="seatNum_21_11">11</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_12" value="12" onclick="fnSeatChc(this, 'seatNum_21_12');"> 
											<label for="seatNum_21_12">12</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_13" value="13" onclick="fnSeatChc(this, 'seatNum_21_13');"> 
											<label for="seatNum_21_13">13</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_14" value="14" onclick="fnSeatChc(this, 'seatNum_21_14');"> 
											<label for="seatNum_21_14">14</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_15" value="15" onclick="fnSeatChc(this, 'seatNum_21_15');"> 
											<label for="seatNum_21_15">15</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_16" value="16" onclick="fnSeatChc(this, 'seatNum_21_16');"> 
											<label for="seatNum_21_16">16</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_17" value="17" onclick="fnSeatChc(this, 'seatNum_21_17');"> 
											<label for="seatNum_21_17">17</label>
										</span> 
										<span class="seatBox "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_18" value="18" onclick="fnSeatChc(this, 'seatNum_21_18');"> 
											<label for="seatNum_21_18">18</label>
										</span> 
										<span class="seatBox last_seat "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_19" value="19" onclick="fnSeatChc(this, 'seatNum_21_19');">
											<label for="seatNum_21_19">19</label>
										</span> 
										<span class="seatBox last_seat "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_20" value="20" onclick="fnSeatChc(this, 'seatNum_21_20');">
											<label for="seatNum_21_20">20</label>
										</span> 
										<span class="seatBox last_seat last "> 
											<input type="checkbox" name="seatBoxDtl" id="seatNum_21_21" value="21" onclick="fnSeatChc(this, 'seatNum_21_21');">
											<label for="seatNum_21_21">21</label>
										</span>
									</div>
								</div>
							</div>
							</c:if>
							<!-- //프리미엄 좌석선택 -->
						</div>
					</div>
					<!-- //우측 detailBox -->
				</div>
				<!-- //compareBox -->
				
				<!-- 선택좌석 상세보기 -->
				<div class="selectSeat_detail">
					<div class="box_tbl">
						<!-- 선택좌석 -->
						<section class="box_detail">
							<div class="box_title">
								<strong class="txt_tit">선택좌석</strong>
							</div>
							<div class="sel_seatNum">
								<span class="txt_selSeat" style="display: none;">좌석을 선택해주세요</span> 
								<span class="txt_selSeat selected" id="selectedSeatNum">좌석을 선택해주세요</span>
								<input type="hidden" name="selectedSeatNum"/>
								<!-- 좌석번호 선택시 class="selected" 추가 -->
							</div>
						</section>
						<!-- //선택좌석 -->
						
						<!-- 탑승인원 및 요금 -->
						<section class="box_detail">
							<div class="tbl_type3">
								<table class="taR">
									<caption>
										<strong>탑승인원 및 요금</strong>
										<p>결제금액, 취소 수수료(예상), 반환금액</p>
									</caption>
									<colgroup>
										<col style="width: 115px;">
										<col style="width: *;">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="txt_black">탑승인원 및 요금</th>
										</tr>
										<tr>
											<th scope="row">성인 <span id="adltSeatCnt">0</span><input type="hidden" name="adltSeatCnt" value="0"></th>
											<td id="adltTotAmt">0원</td>
										</tr>
										<tr>
											<th scope="row">청소년 <span id="chldSeatCnt" name="chldSeatCnt">0</span><input type="hidden" name="chldSeatCnt" value="0"></th>
											<td id="chldTotAmt">0원</td>
										</tr>
									</tbody>
								</table>
							</div>
						</section>
						<!-- //탑승인원 및 요금 -->
					</div>
					<div class="box_tbl">
						<!-- 총 결제금액 -->
						<section class="box_detail total_price">
							<!-- 총 결재금액일 시 class="total_price" 추가 -->
							<div class="box_title">
								<strong class="txt_tit">총 결제금액</strong> 
								<span class="sel_price" id="allTotAmtLocD">0원</span>
								<input type="hidden" id="estimatedAmount" name="estimatedAmount"/> 
							</div>
						</section>
						<!-- //총 결제금액 -->
					</div>
				</div>
				<!-- //선택좌석 상세보기 -->
				<div class="btns btn_selectSeat">
					<button id="satsChcCfmBtn" class="btnL btn_confirm ready">선택완료</button>
				</div>
			</div>

			<!-- 상세설명 -->
			<ul class="desc_list">
				<li>심야 시간대 출발차량의 1번부터 9번 좌석까지는 여성고객 및 노약자를 위한 좌석으로 운영되고 있습니다.
					교통 약자를 위해 배려해 주시기 바랍니다.</li>
				<li>일부 버스의 경우 실제 좌석배치와 다를 수 있습니다.</li>
				<li>
					<span class="ico_square orange">색상표기 좌석</span>은 여성고객 및 노약자를 위한 좌석입니다. 배려해 주시기 바랍니다.
				</li>
			</ul>
		</div>
	</form>
	<input type="hidden" name="price" id="price" value="${price}"> <!-- 날짜 -->
</body>
</html>