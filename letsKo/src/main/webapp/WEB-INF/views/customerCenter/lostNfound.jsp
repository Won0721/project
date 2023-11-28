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
	<form id="readForm" name="readForm" method="post">
		<input type="hidden" id="lostCom" name="lostCom">
		<div class="noti_wrap taL"> <!-- 170119 class추가 'taL' -->
			<p class="noti">탑승하신 고속버스 운송사를 선택 후 <span class="line_block">해당 지역의 유실물 센터로 문의하시기 바랍니다.</span></p>
		</div>
		<ul class="lost_com clfix">
			<li><a href="/customerCenter/lostNfoundKumho"><img src="https://www.kobus.co.kr/images/page/lost_com1_s.png" alt="금호고속"></a></li>
			<li><a href="/customerCenter/lostNfoundDongbu"><img src="https://www.kobus.co.kr/images/page/lost_com2_s.png" alt="Dongbu Express"></a></li>
			<li><a href="/customerCenter/lostNfoundDongYang"><img src="https://www.kobus.co.kr/images/page/lost_com3_s.png" alt="동양고속"></a></li>
			<li><a href="/customerCenter/lostNfoundJungAng"><img src="https://www.kobus.co.kr/images/page/lost_com4_s.png" alt="중앙고속"></a></li>
			<li><a href="/customerCenter/lostNfoundChuNil"><img src="https://www.kobus.co.kr/images/page/lost_com5_s.png"></a></li>
			<li><a href="/customerCenter/lostNfoundSamHwa"><img src="https://www.kobus.co.kr/images/page/lost_com6_s.png" alt="SAMHWA"></a></li>
			<li><a href="/customerCenter/lostNfoundHanIl"><img src="https://www.kobus.co.kr/images/page/lost_com7_s.png"></a></li>
			<li><a href="/customerCenter/lostNfoundSoglisan"><img src="https://www.kobus.co.kr/images/page/lost_com8_s.png" alt="금호속리산고속"></a></li>
		</ul>
	</form>
</div>
	
</body>
</html>