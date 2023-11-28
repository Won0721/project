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
	<title>결제수단 안내</title>
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
	                    <p class="label">결제수단 안내</p>
	                  <b class="button">▾</b>
	                 </a>
	               <div class="selectricItems infor" tabindex="-1" >
	                  <div class="selectricScroll">
	                     <ul>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/reservationInfo'/>">예매 안내</a></li>
	                        <li class="selected"><a class ="link-item" href="<c:url value='/informationUse/paymentMethodInfo'/>">결제수단 안내</a></li>
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


	<div class="page payment_info">
		<div class="noti_wrap taL">
			<!-- <p class="noti">고속버스 통합 예매 홈페이지를 통한 예매 시 <span class="line_block">카드결제, 계좌이체, 부가상품(정액권, 정기권), 프리미엄 마일리지의 결제수단을 이용하실 수 있습니다.</span></p> -->
			 <p class="noti">고속버스 통합 예매 홈페이지를 통한 예매 시 <span class="line_block">카드결제, 계좌이체, 프리미엄 마일리지의 결제수단을 이용하실 수 있습니다.</span></p> 
		</div>

		<div class="section">
			<h3 class="first">카드결제</h3>
			<ul class="desc_list type2 card">
				<!-- <li>카드결제 예매 단계에서 별도의 카드사 선택 없이 카드번호 입력을 통해 결제가 진행됩니다.</li> --> <!-- 2017.02.21 스마트오케스트라 반영 -->
				<li>카드 결제 정보 입력 시 카드번호, 유효기간, 비밀번호 등을 정상적으로 입력하지 않을 경우 결제가 실패할 수 있으니 정확한 정보를 확인 후 입력해주시기 바랍니다.</li>
				<li>결제하려는 카드의 한도가 초과되었거나 사용 중지된 경우 결제가 실패할 수 있으니 사전에 확인해주시기 바랍니다.</li>
				<li>일부 체크카드 및 일부 법인카드는 예매가 제한될 수 있습니다.</li>
				<li>모든 결제정보는 암호화 처리 후 안전하게 전송됩니다.</li>
				<li>예매가 완료된 후 예매확인/취소/변경 메뉴를 통해 예매 성공 여부를 확인하시기 바랍니다.</li>
				<li>카드결제 후 고속버스 탑승 시 결제에 사용된 카드(창구, 무인기 발권 시), 모바일티켓, 홈티켓 중 하나를 가져오셔야 됩니다.</li>
				<li>예매한 카드를 분실하거나 재발급 받은 경우에는 예매 시 사용하신 카드 번호를 매표창구에 제시하시면 발권이 가능합니다.</li>
				<li>E-pass 단말기가 부착된 고속버스에서 E-pass 단말기에 예매 시 사용한 카드(교통카드 기능이 있는 신용카드만 해당)를 태그하시면 영수증과 승차권을 한 번에 발권하실 수 있습니다.</li>
			</ul>
			
			<h3>계좌이체</h3>
			<ul class="desc_list type2 account">
				<li>계좌이체를 통해 결제할 경우 편도 승차권 예매만 가능하니 참고해주시기 바랍니다.</li>
				<li>계좌이체를 통해 결제할 경우 공인인증서를 이용하여 계좌정보(계좌번호, 계좌비밀번호 등)를 통해 해당 계좌에서 실시간 이체가 이루어집니다.</li>
				<li>은행 이체를 통한 예매이므로 공인인증서가 설치되어 있어야 하며 진행중 보안 프로그램설치 유무를 묻는 물음에 ‘설치’를 선택해야 결제가 가능합니다.</li>
				<li>계좌이체를 통한 결제는 Internet Explorer 브라우저 환경에서 가능합니다.</li>
				<li>계좌이체를 통해 결제할 경우 ActiveX를 설치하여야 합니다.</li>
				<li>ActiveX는 고객의 결제에 필요한 중요 데이터를 안전하게 암호화하여 전송하기 위한 프로그램입니다.</li>
				<li>ActiveX는 최초 1회만 설치하면 추후 재설치를 하지 않으셔도 됩니다.</li>
				<!-- <li>계좌이체를 통해 예매를 진행할 경우 모바일 티켓이 아닌 일반 티켓으로만 발권이 진행되오니 모바일 티켓 발권을 원하실 경우 카드결제 혹은 부가상품(정액권/정기권)으로 예매를 진행하시기 바랍니다.</li> -->
				<li>계좌이체를 통해 예매를 진행할 경우 모바일 티켓이 아닌 일반 티켓으로만 발권이 진행되오니 모바일 티켓 발권을 원하실 경우 카드결제로 예매를 진행하시기 바랍니다.</li> 
				<li>계좌이체 예매(또는 취소)단계에서 회선장애, 기타 통신장애 또는 예매 오류 시에도 예매(취소) 성공 여부를 꼭 확인하셔야 합니다.</li>
				<li>계좌이체 예매 후 승차권 터미널 발권 시에는 예매 당시 입력하신 휴대폰번호(회원의 경우 가입 시 입력한 휴대폰번호)와 생년월일(법인은 사업자 등록번호)가 필요합니다.</li>
				<li>예매는 실패하였으나 출금이 되었을 때는 1시간 이내로 결제 취소 후 다시 입금이 되고 해당 좌석은 최소 30분 후에 예매 가능한 좌석이 됩니다. (경우에 따라 익일 아침에 입금 가능)</li>
				<li>계좌이체 예매취소시 즉시 예매 당시의 출금계좌로 입금되나 장애 발생시 최대 1시간까지 입금이 지연될 수도 있습니다.</li>
				<li>최소 30분 이내에 계좌이체 예매를 완료해야 합니다. (시간 경과 시 계좌이체 예매 불가능)</li>
				<li>현금영수증 발급정보(휴대폰 번호 or 사업자 등록 번호, 현금영수증 카드 번호)를 통해 현금영수증을 발급받으실 수 있습니다.</li>
				<li>예매가 완료된 후 예매확인/취소/변경 메뉴를 통해 예매 성공 여부를 확인하시기 바랍니다.</li>
				<li>계좌이체 예매 시 개인 계좌의 경우 365일 24시간 사용가능하나, 법인 계좌일 경우 평일 및 토요일에는 오전 8시부터 오후 10시까지 사용이 가능하며 공휴일에는 사용이 불가능합니다.</li>
				<li>계좌이체예매 취소 시 개인계좌일 경우 당일 송금되나 법인계좌일 경우 익일(평일 및 토요일) 오전 8시에 송금됩니다.</li>
			</ul> 
			<div class="tbl_wrap col2 clfix">
				<div class="tbl_type1">
					<table>
						<caption>계좌이체 가능 은행</caption>
						<colgroup>
							<col style="width: 40%;">
							<col style="width: auto;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">기관명</th>
								<th scope="col">이용가능 서비스 시간(평일)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>농협</td>
								<td>00:30~24:00</td>
							</tr>
							<tr>
								<td>우리</td>
								<td>00:00~24:00</td>
							</tr>
							<tr>
								<td>국민</td>
								<td>00:00~24:00</td>
							</tr>
							<tr>
								<td>신한</td>
								<td>00:05~23:55</td>
							</tr>
							<tr>
								<td>기업</td>
								<td>00:00~24:00</td>
							</tr>
							<tr>
								<td>하나</td>
								<td>00:15~23:50</td>
							</tr>
							<tr>
								<td>대구</td>
								<td>00:00~24:00</td>
							</tr>
							<tr>
								<td>우체국</td>
								<td>00:10~24:00</td>
							</tr>
							<tr>
								<td>외환</td>
								<td>00:15~23:50</td>
							</tr>
							<tr>
								<td>SC제일</td>
								<td>00:00~24:00</td>
							</tr>
							<tr>
								<td>부산</td>
								<td>00:05~24:00</td>
							</tr>
							<tr>
								<td>새마을금고</td>
								<td>00:30~23:30</td>
							</tr>
							<tr>
								<td>한국씨티</td>
								<td>00:00~24:00</td>
							</tr>
							<tr>
								<td>광주</td>
								<td>00:10~23:55</td>
							</tr>
							<tr>
								<td>경남</td>
								<td>00:00~24:00</td>
							</tr>
							<tr>
								<td>수협</td>
								<td>00:10~23:55</td>
							</tr>
							<tr>
								<td>신협</td>
								<td>00:10~23:50</td>
							</tr>
							<tr>
								<td>전북</td>
								<td>00:10~24:00</td>
							</tr>
							<tr>
								<td>제주</td>
								<td>00:20~23:55</td>
							</tr>
							<tr>
								<td>산림조합</td>
								<td>00:30~23:30</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tbl_type1">
					<table>
						<caption>계좌이체 가능 증권사</caption>
						<colgroup>
							<col style="width: 40%;">
							<col style="width: auto;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">기관명</th>
								<th scope="col">이용가능 서비스 시간(평일)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>동양</td>
								<td>00:05~23:55</td>
							</tr>
							<tr>
								<td>한국투자</td>
								<td>00:10~23:40</td>
							</tr>
							<tr>
								<td>삼성</td>
								<td>00:10~23:50</td>
							</tr>
							<tr>
								<td>미래에셋</td>
								<td>00:30~23:30</td>
							</tr>
							<tr>
								<td>우리투자</td>
								<td>00:15~23:55</td>
							</tr>
							<tr>
								<td>현대</td>
								<td>00:15~23:45</td>
							</tr>
							<tr>
								<td>SK</td>
								<td>00:30~23:50</td>
							</tr>
							<tr>
								<td>신한금융투자</td>
								<td>00:10~23:30</td>
							</tr>
							<tr>
								<td>하이</td>
								<td>00:10~23:50</td>
							</tr>
							<tr>
								<td>HMC</td>
								<td>02:00~23:30</td>
							</tr>
							<tr>
								<td>대신</td>
								<td>00:30~23:30</td>
							</tr>
							<tr>
								<td>하나대투</td>
								<td>00:15~23:45</td>
							</tr>
							<tr>
								<td>동부</td>
								<td>00:15~23:50</td>
							</tr>
							<tr>
								<td>유진</td>
								<td>07:00~23:30</td>
							</tr>
							<tr>
								<td>메리츠</td>
								<td>00:20~23:50</td>
							</tr>
							<tr>
								<td>신영</td>
								<td>00:20~23:50</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<p class="bul">기관별 서비스 이용가능 시간 및 상태는 변동될 수 있으니 계좌이체 진행 시 사전에 확인하시기 바랍니다.</p>
		</div>
	</div>
</body>
</html>