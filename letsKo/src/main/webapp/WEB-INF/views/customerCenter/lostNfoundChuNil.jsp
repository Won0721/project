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
		<!-- 천일고속 -->
		<div class="com_info clfix">
			<p class="img">
				<img src="https://www.kobus.co.kr/images/page/lost_com5_s.png" alt="CHUNIL EXPRES" class="hide_mo"> 
			</p>
			<p class="info">부산시 동구 초량동 1211-9</p>
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
						<td class="branch">서울(경부선)</td>
						<td class="tel"><span> 02-535-3161 </span></td>
					</tr>
					<tr>
						<td class="branch">서울 서부(호남선)</td>
						<td class="tel"><span>02-594-1001</span></td>
					</tr>
					<tr>
						<td class="branch">동서울</td>
						<td class="tel"><span>02-446-1011</span></td>
					</tr>
					<tr>
						<td class="branch">부산</td>
						<td class="tel"><span>051-508-9901</span></td>
					</tr>
					<tr>
						<td class="branch">대구</td>
						<td class="tel"><span> 053-755-1001 </span></td>
					</tr>
					<tr>
						<td class="branch">대전</td>
						<td class="tel"><span> 042-622-1001 </span></td>
					</tr>
					<tr>
						<td class="branch">경주</td>
						<td class="tel"><span> 054-772-1001 </span></td>
					</tr>
					<tr>
						<td class="branch">포항</td>
						<td class="tel"><span> 054-272-1001 </span></td>
					</tr>
					<tr>
						<td class="branch">울산</td>
						<td class="tel"><span> 052-261-1001 </span></td>
					</tr>
					<tr>
						<td class="branch">순천 </td>
						<td class="tel"><span>061-745-1008</span></td>
					</tr>
					<tr>
						<td class="branch">여수 </td>
						<td class="tel"><span> 061-653-1001 </span></td>
					</tr>
					<tr>
						<td class="branch">전주</td>
						<td class="tel"><span> 063-275-1001 </span></td>
					</tr>
					<tr>
						<td class="branch">군산</td>
						<td class="tel"><span> 063-445-8517 </span></td>
					</tr>
					<tr>
						<td class="branch">인천</td>
						<td class="tel"><span>032-439-2001</span></td>
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