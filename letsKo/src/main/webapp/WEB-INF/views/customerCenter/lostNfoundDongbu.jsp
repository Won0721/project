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
		<!-- 동부고속 -->
		<div class="com_info clfix">
			<p class="img">
				<img src="https://www.kobus.co.kr/images/page/lost_com2_s.png" alt="Dongbu Express" class="hide_mo"> 
			</p>
			<p class="info">서울시 서초구 반포동 19-4</p>
		</div>
		<p class="tbl_tit hide_mo">유실물 센터</p>
		<div class="tbl_type1 responsive col2">
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
						<td class="branch">서울</td>
						<td class="tel"> 서울특별시 서초구 신반포로 194 </td>
						<td><span> 1688-3287 </span></td>
					</tr>
					<tr>
						<td class="branch">동서울</td>
						<td class="tel">서울특별시 광진구 강변역로 50</td>
						<td><span> 02-456-3182 </span></td>
					</tr>
					<tr>
						<td class="branch">강릉</td>
						<td class="tel">강원도 강릉시 하슬라로 15</td>
						<td><span> 033-641-3184 </span></td>
					</tr>
					<tr>
						<td class="branch">동해</td>
						<td class="tel">강원도 동해시 부곡로 1</td>
						<td><span>033-531-3400</span></td>
					</tr>
					<tr>
						<td class="branch">삼척</td>
						<td class="tel">강원도 삼척시 중앙로 192</td>
						<td><span>033-572-7420</span></td>
					</tr>
					<tr>
						<td class="branch">속초</td>
						<td class="tel">강원도 속초시 동해대로 3988</td>
						<td><span>033-631-3182</span></td>
					</tr>
					<tr>
						<td class="branch">양양</td>
						<td class="tel">강원도 양양군 양양읍 동해대로 2700</td>
						<td><span>033-672-4100</span></td>
					</tr>
					<tr>
						<td class="branch">여주</td>
						<td class="tel">경기도 여주시 세종로 85</td>
						<td><span>031-884-3182</span></td>
					</tr>
					<tr>
						<td class="branch">용인</td>
						<td class="tel">경기도 용인시 중부대로 1486</td>
						<td><span>031-338-3181</span></td>
					</tr>
					<tr>
						<td class="branch">이천</td>
						<td class="tel">경기도 이천시 이섭대천로 1200</td>
						<td><span>031-633-3182</span></td>
					</tr>
					<tr>
						<td class="branch">제천</td>
						<td class="tel">충북 제천시 칠성로10길 12</td>
						<td><span>043-648-3182</span></td>
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