<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <style type="text/css">
    *, *::before, *::after {
       box-sizing: border-box;
   }button {
    appearance: auto;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    box-sizing: border-box;
    background-color: buttonface;
    writing-mode: horizontal-tb !important;
    margin: 0em;
    padding-block: 1px;
    padding-inline: 6px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonborder;
    border-image: initial;
} li{display: list-item;}
    div {
    display: block;
   }*, *::before, *::after {
    box-sizing: border-box;}
   body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, thead, tbody, tr, th, td, form, fieldset, legend, input, textarea, button, a {
    margin: 0;
    padding: 0;
    font-weight: normal;
    color: #666;
    font-family: 'Malgun Gothic', '맑은고딕', sans-serif;
    font-size: 12px;
    line-height: 1.5;
    letter-spacing: -0.03em;}
   li {
    display: list-item;
    text-align: -webkit-match-parent;
   }
   ul, ol {
   display:block;
    list-style: none;}
    ul{}
    body {
    background: url(https://www.kobus.co.kr/images/common/loading.gif) no-repeat -9999px -9999px;
   }
.title_wrap h2 {
    font-size: 34px;
    color: #fff;
    text-align: center;
   }   
 .selectric .label {
    display: block;

    overflow: hidden;
    margin: 0 30px 0 0;
    font-size: 13px;
    color: #666;
    line-height: 49px;
    white-space: nowrap;
}.selectric .button {
    display: block;
    position: absolute;
    right: 0;
    top: 50%;
    width: 11px;
    height: 6px;
    margin-top: -3px;
    background: url(https://www.kobus.co.kr/images/common/bu_selectArrow.png) 0 0 no-repeat;
    text-indent: -99999px;
}
html:first-child select {
    padding-right: 6px;
    height: 20px;
}.selectricHideSelect {
    position: relative;
    overflow: hidden;
    width: 0;
    height: 0;
    overflow: hidden;
    margin: 0 30px 0 0;
    font-size: 13px;
    color: #666;
    line-height: 49px;
    white-space: nowrap;
}.selectric .button {
    display: block;
    position: absolute;
    right: 0;
    top: 50%;
    width: 11px;
    height: 6px;
    margin-top: -3px;
    background: url(https://www.kobus.co.kr/images/common/bu_selectArrow.png) 0 0 no-repeat;
    text-indent: -99999px;
}
html:first-child select {
    padding-right: 6px;
    height: 20px;
}.selectricHideSelect select {
    position: absolute;
    left: -100%;
    display: none;

}option {
    vertical-align: middle;
    padding: 3px 0;
    font-weight: normal;
    display: block;
    white-space-collapse: collapse;
    text-wrap: nowrap;
    min-height: 1.2em;
}select:not(:-internal-list-box) {
    overflow: visible !important;
}.page {
    width: 100%;
    max-width: 960px;
    min-width: 708px;
    margin: 0 auto;
    padding: 30px 0px 100px;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.bnr_app.bnr_pc {
    display: block;
    width : 960px;
    height: 101px;
}.bnr_app {

    position: relative;
    background: #95cadd;
    min-height: 100px;
    margin-bottom: 15px;
    padding: 34px 280px 34px 30px;
    color: #fff;
    font-size: 22px;
    text-align: left;
    box-sizing: border-box;
}.bnr_app strong {
    display: inline;
    font-size: 22px;
    font-weight: bold;
}.bnr_app:after {
    display: inline-block;
    content: '';
    position: absolute;
    right: 40px;
    bottom: 0;
    width: 222px;
    height: 89px;
    background: url(https://www.kobus.co.kr/images/page/bnr_app_s.png) 0 0 no-repeat;
}.route_box .place{
   float:left;
}
.time_table .route_box {
    padding: 8px;
    box-sizing: border-box;
    width: 960px;
}.route_box {
    max-width: 960px;
    margin-top: 25px;
    border: 1px solid #e6e6e6;
}.clfix {
    display: block;
    zoom: 1;
}.route_box .place, .route_box ul.date {
    overflow: hidden;
    background: #fff;
}.route_box .place, .route_box .date li {
    height: 112px;
}.route_box .place{
   width:467px;
}.route_box .place li:first-child, .route_box ul.date li:first-child {
    float: left;
}.route_box .place li {
    float: right;
    position: relative;
    background: #f3f4f6;
    width: -webkit-calc(50% - 4px);
    width: -moz-calc(50% - 4px);
    width: calc(50% - 4px);
    height: 100%;   
}.route_box .place li, .route_box .grade, .route_box .date li {
    padding: 12px 15px;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}.selectricHideSelect select {
    position: absolute;
    left: -100%;
    display: none;
}
html:first-child select {
    padding-right: 6px;
    height: 20px;
}
.route_box .place li > a {
    display: block;
}.route_box .name {
    display: block;
    font-size: 14px;
    color: #333;
}.route_box .date, .route_box .check {
    float: right;
}.route_box .place, .route_box .date, .route_box .grade, .route_box .check {
    
    width: -webkit-calc(50% - 4px);
    width: -moz-calc(50% - 4px);
    width: calc(50% - 4px);
}.route_box .place .text {
    line-height: 1.2;
}.route_box .text {
    height: 60px;
    padding: 5px 0 0;
    font-size: 24px;
    color: #000;
    line-height: 1.3;
}.route_box .text.empty .empty_txt {
    display: block;
    color: #b3b3b3;
}.route_box .place li:first-child, .route_box ul.date li:first-child {showDatePicker()
    float: left;
}.route_box div.date, .route_box ul.date li {
    position: relative;
    
}.route_box .place .btn_change {
    position: absolute;
    top: 40px;
    right: -17px;
    background: url(https://www.kobus.co.kr/images/page/arrow_toggle_s.png) 0 0 no-repeat;
    width: 30px;
    height: 30px;
    font-size: 0;
    z-index: 50;
    cursor: pointer;
}
.route_box .place li:first-child, .route_box ul.date li:first-child {
    float: left;
}.route_box ul.date li {
    background: #f3f4f6;
    width: 100%;
    padding: 0;
}.date_picker_wrap {
    position: relative;
    height: 100%;
    padding: 12px 15px;
    box-sizing: border-box;
}.route_box .text .text_date {
    display: block;
    height: 100%;
    padding: 0;
    font-size: 24px;
    color: #000;
}.date_picker_wrap .ui-datepicker-trigger {
    display: block;
    position: absolute;
    right: 20px;
    top: 50%;
    width: 28px;
    height: 26px;
    margin-top: -13px;
    font-size: 0;
    cursor: pointer;
}.route_box .text input {
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

}.route_box .date .date_wrap {
    display: block;
    position: absolute;
    top: 50%;
    right: 70px;
    margin-top: -13px;
}.route_box .date_wrap a:first-child {
    margin-left: 0;
}.route_box .date_wrap a {
    margin-right: 0;
    font-size: 16px;
}.route_box .date_wrap a {
    margin-left: 20px;
    margin-right: 0;
}.time_table .route_box .box_inputForm.inselect {
    float: left;
    width: -webkit-calc(50% - 4px);
    width: -moz-calc(50% - 4px);
    width: calc(50% - 4px);
    height: 84px;
    margin-top: 8px;
    padding: 12px 0;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}.box_inputForm {
    position: relative;
    padding: 7px 12px;
    background-color: #f3f4f6;
    text-align: left;
}.box_inputForm.inselect strong {
    margin-left: 12px;
    font-weight: bold;
}.box_inputForm.inselect .select-box {
    padding: 0 !important;
}.payment.select-box {
    margin: 6px 0;
    padding: 0 12px;
}.click_box:after {
    display: inline-block;
    content: '';
    position: absolute;
    right: 0;
    bottom: 0;
    background: url(https://www.kobus.co.kr/images/page/input_after.png) 0 0 no-repeat;
    background-size: 100%;
    width: 8px;
    height: 8px;
}

.selectricHideSelect {
    position: relative;
    overflow: hidden;
    width: 0;
    height: 0;
}.payment.select-box .selectricWrapper {
    padding: 0;
}.payment.select-box select {
    font-size: 16px;
    width: 100%;
    height: 28px;
}html:first-child select {
    padding-right: 6px;
    height: 20px;
}.selectricHideSelect select {
    position: absolute;
    left: -100%;
    display: none;
}.selectric {
    position: relative;
    height: 100%;
   }.selectricWrapper {
    position: relative;
    height: 100%;
    padding: 0 18px;
    cursor: pointer;
}
.payment.select-box .label.add {
    color: #000;
}.payment.select-box .selectric .label {
    padding-left: 12px;
    font-size: 16px;
    line-height: 20px;
}.payment.select-box .selectric .button {
    display: none;
}
.payment.select-box .selectricItems {
    top: 23px;
    left: 0;
    position: relative;
    z-index: 10;
}.selectricItems {
    display: none;
    position: absolute;
    top: 100%;
    left: -1px;
    background: #f7f7f7;
    border: 1px solid #e5e5e5;
    z-index: -1;
    box-shadow: 3px 3px 3px rgba(0,0,0,0.07);
}.selectricItems ul {
    list-style: none;
    padding: 0;
    margin: 0;
}.selectricItems ul li {
    padding: 5px;
    cursor: pointer;
}.route_box .check {
    background: #b8becc;
    text-align: center;
    height: 84px;
    margin-top: 8px;
    float: right;
    width: calc(50% - 4px);
}.route_box .check * {
    display: block;
    width: 100%;
    color: #fff;
    font-size: 18px;
    font-weight: bold;
    line-height: 84px;
}.btn_cancel, .btn_confirm.ready, .btn_normal {
    background: #b8becc;
    color: #fff;
    border: none;
}.clfix:after {
    content: '.';
    display: block;
    height: 0px;
    clear: both;
    visibility: hidden;
}.route_box + .section, * + .desc_list, .section > .desc_list:first-child {
    margin-top: 15px;
}.desc_list li, p.bul {
    padding-left: 8px;
    text-indent: -8px;
}.desc_list li:before, p.bul:before {
    display: inline-block;
    content: '';
    background: #919191;
    width: 2px;
    height: 2px;
    margin: 0 6px 3px 0;
}.desc_list li a {
    font-size: inherit;
}a.accent {
    text-decoration: underline;
}.accent {
    color: #68b3ce;
}.desc_list li + li {
    margin-top: 5px;
}.route_box .place li:after, .route_box ul.date li:after{
    display: inline-block;
    content: '';
    position: absolute;
    right: 0;
    bottom: 0;
    background: url(https://www.kobus.co.kr/images/page/input_after.png) 0 0 no-repeat;
    background-size: 100%;
    width: 8px;
    height: 8px;
}.title_wrap {
   background: url(https://www.kobus.co.kr/images/page/visual_drivingInfoT.jpg) center 0 no-repeat;
   background-size: cover;
   }
.infor{
z-index :10;
}
.gradeList ul li { padding-left : 10px;

}.infoList {
	display: block;
	width: 100%;
	border: 0;
	background-color: transparent;
	height: 86px;
	text-align: left;
}.dialog {
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
    </style>
<head>
<style>

/*스크롤바 삭제*/
body::-webkit-scrollbar {
  display: none;
}
body{
  -ms-overflow-style: none; /* 인터넷 익스플로러 */
  scrollbar-width: none; /* 파이어폭스 */
}
</style>
   <title>시간표조회</title>

</head>
<body>
<div class="breadcrumb">
   <ul class="breadcrumb_list">
      <li><a href="/" class ="selectric tag1">HOME</a></li>
      <li>
         <div class="select-box">
            <div class="selectricWrapper selectric-select">      
                 <a class="selectric tag2">
                    <p class="label">운행정보</p>
                  <b class="button">▾</b>
                 </a>
               <div class="selectricItems infor" tabindex="-1" >
                  <div class="selectricScroll">
                     <ul>
                        <li class=""><a class ="link-item">고속버스예매</a></li>
                        <li class=""><a class ="link-item" href="<c:url value='/adminFunction/companyList'/>">예매확인</a></li>
                        <li class="selected"><a class ="link-item">운행정보</a></li>
                        <li class=""><a class ="link-item">이용안내</a></li>
                        <li class=""><a class ="link-item">공지사항</a></li>
                        <li class=""><a class ="link-item">고객센터</a></li>
                        <li class=""><a class ="link-item">전국고속버스운송사업조합</a></li>
                        <li class="last"><a class ="link-item">터미널사업자협회</a></li>
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
                           <li class="selected"><a class ="link-item"  href="<c:url value='/adminFunction/lineInsert'/>">시간표조회</a></li>
                           <li class="last"><a class ="link-item">도착시간안내</a></li>
                        </ul>
                     </div>
                  </div>
                  <input class="selectricInput" tabindex="0">
               </div>
            </div>
         </li>
      
      
      <!-- 부가상품 -->
       
      <!-- 이용안내 -->
      
      <!-- 고객센터 -->
      
      <!-- 전국고속버스운송사업조합 -->
      
      <!-- 터미널사업자협회 -->

   </ul>
</div>

<div class="page time_table">
            <a href="http://www.epassmobile.co.kr" target="_blank" class="bnr_app bnr_pc">모바일에서도 언제 어디서나 도착시간 조회! <strong>고속버스 모바일앱</strong></a>
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
						    <span class="text_date" id="selectedDate"></span>
						    <input type="text" id="datepicker1" readonly alt="달력" title="달력" onclick="showDatePicker()">
 						     
 						</p>
			            <span class="date_wrap">
			                <a href="#" id="deprThddChc">오늘</a>
			                <a href="#" id="deprNxdChc">내일</a>
			            </span>
			        </div>
			    </li>
			</ul>
			
			
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<script type="text/javascript">
			
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

               <div class="box_inputForm click_box inselect">
                  <strong class="name">등급</strong> <!-- 170117 class명 추가 -->
                  <div class="payment select-box">
                     <div class="selectricWrapper"><div class="selectricHideSelect"><select name="" id="" title="출발터미널 선택" onchange="fnBusClsCd(this)" tabindex="0">

                        <option id="busClsCd0" name="busClsCdR" value="0">전체등급</option>
                        <option id="busClsCd7" name="busClsCdR" value="7">프리미엄</option>
                        <option id="busClsCd1" name="busClsCdR" value="1">우등</option>
                        <option id="busClsCd5" name="busClsCdR" value="2">일반</option>
                     </select>
                     </div>
                     <div class="selectric">

                     	<p class="label add" id="selectedGradeLabel">전체등급</p>
                     	<b class="button">▾</b>
                     </div>
                     <div class="selectricItems" tabindex="-1">
                     	

  
                     		<ul>
			                     <li class="">전체등급</li>
			                     <li class="">프리미엄</li>
			                     <li class="">우등</li>
			                     <li class="">일반</li>
                     		</ul>

                    	

                    </div>
                    <input class="selectricInput" tabindex="0"></div>
                  </div>
               </div>
               <p class="check" id="alcnSrchBtn">

                  	<button type="submit" form="rotInfFrm" class="btn_confirm ready" onclick="return validateForm();">조회하기</button>

               </p>
             </div>

            <script>
    $(document).ready(function() {
        // Custom Dropdown을 위한 초기화
        $(".selectric").on("click", function() {
            $(this).find(".selectricItems").toggle();
        });

        // 항목 선택 시 표시 업데이트
        $(".selectricItems ul li").on("click", function(e) {
            e.stopPropagation(); // 이벤트 버블링 막기
            var selectedGradeLabel = $(this).text();
            $("#selectedGradeLabel").text(selectedGradeLabel);
            $(".selectricItems").hide();
            if(selectedGradeLabel == '전체등급'){
            	selectedGradeLabel = '전체';
            }
            document.getElementById('bus_seatGrade').value = selectedGradeLabel;
        });
    });
</script>
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
		<input type="hidden" name="deprCd" id="deprCd" value=""> <!-- 출발지코드 -->
		<input type="hidden" name="arvlCd" id="arvlCd" value=""> <!-- 도착지코드 -->
		<input type="hidden" name="bus_seatGrade" id="bus_seatGrade" value="전체"> <!-- 버스등급 -->
		<input type="hidden" name="book_date" id="book_date" value=""> <!-- 날짜 -->
	
	</form>
<!-- 팝업창 스크립트 -->
<script>
function validateForm() {
    var deprCd = document.getElementById('deprCd').value;
    var arvlCd = document.getElementById('arvlCd').value;
    
    if (!deprCd || !arvlCd) {
        alert("예매하실 노선을 선택하세요.");
        return false;
    }

    return true;
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



            <!-- 조회결과 -->
            <div class="drive_info_wrap" name="readAlcnInqr" id="readAlcnInqr" style="display: none;">
            <p class="drive_info accent" id="takeDrtm"></p>
             <div class="detailBox">
               <div class="detailBox_body clfix">
                     <ul class="time" id="timelistChk">
                     </ul>
                  <div class="bustime_wrap">
                     <p class="bustime_head">
                        <span class="start_time">출발시각</span> <!-- 170119 텍스트수정 -->
                        <span class="bus_info">고속사/등급</span> <!-- tablet / mobile 사이즈에서 보임 -->
                        <span class="bus_com">고속사</span> <!-- pc 사이즈에서만 보임 -->
                        <span class="grade">등급</span> <!-- pc 사이즈에서만 보임 -->
                        <span class="adult">어른요금</span>
                        <span class="child">초등생요금</span>
                        <span class="youth"> 중고생요금</span>
                        <span class="remain">잔여석 <span class="total_seat">/ 총 좌석</span></span>
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
                  <li>실시간 운행상태 조회를 위해서는 <a href="/oprninf/arscgd/oprnArscGd.do" class="accent">도착시간 안내 메뉴</a>를 이용하시기 바랍니다.</li>
                  <li>심야고속 및 심야우등의 할증 요금은 당일 02:00시 부터 04:00 사이 출발차량</li> <!-- 조회결과가 있을경우에만 보임 --> <!-- 170117 텍스트수정 -->
                  <li>노선에 따라 심야요금과 심야할증요금이 동일할 수도 있음</li> <!-- 조회결과가 있을경우에만 보임 --> <!-- 170117 텍스트수정 -->
               </ul>
            </div>
            
         </div>
   
<!-- Bootstrap core JS-->



</body>
</html>
