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
		<!-- 금호고속 -->
		<div class="com_info clfix">
			<p class="img">
				<img src="https://www.kobus.co.kr/images/page/lost_com1_s.png" alt="금호고속" class="hide_mo"> 
			</p>
			<p class="info">전라남도 나주시 송월동 1095-4번지</p>
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
						<td class="branch">강진</td>
						<td class="addr">전남 강진군 강진읍 영랑로 35</td>
						<td class="tel"><span>061-434-4371</span></td>
					</tr>
					<tr>
						<td class="branch">지도</td>
						<td class="addr">전남 신안군 지도읍 해제지도로 1240</td>
						<td class="tel"><span>061-275-0582</span></td>
					</tr>
					<tr>
						<td class="branch">경주</td>
						<td class="addr">경북 경주시 태종로 685번길 2</td>
						<td class="tel"><span>054-772-4445</span></td>
					</tr>
					<tr>
						<td class="branch">고양</td>
						<td class="addr">경기 고양시 일산동구 중앙로 1036 백석종합터미널 2층</td>
						<td class="tel"><span>031-936-7720</span></td>
					</tr>
					<tr>
						<td class="branch">고흥</td>
						<td class="addr">전남 고흥군 고흥읍 터미널길 25</td>
						<td class="tel"><span>061-835-3560</span></td>
					</tr>
					<tr>
						<td class="branch">공주</td>
						<td class="addr">충남 공주시 신관로 74</td>
						<td class="tel"><span>041-855-2319</span></td>
					</tr>
					<tr>
						<td class="branch">광양</td>
						<td class="addr">전남 광양시 광양읍 순광로 688</td>
						<td class="tel"><span>061-761-2355</span></td>
					</tr>
					<tr>
						<td class="branch">광주</td>
						<td class="addr">광주 서구 무진대로 904</td>
						<td class="tel"><span>062-360-8715(고속)</span><span>062-630-8755(직행)</span></td>
					</tr>
					<tr>
						<td class="branch">군산</td>
						<td class="addr">전북 군산시 해망로 30</td>
						<td class="tel"><span>063-443-1928</span></td>
					</tr>
					<tr>
						<td class="branch">김제</td>
						<td class="addr">전북 김제시 동서로 241</td>
						<td class="tel"><span>063-544-4075</span></td>
					</tr>
					<tr>
						<td class="branch">나주</td>
						<td class="addr">전남 나주시 나주로 190</td>
						<td class="tel"><span>061-333-5522</span></td>
					</tr>
					<tr>
						<td class="branch">녹동</td>
						<td class="addr">전남 고흥군 도양읍 천마로 57</td>
						<td class="tel"><span>061-844-1423</span></td>
					</tr>
					<tr>
						<td class="branch">논산</td>
						<td class="addr">충남 논산시 계백로 973</td>
						<td class="tel"><span>041-735-3677</span><span>041-735-3678</span></td>
					</tr>
					<tr>
						<td class="branch">담양</td>
						<td class="addr">전남 담양군 담양읍 중앙로 24-1</td>
						<td class="tel"><span>061-382-3233</span></td>
					</tr>
					<tr>
						<td class="branch">대구</td>
						<td class="addr">대구광역시 동구 동부로 149</td>
						<td class="tel"><span>053-743-4787</span></td>
					</tr>
					<tr>
						<td class="branch">대전</td>
						<td class="addr">대전광역시 동구 동서대로 1689</td>
						<td class="tel"><span>042-623-3487</span></td>
					</tr>
					<tr>
						<td class="branch">목포</td>
						<td class="addr">전남 목포시 영산로 525</td>
						<td class="tel"><span>061-276-0220</span></td>
					</tr>
					<tr>
						<td class="branch">무안</td>
						<td class="addr">전남 무안군 무안읍 무안로 497-1</td>
						<td class="tel"><span>061-453-0156</span></td>
					</tr>
					<tr>
						<td class="branch">벌교</td>
						<td class="addr">전남 보성군 벌교읍 조정래길 2-8</td>
						<td class="tel"><span>061-857-6313</span></td>
					</tr>
					<tr>
						<td class="branch">부산</td>
						<td class="addr">부산광역시 금정구 중앙대로 2238</td>
						<td class="tel"><span>051-508-8881~3</span></td>
					</tr>
					<tr>
						<td class="branch">부산(사상) </td>
						<td class="addr">부산광역시 사상구 201 부산서부버스터미널 별관 3동 3층</td>
						<td class="tel"><span>051-323-8533</span></td>
					</tr>
					<tr>
						<td class="branch">서울(경부선)</td>
						<td class="addr">서울 서초구 신반포로 194 강남고속버스터미널</td>
						<td class="tel"><span>02-530-6341</span><span>02-530-6343</span></td>
					</tr>
					<tr>
						<td class="branch">서울(동서울) </td>
						<td class="addr">서울 광진구 강변역로 50 동서울터미널</td>
						<td class="tel"><span>02-530-6393</span></td>
					</tr>
					<tr>
						<td class="branch">서울(상봉)</td>
						<td class="addr">서울 중랑구 상봉로 117</td>
						<td class="tel"><span>02-323-5885</span></td>
					</tr>
					<tr>
						<td class="branch">서울(호남선)</td>
						<td class="addr">서울 서초구 신반포로 190 센트럴시티터미널</td>
						<td class="tel"><span>02-530-6313</span></td>
					</tr>
					<tr>
						<td class="branch">수원</td>
						<td class="addr">경기도 수원시 권선구 경수대로 270</td>
						<td class="tel"><span>031-267-7760</span></td>
					</tr>
					<tr>
						<td class="branch">안성</td>
						<td class="addr">경기 안성시 비봉로 85</td>
						<td class="tel"><span>031-677-6789</span></td>
					</tr>
					<tr>
						<td class="branch">순천</td>
						<td class="addr">전남 순천시 장천3길 13</td>
						<td class="tel"><span>031-746-2862</span></td>
					</tr>
					<tr>
						<td class="branch">안산</td>
						<td class="addr">경기도 안산시 상록구 항가울로 410</td>
						<td class="tel"><span>031-486-1818</span></td>
					</tr>
					<tr>
						<td class="branch">의정부</td>
						<td class="addr">경기도 의정부시 동일로 640</td>
						<td class="tel"><span>031-856-3652</span></td>
					</tr>
					<tr>
						<td class="branch">여수</td>
						<td class="addr">전남 여수시 좌수영로 268</td>
						<td class="tel"><span>061-652-6977</span></td>
					</tr>
					<tr>
						<td class="branch">연무대</td>
						<td class="addr">충남 논산시 연무읍 안심로 143</td>
						<td class="tel"><span>041-741-6670~1</span></td>
					</tr>
					<tr>
						<td class="branch">영광</td>
						<td class="addr">전남 영광군 영광읍 신남로 180</td>
						<td class="tel"><span>061-353-0040</span></td>
					</tr>
					<tr>
						<td class="branch">영암</td>
						<td class="addr">전남 영광군 영광읍 신남로 180</td>
						<td class="tel"><span>061-473-4183</span></td>
					</tr>
					<tr>
						<td class="branch">완도</td>
						<td class="addr">전남 완도군 완도읍 개포로 130번길 20</td>
						<td class="tel"><span>061-554-2602</span></td>
					</tr>
					<tr>
						<td class="branch">울산</td>
						<td class="addr">울산광역시 남구 삼산로 288</td>
						<td class="tel"><span>052-271-0204</span></td>
					</tr>
					<tr>
						<td class="branch">유성</td>
						<td class="addr">대전광역시 유성구 장대로 50</td>
						<td class="tel"><span>042-822-0386</span></td>
					</tr>
					<tr>
						<td class="branch">인천</td>
						<td class="addr">인천 미추홀구 연남로 35 </td>
						<td class="tel"><span>032-421-2543</span></td>
					</tr>
					<tr>
						<td class="branch">장성</td>
						<td class="addr">전남 장성군 장성읍 영천로 125</td>
						<td class="tel"><span>061-393-2660</span></td>
					</tr>
					<tr>
						<td class="branch">장흥</td>
						<td class="addr">전남 장흥군 장흥읍 중앙로1길 8</td>
						<td class="tel"><span>061-862-7091</span></td>
					</tr>
					<tr>
						<td class="branch">전주</td>
						<td class="addr">전북 전주시 덕진구 가리내로 70</td>
						<td class="tel"><span>063-272-5117</span></td>
					</tr>
					<tr>
						<td class="branch">정읍</td>
						<td class="addr">전북 정읍시 연지1길 43</td>
						<td class="tel"><span>063-532-0229</span></td>
					</tr>
					<tr>
						<td class="branch">중마(동양광)</td>
						<td class="addr">전남 광양시 공영로 91</td>
						<td class="tel"><span>061-792-8684</span></td>
					</tr>
					<tr>
						<td class="branch">진도</td>
						<td class="addr">전남 진도군 진도읍 남문길 5</td>
						<td class="tel"><span>061-543-5053</span></td>
					</tr>
					<tr>
						<td class="branch">함평</td>
						<td class="addr">전남 함평군 함평읍 중앙길 46</td>
						<td class="tel"><span>061-324-0123</span></td>
					</tr>
					<tr>
						<td class="branch">해남</td>
						<td class="addr">전남 해남군 해남읍 해남로 8</td>
						<td class="tel"><span>061-534-0882</span></td>
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