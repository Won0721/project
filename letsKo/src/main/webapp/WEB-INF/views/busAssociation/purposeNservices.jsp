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
							<p class="label">설립목적 및 사업</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/chairmansMsg'/>">이사장 인사말</a></li>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/history'/>">연혁</a></li>
									<li class="selected"><a class="link-item" href="<c:url value='/busAssociation/purposeNservices'/>">설립목적 및 사업</a></li>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/organizationChart'/>">조직도</a></li>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/membershipStatus'/>">회원사 현황</a></li>
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
	
	
	<div class="page business">
		<div class="noti_wrap">
			<p class="noti">설립목적</p>
		</div>			
		<div class="foundation">
			<ul class="col3">
				<li>
					<img src="https://www.kobus.co.kr/images/page/img_business_step01.jpg" alt="고속버스 운송사업의 공익성 구현">
					<p>
						<span class="num">1</span>
						<span class="txt_desc">고속버스 운송사업의 공익성 구현</span>
					</p>
				</li>
				<li>
					<img src="https://www.kobus.co.kr/images/page/img_business_step02.jpg" alt="업체 상호간 협조체제 공고">
					<p>
						<span class="num">2</span>
						<span class="txt_desc">업체 상호간 협조체제 공고</span>
					</p>
				</li>
				<li>
					<img src="	https://www.kobus.co.kr/images/page/img_business_step03.jpg" alt="업체 공동이익증진에 기여">
					<p>
						<span class="num">3</span>
						<span class="txt_desc">업체 공동이익증진에 기여</span>
					</p>
				</li>
			</ul>
		</div>
		<div class="noti_wrap">
			<p class="noti">사업</p>
		</div>
		<p class="sub_visual"><img src="https://www.kobus.co.kr/images/page/img_business02.jpg" alt="사업"></p>				
		<div class="business_list">
			<ul>
				<li>
					<span class="num">1</span>
					<span class="txt_desc">고속버스운송사업의 건전한 발전과<br> 고속버스 운송업계 공동이익증진에 관한<br> 사업</span>
				</li>
				<li>
					<span class="num">2</span>
					<span class="txt_desc">고속버스운송사업에 관한 통계의 작성관리<br> 및 조사연구 사업</span>
				</li>
				<li>
					<span class="num">3</span>
					<span class="txt_desc">경영자 및 종사원교육</span>
				</li>
				<li>
					<span class="num">4</span>
					<span class="txt_desc">운송질서 확립을위한 지도단속 활동 및<br> 안전관리</span>
				</li>
				<li>
					<span class="num">5</span>
					<span class="txt_desc">고속버스운송사업의 경영관리 및 현행제도의<br> 진흥발전에 필요한 조사연구 사업</span>
				</li>
				<li>
					<span class="num">6</span>
					<span class="txt_desc">건설교통부장관으로부터 위탁받은 업무의<br> 정부시책에 부응하는 사업</span>
				</li>
				<li>
					<span class="num">7</span>
					<span class="txt_desc">육운진흥법 제 8조에 의한 공제사업(현재<br> 미추진)</span>
				</li>
				<li>
					<span class="num">8</span>
					<span class="txt_desc">기타 본 조합 목적달성에 필요하다고<br> 인정되는 사업</span>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>