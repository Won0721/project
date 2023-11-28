<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<style type="text/css">
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_route_bg.jpg)
		center 0 no-repeat;
	background-size: cover;
}

.dialog {
	width: 700px;
	min-width: 460px;
	padding: 0;
	vertical-align: middle;
	border: 0;
	text-size-adjust: 100%;
	text-align: center;
}

.dialog .title {
	position: relative;
	background: #68b3ce;
	padding: 8px 0;
	font-size: 22px;
	color: #fff;
}

.dialog-close:before {
	font-family: Arial, "Helvetica CY", "Nimbus Sans L",
		sans-serif !important;
	font-size: 25px;
	line-height: 35px;
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	width: 35px;
	content: "\00d7";
	text-align: center;
}

.remodal-close {
	right: 0;
	left: inherit;
	width: 46px;
	height: 46px;
	color: #767676;
}

.route_box .text input {
	position: absolute;
	left: 148px;
	top: 110px;
	width: 1px !important;
	height: 1px !important;
	padding: 0;
	font-size: 0;
	color: #000;
	border: none;
	background: transparent;
	opacity: 0;
}

.route_box .date .date_wrap {
	display: block;
	position: absolute;
	top: 50%;
	right: 70px;
	margin-top: -13px;
}

.payment.select-box .selectric .button {
	display: none;
}

.payment.select-box .selectricItems {
	top: 23px;
	left: 0;
	position: relative;
	z-index: 10;
}
</style>
<head>
<style>

/*스크롤바 삭제*/
body::-webkit-scrollbar {
	display: none;
}

body {
	-ms-overflow-style: none; /* 인터넷 익스플로러 */
	scrollbar-width: none; /* 파이어폭스 */
}

.infoList {
	display: block;
	width: 100%;
	border: 0;
	background-color: transparent;
	height: 86px;
	text-align: left;
}
</style>
<title>시간표조회</title>

</head>
<body>
	<div class="breadcrumb">
		<ul class="breadcrumb_list">
			<li><a href="/" class="selectric tag1">HOME</a></li>
			<li>
				<div class="select-box">
					<div class="selectricWrapper selectric-select">
						<a class="selectric tag2">
							<p class="label">운행정보</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item">고속버스예매</a></li>
									<li class=""><a class="link-item"
										href="<c:url value='/adminFunction/companyList'/>">예매확인</a></li>
									<li class="selected"><a class="link-item">운행정보</a></li>
									<li class=""><a class="link-item">이용안내</a></li>
									<li class=""><a class="link-item">공지사항</a></li>
									<li class=""><a class="link-item">고객센터</a></li>
									<li class=""><a class="link-item">전국고속버스운송사업조합</a></li>
									<li class="last"><a class="link-item">터미널사업자협회</a></li>
								</ul>
							</div>
						</div>
						<input class="selectricInput" tabindex="0">
					</div>

				</div>
			</li>
			<!-- 예매확인 -->

			<!-- 운행정보 -->

			<li>
				<div class="select-box">
					<div class="selectricWrapper selectric-select">
						<div class="selectric">
							<p class="label">시간표조회</p>
							<b class="button">▾</b>
						</div>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class="selected"><a class="link-item"
										href="<c:url value='/adminFunction/lineInsert'/>">시간표조회</a></li>
									<li class="last"><a class="link-item">도착시간안내</a></li>
								</ul>
							</div>
						</div>
						<input class="selectricInput" tabindex="0">
					</div>
				</div>
			</li>
		</ul>
	</div>
	<div class="page time_table">
		<h3>노선조회</h3>
		<div class="route_box clfix">
			<ul class="place">
				<li>
					<button class="infoList" id="arrInfor">
						<span class="name">출발지</span>
						<p class="text empty">
							<span class="empty_txt">선택</span> <span class="val_txt"
								id="deprNmSpn"></span>
						</p>
						<!-- 값이 있을경우 p에 'empty' class가 없음 -->
					</button>
					<p class="btn_change" onclick="fnCrchDeprArvl();">출,도착지 교체</p>
				</li>
				<li>
					<button class="infoList" id="drrInfor">
						<span class="name">도착지</span>
						<p class="text empty">
							<span class="empty_txt">선택</span> <span class="val_txt"
								id="arvlNmSpn"></span>
						</p>
						<!-- 값이 없을경우 p에 'empty' class가 있음 -->
					</button>
				</li>
			</ul>
			<ul class="date">
				<li>
					<div class="date_picker_wrap">
						<span class="name">가는날</span>
						<p class="text">
							<span class="text_date" id="selectedDate"></span> <input
								type="text" id="datepicker1" readonly alt="달력" title="달력"
								onclick="showDatePicker()">

						</p>
						<span class="date_wrap"> <a href="#" id="deprThddChc">오늘</a>
							<a href="#" id="deprNxdChc">내일</a>
						</span>
					</div>
				</li>
			</ul>
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<script>
			$(function () {
			    var today = new Date();
			    var dd = today.getDate();
			    var mm = today.getMonth() + 1;
			    var yyyy = today.getFullYear();

			    if (dd < 10) {
			        dd = '0' + dd;
			    }

			    if (mm < 10) {
			        mm = '0' + mm;
			    }

			    var defaultDate = yyyy + '. ' + mm + '. ' + dd + '. ' + getDayName(today.getDay());
			    $("#selectedDate").text(defaultDate);
			    document.getElementById('book_date').value = defaultDate;
			    

			    $("#deprThddChc").click(function (e) {
			        e.preventDefault();
			        $("#datepicker1").datepicker("setDate", today);
			        updateSelectedDate(today);
			    });

			    $("#deprNxdChc").click(function (e) {
			        e.preventDefault();
			        var tomorrow = new Date(today);
			        tomorrow.setDate(tomorrow.getDate() + 1);
			        $("#datepicker1").datepicker("setDate", tomorrow);
			        updateSelectedDate(tomorrow);
			    });

			    $("#datepicker1").datepicker({
			        dateFormat: "yy.mm.dd",
			        showOn: "button",
			        buttonImage: "https://www.kobus.co.kr/images/page/ico_calender.png",
			        buttonImageOnly: true,
			        buttonText: "달력 열기",
			        minDate : today,
			        defaultDate: today,
			        onSelect: function (dateText, inst) {
			            var selectedDate = $("#datepicker1").datepicker("getDate");
			            updateSelectedDate(selectedDate);
			        }
			    });
			});

			function updateSelectedDate(date) {
			    var dd = date.getDate();
			    var mm = date.getMonth() + 1;
			    var yyyy = date.getFullYear();

			    if (dd < 10) {
			        dd = '0' + dd;
			    }

			    if (mm < 10) {
			        mm = '0' + mm;
			    }

			    var formattedDate = yyyy + '. ' + mm + '. ' + dd + '. ' + getDayName(date.getDay());
			    $("#selectedDate").text(formattedDate);
			    document.getElementById('book_date').value = formattedDate;
			   
			    
			}

			function getDayName(dayIndex) {
			    var days = ['일', '월', '화', '수', '목', '금', '토'];
			    return days[dayIndex];
			}
			    
			</script>
			<div class="grade">
				<span class="name">등급</span>
				<p>
					<span class="custom_radio gradeAll" style="margin-left: 54px;"
						onclick="selectGrade('전체');"> <input type="radio"
						id="busClsCd0" name="busClsCdR" checked onclick="fnBusClsCd(this)"
						value="0"> <label for="busClsCd0">전체</label>
					</span> <span class="custom_radio grade1" style="margin-left: 54px;"
						onclick="selectGrade('프리미엄');"> <input type="radio"
						id="busClsCd7" name="busClsCdR" onclick="fnBusClsCd(this)"
						value="7"> <label for="busClsCd7">프리미엄</label>
					</span> <span class="custom_radio grade2" style="margin-left: 54px;"
						onclick="selectGrade('우등');"> <input type="radio"
						id="busClsCd1" name="busClsCdR" onclick="fnBusClsCd(this)"
						value="1"> <label for="busClsCd1">우등</label>
					</span> <span class="custom_radio grade3" style="margin-left: 54px;"
						onclick="selectGrade('일반');"> <input type="radio"
						id="busClsCd5" name="busClsCdR" onclick="fnBusClsCd(this)"
						value="2"> <label for="busClsCd5">일반</label>
					</span>
				</p>
			</div>
			<p class="check" id="alcnSrchBtn">
				<button type="submit" form="rotInfFrm" class="btn_confirm ready"
					onclick="return validateForm();">조회하기</button>
			</p>
		</div>

		<!-- 조회결과 -->
		<div class="drive_info_wrap" name="readAlcnInqr" id="readAlcnInqr"
			style="display: none;">
			<p class="drive_info accent" id="takeDrtm"></p>
			<div class="detailBox">
				<div class="detailBox_body clfix">
					<ul class="time" id="timelistChk">
					</ul>
					<div class="bustime_wrap">
						<p class="bustime_head">
							<span class="start_time">출발시각</span>
							<!-- 170119 텍스트수정 -->
							<span class="bus_info">고속사/등급</span>
							<!-- tablet / mobile 사이즈에서 보임 -->
							<span class="bus_com">고속사</span>
							<!-- pc 사이즈에서만 보임 -->
							<span class="grade">등급</span>
							<!-- pc 사이즈에서만 보임 -->
							<span class="adult">어른요금</span> <span class="child">초등생요금</span>
							<span class="youth"> 중고생요금</span> <span class="remain">잔여석
								<span class="total_seat">/ 총 좌석</span>
							</span>
						</p>
						<div class="bus_time" id="alcnList">
							<!-- 동양고속 class="dyexpress" 삼화고속 class="samhwa" 중앙고속 class="jabus" 금호고속 class="kumho" 천일고속 class="chunil" 한일고속 class="hanil" 동부고속 class="dongbu" 금호속리산고속 class="songnisan" 코버스 class="kobus" -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- // 조회결과 -->
		<div class="section">
			<ul class="desc_list">
				<li>당일출발 차량의 경우 출발시간 1시간 전까지 홈페이지 예매가 가능하며 1시간 미만 출발임박 차량의 예매를
					원하시면 고속버스 모바일앱에서 예매하시기 바랍니다.</li>
				<li>1회 최대 예매 매수는 6매입니다. (일부 시외우등 노선에 한정하여 10매까지 예매가능)</li>
				<li>마일리지 구매 승차권은 프리미엄/편도 노선에 한정하여 각 1매씩 예매 가능합니다.(*회원대상)</li>
				<li>일반고속 청소년(중, 고등학생) 할인은 터미널 현장에서 학생증 및 청소년증을 제시 해야만 할인이 적용되며
					탑승 시 소지가 꼭 필요합니다.</li>
				<li>할인 승차권 부정 사용 시 운임의 10배 부가운임을 요구할 수 있습니다.</li>
			</ul>
		</div>
		<div class="section">
			<div class="customer_box">
				<p class="desc">노선안내 및 좌석여부 기타사항은 각 출발지 터미널 안내센터를 이용해 주시기 바랍니다.
				</p>
				<!-- <div class="info_tel">
							<span>고속버스 홈페이지 고객센터</span>
							<p><strong>1644-9030</strong>(전국 국번없이)</p>
						</div> -->
			</div>
		</div>
	</div>

	<!-- 팝업 상자 -->
	<dialog class="dialog" id="favDialog">
	<form method="dialog">
		<div
			class="remodal pop_place full remodal-is-initialized remodal-is-opened"
			style="padding: 0">

			<div class="title">
				출/도착지 선택
				<button class="remodal-close" id="Close"></button>
			</div>
			<div class="cont">
				<div class="place">
					<!-- focus -->
					<ul>
						<!-- 팝업창 -->
						<li id="popDeprChc" class="focuson">
							<!--  class="focuson" --> <span class="stit">출발지</span>
							<p class="text empty">
								<span class="empty_txt" style="display: none;"></span> <span
									class="val_txt" id="popDeprNmSpn"></span>
							</p>
						</li>
						<li id="popArvlChc"><span class="stit">도착지</span>
							<p class="text empty">
								<span class="empty_txt">선택</span> <span class="val_txt"
									id="popArvlNmSpn"></span>
							</p></li>
					</ul>

				</div>

				<div class="terminal_wrap">
					<p class="stit">지역별 터미널</p>
					<div class="ternimal_box">
						<div class="scroll-wrapper area_scroll scrollbar-inner"
							style="position: relative;">
							<div class="area_scroll scrollbar-inner scroll-content"
								style="height: 420px; margin-bottom: 0px; margin-right: 0px; max-height: none;">
								<ul class="area_list">
									<li class="active" id="areaListAll"><span
										onclick="fnDeprArvlViewList('all',this);">전체</span></li>
									<li><span onclick="fnDeprArvlViewList('1',this);">서울</span></li>
									<li><span onclick="fnDeprArvlViewList('2',this);">인천/경기</span></li>
									<li><span onclick="fnDeprArvlViewList('3',this);">강원</span></li>
									<li><span onclick="fnDeprArvlViewList('4',this);">대전/충남</span></li>
									<li><span onclick="fnDeprArvlViewList('5',this);">충북</span></li>
									<li><span onclick="fnDeprArvlViewList('6',this);">광주/전남</span></li>
									<li><span onclick="fnDeprArvlViewList('7',this);">전북</span></li>
									<li><span onclick="fnDeprArvlViewList('8',this);">부산/경남</span></li>
									<li><span onclick="fnDeprArvlViewList('9',this);">대구/경북</span></li>
								</ul>
							</div>
							<div class="scroll-element scroll-x">
								<div class="scroll-element_outer">
									<div class="scroll-element_size"></div>
									<div class="scroll-element_track"></div>
									<div class="scroll-bar" style="width: 100px;"></div>
								</div>
							</div>
							<div class="scroll-element scroll-y">
								<div class="scroll-element_outer">
									<div class="scroll-element_size"></div>
									<div class="scroll-element_track"></div>
									<div class="scroll-bar" style="height: 100px;"></div>
								</div>
							</div>
						</div>
						<!-- 터미널 선택 -->
						<div class="terminal_list" id="terminalList">
							<div class="scroll-wrapper terminal_scroll scrollbar-inner"
								style="position: relative;">
								<div
									class="terminal_scroll scrollbar-inner scroll-content scroll-scrolly_visible"
									style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 420px;">
									<ul class="clear" id="tableTrmList">
										<li class="terminalItem"><span></span></li>
									</ul>
								</div>
								<div class="scroll-element scroll-x scroll-scrolly_visible">
									<div class="scroll-element_outer">
										<div class="scroll-element_size"></div>
										<div class="scroll-element_track"></div>
										<div class="scroll-bar" style="width: 88px;"></div>
									</div>
								</div>
								<div class="scroll-element scroll-y scroll-scrolly_visible">
									<div class="scroll-element_outer">
										<div class="scroll-element_size"></div>
										<div class="scroll-element_track"></div>
										<div class="scroll-bar" style="height: 65px; top: 0px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>



			</div>


		</div>
	</form>
	</dialog>

	<!-- 서버로 터미널 조회 값 보내기 -->
	<form name="rotInfFrm" id="rotInfFrm" method="get" action="/book/book">
		<input type="hidden" name="deprCd" id="deprCd" value="">
		<!-- 출발지코드 -->

		<input type="hidden" name="arvlCd" id="arvlCd" value="">
		<!-- 도착지코드 -->

		<input type="hidden" name="bus_seatGrade" id="bus_seatGrade"
			value="전체">
		<!-- 등급 -->
		<input type="hidden" name="book_date" id="book_date" value="">
		<!-- 날짜 -->

	</form>

</body>


<script type="text/javascript"> 
function validateForm() {
    var deprCd = document.getElementById('deprCd').value;
    var arvlCd = document.getElementById('arvlCd').value;
    
    if (!deprCd || !arvlCd) {
        alert("예매하실 노선을 선택하세요.");
        return false;
    }

    return true;
}
<!-- 팝업창 스크립트 -->
function selectGrade(seat_grade){
		
		document.getElementById('bus_seatGrade').value = seat_grade;
	}
// 팝업창
var favDialog = document.getElementById("favDialog");

let state = 'start'
var DepText = null;
var ArvText = null;

// 팝업창 서울 , 경기 등등 선택기능
function fnDeprArvlViewList(city_num,obj) {

	var parentLi = obj.parentNode;
	var liElements = document.querySelectorAll(".area_list li");
	liElements.forEach(function(li) {
		if (li !== parentLi) {
		li.classList.remove('active');
		}
	});
	parentLi.classList.add('active');
	
	ajaxBook(city_num);
	
	console.log("fnDepr 기능 출발 터미널 : " + DepText);
	
}



// 팝업창 도시번호를 받아서 도시번호에 맞는 노선이 있는 출발터미널 출력
function ajaxBook(city_num){
	$('.empty_txt').show();
	$.ajax({
		type : "get",
		url : '<c:url value = "/book/ajax"/>',
		data :{
			city_num : city_num,
			DepText : DepText==null?'':DepText
		},
		success : function(data){
			insertTerminal(data, city_num, DepText)
			
		},
		error : function(a,b,c){
			console.log("오류");
		}
	});
}

// 터미널 선택 
function insertTerminal(data,city_num){
	var terminalList = $("#tableTrmList");
	terminalList.empty();
	for (var terminal of data) {
		
         var listItem = $("<li>").addClass("terminalItem").append($("<span>").text(terminal.te_code));
         terminalList.append(listItem);
        
         listItem.click(function(){
        	 let text = $(this).text();
        	 if(state == 'start'){
        		 DepText = text; // 출발지 값
        		 $('#popDeprNmSpn').text(DepText); // 팝업창 출발지 값
        		 state = 'end';
        		 console.log("출발지 값 : "+DepText);
        		 city_num = 'all';
        		 ajaxBook(city_num);  // 출발지 선택 시 city_num 이 all 값인 상태로 
        		 var liElements = document.querySelectorAll(".area_list li");
     	    	

     	    	 liElements.forEach(function(li) {
     	    			li.classList.remove('active');
     	    	 });
        		 $('#areaListAll').addClass("active");
        		 $("#popDeprChc").removeClass("focuson");
        		 $("#popArvlChc").addClass("focuson");
        		 
        		 //fetchTerminal(DepText);
        	 }else{
        		 ArvText = text // 도착지 값
        		 $('#popArvlNmSpn').text(ArvText); // 팝업창 도착지 값
        		 $('#deprNmSpn').text(DepText); // 출발지
        		 
        		 $('#arvlNmSpn').text(ArvText); // 도착지
        		 $('#arvlCd').value = ArvText;	// input 태그 value 값
        		 
        		 document.getElementById('deprCd').value = DepText; // input 태그 value 값
        		 document.getElementById('arvlCd').value = ArvText; // input 태그 value 값
        		 favDialog.close();
        		 if($('.val_txt') != null){
        			 $('.empty_txt').hide();
        		 }
        		 DepText = null;
        		 ArvText = null;
        		 
        		 $('#popDeprNmSpn').text(DepText);
        		 $('#popArvlNmSpn').text(ArvText); 
        		 state = 'start';
        		 
        		 //이후 작업
        	 }
         })
         
         var changeDep =  $('#popDeprChc');
         changeDep.click(function(){
        	 let space = '';
        	 if(state =='end'){
        		 state = 'start';
        		 // 출발지를 선택하게 되면 city_num 이 all 값으로 변경되면서 노선의 출발지 터미널들이 보이도록
        		 var liElements = document.querySelectorAll(".area_list li");
     	    	 liElements.forEach(function(li) {
     	    			li.classList.remove('active');
     	    	 });
     	    	 DepText = '';
     	    	 ajaxBook(city_num);
     	    	 $('#areaListAll').addClass("active");
        		 $("#popArvlChc").removeClass("focuson"); // 도착지 터미널 비활성화
        		 $("#popDeprChc").addClass("focuson"); // 출발지 터미널 활성화
        		 
        	 }
        	 
         })
       
    }
}

var terminalList = $("#tableTrmList");
var infoList = $(".infoList");
infoList.on("click", function () {
	 var city_num = "all"; // city_num이 "all"일 때의 값을 지정
	 if (typeof favDialog.showModal === "function") {
		    favDialog.showModal();
		    $("#popDeprChc").addClass("focuson"); // 출발지 터미널 활성화
   		 	$("#popArvlChc").removeClass("focuson"); // 도착지 터미널 비활성화
		  }
	 else {
		    alert("The <dialog> API is not supported by this browser");
		  }
	 ajaxBook(city_num, DepText);
	 
});
function fnCrchDeprArvl() {
	var depToArr = $('#arvlNmSpn').text(); // 도착지를 출발지로	
	var arrToDep = $('#deprNmSpn').text(); // 출발지를 도착지로
	document.getElementById('deprCd').value = depToArr; // input 태그 value 값
	document.getElementById('arvlCd').value = arrToDep; // input 태그 value 값
	$('#deprNmSpn').text(depToArr);
	$('#arvlNmSpn').text(arrToDep);
}

<!-- 팝업창 스크립트 -->
</script>
</html>