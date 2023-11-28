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
		<!-- 중앙고속 -->
		<div class="com_info clfix">
			<p class="img">
				<img src="https://www.kobus.co.kr/images/page/lost_comL4.png" alt="중앙고속" class="hide_mo"> 
			</p>
			<p class="info">경기도 화성시 풀무골로 1</p> 
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
					<!-- 191025 수정 -->
					<tr>
						<td class="branch">서울(경부선)</td>
						<td class="addr"> 서울특별시 서초구 신반포로 194 서울고속터미널 7층 46호 </td>
						<td class="tel"> 02-3479-9584~5 </td>
					</tr>
					<tr>
						<td class="branch">서울(호남선)</td>
						<td class="addr"> 서울특별시 서초구 신반포로 194 서울고속터미널 7층 46호 </td>
						<td class="tel">02-594-0634~5 </td>
					</tr>
					<tr>
						<td class="branch">동서울</td>
						<td class="addr">서울특별시 광진구 강변역로 50</td>
						<td class="tel">02-446-1950~1</td>
					</tr>
					<tr>
						<td class="branch">강릉</td>
						<td class="addr">강원도 강릉시 하슬라로 15</td>
						<td class="tel"> 033-648-5897 </td>
					</tr>
					<tr>
						<td class="branch">강진</td>
						<td class="addr">전라남도 강진군 강진읍 영랑로 35</td>
						<td class="tel">062-367-7085</td>
					</tr>
					<tr>
						<td class="branch">고양</td>
						<td class="addr">경기도 고양시 일산동구 중앙로 1036</td>
						<td class="tel">031-973-8572</td>
					</tr>
					<tr>
						<td class="branch">광명</td>
						<td class="addr">경기도 광명시 광명역로 51</td>
						<td class="tel">031-486-7745</td>
					</tr>
					<tr>
						<td class="branch">광주</td>
						<td class="addr">광주광역시 서구 무진대로 904</td>
						<td class="tel">062-367-7085</td>
					</tr>
					<tr>
						<td class="branch">구미</td>
						<td class="addr">경상북도 구미시 송원동로 72</td>
						<td class="tel">054-453-0484</td>
					</tr>
					<tr>
						<td class="branch">군산</td>
						<td class="addr">전라북도 군산시 해망로 30</td>
						<td class="tel">063-445-2202</td>
					</tr>
					<tr>
						<td class="branch">나주</td>
						<td class="addr">전라남도 나주시 예향로 3803</td>
						<td class="tel">062-367-7085</td>
					</tr>
					<tr>
						<td class="branch">담양</td>
						<td class="addr">전라남도 담양군 담양읍 중앙로 24-1</td>
						<td class="tel">062-367-7085</td>
					</tr>
					<tr>
						<td class="branch">대구</td>
						<td class="addr">대구광역시 동구 효신로 88, 2층</td>
						<td class="tel">053-743-2601</td>
					</tr>
					<tr>
						<td class="branch">대전</td>
						<td class="addr">대전광역시 동구 동서대로 1695번길 30</td>
						<td class="tel">042-624-0118</td>
					</tr>
					<tr>
						<td class="branch">동광양</td>
						<td class="addr">전라남도 광양시 공영로 91</td>
						<td class="tel">055-752-5167</td>
					</tr>
					<tr>
						<td class="branch">마산</td>
						<td class="addr">경상남도 마산시 마산회원구 합포로 290</td>
						<td class="tel">055-288-3355</td>
					</tr>
					<tr>
						<td class="branch">부산(노포) </td>
						<td class="addr">부산광역시 금정구 중앙대로 2238</td>
						<td class="tel"> 051-508-8850 </td>
					</tr>
					<tr>
						<td class="branch">부산사상</td>
						<td class="addr">부산광역시 사상구 사상로 201</td>
						<td class="tel">051-508-8850</td>
					</tr>
					<tr>
						<td class="branch">상봉</td>
						<td class="addr">서울특별시 중랑구 상봉로 117</td>
						<td class="tel"> 02-446-1950~1 </td>
					</tr>
					<tr>
						<td class="branch">세종시 </td>
						<td class="addr">세종특별자치시 갈매로 37-12</td>
						<td class="tel">042-624-0118</td>
					</tr>
					<tr>
						<td class="branch">속초</td>
						<td class="addr">강원도 속초시 동해대로 3988</td>
						<td class="tel">033-648-5897</td>
					</tr>
					<tr>
						<td class="branch">시흥</td>
						<td class="addr">경기도 시흥시 옥구공원로 225</td>
						<td class="tel">031-486-7745</td>
					</tr>
					<tr>
						<td class="branch">안산</td>
						<td class="addr">경기도 안산시 상록구 항가울로 410</td>
						<td class="tel">031-486-7745</td>
					</tr>
					<tr>
						<td class="branch">영광</td>
						<td class="addr">전라남도 영광군 영광읍 신남로 180</td>
						<td class="tel">062-367-7085</td>
					</tr>
					<tr>
						<td class="branch">원주</td>
						<td class="addr">강원도 원주시 서원대로 181</td>
						<td class="tel">033-744-2290</td>
					</tr>
					<tr>
						<td class="branch">익산</td>
						<td class="addr">전라북도 익산시 익산대로 52</td>
						<td class="tel">063-445-2202</td>
					</tr>
					<tr>
						<td class="branch">인천</td>
						<td class="addr">인천광역시 미추홀구 연남로 35, 1층 13호</td>
						<td class="tel"> 031-486-7745 </td>
					</tr>
					<tr>
						<td class="branch">전주</td>
						<td class="addr">전라북도 전주시 덕진구 가리내로 70</td>
						<td class="tel">063-251-1177</td>
					</tr>
					<tr>
						<td class="branch">정읍</td>
						<td class="addr">전라북도 정읍시 연지1길 46-4</td>
						<td class="tel">063-535-4240</td>
					</tr>
					<tr>
						<td class="branch">조치원</td>
						<td class="addr">세종특별자치시 조치원읍 조치원로 54</td>
						<td class="tel">043-233-5501</td>
					</tr>
					<tr>
						<td class="branch">진주</td>
						<td class="addr">경상남도 진주시 동진로 16</td>
						<td class="tel">055-752-5167</td>
					</tr>
					<tr>
						<td class="branch">창원</td>
						<td class="addr">경상남도 창원시 의창구 창원대로 371</td>
						<td class="tel">055-288-3355</td>
					</tr>
					<tr>
						<td class="branch">청주</td>
						<td class="addr">충청북도 청주시 흥덕구 2순환로 1229</td>
						<td class="tel">043-233-5501</td>
					</tr>
					<tr>
						<td class="branch">춘천</td>
						<td class="addr">강원도 춘천시 터미널길 14번길 15</td>
						<td class="tel"> 033-744-2290 </td>
					</tr>
					<tr>
						<td class="branch">충주</td>
						<td class="addr">강원도 충주시 봉계1길 49</td>
						<td class="tel">033-744-2290</td>
					</tr>
					<!-- //191025 수정 -->
				</tbody>
			</table>
		</div>
		<p class="btns col1">
			<a href="/customerCenter/lostNfound" class="btnL btn_normal">목록</a>
		</p>
	</div>
</body>
</html>