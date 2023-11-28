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
							<p class="label">연혁</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="<c:url value='/busAssociation/chairmansMsg'/>">이사장 인사말</a></li>
									<li class="selected"><a class="link-item" href="<c:url value='/busAssociation/history'/>">연혁</a></li>
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
	
	
	<div class="page">
		<div class="noti_wrap taL">
			<p class="noti">전국고속버스운송사업조합의<br> 걸어온 길을 소개합니다.</p>
		</div>
		<p class="sub_visual"><img src="https://www.kobus.co.kr/images/page/img_business01.jpg" alt="연혁"></p>
		<div class="history_wrap">
			<div class="inner">
				<ul class="year year_1900">
					<li>
						<span class="txt_year">1969</span>
						<span class="txt_month">4.2</span>
						<dl>
							<dt>운영개시</dt>
							<dd>한진고속 20대 서울-인천간 운행개시</dd>
						</dl>
					</li>
					<li>
						<span class="txt_year">1970</span>
						<span class="txt_month">8.17</span>
						<dl>
							<dt>창립</dt>
							<dd>자동차운수사업법 제64조</dd>
						</dl>
					</li>
					<li>
						<span class="txt_year">1980</span>
						<span class="txt_month">9. 30</span>
						<dl>
							<dt>해산</dt>
							<dd>운수단체 통폐합</dd>
						</dl>
					</li>
					<li>
						<span class="txt_year">1983</span>
						<span class="txt_month">8.10</span>
						<dl>
							<dt>재설립</dt>
							<dd>여객자동차운수사업법 제55조</dd>
						</dl>
					</li>
					<li class="noYear">
						<span class="txt_month">9.17</span>
						<dl>
							<dt>교통부승인</dt>
							<dd class="noTxt"></dd>
						</dl>
					</li>
					<li class="noYear">
						<span class="txt_month">10. 26</span>
						<dl>
							<dt>법인등기</dt>
							<dd class="noTxt"></dd>
						</dl>
					</li>
					<li>
						<span class="txt_year">1992</span>
						<span class="txt_month">10. 23</span>
						<dl>
							<dt>심야우등 개시</dt>
							<dd>우등고속버스 운행제도 도입</dd>
						</dl>
					</li>
					<li>
						<span class="txt_year">1993</span>
						<span class="txt_month">9. 21</span>
						<dl>
							<dt>대통령표창</dt>
							<dd class="noTxt"></dd>
						</dl>
					</li>
				</ul>
				<ul class="year year_2000 last">
					<li>
						<span class="txt_year">2001</span>
						<span class="txt_month">4.16</span>
						<dl>
							<dt>고속버스 통합정보 시스템 서비스 개시</dt>
							<dd class="noTxt"></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>				
		<div class="history_ceo">
			<h4>역대 이사장</h4>
			<ul class="ceo_list">
				<li>
					<div class="inner">
						<span class="box_name">이동보</span>
						<div class="ceo_desc">
							<span class="txt_puple">초대</span>
							<span class="txt_standing">코오롱고속</span>
							<span class="txt_term">‘83. 10. 26 ~‘87. 06. 29</span>
						</div>
					</div>
				</li>
				<li>
					<div class="inner">
						<span class="box_name">최갑석</span>
						<div class="ceo_desc">
							<span class="txt_puple">2~4대</span>
							<span class="txt_standing">상임</span>
							<span class="txt_term">‘87. 07. 30 ~ ‘96. 08. 09</span>
						</div>
					</div>
				</li>
				<li>
					<div class="inner">
						<span class="box_name">성기수</span>
						<div class="ceo_desc">
							<span class="txt_puple">5대</span>
							<span class="txt_standing">상임</span>
							<span class="txt_term">‘96. 08. 10 ~ ’99. 08. 09</span>
						</div>
					</div>
				</li>
				<li>
					<div class="inner">
						<span class="box_name">김병운</span>
						<div class="ceo_desc">
							<span class="txt_puple">6대</span>
							<span class="txt_standing">상임</span>
							<span class="txt_term">‘99. 08. 10 ~ ’02. 08. 20</span>
						</div>
					</div>
				</li>
				<li>
					<div class="inner">
						<span class="box_name">김석균</span>
						<div class="ceo_desc">
							<span class="txt_puple">7대</span>
							<span class="txt_standing">상임</span>
							<span class="txt_term">‘02. 08. 21 ~ ’05. 12. 05</span>
						</div>
					</div>
				</li>
				<li>
					<div class="inner">
						<span class="box_name">박정희</span>
						<div class="ceo_desc">
							<span class="txt_puple">8대</span>
							<span class="txt_standing">상임</span>
							<span class="txt_term">‘06. 02. 10 ~ ’09. 08. 10</span>
						</div>
					</div>
				</li>
				<li>
					<div class="inner">
						<span class="box_name">이정만</span>
						<div class="ceo_desc">
							<span class="txt_puple">9대</span>
							<span class="txt_standing">상임</span>
							<span class="txt_term">‘09. 09. 01 ~ ‘12. 09. 30</span>
						</div>
					</div>
				</li>
				<li>
					<div class="inner">
						<span class="box_name">조종배</span>
						<div class="ceo_desc">
							<span class="txt_puple">10대</span>
							<span class="txt_standing">상임</span>
							<span class="txt_term">‘12. 10. 01 ~ ‘16. 08. 31</span>
						</div>
					</div>
				</li>
				<li>
					<div class="inner">
						<span class="box_name">박명주</span>
						<div class="ceo_desc">
							<span class="txt_puple">11대</span>
							<span class="txt_standing">상임</span>
							<span class="txt_term">‘16. 09. 01 ~ 19. 11. 30</span>
						</div>
					</div>
				</li>
				<li>
					<div class="inner">
						<span class="box_name">이광재</span>
						<div class="ceo_desc">
							<span class="txt_puple">12대</span>
							<span class="txt_standing">상임</span>
							<span class="txt_term">‘19. 12. 01 ~ 23. 08. 31</span>
						</div>
					</div>
				</li>
				<li>
					<div class="inner">
						<span class="box_name">김용성</span>
						<div class="ceo_desc">
							<span class="txt_puple">13대</span>
							<span class="txt_standing">상임</span>
							<span class="txt_term">‘23. 09. 01 ~ 현재</span>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>