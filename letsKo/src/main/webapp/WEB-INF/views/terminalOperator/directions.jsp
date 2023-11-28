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
<title>찾아오시는 길</title>
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
							<p class="label">찾아오시는 길</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="<c:url value='/terminalOperator/presidentsMessage'/>">협회장 인사말</a></li>
									<li class=""><a class="link-item" href="<c:url value='/terminalOperator/corporateHistory'/>">연혁</a></li>
									<li class=""><a class="link-item" href="<c:url value='/terminalOperator/purposeNservices'/>">설립목적 및 사업</a></li>
									<li class=""><a class="link-item" href="<c:url value='/terminalOperator/organizationChart'/>">조직도</a></li>
									<li class="selected"><a class="link-item" href="<c:url value='/terminalOperator/directions'/>">찾아오시는 길</a></li>
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
		
		<div id="map" style="width:100%;height:400px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey="></script><!-- 앱키 입력 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(37.504603011619274, 127.0019000222782),
				level: 3
			};
	
			var map = new kakao.maps.Map(container, options);
			var marker = new kakao.maps.Marker({  
		        position: new kakao.maps.LatLng(37.504603011619274, 127.0019000222782) 
		    });

			marker.setMap(map);
		</script>
		
		<div class="box_contactUs">
			<h4>협회정보</h4>
			<ul>
				<li>
					<dl>
						<dt>주소</dt>
						<dd>서울 서초구 신반포로 176 센트럴시티터미널</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>예약·예매 및 조회 문의(전산장애 시)</dt>
						<dd>02-588-0753</dd>
					</dl>
				</li>
				<li class="last">
					<dl>
						<dt>팩스번호</dt>
						<dd>02-588-0754</dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>