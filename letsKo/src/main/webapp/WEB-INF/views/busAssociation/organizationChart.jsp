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
							<p class="label">조직도</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/chairmansMsg'/>">이사장 인사말</a></li>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/history'/>">연혁</a></li>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/purposeNservices'/>">설립목적 및 사업</a></li>
									<li class="selected"><a class="link-item" href="<c:url value='/busAssociation/organizationChart'/>">조직도</a></li>
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
			<p class="noti">전국고속버스운송사업조합</p>
		</div>
		<div class="img_gourp">
			<img src="https://www.kobus.co.kr/images/page/img_group_KO.jpg" alt="하단상세설명">
			<figcaption>
				<p>이사장</p>
				<p>상무</p>
				<dl>
					<dt>조합사무실</dt>
					<dd>조합사업업무</dd>
				</dl>
				<dl>
					<dt>관리팀</dt>
					<dd>행사관리</dd>
					<dd>인사관리</dd>
					<dd>예산관리</dd>
					<dd>회계</dd>
					<dd>서무</dd>
					<dd>노무관련</dd>
				</dl>
				<dl>
					<dt>영업팀</dt>
					<dd>영업관리</dd>
					<dd>위탁행정</dd>
					<dd>서비스</dd>
					<dd>통계관리</dd>
					<dd>사업계획</dd>
					<dd>정책건의/자문연구</dd>
					<dd>제도 및 법령개정</dd>
					<dd>터미널 관련업무</dd>
					<dd>영업전략/기획업무</dd>
				</dl>
				<dl>
					<dt>안전팀</dt>
					<dd>안전관리</dd>
					<dd>교육관리</dd>
					<dd>취업관리</dd>
					<dd>일제검사</dd>
					<dd>전용차로</dd>
					<dd>직무보수교육</dd>
				</dl>
				<dl>
					<dt>전산실</dt>
					<dd>고속버스통합정보 시스템운영</dd>
				</dl>
				<dl>
					<dt>중앙전산실</dt>
					<dd>전산업무<br>TEL : 02)536-6460~3<br>FAX : 02)3477-1932</dd>
				</dl>
			</figcaption>
		</div>
	</div>
</body>
</html>