<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_informationT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
</style>
	<title>예매 안내</title>
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
	                    <p class="label">예매안내</p>
	                  <b class="button">▾</b>
	                 </a>
	               <div class="selectricItems infor" tabindex="-1" >
	                  <div class="selectricScroll">
	                     <ul>
	                        <li class="selected"><a class ="link-item" href="<c:url value='/informationUse/reservationInfo'/>">예매 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/paymentMethodInfo'/>">결제수단 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/ticketRefundInfo'/>">승차권 환불안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/mileageInfo'/>">마일리지 안내</a></li>
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


	<div class="page ticketing_info">
		<div class="section">	
			<h3 class="first">승차권 예매/발권</h3>
			<ul class="ticket_noti clfix">
				<li class="noti01">예매하신 승차권의 창구발권은 출발시간 이전에 출발지 터미널에서 발권이 가능하며 예매에 사용하신 신용카드를 지참해주시기 바랍니다.</li>
				<li class="noti02">예매에 사용하신 신용카드를 분실하고 신용카드 번호를 인지 못하신 경우에는 승차권에 대한 어떠한 변경/취소 불가하오니 주의하시기 바랍니다.</li>
				<li class="noti03">승차권 예매 서비스는 실시간으로 온라인 처리가 되므로 예매 시 회선장애나 기타 통신장애로 인하여 성공여부를 확인하지 못하였을 경우 반드시 본 홈페이지의 <a href="/mrs/mrscfm.do" class="accent">예매확인/취소</a> 메뉴에서 성공여부를 확인하셔야 합니다.</li>
				<li class="noti04">출발시간이 지난 후에는 승차권 발권이 불가합니다. 창구 발권 시 반드시 출발시간 이전에 터미널에 도착하셔서 발권 받으시기 바랍니다.</li>
				<li class="noti05">홈페이지의 ‘홈티켓’서비스를 이용해서 인쇄하시면 별도의 창구발권이 필요없습니다.</li>
				<li class="noti06">예매시 ‘모바일티켓’ 발권을 선택하시면 별도 발권절차 없이 고속버스 모바일앱으로 승차가 가능합니다.</li>
			</ul>
			
			<h3>수수료</h3>
			<p class="bul type2">승차권 예매를 취소하실 경우 출발일자를 기준으로 취소 수수료가 부과됩니다. </p>
			<p class="tbl_stit">취소수수료</p>
			<div class="tbl_type1">
				<table>
					<caption>취소수수료</caption>
					<colgroup>
						<col style="width: auto;">
						<col style="width: 30%;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">취소시기</th>
							<th scope="col">수수료</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>예매 당일 또는 승차일 2일전 취소<br></td>
							<td>없음</td>
						</tr>
						<tr>
							<td>예매 후 출발일 1일 전일부터 지정차 출발 1시간 전 취소<br></td>
							<td>승차권 요금의 5%</td>
						</tr>
						<tr>
							<td>예매 후 지정차 출발 1시간 이내 취소<br></td>
							<td>승차권 요금의 10%</td>
						</tr>
					</tbody>
				</table>
			</div>
			<p class="bul type2">구매 승차권은 시간변경이 불가하니 변경을 원하시면 취소 후 다시 예매를 진행하시기 바랍니다.</p>
			
			<div class="epass_wrap">
				<h3>E-PASS 서비스</h3>
				<p class="bul type2">종이 승차권, 홈티켓, 모바일티켓 구분없이 승차와 동시에 셀프 체크인(검표)가능합니다.</p>
				<p class="stit">셀프 체크인 방법</p>
				<p class="desc">고객이 소지한 승차권의 QR코드를 고속버스에 장착된 <span class="txt_puple">E-Pass 단말기에 스캔</span>하고 탑승하세요.</p>
				<div class="self_chk">
					<p>
						<img src="https://www.kobus.co.kr/images/page/ticket_img1.png" alt="승차권(종이) 예시이미지">
						<span>승차권(종이)</span>
					</p>
					<p>
						<img src="https://www.kobus.co.kr/images/page/ticket_img2.png" alt="홈티켓 예시이미지">
						<span>홈티켓</span>
					</p>
					<p>
						<img src="	https://www.kobus.co.kr/images/page/ticket_img3.png" alt="모바일티켓 예시이미지">
						<span>모바일티켓</span>
					</p>
				</div>
				<p class="bul type2">사전예매 없이도 시내버스 또는 지하철과 동일하게 교통카드 및 신용카드로 결제 후 탑승이 가능합니다. <span class="txt_puple">(버스에 빈좌석이 존재할 경우)</span></p>
				<div class="e_pass">
					<p class="card_tag">교통카드 태그! <span>(교통기능 내장 <span>신용카드 포함)</span></span></p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>