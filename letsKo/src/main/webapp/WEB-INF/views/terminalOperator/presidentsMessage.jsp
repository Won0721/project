<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_associationT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
</style>
<title>협회장 인사말</title>
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
									<li class=""><a class="link-item" href="<c:url value='#'/>">고속버스 예매</a></li>
									<li class=""><a class="link-item" href="<c:url value='/bookConfirmation/bookConfirmation'/>">예매확인</a></li>
									<li class=""><a class="link-item" href="<c:url value='#'/>">운행정보</a></li>
									<li class=""><a class="link-item" href="<c:url value='#'/>">이용안내</a></li>
									<li class=""><a class="link-item" href="<c:url value='/board/boardList'/>">공지사항</a></li>
									<li class=""><a class="link-item" href="<c:url value='#'/>">고객센터</a></li>
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
							<p class="label">협회장 인사말</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class="selected"><a class="link-item" href="<c:url value='/terminalOperator/presidentsMessage'/>">협회장 인사말</a></li>
									<li class=""><a class="link-item" href="<c:url value='/terminalOperator/corporateHistory'/>">연혁</a></li>
									<li class=""><a class="link-item" href="<c:url value='/terminalOperator/purposeNservices'/>">설립목적 및 사업</a></li>
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
			<p class="noti">“고속버스 이용객이 보다 편리하게 <span class="line_block">고속버스를 이용할 수 있도록 최선을 다해 노력하겠습니다.</span></p>
		</div>
		<div class="box_message">
			<div class="ceo_cont">
				<p>안녕하십니까?</p>
				<p>전국여객자동차터미널사업자협회 홈페이지를 방문해주셔서 감사합니다.</p>
				<p>전국여객자동차터미널협회에서는 고속버스 이용객이 보다 편리하게 고속버스를 이용할 수 있도록 <strong>고속버스승차권 통합정보시스템 구축시스템</strong>을 완료하고 <strong>서비스</strong>를 <strong>시행</strong>하였습니다.</p>
				<p>고속버스승차권 통합정보시스템구축사업이 완료됨에 따라 고속버스 이용객이 전국 어디서나 승차권 예매 및 안내서비스가 가능해지며 <strong>왕복 승차권구매</strong>는 물론 집에서도 승차권 구입이 가능한 홈티켓 서비스가 시행되며 교통카드로도 고속버스를 이용할 수 있는 이용객이 보다 편리하게 고속버스를 이용할 수 있게 되었습니다.</p>
				<p>앞으로도 우리 고속버스 터미널사업자 일동은 이에 만족하지 않고 <strong>계속하여 이용객이 편리하도록 터미널이용 여건을 개선하여 이용객 여러분에게 한발 더 다가설 것을 약속</strong> 드리며 계속적인 이용객님들의 성원과 충고를 부탁 드립니다.</p>
				<p class="sign">전국여객자동차터미널사업자협회장<strong>석 종 호</strong></p>
			</div>
		</div>
	</div>
</body>
</html>