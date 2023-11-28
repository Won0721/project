<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<style type="text/css">
ul {
	list-style: none;
	padding: 0;
}

h1 {
	text-align: center;
	color: #fff;
	letter-spacing: -0.03em;
	line-height: 1;
	font-size: 34px;
}

label {
	cursor: pointer;
}

.d-flex {
	position: absolute;
	top: 48%;
	left: 0;
	width: 100%;
	height: 470px;
	margin-top: -385px;
}

.container-fluid>.main-tab {
	margin-top: 30px;
	text-align: center;
}

.container-fluid>.main-tab a {
	display: inline-block;
	position: relative;
}

.container-fluid>.main-tab a+a {
	margin-left: 90px;
}

.container-fluid>.main-tab>a>span {
	display: block;
	margin-top: 5px;
	font-size: 14px;
	color: #fff;
}

.container-fluid>.main-tab a:before {
	display: inline-block;
	content: '';
	background: url(https://www.kobus.co.kr/images/common/main_menuset.png)
		no-repeat;
	width: 53px;
	height: 53px;
}

.container-fluid>.main-tab a.tab1:before {
	background-position: -58px 0;
}

.container-fluid>.main-tab a.tab2:before {
	background-position: -174px 0;
}

.container-fluid>.main-tab a.tab3:before {
	background-position: -290px 0;
}

.container-fluid>.main-tab a.freepass:before {
	background:
		url(https://www.kobus.co.kr/images/common/main_menuset_freepass.png)
		no-repeat;
}

.container-fluid>.main-tab a.wheelchair:before {
	background:
		url(https://www.kobus.co.kr/images/common/main_menuset_wheelchair_off.png)
		no-repeat;
}

.container-fluid>.main-tab a.tab1.on:before {
	background-position: 0 0;
}

.container-fluid>.main-tab a.tab2.on:before {
	background-position: -116px 0;
}

.container-fluid>.main-tab a.tab3.on:before {
	background-position: -232px 0;
}
/* main_cont 편도*/
.main_cont {
	width: 750px;
	max-width: 100%;
	margin: 30px auto 0 auto;
	display: block;
}

.main_cont .route_box {
	border: none;
}

.route_box {
	max-width: 960px;
	margin-top: 25px;
}

.route_box .tabs {
	position: relative;
	height: 50px;
	margin: 0;
}

.tab_type1 .tabs {
	position: relative;
}

.tabs col2 {
	margin: 0;
}

.main_box .route_box .tab_wrap.tab_type1 .tabs {
	border: none;
}

.tab_wrap.tab_type1 .tabs>li.active:first-child {
	background: linear-gradient(to right, #fff 0%, rgba(255, 255, 255, 1)
		93%, rgba(255, 255, 255, 1) 100%);
}

.tab_wrap.tab_type1 .tabs>li:first-child {
	background: linear-gradient(to right, rgba(193, 193, 193, 1) 0%,
		rgba(213, 213, 213, 1) 6%, rgba(223, 223, 223, 1) 11%,
		rgba(233, 233, 233, 1) 28%, rgba(236, 236, 236, 1) 81%,
		rgba(237, 237, 237, 1) 93%, rgba(238, 238, 238, 1) 100%);
}

.route_box .oneway {
	position: relative;
}

.route_box .tabs .oneway {
	border-radius: 5px 0 0 5px;
}

.route_box .tabs>li {
	height: 50px;
}

.tab_wrap .tabs li {
	float: left;
	border-bottom: 1px solid #e6e6e6;
	box-sizing: border-box;
}

.tab_wrap .tabs li>a {
	display: block;
}

.tab_wrap.tab_type1 .tabs>li>a {
	padding: 12px 0 12px 30px;
	font-size: 18px;
	color: #999;
}

.tab_wrap .tabs.col2 li {
	width: 50%;
}

.route_box .oneway.active a:before {
	background: url(https://www.kobus.co.kr/images/page/ico_oneway_on.png) 0
		0 no-repeat;
	background-size: 100%;
}

.route_box .oneway a:before {
	display: inline-block;
	content: '';
	background: url(https://www.kobus.co.kr/images/page/ico_oneway.png) 0 0
		no-repeat;
	background-size: 100%;
	width: 19px;
	height: 11px;
	margin-right: 1px;
}

.tab_type1 .tabs>li.active a {
	color: #68b3ce;
}

.route_box .tabs li.active a:after {
	display: inline-block;
	content: '';
	background: url(https://www.kobus.co.kr/images/page/ico_tab_s_on.png) 0
		0 no-repeat;
	width: 11px;
	height: 12px;
	margin: 0 0 1px 7px;
}

.tab_wrap.tab_type1 .tabs li.active a:after {
	display: inline-block;
	content: '';
	background: url(https://www.kobus.co.kr/images/page/ico_tab_s_on.png) 0
		0 no-repeat;
	background-size: 100%;
	width: 11px;
	height: 12px;
	margin: 0 0 -1px 1px;
}
/* main_cont 왕복*/
.tab_wrap.tab_type1 .tabs>li:last-child {
	background: linear-gradient(to right, rgba(238, 238, 238, 1) 0%,
		rgba(236, 236, 236, 1) 50%, rgba(233, 233, 233, 1) 74%,
		rgba(223, 223, 223, 1) 88%, rgba(216, 216, 216, 1) 93%,
		rgba(213, 213, 213, 1) 95%, rgba(193, 193, 193, 1) 100%);
}

.tab_wrap.tab_type1 .tabs>li.active {
	background: linear-gradient(to right, #fff 0%, rgba(255, 255, 255, 1)
		93%, rgba(255, 255, 255, 1) 100%);
}

.route_box .tabs .roundtrip {
	border-radius: 0 5px 5px 0;
}

.route_box .roundtrip a:before {
	display: inline-block;
	content: '';
	background: url(https://www.kobus.co.kr/images/page/ico_roundtrip.png) 0
		0 no-repeat;
	background-size: 100%;
	width: 19px;
	height: 19px;
	margin: 0 7px -4px 0;
}

.route_box .roundtrip.active a:before {
	background:
		url(https://www.kobus.co.kr/images/page/ico_roundtrip_on.png) 0 0
		no-repeat;
	background-size: 100%;
}
/* 출 도착지 */
.route_box .tab_cont {
	padding: 8px 0 0;
}

.route_box .place {
	width: calc(50% - 4px);
	height: 84px;
	float: left;
	margin: 0;
}

.route_box .place li {
	float: right;
	position: relative;
	background: #f3f4f6;
	width: -webkit-calc(50% - 4px);
	width: -moz-calc(50% - 4px);
	width: calc(50% - 4px);
	height: 100%;
	box-sizing: border-box;
}

.route_box .place li, .route_box .date .date_picker_wrap, .route_box .grade
	{
	padding: 15px 20px;
}

.route_box ul.place li, .route_box ul.date li, .route_box .grade,
	.route_box .check {
	border-radius: 5px;
}

.route_box .place li:first-child {
	float: left;
}

.route_box .name {
	display: block;
	font-size: 14px;
	color: #333;
}

.route_box .place .text {
	line-height: 1.2;
}

.route_box .text {
	height: 60px;
	padding: 5px 0 0;
	font-size: 19px;
	color: #000;
	line-height: 1.3;
}

.route_box .text.empty .empty_txt {
	display: block;
	color: #b3b3b3;
}

.route_box .place li:after, .route_box ul.date li:after {
	display: inline-block;
	content: '';
	position: absolute;
	right: 0;
	bottom: 0;
	background: url(https://www.kobus.co.kr/images/page/input_after.png) 0 0
		no-repeat;
	background-size: 100%;
	width: 8px;
	height: 8px;
}

.route_box .place li:after {
	right: 5px;
	bottom: 5px;
}
/* 가는날 */
.route_box .date {
	width: calc(50% - 4px);
	float: right;
	margin: 0;
}

.route_box .date li {
	height: 84px;
}

.route_box ul.date li {
	background: #f3f4f6;
	width: 100%;
	padding: 0;
}

.date_picker_wrap {
	position: relative;
	height: 100%;
	padding: 12px 15px;
	box-sizing: border-box;
}

.route_box .text .text_date {
	display: block;
	height: 100%;
	padding: 0;
	font-size: 24px;
	color: #000;
}

.date_picker_wrap .ui-datepicker-trigger {
	display: block;
	position: absolute;
	right: 20px;
	top: 50%;
	width: 28px;
	height: 26px;
	margin-top: -13px;
	font-size: 0;
	cursor: pointer;
}

.route_box .date .date_wrap {
	display: block;
	position: absolute;
	top: 50%;
	right: 70px;
	margin-top: -13px;
}

.route_box .date_wrap a {
	font-size: 16px;
}

.route_box .date_wrap a:first-child {
	margin-left: 0;
}
/* 등급 */
.route_box .grade {
	width: calc(50% - 4px);
	height: 84px;
	margin-top: 8px;
	float: left;
	background: #f3f4f6;
}

.route_box .grade p {
	margin-top: 10px;
}

.route_box .grade .custom_radio.gradeAll {
	margin-left: 0 !important;
}

[class^='custom_check'], [class^='custom_radio'] {
	display: inline-block;
	position: relative;
	line-height: 1;
	z-index: 100;
}

[class^='custom_check'] input, [class^='custom_radio'] input {
	overflow: hidden;
	width: 1px;
	height: 1px;
	opacity: 0;
	position: absolute;
	top: 0;
	left: 0;
}

input[type="radio"] {
	margin: 0;
	padding: 0;
	vertical-align: middle;
	width: 13px;
	height: 13px;
	line-height: 13px;
}

[class^='custom_radio'] {
	display: inline-block;
	position: relative;
	line-height: 1;
	z-index: 100;
}

[class^='custom_radio'] label {
	padding-right: 15px;
	color: #bfbfbf;
}

[class^='custom_radio'] label {
	color: #bfbfbf;
}

[class^='custom_radio'] label:before {
	display: inline-block;
	content: '';
}

.route_box .grade .custom_radio+.custom_radio input:checked+label:after
	{
	display: inline-block;
	content: '';
	position: absolute;
	top: 3px;
	right: -12px;
	background: url(https://www.kobus.co.kr/images/page/ico_grade_s_on.png)
		0 0 no-repeat;
	width: 11px;
	height: 11px;
}

.route_box .gradeAll input:checked+label {
	background: url(https://www.kobus.co.kr/images/page/ico_grade_s_on.png)
		right 2px no-repeat;
}

[class^='custom_radio'] input:checked+label {
	color: #000;
}

.route_box .grade label {
	font-size: 15px;
}

.route_box .grade1 label {
	background: url(https://www.kobus.co.kr/images/page/ico_grade1_s.png)
		right 0 no-repeat;
	color: #e9a401;
	padding-right: 26px;
}

.route_box .grade1 label, .route_box .grade2 label, .route_box .grade3 label
	{
	display: inline-block;
	min-height: 21px;
	line-height: 21px;
}

.route_box .grade1 label:before {
	display: inline-block;
	content: '';
	position: absolute;
	top: -16px;
	left: 20px;
	background: url(https://www.kobus.co.kr/images/page/ico_premium_s.png) 0
		0 no-repeat;
	background-size: 100%;
	width: 18px;
	height: 14px;
}

.route_box .grade .grade1 input:checked+label:after {
	background: url(https://www.kobus.co.kr/images/page/ico_gradeY_s_on.png)
		0 0 no-repeat !important;
}

.route_box .grade1 label:hover, .route_box .grade1 input:checked+label {
	background: url(https://www.kobus.co.kr/images/page/ico_grade1_s_on.png)
		right 0 no-repeat;
	color: #d29400;
}

.route_box .grade2 label {
	background: url(https://www.kobus.co.kr/images/page/ico_grade2_s.png)
		right 0 no-repeat;
	padding-right: 23px;
}

.route_box .grade2 input+label:hover, .route_box .grade2 input:checked+label
	{
	background: url(https://www.kobus.co.kr/images/page/ico_grade2_s_on.png)
		right 0 no-repeat;
	color: #000;
}

.route_box .grade3 label {
	background: url(https://www.kobus.co.kr/images/page/ico_grade3_s.png)
		right 0 no-repeat;
	padding-right: 22px;
}

.route_box .grade3 input+label:hover, .route_box .grade3 input:checked+label
	{
	background: url(https://www.kobus.co.kr/images/page/ico_grade3_s_on.png)
		right 0 no-repeat;
	color: #000;
}
/* 조회하기 */
.route_box .check {
	width: calc(50% - 4px);
	height: 84px;
	margin-top: 8px;
	float: right;
	background: #b8becc;
	text-align: center;
}

.route_box .check * {
	display: block;
	width: 100%;
	color: #fff;
	font-size: 18px;
	font-weight: bold;
	line-height: 84px;
	border: none;
	border-radius: 5px;
}

.btn_confirm.ready {
	background: #b8becc;
	color: #fff;
}

.btn_confirm.ready:hover {
	background: #a0abc5;
	color: #fff;
}
/* 배너박스 */
.bnr_box {
	position: absolute;
	bottom: 150px;
	width: 100%;
	left: 0;
	height: 150px;
}

.bnr_box .main_molit, .bnr_box .main_bus, .bnr_box .main_app, .bnr_box .main_info
	{
	background-position: right 68%;
	background-size: 37% auto;
}

.bnr_box.bnr3>div {
	width: 25%;
}

.bnr_box.bnr2>div, .bnr_box.bnr3>div {
	float: left;
	height: 100%;
	padding: 25px 0 0 30px;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.bnr_box .main_bus {
	background: rgba(38, 114, 137, 0.8)
		url(https://www.kobus.co.kr/mngr/mainBnrImg.do?bnrNoCd=BNR1) right 65%
		no-repeat;
	background-size: 32% auto;
}

.bnr_box .main_molit .stit, .bnr_box .main_bus .stit {
	color: #68b3ce;
}

.bnr_box .main_app .stit {
	color: #72a9dc;
}

.bnr_box>div .stit {
	font-size: 13px;
}

.bnr_box .main_molit p, .bnr_box .main_bus p, .bnr_box .main_app p {
	margin-top: 15px;
	padding-right: 46%;
	color: #fff;
	line-height: 1.3;
}

.bnr_box .main_molit {
	background: rgba(19, 129, 139, 0.8)
		url(https://www.kobus.co.kr/mngr/mainBnrImg.do?bnrNoCd=BNR3) right 65%
		no-repeat;
	background-size: 32% auto;
}

.bnr_box .main_app {
	background: rgba(29, 87, 120, 0.8)
		url(https://www.kobus.co.kr/mngr/mainBnrImg.do?bnrNoCd=BNR2) right 65%
		no-repeat;
	background-size: 40% auto;
}

.bnr_box .main_info {
	background: rgba(52, 68, 121, 0.8);
}

.bnr_box .main_info .stit {
	color: #8b89fa;
}

.bnr_box .main_info ul {
	margin: 18px 20px 0 0;
}

.bnr_box .main_info li {
	float: left;
	width: 25%;
}

.bnr_box .main_info li a {
	display: block;
	padding-top: 40px;
	color: #fff;
	opacity: 0.5;
	text-align: center;
	font-size: 12px;
}

.bnr_box .main_info li.info1 {
	background: url(https://www.kobus.co.kr/images/common/ico_info1.png)
		center 0 no-repeat;
}

.bnr_box .main_info li.info2 {
	background: url(https://www.kobus.co.kr/images/common/ico_info2.png)
		center 0 no-repeat;
}

.bnr_box .main_info li.info3 {
	background: url(https://www.kobus.co.kr/images/common/ico_info4.png)
		center 0 no-repeat;
}

.infoList {
	display: block;
	width: 100%;
	border: 0;
	background-color: transparent;
	height: 86px;
	text-align: left;
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
	left: 52px;
	top: -0;
	width: 1px !important;
	height: 84px !important;
	padding: 0;
	font-size: 0;
	color: #000;
	border: none;
	background: transparent;
	opacity: 0;
}
</style>
<title>Simple Sidebar - Start Bootstrap Template</title>
</head>
<body>
	<div class="d-flex">
		<div class="container-fluid">
			<h1 style="font-size: 34px; line-height: 2;">즐거운 여행의 시작과 끝, 프리미엄
				버스와 함께!</h1>

			<p class="main-tab">
				<a href="#!" class="tab1 on"> <span>고속버스예매</span>
				</a> <a href="bookConfirmation/bookConfirmation" class="tab2"> <span>예매확인</span>
				</a> <a href="#!" class="tab3"> <span>도착시간안내</span>
				</a> <a href="#!" class="freepass"> <span>프리패스</span>
				</a> <a href="https://www.kobus.co.kr/wchr/main.do" class="wheelchair">
					<span>휠체어사이트</span>
				</a>
			</p>
			<div class="main_cont" style="display: block;">
				<div class="route_box">
					<div class="tab_wrap tab_type1">
						<div class="tab_cont">
							<ul class="place">
								<li>
									<button class="infoList" id="arrInfor">
										<span class="name">출발지</span>
										<p class="text empty">
											<span class="empty_txt">선택</span> <span class="val_txt"
												id="deprNmSpn"></span>
										</p>
									</button>
									<p class="btn_change" onclick="fnCrchDeprArvl();"
										style="top: 30px;">출,도착지 교체</p>
								</li>

								</li>
								<li><a>
										<button class="infoList" id="drrInfor">
											<span class="name">도착지</span>
											<p class="text empty">
												<span class="empty_txt">선택</span> <span class="val_txt"
													id="arvlNmSpn"></span>
											</p>
								</a></li>
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
							<div class="grade">
								<span class="name">등급</span>
								<p>
									<span class="custom_radio gradeAll"
										style="margin-left: 18.6667px;" onclick="selectGrade('전체');">
										<input type="radio" id="busClsCd0" name="busClsCdR" value="0"
										checked> <label for="busClsCd0"> 전체 </label>
									</span> <span class="custom_radio grade1"
										style="margin-left: 18.6667px;" onclick="selectGrade('프리미엄');">
										<input type="radio" id="busClsCd7" name="busClsCdR" value="7">
										<label for="busClsCd7"> 프리미엄 </label>
									</span> <span class="custom_radio grade2"
										style="margin-left: 18.6667px;" onclick="selectGrade('우등');">
										<input type="radio" id="busClsCd1" name="busClsCdR" value="1">
										<label for="busClsCd1"> 우등 </label>
									</span> <span class="custom_radio grade3"
										style="margin-left: 18.6667px;" onclick="selectGrade('일반');">
										<input type="radio" id="busClsCd5" name="busClsCdR" value="1">
										<label for="busClsCd5"> 일반 </label>
									</span>
								</p>
							</div>
							<p class="check">
								<button type="submit" form="rotInfFrm" class="btn_confirm ready" onclick="return validateForm();" >조회하기</button>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bnr_box bnr3">
		<div class="main_bus">
			<a href="#!"> <span class="stit">프리미엄 골드 익스프레스</span>
				<p>도로 위 비즈니스 클래스 프리미엄 고속버스</p>
			</a>
		</div>
		<div class="main_molit">
			<a href="#!"> <span class="stit">ZERODAY EXPRESS</span>
				<p>고속버스 당일배송 온라인 택배신청</p>
			</a>
		</div>
		<div class="main_app">
			<a href="#!"> <span class="stit">All Pass 신한카드 출시</span>
				<p>고속/시외버스 앱 결제시 30% 할인</p>
			</a>
		</div>
		<div class="main_info">
			<span class="stit">이용안내</span>
			<ul>
				<li class="info1" style="width: 33.333%"><a href="#!">예매안내</a>
				</li>
				<li class="info2" style="width: 33.333%"><a href="#!">환승안내</a>
				</li>
				<li class="info3" style="width: 33.333%"><a href="#!">터미널안내</a>
				</li>
			</ul>
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
      $('.main-tab a').click(function(e){
         // 선택된 탭의 클래스를 변경
         $('.main-tab a').removeClass('on');
         $(this).addClass('on');
      })
   </script>
<!-- 편도 왕복 스크립트 -->
<script type="text/javascript">
      $('.tab_wrap li').click(function(e){
         // 선택된 탭의 클래스를 변경
         $('.tab_wrap li').removeClass('active');
         $(this).addClass('active');
      })
   </script>

<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript"> 
<!-- 팝업창 스크립트 -->
function validateForm() {
    var deprCd = document.getElementById('deprCd').value;
    var arvlCd = document.getElementById('arvlCd').value;
    
    if (!deprCd || !arvlCd) {
        alert("예매하실 노선을 선택하세요.");
        return false;
    }

    return true;
}
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
			console.log("ajaxBook 의 데이터 값 : " + data);
			console.log("ajaxBook 의 city_num : " + city_num);
			
			
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