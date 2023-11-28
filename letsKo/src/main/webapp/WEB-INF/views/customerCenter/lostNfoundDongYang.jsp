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
		<!-- 동양고속 -->
		<div class="com_info clfix">
			<p class="img">
				<img src="https://www.kobus.co.kr/images/page/lost_com3_s.png" alt="동양고속" class="hide_mo"> 
			</p>
			<p class="info">경기도 안양시 동안면 호계리 1029-9</p>
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
						<td class="branch">주사무소 </td>
						<td class="addr"> 서울특별시 서초구 신반포로 194 915호, 931호 </td>
						<td class="tel"><span> 02-535-3111~7 </span></td>
					</tr>
					<tr>
						<td class="branch">서울사업소 </td>
						<td class="addr">서울특별시 서초구 신반포로 194 부속상가 2층 34호</td>
						<td class="tel"><span>02-535-3111~7</span></td>
					</tr>
					<tr>
						<td class="branch">동서울사업소 </td>
						<td class="addr"> 서울특별시 광진구 강변역로 50 </td>
						<td class="tel"><span> 02-446-0513 </span></td>
					</tr>
					<tr>
						<td class="branch">평택사업소 </td>
						<td class="addr"> 경기도 평택시 평택로39번길 40 </td>
						<td class="tel"><span> 031-655-2453 </span></td>
					</tr>
					<tr>
						<td class="branch">천안사업소 </td>
						<td class="addr">충청남도 천안시 만남로 43</td>
						<td class="tel"><span> 041-551-7212 </span></td>
					</tr>
					<tr>
						<td class="branch">아산사업소 </td>
						<td class="addr"> 충청남도 아산시 번영로 223 </td>
						<td class="tel"><span> 041-544-4880 </span></td>
					</tr>
					<tr>
						<td class="branch">대전사업소</td>
						<td class="addr"> 대전광역시 동구 동서대로 1689 </td>
						<td class="tel"><span> 042-623-1359 </span></td>
					</tr>
					<tr>
						<td class="branch">전주사업소 </td>
						<td class="addr">전라북도 전주시 덕진구 가리내로 70</td>
						<td class="tel"><span> 063-254-1590 </span></td>
					</tr>
					<tr>
						<td class="branch">대구사업소 </td>
						<td class="addr"> 대구광역시 동구 동부로 149 </td>
						<td class="tel"><span> 053-743-3800 </span></td>
					</tr>
					<tr>
						<td class="branch">부산사업소 </td>
						<td class="addr"> 부산광역시 금정구 중앙대로 2238 </td>
						<td class="tel"><span> 051-508-8911 </span></td>
					</tr>
					<tr>
						<td class="branch">수원사업소 </td>
						<td class="addr"> 경기도 수원시 권선구 경수대로 270 </td>
						<td class="tel"><span> 031-890-7779 </span></td>
					</tr>
					<tr>
						<td class="branch">마산사업소 </td>
						<td class="addr"> 경상남도 창원시 마산회원구 합포로 290 </td>
						<td class="tel"><span> 055-296-6785 </span></td>
					</tr>
					<tr>
						<td class="branch">진주사업소 </td>
						<td class="addr">경상남도 진주시 동진로 16</td>
						<td class="tel"><span> 055-758-3111 </span></td>
					</tr>
					<tr>
						<td class="branch">인천사업소 </td>
						<td class="addr"> 인천광역시 미추홀구 연남로35 </td>
						<td class="tel"><span> 032-425-8312 </span></td>
					</tr>
					<tr>
						<td class="branch">창원사업소 </td>
						<td class="addr"> 경상남도 창원시 의창구 창원대로 371 </td>
						<td class="tel"><span> 055-277-6785 </span></td>
					</tr>
					<tr>
						<td class="branch">포항사업소 </td>
						<td class="addr"> 경상북도 포항시 남구 중앙로 166 </td>
						<td class="tel"><span> 054-272-1417 </span></td>
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