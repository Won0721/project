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
<title>설립목적 및 사업</title>
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
							<p class="label">터미널사업자협회</p> <b class="button">▾</b>
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
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/chairmansMsg'/>">전국고속버스운송사업조합</a></li>
									<li class="selected last"><a class="link-item" href="<c:url value='/terminalOperator/presidentsMessage'/>">터미널사업자협회</a></li>
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
									<li class=""><a class="link-item" href="<c:url value='/terminalOperator/presidentsMessage'/>">협회장 인사말</a></li>
									<li class=""><a class="link-item" href="<c:url value='/terminalOperator/corporateHistory'/>">연혁</a></li>
									<li class="selected"><a class="link-item" href="<c:url value='/terminalOperator/purposeNservices'/>">설립목적 및 사업</a></li>
									<li class=""><a class="link-item" href="<c:url value='/terminalOperator/organizationChart'/>">조직도</a></li>
									<li class=""><a class="link-item" href="<c:url value='/terminalOperator/directions'/>">찾아오시는 길</a></li>
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
					<img src="	https://www.kobus.co.kr/images/page/img_business_step04.jpg" alt="고속버스 운송사업의 공익성 구현">
					<p>
						<span class="num">1</span>
						<span class="txt_desc">여객 자동차 터미널사업에 관한<br>정부시책 수행협력</span>
					</p>
				</li>
				<li>
					<img src="https://www.kobus.co.kr/images/page/img_business_step05.jpg" alt="업체 상호간 협조체제 공고">
					<p>
						<span class="num">2</span>
						<span class="txt_desc">여객 자동차 터미널사업의 발전과<br>사업자 공동이익 도모</span>
					</p>
				</li>
				<li>
					<img src="https://www.kobus.co.kr/images/page/img_business_step06.jpg" alt="업체 공동이익증진에 기여">
					<p>
						<span class="num">3</span>
						<span class="txt_desc">여객 자동차 터미널사업자의<br>권익보호와 복리증진 기여</span>
					</p>
				</li>
			</ul>
		</div>
		<div class="noti_wrap">
			<p class="noti">사업</p>
		</div>
		<p class="sub_visual"><img src="https://www.kobus.co.kr/images/page/img_business.jpg" alt="사업"></p>				
		<div class="business_list">
			<ul>
				<li>
					<span class="num">1</span>
					<span class="txt_desc">터미널사업의 건전한 발전과 상호간의<br> 공동이익을 도모하는 사업</span>
				</li>
				<li>
					<span class="num">2</span>
					<span class="txt_desc">국토해양부장관으로부터 위탁받은 처리 및<br> 행정명령과 지시사항 전달, 계몽지도</span>
				</li>
				<li>
					<span class="num">3</span>
					<span class="txt_desc">터미널에 관한 자료수집 과 조사통계 및 연구</span>
				</li>
				<li>
					<span class="num">4</span>
					<span class="txt_desc">터미널시설의 근대화방안 연구</span>
				</li>
				<li>
					<span class="num">5</span>
					<span class="txt_desc">서비스개선을 위한 지도계몽</span>
				</li>
				<li>
					<span class="num">6</span>
					<span class="txt_desc">터미널의 경영합리화 및 시설의 근대화방안<br> 강구</span>
				</li>
				<li>
					<span class="num">7</span>
					<span class="txt_desc">기타 협회 설립목적을 달성하기 위하여<br> 필요한 업무</span>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>