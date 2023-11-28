<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<style>
.title_wrap {
	background:
		url(https://www.kobus.co.kr/images/page/visual_pc_mypage.jpg) center 0
		no-repeat;
	background-size: cover;
}

.myPage_list {
	color: black;
	line-height: 2;
	text-align: center;
}
</style>
<title>결제내역</title>

<!-- 팝업달력 -->
<link rel="stylesheet" 	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

	$(function() {
		 // 현재 날짜 가져오기
	    var currentDate = new Date();
	
	    //3개월전의 날짜 계산
	    var threeMonthsAgo = new Date();
	    threeMonthsAgo.setMonth(currentDate.getMonth() - 3);
		$("#startDate").datepicker({
			dateFormat : "yy-mm-dd",
			showOn : "button",
			buttonImage : "https://www.kobus.co.kr/images/page/ico_calender.png",
			buttonImageOnly : true,
			buttonText : "달력 열기",
			minDate : threeMonthsAgo,
			maxDate : currentDate
		});
	
		$("#endDate").datepicker({
			dateFormat : "yy-mm-dd",
			showOn : "button",
			buttonImage : "https://www.kobus.co.kr/images/page/ico_calender.png",
			buttonImageOnly : true,
			buttonText : "달력 열기",
			minDate : threeMonthsAgo,
			maxDate : currentDate
		});
		
		termClick('term01');
	});
	
	
	//자동 개월수 입력
	function termClick(id) {
        var term = id.substr(4); // "term01"에서 숫자만 추출
        var today = new Date();
        var endDate = new Date(today);

        if (term === '01') {
            // 1개월
            endDate.setMonth(today.getMonth() - 1);
        } else if (term === '02') {
            // 2개월
            endDate.setMonth(today.getMonth() - 2);
        } else if (term === '03') {
            // 3개월
            endDate.setMonth(today.getMonth() - 3);
        }

        var startDate = today.toISOString().substr(0, 10); // YYYY-MM-DD 형식
        endDate = endDate.toISOString().substr(0, 10); // YYYY-MM-DD 형식

        document.getElementById("endDate").value = startDate;
        document.getElementById("startDate").value = endDate;
    }
	
	function dateMaker(date){
		
		const nowDate= new Date(date);
		// 요일을 추출
		const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
		const dayOfWeek = daysOfWeek[nowDate.getDay()]; // 0(일요일)부터 6(토요일)까지의 숫자를 반환
		// 요일을 해당 요소에 설정
		var frontDate = date.substring(0,11);
		var endDate = date.substring(11,date.length);
		console.log(frontDate);
		console.log(endDate);
		
		return frontDate + "(" + dayOfWeek + ") " + endDate;
	}
	
	function changeDateFormat(departureDate){
		return departureDate[0]+"-"+departureDate[1]+"-"+departureDate[2];
	}
	
	function searchPay(){
		let data = {
				payStatus : $('input[name=payStatus]:checked').val(),
				startDate : $("#startDate").val(),
				endDate : $("#endDate").val()
		};
		console.log(JSON.stringify(data));
		$.ajax({
			async : true,
			type : 'post',
			url : '<c:url value="/member/paymentDetail"/>', 
			data : JSON.stringify(data), 
			contentType : "application/json; charset=UTF-8", 
			dataType : "json", 
			success: function (data) {
			    console.log(data);
			    var payStatus = $('input[name=payStatus]:checked').val();
			    if (data.result) {
			        let bookList = data.bookList;
			        let tbody = $('#searchBody');

			        // 기존 tbody 내용 지우기
			        tbody.empty();

			        if (bookList.length === 0) {
			            // bookList가 비어있을 때 처리
			            tbody.append('<tr><td colspan="7" class="noData">결제하신 내역이 없습니다.</td></tr>');
			        } else {
			            // bookList를 순회하며 행을 tbody에 추가
			            $.each(bookList, function (index, book) {
			            	console.log(book)
			                let row = '<tr>';
			                if(book.cancelVo != null){
			                	 if(payStatus==2){
				                	console.log("2번");
				                    row += '<td>' + book.cancelVo.ca_cancelDate + '</td>';
				                    row += '<td class="status">취소</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_depTerminalId + '</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_arrTerminalId + '</td>';
				                    row += '<td>' + changeDateFormat(book.driveVo.dr_depPlandDate) + '</td>';
				                    row += '<td>' + book.driveVo.busVo.co_name + '</td>';
				                    row += '<td>' + numberFormat(book.bk_totalPeople) + '</td>';
				                    row += '<td>' + numberFormat(book.cancelVo.ca_refundAmount) + '</td>';
				                }
			                }
		                    if(payStatus==0){
		                    	console.log("0번");			                
		                    	row += '<td>' + dateMaker(book.bk_date) + '</td>';
			                    row += '<td class="status">결제</td>';
			                    row += '<td>' + book.driveVo.lineVo.li_te_depTerminalId + '</td>';
			                    row += '<td>' + book.driveVo.lineVo.li_te_arrTerminalId + '</td>';
			                    row += '<td>' + changeDateFormat(book.driveVo.dr_depPlandDate) + '</td>';
			                    row += '<td>' + book.driveVo.busVo.co_name + '</td>';
			                    row += '<td>' + numberFormat(book.bk_totalPeople) + '</td>';
			                    row += '<td>' + numberFormat(book.bk_totalPrice) + '</td>';
			                    row += '</tr>';
			                    if(book.cancelVo != null){
			                    	row += '<tr>';
				                    row += '<td>' + book.cancelVo.ca_cancelDate + '</td>';
				                    row += '<td class="status">취소</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_depTerminalId + '</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_arrTerminalId + '</td>';
				                    row += '<td>' + changeDateFormat(book.driveVo.dr_depPlandDate) + '</td>';
				                    row += '<td>' + book.driveVo.busVo.co_name + '</td>';
				                    row += '<td>' + numberFormat(book.bk_totalPeople) + '</td>';
				                    row += '<td>' + numberFormat(book.cancelVo.ca_refundAmount) + '</td>';
		                    	}
		                    }
		                    if(payStatus==1){
		                    	console.log("1번");
	                    	    row += '<td>' + dateMaker(book.bk_date) + '</td>';
	                    	    row += '<td class="status">결제</td>';
			                    row += '<td>' + book.driveVo.lineVo.li_te_depTerminalId + '</td>';
			                    row += '<td>' + book.driveVo.lineVo.li_te_arrTerminalId + '</td>';
			                    row += '<td>' + changeDateFormat(book.driveVo.dr_depPlandDate) + '</td>';
			                    row += '<td>' + book.driveVo.busVo.co_name + '</td>';
			                    row += '<td>' + numberFormat(book.bk_totalPeople) + '</td>';
			                    row += '<td>' + numberFormat(book.bk_totalPrice) + '</td>';
		                    }
			                row += '</tr>';
			                tbody.append(row);
			            });
			        }
			   	} else {
			        alert("로그인을 해주세요.");
			        location.href = "/member/loginView";
			    }
			}
		});
	}
</script>
</head>
<body>
	
	<div class="page">
		<div class="tab_wrap tab_type1">
			<div class="tab_wrap tab_type1" style="border-bottom: 1px solid #e6e6e6;">
				<span style="color: #bc4ac0;; font-size: 20px; margin-left: 20px;">승차권</span>
			</div>

			<div class="tab_conts" style="display: block;">
				<div class="receipt_wrap ">
					<ul class="innerBox col4">
						<li>
							<div class="box_inputForm">
								<strong>상태</strong> 
								<span class="radio_wrap"> 
									<span class="custom_radio"> 
										<input type="radio" id="status01" name="payStatus" value="0" checked="true"> 
										<label for="status01">전체</label>
									</span> 
									<span class="custom_radio"> 
										<input type="radio" id="status02" name="payStatus" value="1"> 
										<label for="status02">결제</label>
									</span> 
									<span class="custom_radio"> 
										<input type="radio" id="status03" name="payStatus" value="2"> 
										<label for="status03">취소</label>
									</span> 
								</span>
							</div>
						</li>
						<li>
							<div class="box_inputForm">
								<strong>기간</strong> 
								<span class="radio_wrap"> 
									<span class="custom_radio"> 
										<input type="radio" id="term01" name="term" onclick="javascript:termClick(this.id);" checked=true> 
										<label for="term01">1개월</label>
									</span> 
									<span class="custom_radio"> 
										<input type="radio" id="term02" name="term" onclick="javascript:termClick(this.id);"> 
										<label for="term02">2개월</label>
									</span> 
									<span class="custom_radio"> 
										<input type="radio" id="term03" name="term" onclick="javascript:termClick(this.id);"> 
										<label for="term03">3개월</label>
									</span>
								</span> 
							</div>
						</li>
						
						<li class="label_tag">
							<div class="date_picker_wrap">
								<span class="name">조회시작일</span><br /> 
								<input type="text" id="startDate" name="searchStartDate" style="border: none; background-color: #f3f4f6;" readonly>
							</div>
						</li>
						<li class="label_tag">
							<div class="date_picker_wrap">
								<span class="name">조회종료일</span><br /> 
								<input type="text" id="endDate" name="searchEndDate" style="border: none; background-color: #f3f4f6;" readonly>
							</div>
						</li>
						
					</ul>
				</div>
				
				<p class="btns col1">
					<a href="#" class="btnL btn_confirm" onclick="searchPay();">조회</a>
				</p>
				
				<div class="search_result_wrap">
					<table class="tbl_search_result">
						<caption>
							<strong>조회결과 상세정보</strong>
							<p>날짜, 구분, 노선, 배차정보, 매수, 결제금액, 상세조회</p>
						</caption>
						<colgroup>
							<col style="width: 20%;">
							<col style="width: 7%;">
							<col style="width: 13%;">
							<col style="width: 13%;">
							<col style="width: 17%;">
							<col style="width: 12%;">
							<col style="width: 10%;">
							<col style="width: 20%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">날짜</th>
								<th scope="col">구분</th>
								<th scope="col">출발지</th>
								<th scope="col">도착지</th>
								<th scope="col">출발일시</th>
								<th scope="col">운수사</th>
								<th scope="col">매수</th>
								<th scope="col">결제금액</th>
							</tr>
						</thead>
					
						<tbody id='searchBody'></tbody>
						
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>