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
							<p class="label">연혁</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="<c:url value='/terminalOperator/presidentsMessage'/>">협회장 인사말</a></li>
									<li class="selected"><a class="link-item" href="<c:url value='/terminalOperator/corporateHistory'/>">연혁</a></li>
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
	
	<div class="page">
		<div class="noti_wrap taL">
			<p class="noti">터미널사업자협회의<br>걸어온 길을 소개합니다.</p>
		</div>
		<p class="sub_visual"><img src="https://www.kobus.co.kr/images/page/img_history01.jpg" alt="연혁"></p>
		<div class="history_wrap">
			<div class="inner">
				<ul class="year year_1900 last">
					<li>
						<span class="txt_year">1977</span>
						<span class="txt_month">5. 17</span>
						<dl>
							<dt>전국버스정류장협회 창설</dt>
							<dd>민법 제32조</dd>
						</dl>
					</li>
					<li>
						<span class="txt_year">1993</span>
						<span class="txt_month">9. 14</span>
						<dl>
							<dt>전국여객자동차터미널사업자협회로 명칭 변경</dt>
							<dd>여객자동차운수사업법 제 55조</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>				
		<div class="history_ceo">
			<h4>협회 개요</h4>
			<div class="row">
				<p class="imgBox"><img src="https://www.kobus.co.kr/images/page/img_association.png" alt="협회로고"></p>
				<div class="box_intro">
					<table class="tbl_intro">
						<caption>협회개요</caption>
						<colgroup>
							<col style="width:65px;">
							<col style="width:auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">회사명</th>
								<td>전국여객자동차터미널사업자협회</td>
							</tr>
							<tr>
								<th scope="row">대표자</th>
								<td>석종호</td>
							</tr>
							<tr>
								<th scope="row">설립일</th>
								<td>1977년 5월17일</td>
							</tr>
							<tr>
								<th scope="row">소재지</th>
								<td>서울시 서초구 서초동 1446-1</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>