<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_pc_mypage.jpg) center 0 no-repeat;
	background-size: cover;
}
.pointTitle{
	font-weight: bold; font-size: 15px !important; color: #000 !important; 
} 
</style>
<title>마일리지</title>

<!-- 팝업달력 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	$(function() {
		 // 현재 날짜 가져오기
         var currentDate = new Date();

         //2년전의 날짜 계산
         var twoYearsAgo = new Date();
         twoYearsAgo.setMonth(currentDate.getMonth() - 24);
		$("#startDate").datepicker({
			dateFormat : "yy-mm-dd",
			showOn : "button",
			buttonImage : "https://www.kobus.co.kr/images/page/ico_calender.png",
			buttonImageOnly : true,
			buttonText : "달력 열기",
			minDate : twoYearsAgo,
			maxDate : currentDate
		});

		$("#endDate").datepicker({
			dateFormat : "yy-mm-dd",
			showOn : "button",
			buttonImage : "https://www.kobus.co.kr/images/page/ico_calender.png",
			buttonImageOnly : true,
			buttonText : "달력 열기",
			minDate : twoYearsAgo,
			maxDate : currentDate
		});
		
		$("#me_point").text(numberFormat('${user.me_point}'));
	});
	
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
	
	function searchPoint(){
		let data = {
				pointStatus : $('input[name=pointStatus]:checked').val(),
				startDate : $("#startDate").val(),
				endDate : $("#endDate").val()
		};
		console.log(JSON.stringify(data));
		$.ajax({
			async : true,
			type : 'post',
			url : '<c:url value="/member/point"/>', 
			data : JSON.stringify(data), 
			contentType : "application/json; charset=UTF-8", 
			dataType : "json", 
			success: function (data) {
			    console.log(data);
			    var pointStatus = $('input[name=pointStatus]:checked').val();
			    if (data.result) {
			        let bookList = data.bookList;
			        let tbody = $('#searchBody');

			        // 기존 tbody 내용 지우기
			        tbody.empty();

			        if (bookList.length === 0) {
			            // bookList가 비어있을 때 처리
			            tbody.append('<tr><td colspan="6" class="noData">마일리지 적립/사용/취소 내역이 없습니다.</td></tr>');
			        } else {
			            // bookList를 순회하며 행을 tbody에 추가
			            $.each(bookList, function (index, book) {
			                let row = '<tr>';
			                if(book.cancelVo != null){
				                if (book.cancelVo.ca_refundAmount != null) {
				                    row += '<td>' + book.cancelVo.ca_cancelDate + '</td>';
				                    row += '<td class="status">취소</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_depTerminalId + '</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_arrTerminalId + '</td>';
				                    row += '<td>' + changeDateFormat(book.driveVo.dr_depPlandDate) + '</td>';
				                    row += '<td>' + book.driveVo.busVo.co_name + '</td>';
				                    row += '<td>' + numberFormat(book.bk_fee) + '</td>';
				                    row += '<td>' + numberFormat(book.cancelVo.ca_refundPoint) + '</td>';
				                }
			                }else if (book.bk_usePoint != null) {
			                    row += '<td>' + dateMaker(book.bk_date) + '</td>';
			                    if(pointStatus==0){
				                    row += '<td class="status">적립</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_depTerminalId + '</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_arrTerminalId + '</td>';
				                    row += '<td>' + changeDateFormat(book.driveVo.dr_depPlandDate) + '</td>';
				                    row += '<td>' + book.driveVo.busVo.co_name + '</td>';
				                    row += '<td>' + numberFormat(book.bk_fee) + '</td>';
				                    row += '<td>' + numberFormat(book.bk_fee * 0.05) + '</td>';
				                    row += '</tr>';
				                    row += '<tr>';
				                    row += '<td>' + dateMaker(book.bk_date) + '</td>';
				                    row += '<td class="status">사용</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_depTerminalId + '</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_arrTerminalId + '</td>';
				                    row += '<td>' + changeDateFormat(book.driveVo.dr_depPlandDate) + '</td>';
				                    row += '<td>' + book.driveVo.busVo.co_name + '</td>';
				                    row += '<td>' + numberFormat(book.bk_fee) + '</td>';
				                    row += '<td>' + numberFormat(book.bk_usePoint) + '</td>';
				                    
			                    }else if(pointStatus==1){
				                    row += '<td class="status">적립</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_depTerminalId + '</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_arrTerminalId + '</td>';
				                    row += '<td>' + changeDateFormat(book.driveVo.dr_depPlandDate) + '</td>';
				                    row += '<td>' + book.driveVo.busVo.co_name + '</td>';
				                    row += '<td>' + numberFormat(book.bk_fee) + '</td>';
				                    row += '<td>' + numberFormat(book.bk_fee * 0.05) + '</td>';
			                    }else if(pointStatus==2){
				                    row += '<td class="status">사용</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_depTerminalId + '</td>';
				                    row += '<td>' + book.driveVo.lineVo.li_te_arrTerminalId + '</td>';
				                    row += '<td>' + changeDateFormat(book.driveVo.dr_depPlandDate) + '</td>';
				                    row += '<td>' + book.driveVo.busVo.co_name + '</td>';
				                    row += '<td>' + numberFormat(book.bk_fee) + '</td>';
				                    row += '<td>' + numberFormat(book.bk_usePoint) + '</td>';
			                    }
			                    
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
			<div class="mileage_top">
				<p>적립된 마일리지는 승차권 예매에 한하여 사용할 수 있습니다.</p>
				<p>* 승차권 결제금액의 0.05%가 마일리지로 적립됩니다. (예매완료 후 적립)</p>
				<p>* 마일리지 내역은 현재일 날짜기준 2년전까지만 조회 가능합니다.</p>
			</div>
			<div>
				<strong>잔여 마일리지 : <span id="me_point">${me_point}</span> POINT</strong>
			</div>
			<div class="receipt_wrap border-top" style="margin-top:15px;">
				<ul class="innerBox col3">
					<li>
						<div class="box_inputForm">
							<strong>구분</strong> 
							<span class="radio_wrap"> 
								<span class="custom_radio"> 
									<input type="radio" id="status01" name="pointStatus" value="0" checked="true"> 
									<label for="status01">전체</label>
								</span> 
								<span class="custom_radio"> 
									<input type="radio" id="status02" name="pointStatus" value="1"> 
									<label for="status02">적립</label>
								</span> 
								<span class="custom_radio"> 
									<input type="radio" id="status03" name="pointStatus" value="2"> 
									<label for="status03">사용</label>
								</span> 
								<span class="custom_radio"> 
									<input type="radio" id="status04" name="pointStatus" value="3"> 
									<label for="status04">취소</label>
								</span>
							</span>
						</div>
					</li>
					<li class="label_tag">
						<div class="date_picker_wrap">
							<span class="name">조회시작일</span><br/> 
							<input type="text" id="startDate" name="searchStartDate" style="border: none; background-color: #f3f4f6;" readonly>
						</div>
					</li>
					<li class="label_tag">
						<div class="date_picker_wrap">
							<span class="name">조회종료일</span><br/> 
							<input type="text" id="endDate" name="searchEndDate" style="border: none; background-color: #f3f4f6;" readonly>
						</div>
					</li>
				</ul>
			</div>
			<p class="btns col1">
				<button class="btnL btn_confirm" onclick="searchPoint();">조회</button>
			</p>
		<div class="search_result_wrap">
			<table class="tbl_search_result tbl_mileage">
				<caption>
					<strong>조회결과 상세정보</strong>
					<p>날짜, 구분, 노선, 배차정보, 매수, 결제금액</p>
				</caption>
				<colgroup>
					<col style="width: 15%;">
					<col style="width: 5%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 15%;">
					<col style="width: 13%;">
					<col style="width: 13%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="pointTitle">날짜</th>
						<th scope="col" class="pointTitle">구분</th> <!--0.없음 1.적립 2.사용 3.취소 -->
						<th scope="col" class="pointTitle">출발지</th>
						<th scope="col" class="pointTitle">도착지</th>
						<th scope="col" class="pointTitle">출발일시</th>
						<th scope="col" class="pointTitle">운수사</th>
						<th scope="col" class="pointTitle">예매금액</th>
						<th scope="col" class="pointTitle">마일리지(POINT)</th>
					</tr>
				</thead>
				<tbody id='searchBody'>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>