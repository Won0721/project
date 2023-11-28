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
<title>고속버스 운송회사 안내</title>
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
	                    <p class="label">고속버스 운송회사 안내</p>
	                  <b class="button">▾</b>
	                 </a>
	               <div class="selectricItems infor" tabindex="-1" >
	                  <div class="selectricScroll">
	                     <ul>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/reservationInfo'/>">예매 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/paymentMethodInfo'/>">결제수단 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/ticketRefundInfo'/>">승차권 환불안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/mileageInfo'/>">마일리지 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/crewInfo'/>">국민안전 승무원제 안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/informationUse/terminalInfo'/>">고속버스 터미널 안내</a></li>
	                        <li class="selected"><a class ="link-item" href="<c:url value='/informationUse/transportCompanyInfo'/>">고속버스 운송회사 안내</a></li>
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
		<div class="noti_wrap taL">
			<p class="noti">고속버스 운송회사 목록입니다.</p>
			<p class="desc">각 운송사별 홈페이지에서 자세한 정보 확인이 가능합니다.</p>
		</div>
		<div class="pop_gradeinfo">
			<div class="tbl_type1">
				<table>
					<caption>고속버스 운송회사 안내</caption>
					<colgroup>
						<col style="width: 28%;">
						<col style="width: auto;">
						<col style="width: 26%;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">고속회사</th>
							<th scope="col">주소</th>
							<th scope="col">전화번호</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" class="th_top">전국고속버스운송사업조합</th>
							<td>서울시 서초구 반포동 19-4서울고속터미널 9층</td>
							<td class="btnR">
								02)536-6461
								<span class="btnBox">
									<a href="/busAssociation/chairmansMsg" target="_self" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">금호고속(주)</th>
							<td>광주광역시 서구 무진대로 904(광천동,광천터미널)</td>
							<td class="btnR">
								1544-4888
								<span class="btnBox">
									<a href="http://www.kumhobuslines.co.kr/" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)동부고속</th>
							<td>서울특별시 서초구 신반포로 194, 924호 <br>(반포동, 서울고속버스터미널)</td>
							<td class="btnR">
								1688-3287
								<span class="btnBox">
									<a href="http://www.dongbubus.com" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)동양고속</th>
							<td>경기도 안양시 동안구 홍안대로 67(호계동)</td>
							<td class="btnR">
								02)535-3111
								<span class="btnBox">
									<a href="http://www.dyexpress.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)삼화고속</th>
							<td>인천광역시 중구 서해대로 418번길 70(신흥동3가,2층)</td>
							<td class="btnR">
								032)508-1580
								<span class="btnBox">
									<a href="http://www.samhwaexpress.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">속리산고속(주)</th>
							<td>충북 청주시 흥덕구 2순환로 1229(가경동)</td>
							<td class="btnR">
								043-230-1657
								<span class="btnBox">
									<a href="http://www.songnisanbuslines.co.kr/song/main/main" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)중앙고속</th>
							<td>경기도 화성시 풀무골로 1(중리 423-9)</td>
							<td class="btnR">
								031)379-8800
								<span class="btnBox">
									<a href="http://www.jabus.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)천일고속</th>
							<td>부산광역시 동구 중앙대로 168(초량동)</td>
							<td class="btnR">
								051)254-9115
								<span class="btnBox">
									<a href="http://www.chunilexpress.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)한일고속</th>
							<td>서울시 서초구 신반포로 194</td>
							<td class="btnR">
								02)535-2101
								<span class="btnBox">
									<a href="http://www.hanilexpress.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)경기고속</th>
							<td>경기도 광주시 송정동 222번지</td>
							<td class="btnR">
								<span class="btnBox">
									<a href="http://www.buspia.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">경일고속(주)</th>
							<td>대구시 서구 비산동 1860-7</td>
							<td class="btnR">
								&nbsp;
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">경전여객(주)</th>
							<td>경남 진주시 문산읍 삼곡리 1162</td>
							<td class="btnR">
								055)745-8285
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">고려여객자동차(주)</th>
							<td>부산시 동구 초량동 1211-8</td>
							<td class="btnR">
								051)322-6002
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)금남고속</th>
							<td>대전시 중구 산성동 759-33</td>
							<td class="btnR">
								042)584-7770
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)대원고속</th>
							<td>경기도 광주시 송정동 220-3</td>
							<td class="btnR">
								&nbsp;
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">대한여객자동차(주)</th>
							<td>전북 전주시 완산구 효자2동 889-5</td>
							<td class="btnR">
								063)227-7001
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">아성고속(주)</th>
							<td>대구광역시 동구 신천동 481-3</td>
							<td class="btnR">
								053)753-7003
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)아진고속</th>
							<td>대구광역시 서구 비산동 1856-3</td>
							<td class="btnR">
								&nbsp;
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)경북코치서비스</th>
							<td>대구광역시 서구 비산동 1856-3</td>
							<td class="btnR">
								053)355-1241
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)전북고속</th>
							<td>전북 전주시 덕진구 금암동 705-10</td>
							<td class="btnR">
								063)272-0108
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)천마고속</th>
							<td>대구광역시 동구 신천동 481-3</td>
							<td class="btnR">
								053)753-7002
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">천일여객(주)</th>
							<td>부산광역시 동구 초량동 1211-6</td>
							<td class="btnR">
								051)322-6002
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(유)호남고속</th>
							<td>전북 전주시 덕진구 팔복동 1가 280-3</td>
							<td class="btnR">
								063)211-5111
								<span class="btnBox">
									<a href="http://www.honamgosok.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">새서울고속(주)</th>
							<td>충북 청주시 복대1동 504</td>
							<td class="btnR">
								043)234-2753
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)충남고속</th>
							<td>충남 예산군 예산읍 산성리 647</td>
							<td class="btnR">
								041)333-2911
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">(주)한양고속</th>
							<td>충남 예산군 예산읍 신례원리 247-8</td>
							<td class="btnR">
								041)334-3223
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">강원고속(주)</th>
							<td>강원도 춘천시 온의동 511번지</td>
							<td class="btnR">
								033)254-3676
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>