<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_route_bg.jpg)
		center 0 no-repeat;
	background-size: cover;
}
/*헤더 밑 드랍다운 css*/
.breadcrumb_list li, .breadcrumb_list a {
	margin: 0;
	padding: 0;
	font-weight: normal;
	color: #666;
	font-family: 'Malgun Gothic', '맑은고딕', sans-serif;
	font-size: 12px;
	line-height: 1.5;
	letter-spacing: -0.03em;
}

.breadcrumb ul.breadcrumb_list>li {
	float: left;
	height: 49px;
	line-height: inherit !important;
	border-right: 1px solid #e6e6e6;
}

.selectricInput {
	position: absolute !important;
	top: 0 !important;
	left: 0 !important;
	overflow: hidden !important;
	clip: rect(0, 0, 0, 0) !important;
	margin: 0 !important;
	padding: 0 !important;
	width: 1px !important;
	height: 1px !important;
	outline: none !important;
	border: none !important;
	background: none !important;
}.empty_route{
	height: auto;
    padding: 15px;
    text-align: center;
    border-bottom: 1px solid #e6e6e6;
}.accent{
	    display: inline;
    vertical-align: top;
}.infor {
	z-index: 10;
}.bus_time a{
	display: inline-block;
    width: auto;
    height: auto;
    line-height: 30px;
    margin-top: 10px;
}
/*헤더 밑 드랍다운 css*/
/* 스크롤바 제거 */
body::-webkit-scrollbar {
	display: none;
}

body {
	-ms-overflow-style: none; /* 인터넷 익스플로러 */
	scrollbar-width: none; /* 파이어폭스 */
}
/* 스크롤바 제거 */
</style>
<title>고속버스 예매</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(function () {
	var dt = new Date();
    var year = dt.getFullYear();
    var month = dt.getMonth() + 1;  // 월은 0부터 시작하므로 1을 더합니다.
    var day = dt.getDate();
    var hour = dt.getHours();
	console.log("month", month);
	console.log("hour" , hour);
	// 날짜와 시간을 합치기
	var combinedDate = year + '' + (month < 10 ? '0' + month : month) + '' + (day < 10 ? '0' + day : day);
	console.log("combinedDate", combinedDate);
	
    // 출발 시간이 더 빠른 경우 noselect 클래스 추가 및 클릭 이벤트 비활성화
    $(".bus_time a").each(function () {
    	var departureTime = parseInt($(this).find('.dr_depPlandTime').text());
    	var depPlandDateText = $(this).find('.dr_depPlandDate').text();

        // 정규식을 사용하여 하이픈을 제외한 숫자만 추출합니다.
        var depPlandDate = depPlandDateText.replace(/-/g, '');

        // depPlandDate를 년도, 월, 일로 분리
        
		console.log("departureTime" , departureTime);
		console.log("depPlandDate" , depPlandDate);
		
		
        if (depPlandDate <= combinedDate && departureTime <= hour) {
            $(this).addClass("noselect").removeAttr("href").click(function (e) {
                e.preventDefault();
            });
        }
    });
});
</script>
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
							<p class="label">고속버스 조회</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class="selected"><a class="link-item"
										href="<c:url value='/book/bookSearch'/>">고속버스예매</a></li>
									<li class=""><a class="link-item"
										href="<c:url value='/book/book'/>">예매확인</a></li>
									<li class=""><a class="link-item"
										href="<c:url value='/book/book'/>">운행정보</a></li>
									<li class=""><a class="link-item"
										href="<c:url value='/book/book'/>">이용안내</a></li>
									<li class=""><a class="link-item"
										href="<c:url value='/book/book'/>">공지사항</a></li>
									<li class=""><a class="link-item"
										href="<c:url value='/book/book'/>">고객센터</a></li>
									<li class=""><a class="link-item"
										href="<c:url value='/book/book'/>">전국고속버스운송사업조합</a></li>
									<li class="last"><a class="link-item"
										href="<c:url value='/book/book'/>">터미널사업자협회</a></li>
								</ul>
							</div>
						</div>
						<input class="selectricInput" tabindex="0">
					</div>

				</div>
			</li>
		</ul>
	</div>
	<!-- 헤더 밑 드랍다운 -->
	<div class="page">



		<h3>배차조회</h3>
		<div class="buscheck_wrap clfix">
			<!-- 좌측 infoBox -->

			<div class="infoBox">


				<p class="date" id="alcnDeprDtm">${book_date}</p>



				<div class="route_wrap" id="alcnRotInfo">
					<div class="inner">
						<p class="roundBox departure" id="alcnDeprTmlNm">${te_depTerminalId}</p>

						<p class="roundBox arrive" id="alcnArvlTmlNm">${te_arrTerminalId}</p>
					</div>
					<div class="detail_info">

						<span id="takeDrtm"> <c:choose>
								<c:when test="${driveEx ne null}">
									<c:set var="hours" value="${driveEx.lineVo.li_travelTime.hour}" />
									<c:set var="minutes"
										value="${driveEx.lineVo.li_travelTime.minute}" />
									<c:out value="${hours}시간${minutes}분" />
								</c:when>
								<c:otherwise>0분</c:otherwise>
							</c:choose>
						</span> <span id="dist">${distance}Km</span>						
					</div>
					<div class="btn_r">
						<a href="/book/bookSearch" class="btn btn_modify white">수정</a>
					</div>
				</div>

				<a href="#" class="btn_price">요금보기</a>
				<div class="price_info bottom" id="alcnPriceInf">
					<p class="stit">
						요금정보 <span>(일반요금)</span>
					</p>
					<dl>
						<dt class="">우등</dt>
						<dd>${mid}원</dd>
						<dt class="">프리미엄</dt>
						<dd>${high}원</dd>
						<dt class="">일반</dt>
						<dd>${bottom}원</dd>
					</dl>
				</div>
				
			</div>
			<!-- //좌측 infoBox -->

			<!-- 우측 detailBox -->
			<div class="detailBox">
				<div class="detailBox_head col3">
					<div class="box_refresh">
						
					</div>
					<div class="head_date">
						<span class="date_cont" id="rideDate">${book_date}</span>
						
					</div>
				</div>
				<div class="detailBox_body clfix">
					<ul class="time">


						<li class="night"><a href="#none" class="noselect"
							data-time="01">1</a></li>

						<li class="night"><a href="#none" class="noselect"
							data-time="03">3</a></li>

						<li class="night"><a href="#none" class="noselect"
							data-time="05">5</a></li>

						<li class="daytime"><a href="#none" class="noselect"
							data-time="07">7</a></li>

						<li class="daytime active"><a href="#none" class="noselect"
							data-time="09">9</a></li>

						<li class="daytime"><a href="#none" class="" data-time="11">11</a></li>

						<li class="daytime"><a href="#none" class="" data-time="13">13</a></li>

						<li class="daytime"><a href="#none" class="" data-time="15">15</a></li>

						<li class="daytime"><a href="#none" class="" data-time="17">17</a></li>

						<li class="daytime"><a href="#none" class="" data-time="19">19</a></li>

						<li class="night"><a href="#none" class="" data-time="21">21</a></li>

						<li class="night"><a href="#none" class="" data-time="23">23</a></li>



					</ul>

					<div class="bustime_wrap">
						<p class="bustime_head">
							<span class="start_time">출발</span> <span class="bus_info">고속사/등급</span>
							<!-- tablet / mobile 사이즈에서 보임 -->
							<span class="bus_com">고속사</span>
							<!-- pc 사이즈에서만 보임 -->
							<span class="grade">등급</span>							
							<span class="remain">잔여석</span> <span
								class="status"></span>
						</p>
						<div class="bus_time">
							<div class="noti" id="notiNoToday" style="display: none;">
								<!-- 현시점 기준 출발 5분~60분 남은 차량의 경우 배차정보는 노출하되 예매진행 불가처리하여 고속버스 모바일앱 안내 노출 -->
								<p>
									<span class="accent">출발예정 60분전</span> 배차 차량은 고속버스 모바일앱을 통하여 예매할
									수 있습니다.<br> <span class="show_pc">곧 출발하는 버스탑승을 하시려면
										지금 바로 고속버스 모바일앱으로 접속하세요.</span><br> 임시차량은 공동운수협정차량이 운행될 수도 있습니다.
								</p>

							</div>
							
							<c:forEach items="${driveList}" var="drive">

								<p class="">
									<a href="/book3/selectSeats?dr_num=${drive.dr_num}" class=""
										onclick="fnSatsChc('20231101','113000','113000','010','852','1','11','0','Y','N','010','852','N','N','N','N');">

										<span class="start_time dr_depPlandTime">${drive.dr_depPlandTime}</span>
										<span class="dr_depPlandDate" style="display :none;">${drive.dr_depPlandDate}</span>
										<span class="bus_info "> <c:forEach
												items="${drive.busVo.companyVo.companyFileVoList}"
												var="companyfile">
												<img src="<c:url value='/download${companyfile.cf_name}'/>"
													alt="..." height="25px" />
											</c:forEach> <span class="grade_mo">${drive.dr_reservationAvailable}</span>
									</span> <!-- tablet / mobile 사이즈에서 보임 --> <span class="bus_com">
											<c:forEach items="${drive.busVo.companyVo.companyFileVoList}"
												var="companyfile">
												<img src="<c:url value='/download${companyfile.cf_name}'/>"
													alt="..." height="25px" />
											</c:forEach>
									</span> <!-- pc 사이즈에서만 보임 --> <span class="grade">${drive.busVo.bus_seatGrade}
											<span class="via"></span>
									</span> <!-- pc 사이즈에서만 보임 --> <span class="temp"></span> <span
										class="remain">${drive.dr_reservationAvailable}석 </span> <span
										class="status"> <span class="accent btn_arrow">선택</span>
									</span>
					        
									</a>
								</p>
							</c:forEach>						
					      <c:if test="${empty driveList}">
						    <div class="empty_route" style="border-bottom: 1px solid #e6e6e6;">
						        <p>
						            조회되는 배차가 없습니다. <br>
						            <p class="accent">배차정보에 관한 사항은 출발지 터미널</p> 로 문의하시기 바랍니다.
						        </p>
						        <a href="/book/bookSearch" class="btnS btn_normal">노선선택하기</a>
						    </div>
						 </c:if>
						</div>
					</div>
				</div>
			</div>
			<!-- //우측 detailBox -->
		</div>	
		<div class="section">
			<ul class="desc_list">
			
				<li>심야고속 및 심야우등의 할증 요금은 당일 02:00부터 04:00 사이 출발차량</li>
				<li>노선에 따라 심야요금과 심야할증요금이 동일할 수도 있음</li>
				<li>마일리지 구매 승차권은 프리미엄/편도 노선(일부노선 제외)에 한정하며 각 1매씩 예매 가능(*회원대상)</li>
				<li>유아 카시트 가능( <img src="/images/page/ico_child_on.png" alt=""
					style="width: 13px"> ) 표시된 차량에만 유아 카시트 장착 가능 (본인 소유의 유아 카시트
					준비)
				</li>
				<li>소요(도착)시간은 도로 사정에 따라 지연될 수 있음</li>
				<!-- 190925 추가 -->
				<li>휠체어 탑승 가능( <img src="/images/page/ico_wheel_on.png" alt=""
					style="width: 13px"> ) 표시된 차량에만 휠체어 동반 탑승 가능 (전동식 휠체어만 탑승 가능)
				</li>
				<li>휠체어 좌석 예매는 wkobus 사이트에서 예매 가능하며, 휠체어 좌석 예매는 출발일로 부터 3일 전까지만
					가능<br>(*휠체어 좌석 예매가 없을 시 출발일 이틀 전부터 일반석 예매 가능)
				</li>
				<!-- // 190925 추가 -->
			</ul>
		</div>
	</div>

</body>
<script type="text/javascript">


$(function(){
	var dt = new Date();		//오늘날짜 전체
	var yyyy  = dt.getFullYear();		//선택한 년도
	var mm    = dt.getMonth()+1;		//선택한 월
	var mm2Len = Number(mm) < 10 ? "0"+mm : mm;			// 선택ㅡㅜ?ㅌ월 ex:01 두글자로 변환
	var ddTo    = Number(dt.getDate()) < 10 ? "0"+dt.getDate() : dt.getDate(); 			// 숫자형
	var yymmddD0 = yyyy+""+mm2Len+""+ddTo;		//오늘날짜
	
	var url = window.location.pathname;

	if (yymmddD0 < 20200128) {
		$("#rotinf").hide();
	}
});

</script>

</html>