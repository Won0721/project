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
<title>이사장 인사말</title>
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
							<p class="label">이사장 인사말</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class="selected"><a class="link-item" href="<c:url value='/busAssociation/chairmansMsg'/>">이사장 인사말</a></li>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/history'/>">연혁</a></li>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/purposeNservices'/>">설립목적 및 사업</a></li>
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
					<p class="noti">“<span class="txt_puple">안전하고 편안하게</span> <span class="mo_block">모시겠습니다.”</span></p>
				</div>
				<div class="box_message">
					<div class="ceo_cont">
						<p>저희 <strong>전국고속버스운송사업조합 홈페이지</strong> 방문을 환영합니다.</p>
						<p>고속버스는 1969년 4월 운행을 시작한 이래 고객 여러분의 <strong>따뜻한 관심과 사랑</strong>에 힘입어 양적으로나 질적으로 눈부신 발전을 거듭하여 왔으며, <strong>지역 간 주요 교통수단</strong>으로 역할을 다해 왔다고 자부합니다.</p>
						<p>저희 고속버스는 전국 주요 도시에 5~20분 간격의 촘촘한 배차와 환승정류장 운영 등을 통해 전국 <strong>일일생활권에 기여</strong>하고 있으며, 버스전용차로제 시행으로 <strong>정시성 확보</strong>를 위해 힘써 왔습니다.</p>
						<p>또한 교통 환경 변화와 국민들의 삶의 질 향상에 부응하기 위하여 “도로 위의 일등석”인 <strong>프리미엄 고속버스</strong>를 ‘16년 11월부터 운행하여 <strong>차별화된 서비스를 제공</strong>하고 있으며, <strong>고속버스 티머니 앱</strong>을 통해 <strong>예매에 탑승까지 원스톱 서비스</strong>를 제공하고 <strong>잔여좌석, 배차간격, 도착시간 정보</strong>를 실시간으로 확인할 수 있도록 하는 등 고속버스 이용편의 증진을 위하여 노력하고 있습니다.</p>
						<p>앞으로도 저희 고속버스운송사업조합과 고속버스 업계 종사자는 고객님들이 <strong>보다 편안하고 안전</strong>하게 고속버스를 이용하여 <strong>행복한 여행길</strong>이 되도록 최선을 다하고자 합니다.</p>
						<p>늘 변함없는 <strong>관심과 이용</strong>을 부탁드립니다.<br>고맙습니다.</p>
						<p class="sign">전국고속버스운송사업조합 이사장<strong>김 용 성</strong></p>
					</div>
				</div>
		</div>
</body>
</html>