<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.title_wrap {
	background:
		url(https://www.kobus.co.kr/images/page/visual_customerT_bg.jpg)
		center 0 no-repeat;
	background-size: cover;
}

.faq dd{
	display:none;
}

.faq dd .answer {
	margin: -22px 20px 0 30px;
	padding-top: 10px;
	border-top: 1px solid #f1f2f4
}

.selectricItems li {
	display: block;
	height: 39px;
	padding-left: 20px;
	border-bottom: 1px solid #e6e6e6;
	color: #666;
	cursor: pointer;
	line-height: 39px;
}

.selectricItems ul, .selectricItems li {
	list-style: none;
	padding-left: 5px;
	padding-right: 5px;
	font-size: 12px;
	line-height: 40px;
	min-height: 20px;
}
.list-faqItem .hide_box{
display : none;
}


.selectricItems {
	z-index: 9999; /* 원하는 z-index 값으로 변경 */
}
</style>
<title>자주하는 질문</title>

<script>
// Q&A 화면구현
var currentSelected; // 선택된 질문을 추적하는 변수


function toggleAnswer(answerId) {
    var answer = document.getElementById("answer" + answerId);
    var displayState = answer.style.display;

    // 클릭한 답변의 표시를 토글합니다
    if (displayState === "none" || displayState === "") {
        // 초기에 모든 답변을 숨깁니다
        document.querySelectorAll('.faq dd').forEach(function(answer) {
            answer.style.display = "none";
        });

        // 클릭한 답변을 표시합니다
        answer.style.display = "block";

        // 현재 선택된 질문에 테두리 클래스를 추가하고 다른 질문의 테두리 클래스를 제거합니다
        if (currentSelected) {
            currentSelected.classList.remove("active");
        }
        currentSelected = document.querySelector('.faq dt:nth-child(' + (answerId * 2 - 1) + ')');
        currentSelected.classList.add("active");
    } else {
        // 클릭한 답변이 이미 표시 중이라면, 표시를 숨깁니다
        answer.style.display = "none";

        // 선택한 질문의 테두리 클래스를 제거합니다
        if (currentSelected) {
            currentSelected.classList.remove("active");
            currentSelected = null; // 선택 해제
        }
    }
}

	
	//셀렉트상자
	$(document).ready(
		function() {
		// 사용자가 select 상자를 클릭할 때
		$('.selectric').on('click', function() {
			$(".selectric").not(this).find(".selectricItems").hide();
	        $(this).find(".selectricItems").toggle();
			// 드롭다운의 가시성을 전환합니다
			// $('.selectricItems').toggle();
		});

		// 사용자가 드롭다운에서 옵션을 선택할 때
		$('.selectricItems ul li').on('click', function() {
			// 선택한 옵션의 텍스트를 가져옵니다
		
			var selectedOption = $(this).text();
			console.log("선택");
			// 선택한 옵션 텍스트를 레이블 텍스트로 설정합니다
			$('.selectric .label').text(selectedOption);
			// 드롭다운을 숨깁니다
			$('.selectricItems').addClass('hide_box');
		});

/* 옵션 선택시 화면구현 */
	// 옵션 선택시 해당내용만 화면에 보이는 구현
 	document.getElementById("bltnCtgCd").addEventListener("change", function () {
	    var selectedCategory = this.value;
	    var faqItems = document.querySelectorAll('.faq dd'); 

	// 모든 FAQ 항목을 숨깁니다
    faqItems.forEach(function (answer) {
        answer.style.display = "none";
    });

	 faqItems.forEach(function (answer) {
	    if (answer.getAttribute("data-category") === selectedCategory || selectedCategory === "0") {
	        answer.style.display = "block";
	        }
	    });
	});
});
	
	//test
	
function selectItem(number,obj) {
		
		if(number == '1'){
			$('.active').hide();
			$('.list-faqItem').show();
		}
		if(number == '2'){
			$('.active').hide();
			$('.list-faqItem').hide();
			$('.book').show();
		}
		if(number == '3'){
			$('.active').hide();
			$('.list-faqItem').hide();
			$('.update').show();
		}
		if(number == '4'){
			$('.active').hide();
			$('.list-faqItem').hide();
			$('.pay').show();
		}
		if(number == '5'){
			$('.active').hide();
			$('.list-faqItem').hide();
			$('.ticket').show();
		}
		if(number == '6'){
			$('.active').hide();
			$('.list-faqItem').hide();
			$('.drive').show();
		}
		if(number == '7'){
			$('.active').hide();
			$('.list-faqItem').hide();
			$('.member').show();
		}
		if(number == '8'){
			$('.active').hide();
			$('.list-faqItem').hide();
			$('.other').show();
		}
		
	
}
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
							<p class="label">자주하는 질문</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class="selected"><a class="link-item" href="<c:url value='/customerCenter/question'/>">자주하는 질문</a></li>
									<li class=""><a class="link-item" href="<c:url value='/customerCenter/lostNfound'/>">유실물센터 안내</a></li>
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
		<div class="noti_wrap hide_mo">
			<p class="noti">고객님들이 자주 문의하시는 질문과 답변내용입니다.</p>
		</div>
		<div class="search_wrap type2 custom_input">
			<div class="box_inputForm click_box inselect">
				<div class="payment select-box">
					<div class="selectricWrapper">
						<div class="selectricHideSelect">
							<select name="bltnCtgCd" id="bltnCtgCd" title="질문 선택"
								tabindex="0">
								<option value="0">전체</option>
								<option value="1">예매</option>
								<option value="2">조회/변경/취소</option>
								<option value="3">결제</option>
								<option value="4">홈티켓</option>
								<option value="5">고속버스 운행</option>
								<option value="6">회원</option>
								<option value="7">기타</option>
							</select>
						</div>
						<div class="selectric">
							<p class="label add">전체</p>
							<b class="button">▾</b>
						</div>
						<div class="selectricItems" tabindex="-1" style="width: 498px;">
							<div class="selectricScroll">
								<ul>
									<li class="selectItem" onclick="selectItem('1',this);">전체</li>
									<li class="selectItem" onclick="selectItem('2',this);">예매</li>
									<li class="selectItem" onclick="selectItem('3',this);">조회/변경/취소</li>
									<li class="selectItem" onclick="selectItem('4',this);">결제</li>
									<li class="selectItem" onclick="selectItem('5',this);">홈티켓</li>
									<li class="selectItem" onclick="selectItem('6',this);">고속버스 운행</li>
									<li class="selectItem" onclick="selectItem('7',this);">회원</li>
									<li class="selectItem" onclick="selectItem('8',this);">기타</li>
								</ul>
							</div>
						</div>
						<input class="selectricInput" tabindex="0">
					</div>
				</div>
			</div>
		</div>


		<dl class="faq">
			<dt class ="list-faqItem book" onclick="toggleAnswer(1)" data-category="1">예매 가능 기간 및 명절 연휴
				예매 기간은 언제입니까?</dt>
			<dd class="active" id="answer1" data-category="1">
				<div class="answer">
					<p>
						예매 가능일자와 관련하여 따로 정해진 기간은 없으며, 배차 정보가 입력되어 있는 경우에 조회/예매가 가능합니다.<br>배차정보는
						각 출발지 터미널에서 입력합니다. 다음달 배차정보는 전월 20일경에 입력하고 있으나, 출발지 터미널에 따라 기간이
						달라질 수 있습니다. <br> <br>명절의 경우 접속과다로 인한 부하를 방지하기 위하여 특송기간
						전용 홈페이지로 전환하여 운영하지만 예매 기간은 동일하게 적용됩니다.<br> <br>배차정보에 관한
						더 자세한 사항은 출발지 터미널에 문의해주시기 바랍니다.<br>
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem book" onclick="toggleAnswer(2)" data-category="1">노선조회시 "배차정보가 존재하지 않습니다."라는 문구가
				나타납니다.</dt>
			<dd class="active" id="answer2" data-category="1">
				<div class="answer">
					<p>
						배차정보가 아직 입력되어 있지 않은 상태이며, 배차 정보가 입력되어 있어야만 조회/예매가 가능합니다. <br>배차정보는
						각 출발지 터미널에서 입력합니다. 다음달 배차정보는 전월 20일경에 입력하고 있으나, 출발지 터미널에 따라 기간이
						달라질 수 있습니다. <br>배차정보에 관한 더 자세한 사항은 출발지 터미널에 문의해주시기 바랍니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem book" onclick="toggleAnswer(3)" data-category="1">"이 구간은 홈페이지 예매가 불가능 합니다."라는 문구가
				나타납니다.</dt>
			<dd class="active" id="answer3" data-category="1">
				<div class="answer">
					<p>
						일부 소도시 터미널은 신용카드 발권을 도입하지 않고 있습니다. 전산센터 입장에서는 신용카드 발권 도입을 권유하고 있지만
						터미널의 권한이라 임의로 바꿀 수 없는 사항 입니다. <br>이러한 구간의 경우 홈페이지를 통한 예매는
						불가하고, 터미널에 직접 방문하셔서 승차권을 발권하셔야 합니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem book" onclick="toggleAnswer(4)">홈페이지 예매 후 터미널 창구에서의 승차권 발권은 어떻게 할
				수 있습니까?</dt>
			<dd class="active" id="answer4">
				<div class="answer">
					<p>카드결제를 통한 예매의 경우 예매시 사용하신 카드를 지참하셔야 하며, 기타 결제수단을 통한 예매의 경우에는
						본인 휴대폰번호와 생년월일 정보를 창구에서 말씀하시면 승차권 발권이 가능합니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem book"  onclick="toggleAnswer(5)">고객센터의 상담원 연결을 통한 예매가 가능 합니까?</dt>
			<dd class="active" id="answer5">
				<div class="answer">
					<p>예매는 홈페이지, 모바일, 터미널에서 본인이 직접 하셔야 하며, 상담원 연결을 통한 예매는 불가합니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem book" onclick="toggleAnswer(6)">예매시 "카드인증실패" 문구가 나타납니다.</dt>
			<dd class="active" id="answer6">
				<div class="answer">
					<p>
						카드에 대한 문제나 정보입력상에 오류가 있을 경우 예매 진행이 어려울 수 있습니다. <br>연체,
						카드사용중지, 사용한도초과, 주민번호오류, 유효기간 입력오류 등의 경우가 있을 수 있으며, 이에 대한 자세한 사항은
						해당 카드사를 통해 확인해주시기 바랍니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem book" onclick="toggleAnswer(7)">예매한 승차권은 어떻게 발권할 수 있습니까?</dt>
			<dd class="active" id="answer7">
				<div class="answer">
					<p>
						예매하신 승차권 발권은 예매에 사용한 카드를 소지 후 출발시간 이전에 해당 터미널 매표창구에서 발권할 수 있습니다.<br>발권시
						예매에 사용한 카드를 제시하시면 바로 발권이 가능합니다. 또한 왕복으로 예매를 하시면 해당 터미널에서 왕복 발권도
						가능합니다. 다만 출발지나 도착지 외의 터미널에서의 발권은 불가합니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem book" onclick="toggleAnswer(8)">예매 가능 시간은 언제입니까?</dt>
			<dd class="active" id="answer8">
				<div class="answer">
					<p>예매에 특별히 정해진 시간은 없으며, 해당 출발지 터미널의 배차정보가 입력되어 있으면 홈페이지 또는
						고속버스모바일앱을 통해 예매가 가능합니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem book" onclick="toggleAnswer(9)">고속버스 승차권도 할인 요금을 적용 받을 수 있습니까?</dt>
			<dd class="active" id="answer9">
				<div class="answer">
					<p>고속버스 요금할인은 일반적으로 아동/중고생으로 구분되어 있으나 예외적으로 일부 고속사의 노선별 운영정책에
						따라 대학생 할인 요금이 적용되는 노선이 있으며, 고속버스 요금할인 정책은 노선별, 구간별로 고속사마다 다르게 운영되고
						있습니다. 홈페이지에서 할인 요금이 적용되는 노선은 예매 좌석 선택 시 권종이 표기되어 있는 것으로 확인하실 수
						있습니다. 예매하시는 노선이 할인 적용 노선일 경우 검표 시 학생증(청소년증) 제시를 요청할 수 있으므로 탑승시 반드시
						학생증(청소년증)을 지참하시기 바랍니다. 학생증(청소년증) 미 지참 시 일반요금으로 부과될 수 있습니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem book" onclick="toggleAnswer(10)">한번에 예매 가능한 승차권 매수는 어떻게 됩니까?</dt>
			<dd class="active" id="answer10">
				<div class="answer">
					<p>1회 최대 예매 매수는 6매입니다.(일부 시외우등 노선에 한정하여 10매까지 예매가능)</p>
				</div>
			</dd>
			<dt class ="list-faqItem book" onclick="toggleAnswer(11)">환승지에서 다른 차량으로 환승하는 노선을 예매하고 싶습니다.</dt>
			<dd class="active" id="answer11">
				<div class="answer">
					<p>
						홈페이지에서 예매 진행 시 "환승" 구분을 선택 후 출발지/도착지를 설정하여 조회하시기 바랍니다.<br>먼저
						[출발지→환승지] 노선에 대한 예매가 진행되며, 완료 후 이어서 [환승지→도착지]노선 예매가 가능합니다.<br>환승
						노선을 예매하시면 중간 환승지에서 다른 차량으로 환승이 필요하니 참고하시기 바랍니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem book" onclick="toggleAnswer(12)">홈페이지에서 예매 후 고속버스모바일앱에서 승차권 조회 및
				사용이 가능합니까?</dt>
			<dd class="active" id="answer12">
				<div class="answer">
					<p>
						홈페이지에서 예매 진행 시 "모바일티켓"으로 예매할 수 있습니다.<br>"모바일티켓"으로 예매하셔야만
						모바일앱에서 조회 및 사용이 가능하며 "일반티켓"으로 예매하시면 모바일앱에서는 조회되지 않으니 참고하시기 바랍니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem update" onclick="toggleAnswer(13)">예매사항의 변경시 날짜 변경이 불가한 이유는 무엇입니까?</dt>
			<dd class="active" id="answer13">
				<div class="answer">
					<p>무분별한 날짜 변경으로 인한 승차권 부족 현상을 방지하기 위하여 예매 변경 시 날짜 변경이 불가하도록
						제한하고 있으니 양해 부탁드립니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem update" onclick="toggleAnswer(14)">예매한 승차권의 시간 변경은 어떻게 할 수 있습니까?</dt>
			<dd class="active" id="answer14">
				<div class="answer">
					<p>
						시간변경은 동일 날짜/노선에 한하여 차량 출발시간 1시간 이전까지 시간변경 기능을 통해 가능합니다.(1회 가능)<br>시간변경
						기능은 [예매확인]→[예매 확인/취소/변경] 메뉴에서 확인하실 수 있습니다.<br> <br>시간변경
						기능의 절차는 기존 예매한 티켓을 취소 후 재결제 하는 방식으로 이루어지며, 해당 기능을 통해 재결제할 경우 수수료가
						부과되지 않습니다.<br> <br>차량 출발 1시간 이내 티켓이라면, 예매 취소 후 다시 예매하셔야
						합니다.<br> <br>예매 취소 후 재예매를 하실 경우 "고속버스운송약관"에 따라 취소 수수료 부과
						및 좌석 부족으로 승차권 예매가 불가할 수 있는 점 양해부탁드립니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem update" onclick="toggleAnswer(15)">승차권의 영수증 발급은 어떻게 할 수 있습니까?</dt>
			<dd class="active" id="answer15">
				<div class="answer">
					<p>
						승차권 예매 후 바로 영수증 출력이 가능합니다.<br>영수증은 [예매확인]→[예매 확인/취소/변경] 메뉴로
						이동하여 확인하실 수 있으며, 홈페이지에서 예매하지 않은 승차권 영수증의 경우 [예매확인]→[영수증 발행] 메뉴로
						이동하여 확인하시기 바랍니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem update" onclick="toggleAnswer(16)">예매한 승차권의 내역 조회가 불가합니다.</dt>
			<dd class="active" id="answer16">
				<div class="answer">
					<p>
						고객님께서 비회원으로 예매하신 승차권을 회원 가입하여 예매 승차권을 조회하시면 조회가 불가합니다. 비회원으로 예매하신
						경우 예매한 휴대폰 번호+ 비밀번호 4자리 입력 후 예매 내역을 확인할 수 있습니다.<br> <br>내역
						조회가 되지 않을 경우 이용 터미널 매표소로 문의해주시기 바랍니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem update" onclick="toggleAnswer(17)">예매 승차권의 취소 수수료는 어떻게 부과됩니까?</dt>
			<dd class="active" id="answer17">
				<div class="answer">
					<p>
						고속버스 승차권 취소 수수료 정책은 아래와 같습니다.<br> <br>1. 취소수수료 없음<br>-
						차량출발일 2일전까지 취소할 경우<br>- 당일 출발 차량 예매 후 1시간 이내 취소할 경우<br>
						<br>2. 취소수수료 5%부과<br>- 차량출발일 전일 부터 차량 출발전 1시간 전 까지 취소할
						경우<br> <br>3. 취소수수료 10%부과<br>- 차량 출발전 1시간 이내부터 차량
						출발 전 까지 취소할 경우<br> <br>4. 취소수수료 30%부과<br>- 예매 차량 출발
						후 도착예정시간(배차시간+소요시간) 전 까지 취소할 경우<br> <br>※ 차량 출발 후 도착 전까지
						홈페이지 및 출발지 터미널에서 취소가 가능하며, 차량 도착 이후에는 100% 위약금이 발생합니다.(모든 티켓 동일)<br>
						<br>※예매 취소 및 환급에 대한 규정은 고속버스 운송약관에 따르며, 자세한 사항은 고속버스 운송약관을
						통해서 확인하실 수 있습니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem update" onclick="toggleAnswer(18)">홈페이지에서 승차권 취소 후 완료시점이 궁금합니다.</dt>
			<dd class="active" id="answer18">
				<div class="answer">
					<p>
						승차권을 예매하신 후 당일 취소 하실 경우 대부분의 신용카드사에서는 승인 취소 문자가 발송되고 있습니다. 그러나
						예매일과 취소일이 다를 경우 약 3~5일 가량 소요됩니다.<br> <br>취소 수수료가 부과되는 경우
						취소 수수료 재정산일이 소요되어 취소 처리 기간이 3~5일가량 소요될 수 있으며, 만약 취소 일자에 잔액부족 또는
						승인한도 부족으로 수수료가 결제되지 못했다면 취소가 지연될 수 있습니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem pay" onclick="toggleAnswer(19)">예매에 사용한 카드의 분실/갱신으로 인해 카드번호가 바뀌었을
				경우 예매한 승차권은 어떻게 발권할 수 있습니까?</dt>
			<dd class="active" id="answer19">
				<div class="answer">
					<p>
						예매에 사용한 분실카드나 갱신 전 카드번호를 꼭 인지하셔야 합니다. <br>터미널에서 분실/갱신 전 카드로
						예매된 사항을 취소하시고 그 표를 다시 신규카드나 현금으로 발권하실 수 있습니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem pay" onclick="toggleAnswer(20)">예매한 사람이 아닌 타인이 카드를 소지하고 있을 경우
				터미널에서 예매한 표를 발권을받을 수 있습니까?</dt>
			<dd class="active" id="answer20">
				<div class="answer">
					<p>현행법상 신용카드는 타인에게 대여, 양도를 할수 없으므로 발권이 불가능합니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem pay" onclick="toggleAnswer(21)">체크카드와 선불성 신용카드를 통한 예매가 가능합니까?</dt>
			<dd class="active" id="answer21">
				<div class="answer">
					<p>
						신용카드(Check, Plus, Virtual)와 선불성카드의 경우, 발권 후 환불이나 취소시 해당 카드의 특성상
						자동전산처리가 불가하여 고객의 피해사항 발생 소지가 있어 카드 예매 서비스가 불가합니다.<br>(단, 예매가
						가능한 카드는 사용할 수 있는 카드입니다)
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem pay" onclick="toggleAnswer(22)">카드번호와 비밀번호를 알면 예매에 사용한 카드가 없어도
				발권이 가능합니까?</dt>
			<dd class="active" id="answer22">
				<div class="answer">
					<p>예매에 사용한 카드를 소지하지 않고 카드 번호와 비밀번호만 인지하고 있을 경우에는 발권이 불가능합니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem pay" onclick="toggleAnswer(23)">터미널에서 카드로 발권 후 환불/취소를 했는데 카드요금이
				청구되었습니다.</dt>
			<dd class="active" id="answer23">
				<div class="answer">
					<p>
						-카드로 승차권을 구매한 당일 환불이나 취소를 할 경우 : <br>카드 사용내역 조회시 카드매표 구매사항이
						사용내역에 포함되지 않습니다. <br>-카드로 승차권을 구매한 당일 이후 환불이나 취소를 하시는 경우 :<br>카드사의
						취소처리가 취소일로부터 3-4일정도 소요됩니다. 1주일 정도 후에 사용내역을 조회하시면 정상적(미청구)으로 처리가 되어
						있습니다.<br> <br>취소 처리기간 중 결제기준일자가 중간에 끼어있게되면 청구서에는 청구가 되나
						결제출금시에는 환불/취소 금액 만큼이 미반영되며, 카드에 따라서는 다음달에 환불/취소 금액 만큼을 감액 청구합니다. 위
						결제 사항은 사용카드사에 문의하시면 됩니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem pay" onclick="toggleAnswer(24)">신용카드 정보의 보안 적용 방식에 대해 궁금합니다.</dt>
			<dd class="active" id="answer24">
				<div class="answer">
					<p>
						신용카드정보는 128-bit SSL(Secure Socket Layer)을 통해 암호화되어 전송됩니다.<br>인증서는
						가장 지명도 있는 인증기관인 VeriSign으로부터 받았으며, 예매하신 모든 정보는 외부에서 접근이 불가합니다. <br>예매시
						결제정보 입력 부분에서 URL이 ""https://xxx.xxx"" 로 바뀌면 SSL이 이미 적용되어 있는 것이니
						안심하고 사용하시기 바랍니다.
					</p>
				</div>
			</dd>
			<dt  class ="list-faqItem pay"onclick="toggleAnswer(25)">승차권 예매시 이용 가능한 결제 수단은 어떤 것들이
				있습니까?</dt>
			<dd class="active" id="answer25">
				<div class="answer">
					<p>
						홈페이지에서 승차권 예매시 카드결제, 계좌이체, 부가상품(프리패스)의 결제수단을 이용하실 수 있습니다.<br>결제
						수단에 대한 자세한 사항은 [이용안내]→[결제수단 안내] 메뉴에서 확인 가능합니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem pay" onclick="toggleAnswer(26)" class ="">계좌이체를 통한 승차권 예매 후 터미널에서 발권을 하려면
				어떻게 해야 합니까?</dt>
			<dd class="active" id="answer26">
				<div class="answer">
					<p>계좌이체 예매 후 승차권을 터미널에서 발권할 경우에는 예매 당시 입력한 휴대폰번호(회원의 경우 가입 시
						입력한 휴대폰번호)와 생년월일(법인은 사업자 등록번호)가 필요합니다.</p>
				</div>
			</dd>
			<dt  class ="list-faqItem pay" onclick="toggleAnswer(27)">계좌이체 예매 후 취소/환불할 경우 처리 기간은 어떻게
				됩니까?</dt>
			<dd class="active" id="answer27">
				<div class="answer">
					<p>계좌이체 예매 취소시 즉시 예매 당시의 출금계좌로 입금되나 장애 발생 시 최대 한 시간까지 입금이 지연될 수
						있습니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem pay" onclick="toggleAnswer(28)" >계좌이체 예매시 현금영수증 발급이 가능합니까?</dt>
			<dd class="active" id="answer28">
				<div class="answer">
					<p>계좌이체 예매시 현금영수증 발급정보(휴대폰번호 또는 사업자 등록 번호, 현금영수증 카드 번호)를 통해
						현금영수증을 발급받으실 수 있습니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem pay" onclick="toggleAnswer(29)">계좌이체 예매 가능 시간은 어떻게 됩니까?</dt>
			<dd class="active" id="answer29">
				<div class="answer">
					<p>
						계좌이체 예매시 개인 계좌의 경우 365일 24시간 이용 가능하나, 법인 계좌일 경우 평일 및 토요일에는 오전 8시부터
						오후 10시까지 이용 가능하며 공휴일에는 사용이 불가합니다.<br>또한 은행 및 증권사에 따라 이용 가능
						서비스 시간이 달라질 수 있습니다. 이에 대한 내용은 [이용안내]→[결제수단 안내]에서 확인하실 수 있습니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem ticket" onclick="toggleAnswer(30)">고속버스 홈티켓 발행 후 사용하지 못한 승차권의 환불이
				가능합니까?</dt>
			<dd class="active" id="answer30">
				<div class="answer">
					<p>해당 차량이 출발된 이후의 승차권 환불은 차량출발 후 도착예정시간까지 출발지 터미널 및 홈페이지에서
						가능합니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem ticket"  onclick="toggleAnswer(31)">고속버스 홈티켓을 출력 후 분실했습니다.</dt>
			<dd class="active" id="answer31">
				<div class="answer">
					<p>
						홈페이지에 접속하시면 홈티켓 재발행이 가능합니다. 프린터가 연결된 PC에서 홈페이지 접속 후 재발행 하시기 바랍니다.<br>모바일
						환경에서 접속시 홈티켓 발행기능이 제한되오니 참고하시기 바랍니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem drive" onclick="toggleAnswer(32)">고속버스노선, 운행횟수 증설 및 신설, 불편사항은 어디에
				문의해야 합니까?</dt>
			<dd class="active" id="answer32">
				<div class="answer">
					<p>고속버스 운행에 관한 모든 사항은 고속사에서 결정 및 관리하고 있으므로, 해당노선의 고속회사 홈페이지나
						담당부서에 문의하셔야 합니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem member" onclick="toggleAnswer(33)">마일리지(프리미엄) 적립 방식에 대해 궁금합니다.</dt>
			<dd class="active" id="answer33">
				<div class="answer">
					<p>· 고속사에서 제공하는 마일리지(프리미엄)는 프리미엄 고속버스 이용 시마다 승차권 금액의 2%가 포인트로
						적립됩니다. * 적립일로부터 2년이 경과될 경우 해당 마일리지(프리미엄)는 자동 소멸합니다. · 프리미엄 요금할인
						노선과 비회원 및 터미널 현장 예매로 이용하였을 경우 적립되지 않습니다. · 프리미엄 마일리지는 D+2일 이후 적립
						건을 확인하실 수 있습니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem member" onclick="toggleAnswer(34)">고속버스 예매를 위해서 회원가입이 필수입니까?</dt>
			<dd class="active" id="answer34">
				<div class="answer">
					<p>홈페이지에서 예매시 비회원으로 예매 가능합니다.회원으로 예매하시면 홈페이지뿐 아니라 모바일앱에서도 승차권,
						결제 내역이 공유되며 마일리지(프리미엄)적립 등 다양한 혜택과 편의성이 제공됩니다.고속버스 통합홈페이지는 티머니
						통합회원 계정으로 로그인 가능합니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem member" onclick="toggleAnswer(35)">아이디, 비밀번호가 기억이 나지 않습니다.</dt>
			<dd class="active" id="answer35">
				<div class="answer">
					<p>아이디, 비밀번호를 잊으셨을 경우, [로그인]→[아이디찾기]/[비밀번호찾기] 메뉴를 통해 회원정보를 조회하실
						수 있습니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem member" onclick="toggleAnswer(36)" >회원정보의 변경이 가능합니까?</dt>
			<dd class="active" id="answer36">
				<div class="answer">
					<p>로그인 후 [마이페이지]에서 비밀번호와 휴대폰번호 변경이 가능합니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem member" onclick="toggleAnswer(37)">회원을 탈퇴하고 싶습니다.</dt>
			<dd class="active" id="answer37">
				<div class="answer">
					<p>로그인 후 [마이페이지]에 접속후 회원탈퇴 버튼을 선택하여 진행하시기 바랍니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem other" onclick="toggleAnswer(38)">[서울경부], [서울호남(센트럴)], [동서울]은 각각 어느
				터미널입니까?</dt>
			<dd class="active" id="answer38">
				<div class="answer">
					<p>
						서울 강남고속버스터미널은 경부선과 호남선(센트럴시티)으로 건물이 나누어져 있습니다. <br>출발지 선택 시
						[서울경부]는 서울강남고속버스경부선 터미널이며, [서울호남(센트럴)]은 서울강남고속버스호남선 터미널입니다. [동서울]은
						지하철 2호선 강변역에 위치한 터미널입니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem other" onclick="toggleAnswer(39)">애완동물과 함께 고속버스 탑승이 가능합니까?</dt>
			<dd class="active" id="answer39">
				<div class="answer">
					<p>다른 여객에게 위해를 끼치거나 불쾌감을 줄 우려가 있는 동물은 탑승이 불가하며 장애인보조견 및 애완동물 동반
						탑승시 전용운반상자를 이용해야 합니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem other" onclick="toggleAnswer(40)">홈페이지, 모바일 예매시 문제가 발생 시 어디에 문의해야
				합니까?</dt>
			<dd class="active" id="answer40">
				<div class="answer">
					<p>
						통합고객센터로 문의하시기 바랍니다.<br>문의처 : 1644-9030 (평일 09시 ~ 18시, 장애/오류
						접수 24시간)
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem other" onclick="toggleAnswer(41)">터미널에 대한 개선사항이나 건의사항은 어디에 문의해야
				합니까?</dt>
			<dd class="active" id="answer41">
				<div class="answer">
					<p>
						전국의 고속버스 터미널은 각각의 사업장으로 별도로 존재합니다. <br>따라서 매표원의 불친절이나 터미널들 대한
						건의 사항은 각각의 터미널에 문의를 하셔야 합니다.
					</p>
				</div>
			</dd>
			<dt class ="list-faqItem other" onclick="toggleAnswer(42)">이용한 차량에 물건을 놓고 내렸을 경우 찾을 수 있는 방법이
				있는 지 궁금합니다.</dt>
			<dd class="active" id="answer42">
				<div class="answer">
					<p>분실물과 유실물은 고속버스 운송회사별 각 지역센터에서 운영되고 있으며, 운송회사 연락처는
						[고객센터]→[유실물 센터 안내] 메뉴에서 확인 가능합니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem update" onclick="toggleAnswer(43)" >홈페이지에서 예매 한건에 대해 어플에서 승차권 변경 또는
				취소가 가능한가요?</dt>
			<dd class="active" id="answer43">
				<div class="answer">
					<p>고객님 홈페이지에서 예매 하신건은 홈페이지 또는 창구에서 승차권 변경또는 취소가 가능하며 모바일 환경에서는
						진행되지 않습니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem other" onclick="toggleAnswer(44)">모바일에서 인터넷 접속하면 홈페이지 접속이 안되는데요.
				어떻게 해요?</dt>
			<dd class="active" id="answer44">
				<div class="answer">
					<p>고객님, 모바일 웹은 개인 정보 보호와 고객님의 손실을 막기 위해 사용이 되지 않습니다. 고속 버스 모바일
						어플을 설치 하셔서 안전하게 사용하시기 바라며, 일부 노선에 대해서는 홈페이지에서만 예매 가능하고, 해당 승차권의 변경
						또는 취소는 홈페이지에서만 가능합니다.</p>
				</div>
			</dd>
			<dt class ="list-faqItem book" onclick="toggleAnswer(45)">예전에 코버스 홈페이지에서는 예약되던 노선들이 지금
				홈페이지에서는 예매 안되는데요.언제 되나요?</dt>
			<dd class="active" id="answer45">
				<div class="answer">
					<p>노선은 순차적으로 오픈을 하고 있습니다. 고객님들의 안전한 전자 승차권 사용을 위해 지속적으로 노력 하고
						있사오니, 양해 해 주시기 바랍니다.</p>
				</div>

			</dd>
		</dl>
	</div>
</body>
</html>