<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_businessT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
</style>
<title>연혁</title>
</head>
<body>
	<!-- 헤더 밑 드랍다운 -->
	<div class="breadcrumb">
		<ul class="breadcrumb_list">
			<li><a href="/" class="selectric tag1">HOME</a></li>
			<li>
				<div class="select-box">
					<div class="selectricWrapper selectric-select">
						<a class="selectric tag2">
							<p class="label">전국고속버스운송사업조합</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									 <li class=""><a class="link-item" href="<c:url value='/book/bookSearch'/>">고속버스 예매</a></li>
									 <li class=""><a class="link-item" href="<c:url value='/bookConfirmation/bookConfirmation'/>">예매확인</a></li>
									 <li class=""><a class="link-item" href="<c:url value='/inforSchedule/timeList'/>">운행정보</a></li>
									 <li class=""><a class="link-item" href="<c:url value='/informationUse/reservationInfo'/>">이용안내</a></li>
									 <li class=""><a class="link-item" href="<c:url value='/board/boardList'/>">공지사항</a></li>
									 <li class=""><a class="link-item" href="<c:url value='/customerCenter/question'/>">고객센터</a></li>
									 <li class="selected"><a class="link-item" href="<c:url value='/busAssociation/chairmansMsg'/>">전국고속버스운송사업조합</a></li>
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
							<p class="label">회원사 현황</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/chairmansMsg'/>">이사장 인사말</a></li>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/history'/>">연혁</a></li>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/purposeNservices'/>">설립목적 및 사업</a></li>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/organizationChart'/>">조직도</a></li>
									<li class="selected"><a class="link-item" href="<c:url value='/busAssociation/membershipStatus'/>">회원사 현황</a></li>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/directions'/>">찾아오시는 길</a></li>
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
		<span class="condition_tit">총 11개업체</span>
		<div class="tbl_type1 mobNone">
			<table>
				<caption>회원사 현황</caption>
				<colgroup>
					<col style="width:22.5%;">
					<col style="width:16.5%;">
					<col style="width:auto;">
					<col style="width:11.5%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">고속회사</th>
						<th scope="col">대표자</th>
						<th scope="col">주소</th>
						<th scope="col">전화번호</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td class="txt_company">금호고속(주)</td>
						<td class="txt_name">이계영</td>
						<td class="txt_address">광주광역시 서구 무진대로 904(광천동)</td>
						<td class="txt_tel">1544-4888</td>
					</tr>
					<tr>
						<td class="txt_company">(주)동부고속</td>
						<td class="txt_name">강병도</td>
						<td class="txt_address">서울특별시 서초구 신반포로 194, 9층 924호(반포동, 서울고속버스터미널)</td>
						<td class="txt_tel">1688-3287</td>
					</tr>
					<tr>
						<td class="txt_company">(주)동양고속</td>
						<td class="txt_name">백남근</td>
						<td class="txt_address">경기도 안양시 동안구 흥안대로 67(호계동)</td>
						<td class="txt_tel">02-535-3111</td>
					</tr>
					<tr>
						<td class="txt_company">(주)삼화고속</td>
						<td class="txt_name">배홍철</td>
						<td class="txt_address">인천광역시 중구 서해대로 418번길 70(신흥동3가, 2층)</td>
						<td class="txt_tel">032-508-1580</td>
					</tr>
					<tr>
						<td class="txt_company">속리산고속(주)</td>
						<td class="txt_name">강병도</td>
						<td class="txt_address">충청북도 청주시 흥덕구 2순환로 1229(가경동)</td>
						<td class="txt_tel">043-230-1657</td>
					</tr>
					<tr>
						<td class="txt_company">(주)중앙고속</td>
						<td class="txt_name">이광석</td>
						<td class="txt_address">경기도 화성시 풀무골로 1(영천동)</td>
						<td class="txt_tel">031-379-8800</td>
					</tr>
					<tr>
						<td class="txt_company">(주)천일고속</td>
						<td class="txt_name">박도현</td>
						<td class="txt_address">부산광역시 동구 중앙대로 168(초량동)</td>
						<td class="txt_tel">051-254-9115</td>
					</tr>
					<tr>
						<td class="txt_company">(주)한일고속</td>
						<td class="txt_name">최지환</td>
						<td class="txt_address">서울특별시 서초구 신반포로 194, 910호(반포동, 고속터미널9층)</td>
						<td class="txt_tel">02-535-2101</td>
					</tr>
					<tr>
						<td class="txt_company">(주)대원고속</td>
						<td class="txt_name">허상준</td>
						<td class="txt_address">경기도 광주시 광주대로 171(송정동)</td>
						<td class="txt_tel">02-455-2114</td>
					</tr>
					<tr>
						<td class="txt_company">(주)코리아와이드경북고속</td>
						<td class="txt_name">류상우</td>
						<td class="txt_address">대구광역시 서구 서대구로 295(비산동)</td>
						<td class="txt_tel">053-355-1241</td>
					</tr>
					<tr>
						<td class="txt_company">(주)충남고속</td>
						<td class="txt_name">정창현</td>
						<td class="txt_address">충청남도 예산군 예산읍 금오대로 35-14</td>
						<td class="txt_tel">041-333-2911</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="conditionBox mobBlock">
			<dl>
				<dt>금호고속(주)</dt>
				<dd>대표자 : 이덕연</dd>
				<dd>광주광역시 서구 무진대로 904 (광천동, 광천터미널)</dd>
				<dd>02-536-6461</dd>
			</dl>
			<dl>
				<dt>(주)동부익스프레스</dt>
				<dd>대표자 : 정주섭</dd>
				<dd>서울특별시 용산구 한강대로 372&nbsp;(동자동, 센트레빌아스테리움서울디동23층)</dd>
				<dd>1688-3287</dd>
			</dl>
			<dl>
				<dt>(주)동양고속운수</dt>
				<dd>대표자 : 백남근</dd>
				<dd>경기도 안양시 동안구 홍안대로 67 (호계동)</dd>
				<dd>02-535-3111</dd>
			</dl>
			<dl>
				<dt>(주)삼화고속</dt>
				<dd>대표자 : 배홍철</dd>
				<dd>인천광역시 중구 서해대로 418번길 70 (신흥동3가, 2층)</dd>
				<dd>032-508-1580</dd>
			</dl>
			<dl>
				<dt>속리산고속(주)</dt>
				<dd>대표자 : 이덕연</dd>
				<dd>충북 청주시 흥덕구 2순환로 1229 (가경동)</dd>
				<dd>043-230-1620</dd>
			</dl>
			<dl>
				<dt>(주)중앙고속</dt>
				<dd>대표자 : 이광석</dd>
				<dd>경기도 화성시 풀무골로 1 (중리 423-9)</dd>
				<dd>031-379-8800</dd>
			</dl>
			<dl>
				<dt>(주)천일고속</dt>
				<dd>대표자 : 박도현</dd>
				<dd>부산광역시 동구 중앙대로 168(초량동)</dd>
				<dd>051-254-9115</dd>
			</dl>
			<dl>
				<dt>(주)한일고속</dt>
				<dd>대표자 : 최지환</dd>
				<dd>서울시 서초구 신반포로 194</dd>
				<dd>02-535-2101</dd>
			</dl>
			<dl>
				<dt>(주)대원고속</dt>
				<dd>대표자 : 허명회</dd>
				<dd>경기도 광주시 광주대로 171 (송정동)</dd>
				<dd>02-455-2114</dd>
			</dl>
			<dl>
				<dt>(주)경북코치서비스</dt>
				<dd>대표자 : 노진목</dd>
				<dd>대구광역시 서구 비산동 1856-3</dd>
				<dd>053-355-1241</dd>
			</dl>
			<dl>
				<dt>(주)충남고속</dt>
				<dd>대표자 : 정창현</dd>
				<dd>충청남도 예산군 예산읍 금오대로 35-14</dd>
				<dd>041-333-2911</dd>
			</dl>
		</div>
	</div>
</body>
</html>