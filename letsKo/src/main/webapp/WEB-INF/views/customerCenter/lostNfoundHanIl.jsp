<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_customerT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
</style>
<title>유실물 센터</title>
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
							<p class="label">고객센터</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="<c:url value='/book/bookSearch'/>">고속버스 예매</a></li>
									<li class=""><a class="link-item" href="<c:url value='/bookConfirmation/bookConfirmation'/>">예매확인</a></li>
									<li class=""><a class="link-item" href="<c:url value='/inforSchedule/timeList'/>">운행정보</a></li>
									<li class=""><a class="link-item" href="<c:url value='/informationUse/reservationInfo'/>">이용안내</a></li>
									<li class=""><a class="link-item" href="<c:url value='/board/boardList'/>">공지사항</a></li>
									<li class="selected"><a class="link-item" href="<c:url value='/customerCenter/question'/>">고객센터</a></li>
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
							<p class="label">유실물센터 안내</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="<c:url value='/customerCenter/question'/>">자주하는 질문</a></li>
									<li class="selected"><a class="link-item" href="<c:url value='/customerCenter/lostNfound'/>">유실물센터 안내</a></li>
								</ul>
							</div>
						</div>
						<input class="selectricInput" tabindex="0">
					</div>
				</div>
			</li>
		</ul>
	</div>
	
	<div class="page customer">
		<!-- 한일고속 -->
		<div class="com_info clfix">
			<p class="img">
				<img src="https://www.kobus.co.kr/images/page/lost_com7_s.png" alt="HANIL EXPRESS" class="hide_mo"> 
			</p>
			<p class="info">서울시 서초구 반포동 19-4</p>
		</div>
		<p class="tbl_tit hide_mo">유실물 센터</p>
		<div class="tbl_type1 responsive col3">
			<table>
				<colgroup>
					<col style="width: 20%;">
					<col style="width: 40%;">
					<col style="width: auto">
				</colgroup>
				<caption>유실물 센터</caption>
				<thead>
					<tr>
						<th scope="col">영업소</th>
						<th scope="col">주소</th>
						<th scope="col">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="branch">본사</td>
						<td class="addr">서울시 서초구 반포동 19-4</td>
						<td class="tel"><span>02-535-2101~6</span></td>
					</tr>
					<tr>
						<td class="branch">기술부</td>
						<td class="addr">서울시 용산구 한남동 99-1</td>
						<td class="tel"><span>02-794-9110~2</span></td>
					</tr>
					<tr>
						<td class="branch">서울</td>
						<td class="addr">서울시 서초구 반포동 19-4</td>
						<td class="tel"><span>02-535-2107,2111</span></td>
					</tr>
					<tr>
						<td class="branch">대전</td>
						<td class="addr">대전광역시 동구 용전동 63-3</td>
						<td class="tel"><span>042-622-9636</span></td>
					</tr>
					<tr>
						<td class="branch">김천</td>
						<td class="addr">경북 김천시 성내동 38-1</td>
						<td class="tel"><span>054-430-1001</span></td>
					</tr>
					<tr>
						<td class="branch">상주</td>
						<td class="addr">경북 상주시 무양동 291</td>
						<td class="tel"><span>054-535-3008</span></td>
					</tr>
					<tr>
						<td class="branch">대구</td>
						<td class="addr">대구광역시 동구 신천동 329-3</td>
						<td class="tel"><span>053-755-6314</span></td>
					</tr>
					<tr>
						<td class="branch">경주</td>
						<td class="addr">경주시 노서동 243-5</td>
						<td class="tel"><span>054-772-2886</span></td>
					</tr>
					<tr>
						<td class="branch">포항</td>
						<td class="addr">포항시 해도동 33-14</td>
						<td class="tel"><span>054-272-3194</span></td>
					</tr>
					<tr>
						<td class="branch">울산</td>
						<td class="addr">울산시 남구 삼산동 1480-1</td>
						<td class="tel"><span>052-272-2767</span></td>
					</tr>
					<tr>
						<td class="branch">부산</td>
						<td class="addr">부산광역시 금정구 노포동 133</td>
						<td class="tel"><span>051-508-8891~3</span></td>
					</tr>
					<tr>
						<td class="branch">동서울</td>
						<td class="addr">서울시 광진구 구의동 546-1</td>
						<td class="tel"><span>02-457-6264</span></td>
					</tr>
					<tr>
						<td class="branch">동광양</td>
						<td class="addr">전남 동광양시 중동 36블럭 1651</td>
						<td class="tel"><span>061-792-0512</span></td>
					</tr>
					<tr>
						<td class="branch">광주</td>
						<td class="addr">광주광역시 서구 광천동 49-1</td>
						<td class="tel"><span>062-362-3116</span></td>
					</tr>
					<tr>
						<td class="branch">인천</td>
						<td class="addr">인천광역시 남구 관교동 15</td>
						<td class="tel"><span>032-426-8321</span></td>
					</tr>
					<tr>
						<td class="branch">순천</td>
						<td class="addr">순천시 매곡동 475-1</td>
						<td class="tel"><span>061-252-2863</span></td>
					</tr>
					<tr>
						<td class="branch">청주</td>
						<td class="addr">청주시 홍덕구 가경동 1416</td>
						<td class="tel"><span>043-232-3750</span></td>
					</tr>
					<tr>
						<td class="branch">춘천</td>
						<td class="addr">춘천시 온의동 154-1</td>
						<td class="tel"><span>033-256-1571~3</span></td>
					</tr>
					<tr>
						<td class="branch">안산</td>
						<td class="addr">안산시 성포동 590</td>
						<td class="tel"><span>031-409-3092</span></td>
					</tr>
					<tr>
						<td class="branch">속초</td>
						<td class="addr">속초시 조양동 1418</td>
						<td class="tel"><span>033-633-4017</span></td>
					</tr>
					<tr>
						<td class="branch">완도선박</td>
						<td class="addr">완도군 완도읍 항동리 1255</td>
						<td class="tel"><span>061-554-8000</span></td>
					</tr>
					<tr>
						<td class="branch">제주선박</td>
						<td class="addr">제주도 제주시 건입동 918-30</td>
						<td class="tel"><span>064-751-5050</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<p class="btns col1">
			<a href="/customerCenter/lostNfound" class="btnL btn_normal">목록</a>
		</p>
	</div>
</body>
</html>