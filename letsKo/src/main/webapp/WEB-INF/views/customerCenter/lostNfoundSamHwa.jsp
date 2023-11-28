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
		<!-- 삼화고속 -->
		<div class="com_info clfix">
			<p class="img">
				<img src="https://www.kobus.co.kr/images/page/lost_com6_s.png" alt="SAMHWA" class="hide_mo"> 
			</p>
			<p class="info">서울시 중구 태평로 1가 61-1</p>
		</div>
		<p class="tbl_tit hide_mo">유실물 센터</p>
		<div class="tbl_type1 responsive col2">
			<table>
				<colgroup>
					<col style="width: 50%;">
					<col style="width: auto">
				</colgroup>
				<caption>유실물 센터</caption>
				<thead>
					<tr>
						<th scope="col">영업소</th>
						<th scope="col">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="branch">영업부</td>
						<td class="tel"><span>032-508-1580 </span></td>
					</tr>
					<tr>
						<td class="branch">서울(강남)</td>
						<td class="tel"><span>02-535-2782</span></td>
					</tr>
					<tr>
						<td class="branch">서인천</td>
						<td class="tel"><span>032-561-1220</span></td>
					</tr>
					<tr>
						<td class="branch">부산</td>
						<td class="tel"><span>051-503-2488</span></td>
					</tr>
					<tr>
						<td class="branch">대전</td>
						<td class="tel"><span>031-633-3182</span></td>
					</tr>
					<tr>
						<td class="branch">대구</td>
						<td class="tel"><span>053-754-3606</span></td>
					</tr>
					<tr>
						<td class="branch">광주</td>
						<td class="tel"><span>062-386-5205</span></td>
					</tr>
					<tr>
						<td class="branch">수원</td>
						<td class="tel"><span>031-242-3737</span></td>
					</tr>
					<tr>
						<td class="branch">전주</td>
						<td class="tel"><span>063-277-0572</span></td>
					</tr>
					<tr>
						<td class="branch">마산</td>
						<td class="tel"><span>055-255-7306</span></td>
					</tr>
					<tr>
						<td class="branch">인천</td>
						<td class="tel"><span>032-438-6813</span></td>
					</tr>
					<tr>
						<td class="branch">남원</td>
						<td class="tel"><span>063-625-5392</span></td>
					</tr>
					<tr>
						<td class="branch">서울역</td>
						<td class="tel"><span>02-755-0988</span></td>
					</tr>
					<tr>
						<td class="branch">신촌</td>
						<td class="tel"><span>02-363-5231</span></td>
					</tr>
					<tr>
						<td class="branch">계산</td>
						<td class="tel"><span>032-541-8471</span></td>
					</tr>
					<tr>
						<td class="branch">관교</td>
						<td class="tel"><span>032-438-6811</span></td>
					</tr>
					<tr>
						<td class="branch">연수</td>
						<td class="tel"><span>032-818-4937</span></td>
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