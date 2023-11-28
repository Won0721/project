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
<title>승차권 환불안내</title>
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
	                    <p class="label">승차권 환불안내</p>
	                  <b class="button">▾</b>
	                 </a>
	               <div class="selectricItems infor" tabindex="-1" >
	                  <div class="selectricScroll">
	                     <ul>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/reservationInfo'/>">예매 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/paymentMethodInfo'/>">결제수단 안내</a></li>
	                        <li class="selected"><a class ="link-item" href="<c:url value='/informationUse/ticketRefundInfo'/>">승차권 환불안내</a></li>
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


	<div class="page payment_info">
		<div class="noti_wrap taL">
			<p class="noti">카드결제, 계좌이체, 마일리지로 예매한
				<span class="line_block">고속버스 승차권 환불 규정에 대한 안내입니다.</span>
			</p>
		</div>

		<div class="section">
			<h3 class="first">승차권 환불 규정</h3>
			<ul class="desc_list type2 refund">
				<li>승차권을 환불하신 후(승객용) 승차권을 교부 받으시면 정상적으로 환불 처리가 되었음을 의미하며 안심하셔도	됩니다.</li>
				<li>신용카드의 청구 및 환불은 결제일에 일괄적으로 정산처리됩니다. (카드사, 개인 결제일자별 차이가 있습니다.)</li>
				<li>신용카드 결제일에 청구되는 금액은 원칙적으로 사용금액(+)에서 환불금액(-)을 차감한 금액입니다. (카드사
					사정에 의해 모두 청구한 후 환불금액만 따로 계좌로 입금될 수도 있습니다. 따라서 결제일을 전후하여 신용카드사에서 발송한
					청구서와 계좌(통장)의 입출금 내역을 같이 확인하시기 바랍니다.)</li>
				<li>승차권 구입일자와 환불일자가 다르면 다음 결제일에 환불될 수도 있습니다.</li>
				<li>고속조합에서는 고객의 개별적인 승인취소 요청에 대해 처리해드리지 않사오니 양해 부탁드립니다.</li>
				<li>카드사 홈페이지에서 고속버스승차권의 이용내역을 조회하실 경우 가급적 결제일을 전후하여
					청구내역(거래승인내역이 아님)을 조회하시기 바랍니다. 또한 카드사의 사정에 따라 환불내역이 조회되지 않을 수 있습니다.</li>
				<li>신용카드 승차권의 환불은 구입했을 당시의 신용카드로 환불됩니다. 타인의 신용카드로 구입한 승차권 환불 시
					본인은 환불 받으실 수 없습니다.</li>
				<li>계좌이체 예매취소 시 즉시 예매 당시의 출금계좌로 입금되나 장애 발생 시 최대 1시간까지 입금이 지연될
					수도 있습니다.</li>
			</ul>
		</div>
	</div>
</body>
</html>