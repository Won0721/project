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
<title>국민안전 승무원제 안내</title>
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
	                    <p class="label">국민안전승무원제 안내</p>
	                  <b class="button">▾</b>
	                 </a>
	               <div class="selectricItems infor" tabindex="-1" >
	                  <div class="selectricScroll">
	                     <ul>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/reservationInfo'/>">예매 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/paymentMethodInfo'/>">결제수단 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/ticketRefundInfo'/>">승차권 환불안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/mileageInfo'/>">마일리지 안내</a></li>
	                        <li class="selected"><a class ="link-item" href="<c:url value='/informationUse/crewInfo'/>">국민안전 승무원제 안내</a></li>
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
	
	
	<div class="page crew">
	    <div class="noti_wrap taL">
	        <p class="noti">국민안전 승무원제</p>
	        <p class="desc">국민안전 승무원제 해당 좌석은 3번 좌석입니다.</p>
	    </div>
	    <div class="section">
	        <h4>국민안전 승무원제란?</h4>
	        <p>3번 좌석을 이용하는 승객이 교통사고나 화재가 발생하였을경우 
	      	  <span class="txt_blue">다른 승객들의 안전을 확보하는데 도움을 주고</span> 고속버스의 이상 운행 및 이상 징후 포착시 운전기사에게 알려 
	    	  <span class="txt_blue">교통사고를 예방하고 피해를 최소화하고자</span> 도입한 자율적 참여제도입니다.
	        </p>
	        <h4>혜택</h4>
	        <p>고속버스 통합 홈페이지 (www.kobus.co.kr) 또는 모바일 앱 회원으로 가입후 해당 노선의 프리미엄 
	        	<span class="txt_blue">고속버스 3번 좌석</span>을 예매하였을 경우 
	       	 <span class="txt_blue">요금의 2% 마일리지 적립 및 추가로 1% 마일리지가 적립</span>됩니다.
	        </p> 
	         <ul class="desc_list">
	             <li>온라인 예매 시 국민안전 승무원 좌석의 동의 여부를 확인 후 동의 시에만 마일리지 추가 적립됩니다.</li>
	             <li>프리미엄 요금할인 노선과 비회원 및 터미널 현장 예매로 이용하였을 경우 적립되지 않습니다.</li>
	         </ul>
	        <img src="https://www.kobus.co.kr/images/page/img_crew_info.jpg" alt="" class="crew_info">
	        
	        <!-- 대체텍스트 -->
	        <ul class="alt">
	            <li>
	                <span>1. 교통사고나 화재 등 비상상황 발생시 운전기사를 도와 승객 대피</span>
	                <ul>
	                    <li><span>1. 교통사고나 화재 등 비상상황 발생</span></li>
	                    <li><span>2. 운전기사를 도와 안전지대로 승객 대피 유도</span></li>                                    
	                </ul>
	            </li>
	            <li>
	                <span>2. 승객 대피 유도시 운전기사를 도와 탈출로 확보 _ 승강구 수동사용, 비상망치</span>
	                <ul>
	                    <li>
	                        <span>승강구 수동사용</span>
	                        <ul>
	                            <li><span>1. 우측으로 돌려서 사용</span></li>
	                            <li><span>2. 승강구를 밀어 탈출</span></li>
	                        </ul>
	                    </li>
	                    <li>
	                        <span>비상망치</span>
	                        <ul>
	                            <li><span>1. 버스양옆에 위치</span></li>
	                            <li><span>2. 창문의 가장자리를 가격</span></li>
	                        </ul>
	                    </li>
	                </ul>
	            </li>
	            <li>
	                <span>3. 소화기 위치 및 사용방법</span>
	                <ul>
	                    <li><span>1. 운전석 뒤, 맨 뒷자석 뒤에 위치</span></li>
	                    <li><span>2. 안전핀 제거</span></li>
	                    <li><span>3. 화재방향으로 빗자루 쓸듯이 분사</span></li>
	                </ul>
	            </li>
	            <li>
	                <span>4. 버스 이상 운행 및 이상 징후 포착시 운전기사에게 알림</span>
	                <ul>
	                    <li><span>1. 이상 운행 및 이상 징후 포착</span></li>
	                    <li><span>2. 운전기사에게 통지하여 사고 예방</span></li>
	                </ul>
	            </li>
	        </ul>
	    </div>
	</div>
</body>
</html>