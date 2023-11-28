<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_businessT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
</style>
<title>사이트맵</title>
</head>
<body>
	<div class="page">
	<div class="noti_wrap taL">
		<p class="noti">고속버스 홈페이지의 정보를 쉽고 빠르게 확인하실 수 있습니다.</p>
	</div>			
	<div class="siteMap_wrap">
		<div class="box_siteMap tab01">
			<h3>승차권</h3>
			<div class="box_list">
				<h4>예매</h4>
				<ul>
					<li><a href="/book/bookSearch">고속버스 예매</a></li>
					<li><a href="/bookConfirmation/bookConfirmation">예매확인/취소</a></li>
				</ul>
				<h4>운행정보</h4>
				<ul>
					<li><a href="/inforSchedule/timeList">시간표 조회</a></li>
				</ul>
			</div>
		</div>
		<div class="box_siteMap tab02">
			<h3>회원</h3>
			<div class="box_list">
				<c:if test="${user == null || user == ''}">
				<h4>회원</h4>
				<ul>
					<li><a href="/member/signupAgreement">회원가입</a></li>
					<li><a href="/member/loginView">로그인</a></li>
					<li><a href="/member/findIdView">아이디 찾기</a></li>
					<li><a href="/member/findPwView">비밀번호 찾기</a></li>
				</ul>
				</c:if>
				
				<h4>약관 및 처리방침</h4>
				<ul class="last">
					<li><a href="/sitemap/serviceAgreement">서비스 이용약관</a></li>
					<li><a href="/sitemap/privacyPolicy">개인정보 처리방침</a></li>
					<li><a href="/sitemap/busAgreement">고속버스 운송약관</a></li>
					<li><a href="/sitemap/electronicFinancialTransaction">전자금융거래 이용약관</a></li>
				</ul>
			</div>
		</div>
		<div class="box_siteMap tab03">
			<h3>기타</h3>
			<div class="box_list">
				<h4>이용안내</h4>
				<ul>
					<li><a href="/informationUse/reservationInfo">예매 안내</a></li>
					<li><a href="/informationUse/paymentMethodInfo">결제수단 안내</a></li>
					<li><a href="/informationUse/ticketRefundInfo">승차권 환불안내</a></li>
					<li><a href="/informationUse/terminalInfo">터미널 안내</a></li>
					<li><a href="/informationUse/transportCompanyInfo">운송사 안내</a></li>
				</ul>
				<h4>고객센터</h4>
				<ul>
					<li><a href="/board/boardList">공지사항</a></li>
					<li><a href="/customerCenter/question">자주찾는 질문</a></li>
					<li><a href="/customerCenter/lostNfound">유실물센터 안내</a></li>
				</ul>
				<h4>기타</h4>
				<ul class="last">
					<li><a href="/busAssociation/chairmansMsg">전국고속버스운송사업조합</a></li>
					<li><a href="/terminalOperator/presidentsMessage">터미널사업자협회</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>