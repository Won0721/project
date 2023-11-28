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
<title>고속버스 터미널 안내</title>
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
	                    <p class="label">고속버스 터미널 안내</p>
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
	                        <li class="selected"><a class ="link-item" href="<c:url value='/informationUse/terminalInfo'/>">고속버스 터미널 안내</a></li>
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
	

	<div class="page">
		<div class="noti_wrap taL mobNone">
			<p class="noti">전국의 고속버스 터미널 안내입니다.</p>
			<p class="desc">지역을 선택하시면 해당 지역에 소재한 고속버스 터미널을 확인할 수 있습니다.</p>
		</div>
		<div class="search_wrap type2 custom_input">
			<div class="box_inputForm click_box inselect">
				<div class="payment value select-box sel_terminal">
					<div class="selectricWrapper">
						<div class="selectricHideSelect">
							<select name="" id="" title="지역 선택" tabindex="0">
								<option>전체</option>
								<option selected="">서울</option><!-- default 노출 -->
								<option>경기</option>
								<option>인천</option>
								<option>강원</option>
								<option>충남</option>
								<option>대전</option>
								<option>충북</option>
								<option>전북</option>
								<option>경북</option>
								<option>대구</option>
								<option>광주</option>
								<option>전남</option>
								<option>경남</option>
								<option>울산</option>
								<option>부산</option>
							</select>
						</div>
					<div class="selectric">
						<p class="label add">서울</p>
						<b class="button">▾</b>
						</div>
					<div class="selectricItems" tabindex="-1" style="width: 498px; height: 500px;">
						<div class="selectricScroll">
							<ul>
								<li class="">전체</li>
								<li class="selected">서울</li>
								<li class="">경기</li>
								<li class="">인천</li>
								<li class="">강원</li>
								<li class="">충남</li>
								<li class="">대전</li>
								<li class="">충북</li>
								<li class="">전북</li>
								<li class="">경북</li>
								<li class="">대구</li>
								<li class="">광주</li>
								<li class="">전남</li>
								<li class="">경남</li>
								<li class="">울산</li>
								<li class="last">부산</li>
							</ul>
						</div>
					</div>
					<input class="selectricInput" tabindex="0">
					</div>
				</div>
			</div>
		</div>
		<!-- 서울 -->
		<div class="pop_gradeinfo marT30">
			<div class="tbl_type1 sort">
				<table>
					<caption>고속버스 운송회사 안내</caption>
					<colgroup>
						<col style="width: 32%;">
						<col style="width: auto;">
						<col style="width: 31%;">
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
							<th scope="row" class="th_top">전국여객자동차터미널사업자협회</th>
							<td>서초구 서초동 1446-1</td>
							<td class="btnR">
								02)588-0753
								<span class="btnBox">
									<a href="/ugd/trmlbizr/Trmlbizr.do" target="_self" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<!-- 서울 -->
						<tr data-label="서울" class="default">
							<th scope="row" class="th_top">서울고속 (경부, 영동)</th>
							<td>서초구 반포동 19-4</td>
							<td class="btnR">
								1688-4700
								<span class="btnBox">
									<a href="http://www.exterminal.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr data-label="서울" class="default">
							<th scope="row" class="th_top">센트럴시티(서울)</th>
							<td>서초구 반포동 19-3</td>
							<td class="btnR">
								02)6282-0600
								<span class="btnBox">
									<a href="http://www.centralcityseoul.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr data-label="서울" class="default">
							<th scope="row" class="th_top">동서울</th>
							<td>서울특별시 광진구 강변역로 50</td>
							<td class="btnR">
								1688-5979
								<span class="btnBox">
									<a href="http://www.ti21.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr data-label="서울" class="default">
							<th scope="row" class="th_top">상봉</th>
							<td>중량구상봉동 83-1</td>
							<td class="btnR">
								02)490-7751~2
							</td>
						</tr>
						<!-- 경기 -->
						<tr data-label="경기">
							<th scope="row" class="th_top">고양(화정)</th>
							<td>고양시 덕양구 화정동 974</td>
							<td class="btnR">
								1577-9884
								<span class="btnBox">
									<a href="http://www.hwajungterminal.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">성남(분당)</th>
							<td>성남시 분당구 야탑동 341 지상 1층 416호</td>
							<td class="btnR">
								1644-2689
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">수원</th>
							<td>수원시 권선구 권선동 1189</td>
							<td class="btnR">
								1688-5455
								<span class="btnBox">
									<a href="http://www.suwonterminal.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">안산</th>
							<td>안산시 성포동 590</td>
							<td class="btnR">
								031)411-1917
								<span class="btnBox">
									<a href="http://www.ansan-busterminal.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">안성</th>
							<td>안성시 가사동 182</td>
							<td class="btnR">
								1688-1845
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">여주</th>
							<td>여주시 여주읍 홍문리 269-4</td>
							<td class="btnR">
								031)884-3182
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">여주종합</th>
							<td>여주시 여주읍 홍문리 274-1</td>
							<td class="btnR">
								031)885-9598
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">의정부</th>
							<td>의정부시 금오동 369-5</td>
							<td class="btnR">
								1688-0314
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">용인</th>
							<td>용인시 김량장동 23-1</td>
							<td class="btnR">
								031)339-3181
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">용인유방</th>
							<td>용인시 처인구 유방동 310-12번지</td>
							<td class="btnR">
								031)338-2510
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">이천</th>
							<td>이천시 중리동 219-1</td>
							<td class="btnR">
								031)634-3183
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">평택</th>
							<td>평택시 평택동 55-5</td>
							<td class="btnR">
								031)655-2453
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">평택대</th>
							<td>평택시 소사동 4-3</td>
							<td class="btnR">
								031)658-1850
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_top">광명</th>
							<td>광명시 일직동 경부고속철도역사내</td>
							<td class="btnR">
								02)897-0799
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">광명</th>
							<td>광명시 광명역로 51</td>
							<td class="btnR">
								02)899-8110
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">오산</th>
							<td>경기 오산시 역광장로 59</td>
							<td class="btnR">
								031)377-3215
							</td>
						</tr>
						<tr data-label="경기">
							<th scope="row" class="th_top">시흥시화</th>
							<td>경기 시흥시 정왕동 1745-6</td>
							<td class="btnR">
								031)434-8686
							</td>
						</tr>
						<!-- //경기 -->
						<!-- 인천 -->
						<tr data-label="인천">
							<th scope="row" class="th_top">인천</th>
							<td>인천광역시 미추홀구 연남로 35</td>
							<td class="btnR">
								1666-7114
								<span class="btnBox">
									<a href="http://www.ictr.or.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<!-- //인천 -->
						<!-- 강원 -->
						<tr data-label="강원">
							<th scope="row" class="th_top">원주</th>
							<td>원주시 서원대로 171</td>
							<td class="btnR">
								033)734-4114
							</td>
						</tr>
						<tr data-label="강원">
							<th scope="row" class="th_top">강릉</th>
							<td>강릉시 홍제동 992-2</td>
							<td class="btnR">
								033)641-3184
							</td>
						</tr>
						<tr data-label="강원">
							<th scope="row" class="th_top">속초</th>
							<td>속초시 조양동 1418</td>
							<td class="btnR">
								033)631-3181
							</td>
						</tr>
						<tr data-label="강원">
							<th scope="row" class="th_top">동해</th>
							<td>동해시 부곡동 88</td>
							<td class="btnR">
								033)531-3400
							</td>
						</tr>
						<tr data-label="강원">
							<th scope="row" class="th_top">삼척</th>
							<td>삼척시 남양동 334-1</td>
							<td class="btnR">
								033)572-7444
							</td>
						</tr>
						<tr data-label="강원">
							<th scope="row" class="th_top">춘천</th>
							<td>춘천시 온의동 111-2</td>
							<td class="btnR">
								033)256-1571
							</td>
						</tr>
						<tr data-label="강원">
							<th scope="row" class="th_top">양양</th>
							<td>양양군 양양읍 동해대로 2700</td>
							<td class="btnR">
								033)672-4100
							</td>
						</tr>
						<!-- //강원 -->
						<!-- 충남 -->
						<tr data-label="충남">
							<th scope="row" class="th_top">공주</th>
							<td>공주시 신관동 609</td>
							<td class="btnR">
								041)855-2319
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">금산</th>
							<td>금산군 금산읍 상리 34-10</td>
							<td class="btnR">
								041)754-2100
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">논산</th>
							<td>논산시 논산읍 취암동 599-3</td>
							<td class="btnR">
								041)735-3678
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">온양</th>
							<td>아산시 모종동 557-3</td>
							<td class="btnR">
								041)544-4880
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">연무대</th>
							<td>논산시 연무읍 안심8동 1125</td>
							<td class="btnR">
								041)741-6670
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">조치원</th>
							<td>연기군 조치원읍 상리 96</td>
							<td class="btnR">
								044)850-0225
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">세종시</th>
							<td>세종특별자치시 대평동 269-19</td>
							<td class="btnR">
								070-4904-3262
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">천안</th>
							<td>천안시 신부동 354-1</td>
							<td class="btnR">
								041)551-4933
							</td>
						</tr>
						<!-- 기획팀 검토중_DB에 없는 정보 -->
						<tr data-label="충남">
							<th scope="row" class="th_top">예산</th>
							<td>예산군 예산읍 산성리 647</td>
							<td class="btnR">
								041)333-2911
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">홍성</th>
							<td>홍성군 홍성읍 고암리 1042</td>
							<td class="btnR">
								041)632-2425
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">보령</th>
							<td>보령시 궁촌동 347</td>
							<td class="btnR">
								041)936-5757
							</td>
						</tr>
						<!-- //기획팀 검토중_DB에 없는 정보 -->
						<tr data-label="충남">
							<th scope="row" class="th_top">당진</th>
							<td>당진군 당진읍 수청리 979</td>
							<td class="btnR">
								041)355-1129
							</td>
						</tr>
						<!-- 기획팀 검토중_DB에 없는 정보 -->
						<tr data-label="충남">
							<th scope="row" class="th_top">서산</th>
							<td>서산시 동문동 309-3</td>
							<td class="btnR">
								041)665-0465
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">태안</th>
							<td>태안군 태안읍 남문리 701</td>
							<td class="btnR">
								041)674-2009
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">대천욕장</th>
							<td>보령시 신흑동 10단지 아-10</td>
							<td class="btnR">
								&nbsp;
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">안면도</th>
							<td>태안군 안면읍 승언리 1243-3</td>
							<td class="btnR">
								041)943-2681
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">덕산스파</th>
							<td>예산군 덕산면 사동리 361</td>
							<td class="btnR">
								&nbsp;
							</td>
						</tr>
						<tr data-label="충남">
							<th scope="row" class="th_top">청양</th>
							<td>청양군 청양읍 읍내리 208-4</td>
							<td class="btnR">
								041)943-2681
							</td>
						</tr>
						<!-- //기획팀 검토중_DB에 없는 정보 -->
						<!-- //충남 -->
						<!-- 대전 -->
						<tr data-label="대전">
							<th scope="row" class="th_top">대전</th>
							<td>대전시 동구 용전동 63-3</td>
							<td class="btnR">
								042)625-8791
								<span class="btnBox">
									<a href="http://www.djbusterminal.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr data-label="대전">
							<th scope="row" class="th_top">대전청사(샘머리)</th>
							<td>대전시 서구 둔산2동 908</td>
							<td class="btnR">
								042)485-0181
								<span class="btnBox">
									<a href="http://www.djbusterminal.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr data-label="대전">
							<th scope="row" class="th_top">유성</th>
							<td>대전시 유성구 장대동 281-23</td>
							<td class="btnR">
								042)822-0386
							</td>
						</tr>
						<!-- //대전 -->
						<!-- 충북 -->
						<tr data-label="충북">
							<th scope="row" class="th_top">제천</th>
							<td>제천시 의림동 25-24</td>
							<td class="btnR">
								043)648-3182
							</td>
						</tr>
						<tr data-label="충북">
							<th scope="row" class="th_top">청주</th>
							<td>청주시 흥덕구 가경동 1416</td>
							<td class="btnR">
								043)230-1657
							</td>
						</tr>
						<!-- 기획팀 검토중_DB에 없는 정보 -->
						<tr data-label="충북">
							<th scope="row" class="th_top">충주</th>
							<td>충주시 칠금동 849</td>
							<td class="btnR">
								043)856-7000
								<span class="btnBox">
									<a href="http://www.cjterminal.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<!-- //기획팀 검토중_DB에 없는 정보 -->
						<tr data-label="충북">
							<th scope="row" class="th_top">황간(상행)</th>
							<td>충북 영동군 황간면 신촌 2길 7-5 인근 경부고속도로 간이 정류장</td>
							<td class="btnR">
								
							</td>
						</tr>
						<tr data-label="충북">
							<th scope="row" class="th_top">황간(하행)</th>
							<td>충북 영동군 황간면 신촌 3길 7-6 인근 경부고속도로 간이 정류장</td>
							<td class="btnR">
								
							</td>
						</tr>
						<!-- //충북 -->
						<!-- 전북 -->
						<tr data-label="전북">
							<th scope="row" class="th_top">전주공용</th>
							<td>전주시 덕진구 금암동 767-2</td>
							<td class="btnR">
								063)277-1572
							</td>
						</tr>
						<tr data-label="전북">
							<th scope="row" class="th_top">고창</th>
							<td>고창군 고창읍 읍내리 629</td>
							<td class="btnR">
								063)563-3388
							</td>
						</tr>
						<tr data-label="전북">
							<th scope="row" class="th_top">군산</th>
							<td>군산시 경암동 612-7</td>
							<td class="btnR">
								063)445-3824
							</td>
						</tr>
						<tr data-label="전북">
							<th scope="row" class="th_top">김제</th>
							<td>김제시 요촌동 47-28</td>
							<td class="btnR">
								063)544-0075
							</td>
						</tr>
						<tr data-label="전북">
							<th scope="row" class="th_top">남원</th>
							<td>남원시 용성로 109</td>
							<td class="btnR">
								063)625-5391
							</td>
						</tr>
						<tr data-label="전북">
							<th scope="row" class="th_top">부안</th>
							<td>부안군 부안읍 봉덕리 574-13</td>
							<td class="btnR">
								063)584-2098
							</td>
						</tr>
						<tr data-label="전북">
							<th scope="row" class="th_top">순창</th>
							<td>순창군 순창읍 순화리 114-9</td>
							<td class="btnR">
								063)653-2186
							</td>
						</tr>
						<tr data-label="전북">
							<th scope="row" class="th_top">익산</th>
							<td>익산시 익산대로 52</td>
							<td class="btnR">
								063)855-0345
							</td>
						</tr>
						<tr data-label="전북">
							<th scope="row" class="th_top">정읍</th>
							<td>정읍시 연지동 312-12</td>
							<td class="btnR">
								063)535-4240
							</td>
						</tr>
						<tr data-label="전북">
							<th scope="row" class="th_top">진안</th>
							<td>진안군 진안읍 군상리 430-19</td>
							<td class="btnR">
								063)433-2508
							</td>
						</tr>
						<!-- //전북 -->
						<!-- 경북 -->
						<tr data-label="경북">
							<th scope="row" class="th_top">구미</th>
							<td>구미시 원평1동1073-1</td>
							<td class="btnR">
								054)452-5750
							</td>
						</tr>
						<tr data-label="경북">
							<th scope="row" class="th_top">김천</th>
							<td>김천시 성내동 38-1</td>
							<td class="btnR">
								054)432-7600
							</td>
						</tr>
						<tr data-label="경북">
							<th scope="row" class="th_top">경주</th>
							<td>경주시 노서동 243-5</td>
							<td class="btnR">
								054)741-4000
							</td>
						</tr>
						<tr data-label="경북">
							<th scope="row" class="th_top">상주</th>
							<td>상주시 무양동 291</td>
							<td class="btnR">
								054)534-9002
							</td>
						</tr>
						<tr data-label="경북">
							<th scope="row" class="th_top">영주</th>
							<td>영주시 대학로 352(가흥동)</td>
							<td class="btnR">
								054)631-3264
							</td>
						</tr>
						<tr data-label="경북">
							<th scope="row" class="th_top">영천</th>
							<td>영천시 금노동 584-3</td>
							<td class="btnR">
								054)334-2556
							</td>
						</tr>
						<tr data-label="경북">
							<th scope="row" class="th_top">안동</th>
							<td>안동시 송현동 713-6</td>
							<td class="btnR">
								1688-8228
							</td>
						</tr>
						<tr data-label="경북">
							<th scope="row" class="th_top">점촌</th>
							<td>문경시 모전로 54</td>
							<td class="btnR">
								054)556-7707
							</td>
						</tr>
						<tr data-label="경북">
							<th scope="row" class="th_top">포항(천일)</th>
							<td>포항시 남구 해도동 33-7</td>
							<td class="btnR">
								054)272-1001
							</td>
						</tr>
						<!-- //경북 -->
						<!-- 대구 -->
						<tr data-label="대구">
							<th scope="row" class="th_top">대구금호</th>
							<td>대구시 동구 신천4동 329-3</td>
							<td class="btnR">
								053)743-4787
							</td>
						</tr>
						<tr data-label="대구">
							<th scope="row" class="th_top">대구동양</th>
							<td>대구시 동구 신천4동 328-2</td>
							<td class="btnR">
								053)743-3950
							</td>
						</tr>
						<tr data-label="대구">
							<th scope="row" class="th_top">대구중앙</th>
							<td>대구시 동구 신천4동 327-1</td>
							<td class="btnR">
								053)743-2662
							</td>
						</tr>
						<tr data-label="대구">
							<th scope="row" class="th_top">대구한진</th>
							<td>대구시 동구 신천4동 328-1</td>
							<td class="btnR">
								053)743-3701
							</td>
						</tr>
						<tr data-label="대구">
							<th scope="row" class="th_top">서대구</th>
							<td>대구시 북구 노원3가 685</td>
							<td class="btnR">
								1666-2600
							</td>
						</tr>
						<!-- //대구 -->
						<!-- 광주 -->
						<tr data-label="광주">
							<th scope="row" class="th_top">광주</th>
							<td>광주시 서구 광천동 49-1</td>
							<td class="btnR">
								062)360-8114
							</td>
						</tr>
						<!-- //광주 -->
						<!-- 전남 -->
						<tr data-label="전남">
							<th scope="row" class="th_top">강진</th>
							<td>강진군 강진읍 평동리 167-1</td>
							<td class="btnR">
								061)434-2053
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">고흥</th>
							<td>고흥군 고흥읍 소문리 218-11</td>
							<td class="btnR">
								061)833-0009
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">광양</th>
							<td>광양시 광양읍 인동리 413</td>
							<td class="btnR">
								061)762-3030
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">동광양</th>
							<td>광양시 중동 1691</td>
							<td class="btnR">
								061)795-8289
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">나주</th>
							<td>나주시 중앙동 95-2</td>
							<td class="btnR">
								061)333-1323
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">녹동</th>
							<td>고흥군 도양읍 봉암리 1613-1</td>
							<td class="btnR">
								061)842-2706
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">담양</th>
							<td>담양군 담양읍 지침리 132-17</td>
							<td class="btnR">
								061)381-3233
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">목포</th>
							<td>목포시 상동 220</td>
							<td class="btnR">
								061)276-0220
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">문장</th>
							<td>함평군 해보면 문장리 822-24</td>
							<td class="btnR">
								061)323-0068
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">무안</th>
							<td>무안군 무안읍 성동리 873-11</td>
							<td class="btnR">
								061)453-2518
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">보성</th>
							<td>보성군 보성읍 원봉리 5-1</td>
							<td class="btnR">
								061)852-2777
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">벌교</th>
							<td>보성군 벌교읍 회정리 432</td>
							<td class="btnR">
								061)857-2150
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">순천</th>
							<td>순천시 장천동 18-22</td>
							<td class="btnR">
								061)744-4296
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">여수</th>
							<td>여수시 오림동 390</td>
							<td class="btnR">
								061)652-6977
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">여천</th>
							<td>여수시 무선로 200</td>
							<td class="btnR">
								061)686-7666
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">영광</th>
							<td>영광군 영광읍 신하리 10-1</td>
							<td class="btnR">
								061)353-3360
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">영산포</th>
							<td>나주시 이창동 191</td>
							<td class="btnR">
								061)332-2345
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">영암</th>
							<td>영암군 영암읍 남풍리 4-1</td>
							<td class="btnR">
								061)473-3355
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">완도</th>
							<td>완도군 완도읍 군내리 1230</td>
							<td class="btnR">
								061)552-1500
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">장흥</th>
							<td>장흥군 장흥읍 건산리 382</td>
							<td class="btnR">
								061)863-9036
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">진도</th>
							<td>진도군 진도읍 남동리 782-1</td>
							<td class="btnR">
								061)544-2141
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">함평</th>
							<td>함평군 함평읍 기각리 88-1</td>
							<td class="btnR">
								061)322-0660
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">해남</th>
							<td>해남군 해남읍 해리 401</td>
							<td class="btnR">
								061)534-0884
							</td>
						</tr>
						<tr data-label="전남">
							<th scope="row" class="th_top">삼호</th>
							<td>영암군 삼호읍 삼호중앙로 246</td>
							<td class="btnR">
								061)461-6333
							</td>
						</tr>
						<!-- //전남 -->
						<!-- 경남 -->
						<tr data-label="경남">
							<th scope="row" class="th_top">마산</th>
							<td>마산시 양덕2동 154-1</td>
							<td class="btnR">
								055)255-2576
							</td>
						</tr>
						<tr data-label="경남">
							<th scope="row" class="th_top">내서</th>
							<td>마산시 내서읍 중리 895-1 농수산물 도매시장내</td>
							<td class="btnR">
								055)231-0113
							</td>
						</tr>
						<tr data-label="경남">
							<th scope="row" class="th_top">진주</th>
							<td>진주시 칠암동 489-2</td>
							<td class="btnR">
								1688-0091
							</td>
						</tr>
						<tr data-label="경남">
							<th scope="row" class="th_top">창원</th>
							<td>창원시 팔용동 용원상업지구 35</td>
							<td class="btnR">
								055)288-3355
							</td>
						</tr>
						<tr data-label="경남">
							<th scope="row" class="th_top">김해</th>
							<td>김해시 외동 1264</td>
							<td class="btnR">
								055)327-7898
							</td>
						</tr>
						<tr data-label="경남">
							<th scope="row" class="th_top">통영</th>
							<td>통영시 광도면 죽림리 1569번지</td>
							<td class="btnR">
								055)644-0018
							</td>
						</tr>
						<!-- //경남 -->
						<!-- 울산 -->
						<tr data-label="울산">
							<th scope="row" class="th_top">울산</th>
							<td>울산시 남구 삼산동 1480-4</td>
							<td class="btnR">
								1688-7797
							</td>
						</tr>
						<tr data-label="울산">
							<th scope="row" class="th_top">울산신북</th>
							<td>울산시 남구 무거동 327-21번지</td>
							<td class="btnR">
								052)249-5777
							</td>
						</tr>
						<!-- //울산 -->
						<!-- 부산 -->
						<tr data-label="부산">
							<th scope="row" class="th_top">부산</th>
							<td>부산시 금정구 노포동 133</td>
							<td class="btnR">
								1577-9956
								<span class="btnBox">
									<a href="http://www.bxt.co.kr" target="_blank" class="btn btn_sm_link_purple">바로가기</a>
								</span>
							</td>
						</tr>
						<tr data-label="부산">
							<th scope="row" class="th_top">서부산(사상)</th>
							<td>부산시 사상구 괘법동 533번지</td>
							<td class="btnR">
								1577-8301
							</td>
						</tr>
						<!-- //부산 -->
					</tbody>
				</table>
			</div>
		</div>
		<!-- 강원 -->
	</div>
</body>
</html>