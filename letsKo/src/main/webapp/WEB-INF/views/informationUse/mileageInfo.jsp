<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.title_wrap {
	background:
		url(https://www.kobus.co.kr/images/page/visual_informationT_bg.jpg)
		center 0 no-repeat;
	background-size: cover;
}
</style>
<title>마일리지 안내</title>
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
	                    <p class="label">이용안내</p>
	                  <b class="button">▾</b>
	                 </a>
	                 <div class="selectricItems infor" tabindex="-1">
						 <div class="selectricScroll">
							 <ul>
								 <li class=""><a class="link-item" href="<c:url value='/book/bookSearch'/>">고속버스 예매</a></li>
								 <li class=""><a class="link-item" href="<c:url value='/bookConfirmation/bookConfirmation'/>">예매확인</a></li>
								 <li class=""><a class="link-item" href="<c:url value='/inforSchedule/timeList'/>">운행정보</a></li>
								 <li class="selected"><a class="link-item" href="<c:url value='/informationUse/reservationInfo'/>">이용안내</a></li>
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
	                    <p class="label">마일리지 안내</p>
	                  <b class="button">▾</b>
	                 </a>
	               <div class="selectricItems infor" tabindex="-1" >
	                  <div class="selectricScroll">
	                     <ul>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/reservationInfo'/>">예매 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/paymentMethodInfo'/>">결제수단 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/ticketRefundInfo'/>">승차권 환불안내</a></li>
	                        <li class="selected"><a class ="link-item" href="<c:url value='/informationUse/mileageInfo'/>">마일리지 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/crewInfo'/>">국민안전 승무원제 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/terminalInfo'/>">고속버스 터미널 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/transportCompanyInfo'/>">고속버스 운송회사 안내</a></li>
	                     </ul>
	                  </div>
	            	</div>
	               <input class="selectricInput" tabindex="0">
	            </div>
	         </div>
	      </li>
	   </ul>
	</div>


	<div class="page mileage_info">
		<div class="noti_wrap taL">
			<p class="noti">마일리지에 대한 안내입니다.</p>
		</div>
		<div class="section">
			<h3 class="first">개요</h3>
			<!-- 171125 추가 -->
			<ul class="desc_list type2 info">
				<li>일리지”란 고속버스 통합홈페이지 또는 고속버스 모바일 앱에서 회원으로 가입한 고객이 고속버스 승차권을 구매하여 사용하였을 경우 적립되는 마일리지를 말합니다.
					<span class="line_block marL10">
						<a href="#" class="accent">마일리지 내역조회 및 사용 방법 확인 &gt;</a>
					</span>
				</li>
			</ul>
			<h3 class="first">적립 및 조회</h3>
			<ul class="desc_list type2 save">
				<li>마일리지는 승차권 결제 후 승차권 요금의 0.05%가 적립됩니다.</li>
				<li>마일리지 적립 내역은 마이페이지 
					<a href="/" class="accent">마일리지 조회</a>
					마일리지 상세보기 에서 조회 가능합니다.
				</li>
			</ul>
			<h3>사용</h3>
			<ul class="desc_list type2 use">
				<li>적립된 마일리지는 승차권 예매시 사용이 가능합니다.</li>
				<li>마일리지는 고속버스 통합홈페이지와 고속버스 모바일 앱에서만 사용가능합니다.</li>
				<li>마일리지 사용 내역 조회는 현재일 기준으로 과거 2년까지 확인 가능합니다.</li>
			</ul>
			<h3>사용제한 및 자동소멸 유효기간</h3>
			<ul class="desc_list type2 expire">
				<li>마일리지 승차권은 고속버스통합홈페이지 또는 고속버스 모바일 앱에서만 예매 및 취소가 가능합니다.</li>
				<li>마일리지 적립일로부터 2년이 경과되는 경우 해당 마일리지는 자동 소멸됩니다.
					<p class="marL10">※ 마일리지 소멸 기준 (시작일 : 2017년 11월 25일)</p>
					<p class="marL10">- 회원이 마일리지 시작일 이전 적립 건 : 시작일부터 2년</p>
					<p class="marL10">- 마일리지 시작일 이후 적립 건 : 적립일로부터 2년</p>
				</li>
			</ul>
			<h3>취소 및 환급</h3>
			<ul class="desc_list type2 refund">
				<li>마일리지 구매 승차권 예매를 취소하실 경우 출발일자를 기준으로 취소 수수료가 부과됩니다.</li>
				<li>마일리지 승차권은 고속버스통합홈페이지 또는 고속버스 모바일 앱에서만 예매 및 취소가 가능합니다.</li>
				<li>
					<span class="caution">마일리지 구매 승차권은 터미널에서 현장 예매 (승차권 출력) 및 취소가 불가능 합니다.</span>
				</li>
				<li>출발시각이 지난 마일리지 승차권은 환급 및 사용이 불가합니다.
					<p class="tbl_stit">마일리지 취소 및 환급 안내</p>
					<div class="tbl_type1">
						<table>
							<caption>마일리지 취소 및 환급 안내</caption>
							<colgroup>
								<col style="width: 48%;">
								<col style="width: 52%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">취소시기</th>
									<th scope="col">수수료</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>출발시간 이전 취소</td>
									<td>마일리지 100% 환급</td>
								</tr>
								<tr>
									<td>출발시간 이후 취소</td>
									<td>마일리지 100% 차감</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>