<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
.custom-select {
	display: inline-block;
	width: 150px;
	height: calc(1.5em + 1.25rem + 2px);
	padding: 0.1rem 2rem 0.1rem 0.7rem;
	font-size: 0.8rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}
.custom-select:focus {
	border-color: #80bdff;
	box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, .25);
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
.form-group{
	width: 50% !important; height: 35px !important;
}.terminalDialog {
    width: 700px; /* 너비 설정 */
    min-width: 460px; /* 최소 너비 설정 */
    padding: 0;
    vertical-align: middle;
    border: 0;
    text-size-adjust: 100%;
    text-align: center;
}
/* class="remodal pop_place"인 div 태그의 스타일 조절 */
.remodal.pop_place {
    width: 700px; /* 너비 설정 (dialog 태그와 동일하게 설정) */
    min-width: 460px; /* 최소 너비 설정 (dialog 태그와 동일하게 설정) */
    padding: 0;
    vertical-align: middle;
    border: 0;
    text-size-adjust: 100%;
    text-align: center;
}
.remodal.pop_place .title {
    position: relative;
    background: #68b3ce;
    padding: 8px 0;
    font-size: 22px;
    color: #fff;
}
.titleLine{
	font-weight: bold; font-size: 15px; line-height: 3;
}
input[type=text], input[type=password] {
	width: 50% !important; height: 35px !important; margin-top: 6px !important;
}

</style>
<title>노선 등록</title>
</head>
<body>
	<div class="breadcrumb">
       <ul class="breadcrumb_list">
          <li><a href="/" class ="selectric tag1">HOME</a></li>
          <li>
             <div class="select-box">
                <div class="selectricWrapper selectric-select">      
                     <a class="selectric tag2">
                        <p class="label">노선 관리</p>
                          <b class="button">▾</b>
                     </a>
                   <div class="selectricItems infor" tabindex="-1" >
                      <div class="selectricScroll">
                         <ul>
                            <li class=""><a class ="link-item" href="<c:url value='/company/companyList'/>">고속사 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/bus/busList'/>">고속버스 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/terminal/list'/>">터미널 관리</a></li>
                            <li class="selected"><a class ="link-item" href="<c:url value='/line/list'/>">노선 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/drive/list'/>">운행 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/board/boardList'/>">공지사항 조회</a></li>
                            <li class="last"><a class ="link-item" href="<c:url value='/board/boardListAdmin'/>">공지사항 등록</a></li>
                         </ul>
                      </div>
                   </div>
                   <input class="selectricInput" tabindex="0">
                </div>
             </div>
          </li>
       </ul>
    </div>
    
 
	<script>
		    // 출발 터미널을 변경할 때마다 호출되는 함수
		    function onDepartureTerminalChange() {
		        // 선택한 출발 터미널의 값을 가져옴
		        const selectedDepartureTerminal = document.getElementById('li_te_depTerminalId').value;
		
		        // 도착 터미널 목록의 모든 옵션을 숨김
		        const arrivalTerminals = document.querySelectorAll('#li_te_arrTerminalId option');
		        arrivalTerminals.forEach(option => option.style.display = 'none');
		
		        // 선택한 출발 터미널을 제외하고 나머지 옵션을 보이게 함
		        arrivalTerminals.forEach(option => {
		            if (option.value !== selectedDepartureTerminal) {
		                option.style.display = 'block';
		            }
		        });
		    }
		
		    // li_travelTime을 LocalTime으로 변환하는 함수
		    function parseTime(input) {
		        const parts = input.split(':');
		        return {
		            hour: parseInt(parts[0], 10),
		            minute: parseInt(parts[1], 10)
		        };
		    }
		
		    // 폼이 서버로 전송되기 전에 실행될 함수
		    function onSubmit() {
		        // li_travelTime 값을 가져와서 LocalTime으로 변환
		        const inputTime = document.getElementById('li_travelTime').value;
		        const parsedTime = parseTime(inputTime);
		
		        // 변환된 값을 숨겨진 input에 설정
		        document.getElementById('hiddenLiTravelTimeHour').value = parsedTime.hour;
		        document.getElementById('hiddenLiTravelTimeMinute').value = parsedTime.minute;
		
		        // 폼을 서버로 전송
		        document.getElementById('lineForm').submit();
		    }
		
		    // 노선 등록 페이지에서 마우스 호버 이벤트
		    document.addEventListener('DOMContentLoaded', function () {
		        const cityOptions = document.querySelectorAll('#li_te_depTerminalId option, #li_te_arrTerminalId option');
		
		        cityOptions.forEach(option => {
		            option.addEventListener('mouseover', function () {
		                const cityId = this.value;
		                loadTerminalsByCity(cityId);
		            });
		        });
		    });
		
		    // Ajax를 사용하여 해당 도시에 속한 터미널 리스트 가져오기
		    function loadTerminalsByCity(cityId) {
		        const xhr = new XMLHttpRequest();
		        xhr.onreadystatechange = function () {
		            if (xhr.readyState === 4 && xhr.status === 200) {
		                const terminals = JSON.parse(xhr.responseText);
		                displayTerminals(terminals);
		            }
		        };
		
		        xhr.open('GET', '/line/terminals/' + cityId, true);
		        xhr.send();
		    }
		
		    // 가져온 터미널 리스트를 화면에 팝업으로 표시
		    function displayTerminals(terminals) {
		        let popupContent = '<h3>도시에 속한 터미널 리스트</h3>';
		        popupContent += '<ul>';
		
		        terminals.forEach(function (terminal) {
		            popupContent += '<li>' + terminal.te_code + '</li>';
		        });
		
		        popupContent += '</ul>';
		
		        // 팝업 표시
		        alert(popupContent);
		    }
		</script>
		
		<dialog class="terminalDialog" id="terminalDialog">
			<div class="remodal pop_place full remodal-is-initialized remodal-is-opened" style="padding: 0">
				<div class="title">터미널 조회
					<button class="remodal-close" id="Close" onclick="remodal_close();"></button>
				</div>
				<div class="cont">
					<div class="place">
						<!-- focus -->
						<ul>
							<!-- 팝업창 -->
							<li id="popDeprChc" class="focuson">
								<!--  class="focuson" --> 
								<span class="stit">출발터미널</span>
								<p class="text empty">
									<span class="empty_txt" style="display: none;"></span> 
									<span class="val_txt" id="popDeprNmSpn"></span>
								</p>
							</li>
							<li id="popArvlChc"><span class="stit">도착터미널</span>
								<p class="text empty">
									<span class="empty_txt">선택</span> 
									<span class="val_txt" id="popArvlNmSpn"></span>
								</p>
							</li>
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
										<li class="active" id="areaListAll"><span onclick="terminalViewList('all',this);">전체</span></li>
										<li><span onclick="terminalViewList('1',this);">서울</span></li>
										<li><span onclick="terminalViewList('2',this);">인천/경기</span></li>
										<li><span onclick="terminalViewList('3',this);">강원</span></li>
										<li><span onclick="terminalViewList('4',this);">대전/충남</span></li>
										<li><span onclick="terminalViewList('5',this);">충북</span></li>
										<li><span onclick="terminalViewList('6',this);">광주/전남</span></li>
										<li><span onclick="terminalViewList('7',this);">전북</span></li>
										<li><span onclick="terminalViewList('8',this);">부산/경남</span></li>
										<li><span onclick="terminalViewList('9',this);">대구/경북</span></li>
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
		</dialog>
	
		<button class="terminalInput btn btn-outline-dark" id ="terminalInput">터미널 입력 하기</button>
		<form action="<c:url value='/line/insert'/>" method="post" id ="lineForm">
			<div class="container">
				<table class="table table-hover" style="margin-top: 30px;">
					<tr>
						<td class="titleLine">출발터미널</td>
						<td>
							<p class="text empty" style="margin-top: 10px;">
								<input type="hidden" name="deprCd" id="deprCd" value="">
								<span class="empty_txt"></span>
								<span class="val_txt" id="deprNmSpn">
									<input type="text" name="bus_carNumber" class="form-control" placeholder="출발 터미널" readonly>
								</span>
							</p>					
						</td>
						
					</tr>
					<tr>
						<td class="titleLine">도착 터미널</td>
						<td>
							<p class="text empty" style="margin-top: 10px;">
								<input type="hidden" name="arvlCd" id="arvlCd" value="">
								<span class="empty_txt"></span> 
								<span class="val_txt" id="arvlNmSpn">
									<input type="text" name="bus_carNumber" class="form-control" placeholder="도착 터미널" readonly>
								</span>
							</p>
						</td>
					</tr>
					<tr>
						<td class="titleLine">총 거리</td>
						<td class="titleLine">
							<input class="form-control" type="text" id="li_distance" name="li_distance" placeholder="예: 123.0" required>
						</td>
					</tr>
					<tr>
						<td class="titleLine">소요 시간</td>
						<td class="titleLine">
							<input class="form-control" type="text" id="li_travelTime" name="li_travelTime" placeholder="예: 01:10" required>
						</td>
					</tr>
					<tr>
						<td class="titleLine">사용 여부</td>
						 <td class="titleLine">
					        <select class="form-group valid" id="li_use" name="li_use" required>
					            <option value="true" ${line.li_use ? 'selected' : ''}>사용</option>
					            <option value="false" ${!line.li_use ? 'selected' : ''}>미사용</option>
					        </select>
					    </td>
					</tr>
				</table>
			</div>
			<input type="hidden" id="li_te_depTerminalId" name="li_te_depTerminalId">
			<input type="hidden" id="li_te_arrTerminalId" name="li_te_arrTerminalId">
			<input type="hidden" id="hiddenLiTravelTimeMinute" name="hiddenLiTravelTimeMinute">
			<input type="hidden" id="hiddenLiTravelTimeHour" name="hiddenLiTravelTimeHour">
			<button class="btn btn-success col-5 offset-3" style="margin-top: 10px;" onclick ="onSubmit();">등록하기</button>
		</form>
</body>
<script type="text/javascript">

	var button = $(".terminalInput");
	let state = 'start'
	var DepText = null;
	var ArvText = null;
	button.on("click", function () {
		 var city_num = "all";
		 if (typeof terminalDialog.showModal === "function") {
			 terminalDialog.showModal();
			 	$("#popDeprChc").addClass("focuson"); // 출발지 터미널 활성화
			 	$("#popArvlChc").removeClass("focuson"); // 도착지 터미널 비활성화
			 	ajaxTerminal(city_num);
			  }
		 else {
			    alert("The <dialog> API is not supported by this browser");
			  }
	});
	//x버튼 클릭 시 팝업창 닫기
	function remodal_close(){
		terminalDialog.close();
	}
	function terminalViewList(city_num,obj) {
	
		var parentLi = obj.parentNode;
		var liElements = document.querySelectorAll(".area_list li");
		liElements.forEach(function(li) {
			if (li !== parentLi) {
			li.classList.remove('active');
			}
		});
		parentLi.classList.add('active');
		console.log("city_num",city_num);
		ajaxTerminal(city_num);
	}
	
	function ajaxTerminal(city_num){
		$('.empty_txt').show();
		$.ajax({
			type : "get",
			url : '<c:url value = "/terminal/ajax"/>',
			data :{
				city_num : city_num
			},
			success : function(data){
				insertTerminal(data, city_num)
				
			},
			error : function(a,b,c){
				console.log("오류 ajaxTerminal");
			}
		});
	}
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
	        		 ajaxTerminal(city_num);  // 출발지 선택 시 city_num 이 all 값인 상태로 
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
	        		 
	        		 document.getElementById('li_te_depTerminalId').value = DepText; // input 태그 value 값
	        		 document.getElementById('li_te_arrTerminalId').value = ArvText; // input 태그 value 값
	        		 terminalDialog.close();
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
	     	    	 ajaxTerminal(city_num);
	     	    	 $('#areaListAll').addClass("active");
	        		 $("#popArvlChc").removeClass("focuson"); // 도착지 터미널 비활성화
	        		 $("#popDeprChc").addClass("focuson"); // 출발지 터미널 활성화
	        		 
	        	 }
	        	 
	         })
	       
	    }
	}
	
	function onSubmit() {
	    // li_travelTime 값을 가져와서 LocalTime으로 변환
	    const inputTime = document.getElementById('li_travelTime').value;
	    const parsedTime = parseTime(inputTime);
	
	    // 변환된 값을 숨겨진 input에 설정
	    document.getElementById('hiddenLiTravelTimeHour').value = parsedTime.hour;
	    document.getElementById('hiddenLiTravelTimeMinute').value = parsedTime.minute;
	
	    // 폼을 서버로 전송
	    document.getElementById('lineForm').submit();
	}
</script>
</html>