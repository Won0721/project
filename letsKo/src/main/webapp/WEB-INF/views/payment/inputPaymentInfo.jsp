<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>결제정보 입력</title>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
	<!-- 결제API(포트원) -->
	var IMP = window.IMP;
	IMP.init(""); // 본인 포트원 앱키 적용 
	
	function requestPay() {
		var checkedAgreeCount = $(".agree:checked").filter(function() {
	        return $(this).val() === "on";
	    }).length;
		
		// 8자리 난수 생성
		var merchant_uid = Math.floor(Math.random() * (99999999 - 1)) + 1;

		//fnInsertPayInfo(); 
		//return false;
		
		$("#bk_payNum").val(merchant_uid);

		if (checkedAgreeCount === 4) {
	        if (confirm('결제하시겠습니까?')) {
	            IMP.request_pay({
	                pg: "html5_inicis",
	                pay_method: "card",
	                merchant_uid: merchant_uid,
	                name: "고속버스 예약",
	                buyer_email: "${me_email}",
	                buyer_name: "${me_id}",
	                buyer_tel: "${me_phone}",
	                amount: $("#totalAmount").val()
	            }, function(rsp) {
	                if (rsp.success) {
	                    // 결제 성공, 서버 유효성 검증을 진행
	                    alert('결제가 완료되었습니다.');
	                    fnInsertPayInfo();
	                } else {
	                    alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
	                }
	            });
	        }
	    } else {
	        alert("약관에 동의해주세요.");
	    } 
	}

	function fnInsertPayInfo(){
		$('#submitButton').click();
	}
	
	// 동의 
	function fnChgCfmBtn(obj) {
	    console.log(obj.id);
	    if (obj.getAttribute('value') === 'on') {
	        obj.setAttribute('value', 'off'); // 변경된 value 값
	    } else {
	        obj.setAttribute('value', 'on');
	    }
	    
	    // 모든 "agree" 클래스를 가진 체크박스를 선택하고 "on" 값인 것들을 카운트
	    var checkedAgreeCount = $(".agree:checked").filter(function() {
	        return $(this).val() === "on";
	    }).length;
	
	    // 만약 "on" 값인 동의 체크박스가 4개일 때 버튼 활성화
	    if (checkedAgreeCount === 4) {
	        $("#agreeAll").val('on');
	        $(".agreeAll").css('color', '#594cb5');
	        $(".agreeAll").css('font-weight', 'bold');
	        $(".agreeAll").css('background', 'url(https://www.kobus.co.kr/images/common/custom_chkP.png) 0 3px no-repeat !important;');
	    } else {
	        $("#agreeAll").val('');
	        $(".agreeAll").css('color', '#b3b3b3');
	        $(".agreeAll").css('font-weight', 'unset');
	        $(".agreeAll").css('background', 'url(https://www.kobus.co.kr/images/common/custom_chkG.png) 0 3px no-repeat !important;');
	    }
	}
	
	// 전체동의
	function fnAgreeAllCilck(){
		var checkedAgreeCount = $(".agree:checked").filter(function() {
	        return $(this).val() === "on";
	    }).length;
		
		if (checkedAgreeCount === 4) {
			$(".agree:checked").click();
		}else{
			$(".agree:not(:checked)").click();	
		}
	}
	
	// 요일 메이커
	// 페이지가 로드될 때 스크립트 실행
	window.addEventListener('load', function() {
	// 드라이브 날짜를 가져오기
	const driveDate = new Date('${drive.dr_depPlandDate}');
	// 요일을 추출
	const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
	const dayOfWeek = daysOfWeek[driveDate.getDay()]; // 0(일요일)부터 6(토요일)까지의 숫자를 반환
	// 요일을 해당 요소에 설정
	document.getElementById("dayOfWeek").textContent = dayOfWeek;
	});
	
	// 결제금액 및 마일리지 
	$(document).ready(function() {
	    
	    $("#estimatedAmount").text(numberFormat('${estimatedAmount}') +" 원");
	    $("#totalAmountSpan").text(numberFormat('${estimatedAmount}') +" 원");
	    $("#remainingPoint").text(numberFormat('${point} '));
	    
	    // 사용마일리지 밸리데이션 체크
	    $("#bk_usePoint").change(function(){
	    	var estimatedAmount = parseInt('${estimatedAmount}');
	    	var bk_usePoint = parseInt($("#bk_usePoint").val());
	    	var point = parseInt('${point}');
	    	
	    	var reg = /[^0-9]/g;
	    	
    		if(reg.test(bk_usePoint)){
    			alert('마일리지는 숫자만 입력 가능합니다.');
	    		$("#bk_usePoint").val(0);
	    		$("#bk_usePoint").text('0');
    			return false;
    		}
    		
	    	if(bk_usePoint > point || bk_usePoint < 0 || bk_usePoint > estimatedAmount){
	    		alert('보유 마일리지를 확인해주세요.');
	    		$("#bk_usePoint").val(0);
	    		$("#bk_usePoint").text('0');
	    		$("#totalAmount").val(estimatedAmount);
		    	$("#totalAmountSpan").text(numberFormat(estimatedAmount) +" 원");
	    		return false;
	    	} 
	    	$("#totalAmount").val(estimatedAmount - bk_usePoint);
	    	$("#totalAmountSpan").text(numberFormat(estimatedAmount - bk_usePoint) +" 원");
	    })
	});
	
</script>
<style>
	.title_wrap {
		background: url(https://www.kobus.co.kr/images/page/visual_route_bg.jpg) center 0 no-repeat;
		background-size: cover;
	}
	.containerPayment {padding: 30px 40px 100px;}
	.agreement_wrap {margin-top: 40px;}
	h4 {margin-top: 45px; font-size: 20px; color: #000;}
</style>
</head>

<body>
	<!-- 헤더 밑 드랍다운 -->
	<div class="breadcrumb">
	   <ul class="breadcrumb_list">
	      <li><a href="/" class ="selectric tag1">HOME</a></li>
	      <li>
	         <div class="select-box">
	            <div class="selectricWrapper selectric-select">      
	                 <a class="selectric tag2">
	                    <p class="label">고속버스 예매</p>
	                  <b class="button">▾</b>
	                 </a>
	               <div class="selectricItems infor" tabindex="-1" >
	                  <div class="selectricScroll">
	                     <ul>
	                        <li class=""><a class ="link-item" href="<c:url value='#'/>">고속버스 예매</a></li>
	                        <li class="selected"><a class ="link-item" href="<c:url value='#'/>">예매확인</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='#'/>">운행정보</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='#'/>">이용안내</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='/board/boardList'/>">공지사항</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='#'/>">고객센터</a></li>
	                        <li class=""><a class ="link-item" href="<c:url value='#'/>">전국고속버스운송사업조합</a></li>
	                        <li class="last"><a class ="link-item" href="<c:url value='#'/>">터미널사업자협회</a></li>
	                     </ul>
	                  </div>
	               </div>
	               <input class="selectricInput" tabindex="0">
	            </div>
	         </div>
	      </li>
	   </ul>
	</div>
	
	<div class="containerPayment">
		<form action="<c:url value='/payment/completeReservation'/>" method="post">
		<input type="hidden" id="bk_payNum" name="bk_payNum" value="0"/>
		<input type="hidden" id="bk_dr_num" name="bk_dr_num" value="${dr_num}"/>
			<!-- 서비스 이용약관 동의 -->
			<div class="section">
				<div class="agreement_wrap">
					<div class="agreement_tit">
						<h4 class="first">서비스 이용약관 동의</h4>
						<span class="custom_check chk_blue"> 
							<input type="checkbox" id="agree1" class="agree" onclick="fnChgCfmBtn(this);" value="off"> 
							<label for="agree1">동의</label>
						</span>
					</div>
					<div class="scroll-wrapper agreement_cont scrollbar-inner"
						style="position: relative;">
						<div class="agreement_cont scrollbar-inner scroll-content scroll-scrolly_visible"
							style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 120px;">
							<div class="terms_wrap" id="service">
								<h1>&lt;서비스 이용약관&gt;</h1>
								<dl>
									<dt>제1장 총칙</dt>
									<dd>
										<ol class="terms_list">
											<li>제1조 (목적)
												<ol class="sub_list">
													<li>본 약관은 티머니(이하 ‘회사’라 합니다)가 제공하는 고속버스 티머니/시외버스 티머니 어플리케이션 서비스 및 고속버스통합예매 홈페이지의 이용과 관련하여 회사와 이용자 간의 권리, 의무 및 기타 제반 사항을 정함에 그 목적이 있습니다.</li>
												</ol>
											</li>
											<li>제2조 (약관의 적용)
												<ol class="sub_list">
													<li>① 서비스 이용자에게는 본 약관과 여객운송 사업자의 운송약관이 적용됩니다.</li>
													<li>② 본 약관에서 규정되지 않은 사항에 대해서는 여객운송 사업자의 운송약관에 따릅니다.</li>
												</ol>
											</li>
											<li>제3조 (용어의 정의)
												<ol class="sub_list">
													<li>① 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
														<ol class="sub_list">
															<li>1. “서비스”란 이용자가 모바일 어플리케이션 상에서 고속ㆍ시외버스 승차권의 예매 및 예매 확인, 고속ㆍ시외버스 출발시간 확인과 기타 부가 기능을 이용 할 수 있도록 회사가 제공하는 서비스(고속버스 티머니 및 시외버스 티머니 어플리케이션, 고속버스통합예매 홈페이지)를 말합니다.</li>
															<li>2. “모바일 기기”란 어플리케이션의 설치가 가능한 운영체재를 탑재하고 있는 스마트 폰, 태블릿 PC 등의 이동 통신 기기를 말합니다.</li>
															<li>3. “이용자”란 본 약관에 따라 회사가 제공하는 서비스를 이용하는 회원과 비회원을 말합니다.</li>
															<li>4. “회원”이란 회사가 정한 회원 가입 절차에 따라 계정 등록을 마친 이용자로서 결제 내역 조회, 1:1문의 등의 추가 기능을 사용할 수 있는 자를 말합니다.</li>
															<li>5. “비회원”이란 회원 가입 절차에 따른 계정 등록을 하지 않고 서비스를 이용하는 자를 말합니다.</li>
															<li>6. “모바일 승차권”이란 여객운송 사업자가 발행하는 고속ㆍ시외버스 승차권을 모바일 기기 어플리케이션으로 전송 받은 것을 말합니다.</li>
															<li>7. “결제”란 이용자가 서비스 내에서 제공되는 결제수단으로 고속ㆍ시외버스 승차권의 	예매 대금을 지불하는 행위를 말합니다.</li>
															<li>8. “환불”이란 어플리케이션에서 예매한 승차권을 취소할 때 예매 대금을 이용자와 회사 간에 약정된 방법과 절차에 따라 이용자에게 돌려주는 것을 말합니다.</li>
															<li>9. “모바일티머니”란 이동전화, 태블릿, 기타 모바일 기기 내에 장착되는 USIM chip 또는 SE(Secure Element, Embedded SE/Secure Memory card 등, 이하 USIM chip 등이라 함) 등에 회사가 발급하는 선불전자지급수단을 말합니다.</li>
															<li>10. “신용카드”란 서비스 상에서 고속ㆍ시외버스 승차권의 예매 대금을 결제 할 수 있도록 회사와 계약이 체결 된 은행 또는 신용카드사가 발행한 신용카드 및 체크카드를 말합니다.</li>
														</ol>
													</li>
													<li>② 본 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 여객운송 사업자의 운송약관, 관계 법령 및 서비스 별 안내에서 정하는 바에 의합니다.</li>
												</ol>
											</li>
											<li>제4조 (약관의 효력 및 변경)
												<ol class="sub_list">
													<li>① 본 약관은 회사가 본 약관의 내용을 서비스 화면에 게시하거나 기타의 방법으로 이용자에게 공지하고, 이용자가 이에 동의함으로써 적용됩니다.</li>
													<li>② 회사는 필요하다고 인정되는 경우, 「약관의 규제에 관한 법률」, 「전자금융거래법」, 정보통신망 이용촉진 및 정보보호 등에 관한 법률」 등 관련 법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.</li>
													<li>③ 회사가 약관을 변경할 경우에는 적용일자 및 변경사유를 명시하여 제1항과 같은 방법으로 그 시행일자로부터 14일 전에 공지합니다. 단, 이용자에게 불리한 약관 내용의 변경에 대해서는 30일 전에 공지합니다. 
														이용자의 연락처 변경 등으로 인하여 회사가 각 이용자에게 개별 통지 하기가 어려운 경우에는 본 항의 공지를 함으로써 개별 통지 한 것으로 간주합니다.</li>
													<li>④ 이용자가 제3항에 따라 변경된 약관에 동의하지 않을 경우 서비스의 이용을 중단하고 이용 계약을 해지할 수 있습니다. 
														다만, 변경 약관 시행일의 전날까지 명시적으로 약관 변경 거부 의사를 표시하지 아니할 경우 변경 약관에 동의한 것으로 간주합니다.</li>
												</ol>
											</li>
										</ol>
									</dd>
									<dt>제2장 서비스의 이용</dt>
									<dd>
										<ol class="terms_list">
											<li>제5조 (서비스 이용 계약의 체결)
												<ol class="sub_list">
													<li>① 이용자는 약관 동의 후 서비스의 이용이 가능합니다.</li>
													<li>② 결제 내역 조회, 1:1문의 등 기타 추가 기능을 사용하기 위해서는 서비스 내 회원가입 절차를 통해 계정을 등록해야 합니다.</li>
													<li>③ 회원가입 고객은 하나의 아이디와 비밀번호를 통해 본 약관 제3조 1항에 명시되어 있는 서비스를 이용할 수 있습니다.</li>
													<li>④ 회사는 다음 각 호에 해당하는 회원가입 신청의 경우에는 이를 승낙하지 아니할 수 있습니다.
														<ol class="sub_list">
															<li>1. 기술상 서비스 제공이 불가능한 경우</li>
															<li>2. 다른 사람의 정보를 사용하는 등 허위로 신청하는 경우</li>
															<li>3. 이용자가 본 조 제2항에 따른 계정 등록 시 등록 사항을 누락하거나 잘못 입력 한	경우</li>
															<li>4. 공공질서 또는 미풍양속을 저해하거나 저해할 목적으로 신청한 경우</li>
															<li>5. 기타 회사가 정한 이용 신청 요건이 충족되지 않았을 경우</li>
														</ol>
													</li>
												</ol>
											</li>
											<li>제6조(서비스의 제공 및 변경)
												<ol class="sub_list">
													<li>① 서비스의 제공은 연중무휴 1일 24시간을 원칙으로 하며, 구체적인 종류와 세부내용은 서비스 내 사용방법 FAQ 및 서비스 별 안내에 따릅니다.</li>
													<li>② 회사는 기술적 사양의 변경 또는 기타 불가피한 여건이나 사정 등이 있는 경우에는 서비스의 내용을 변경 할 수 있습니다. 
														이 경우 변경된 서비스의 내용 및 제공 일자를 명시하여 이용자에게 공지 합니다.</li>
												</ol>
											</li>
											<li>제7조 (서비스의 중단)
												<ol class="sub_list">
													<li>① 회사는 다음 각 호에 해당하는 경우 이용자에 대한 서비스 제공을 중지 할 수 있습니다.
														<ol class="sub_list">
															<li>1. 컴퓨터, 서버 등 서비스 제공을 위한 설비의 보수, 점검, 교체, 고장 등으로 인하여 부득이 한 경우</li>
															<li>2. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 제공에 지장이 있는 경우</li>
															<li>3. 서비스 제휴 업체와의 계약 종료 등과 같은 회사의 제반 사정 또는 법률상의 장애	등으로 서비스를 유지할 수 없는 경우</li>
															<li>4. 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우</li>
														</ol>
													</li>
													<li>② 제1항에 의한 사유로 서비스가 일시 중지될 경우 회사는 인터넷 홈페이지 또는 어플리케이션을 통해 이를 사전에 공지합니다. 
														다만, 운영자의 고의 또는 과실이 없는 서버 장애, 시스템 다운 등 회사가 통제할 수 없는 사유로 인하여 이용자에게 사전 통지가 불가능한 경우에는 사후에 통지 할 수 있습니다.</li>
												</ol>
											</li>
											<li>제8조 (회원 탈퇴 및 자격 상실 등)
												<ol class="sub_list">
													<li>① 회원은 언제든지 어플리케이션 내 ‘설정’ 메뉴를 통해 회원 탈퇴를 신청 할 수
														있습니다. 단, 승차권 예매 후 탑승이 이루어지지 않은 모바일 승차권을 보유하고 있을 경우에는 해당 승차권의 예매를 취소한 후 회원 탈퇴가 가능 하며, 본 약관 제3조 1항의 서비스에서 예매한 승차권 조회 및 이용이 불가 합니다.</li>
													<li>② 다음 각 호의 사유에 해당하는 경우 회사는 회원의 자격을 정지 또는 상실 시킬 수 있습니다.
														<ol class="sub_list">
															<li>1. 가입 신청 시 허위의 내용을 등록 한 경우</li>
															<li>2. 타인의 명예를 손상시키거나 불이익을 주는 행위</li>
															<li>3. 서비스와 관련된 설비의 오 동작이나 정보 등의 파괴 및 혼란을 유발시키는 컴퓨터
																바이러스 감염 자료를 등록 또는 유포하는 행위</li>
															<li>4. 다른 사람의 개인정보를 도용하거나 서비스 이용을 방해하는 경우</li>
															<li>5. 서비스를 이용하여 법령 또는 이 약관이 금지하는 행위를 하는 경우</li>
															<li>6. 현금 융통, 시세 차익을 노린 승차권 선 예매 등 비정상적인 목적으로 서비스를 이용하는 경우</li>
															<li>7. 서비스의 이용과 관련하여 취득한 타인의 개인정보를 무단으로 유용 또는 유출하는 	행위</li>
														</ol>
													</li>
												</ol>
											</li>
											<li>제9조 (승차권 예매)
												<ol class="sub_list">
													<li>① 서비스내에서 승차권 예매 시 이용자에게 부과되는 예매 수수료는 없으며, 이용자는 	신용카드, 모바일티머니 또는 기타 회사가 추가로 정의하는 결제수단을 통해 결제 할 수 있습니다.</li>
													<li>② 결제 수단 또는 예매 수수료와 관련하여 변경 사항이 발생하는 경우 회사는 그 내용을 서비스 내에 사전 고지 합니다.</li>
												</ol>
											</li>
											<li>제10조 (취소 및 환불)
												<ol class="sub_list">
													<li>① 서비스를 통한 예매 건의 취소 마감 시간은 서비스 내에 별도로 안내하며 취소 마감 시간은 여객운송 사업자, 터미널 등 관련 기관의 사정에 의해 변경 될 수 있습니다.</li>
													<li>② 승차권 예매 취소에 따른 따른 환불 수수료는 여객운송 사업자의 운송약관이 정한 바에 따릅니다.</li>
												</ol>
											</li>
										</ol>
									</dd>
									<dt>제3장 회사와 이용자의 권리 및 의무</dt>
									<dd>
										<ol class="terms_list">
											<li>제11조 (회사의 의무)
												<ol class="sub_list">
													<li>① 회사는 법령 또는 이 약관이 금지하는 사항 또는 공공질서ㆍ미풍양속에 반하는 행위를 하지 않으며, 이 약관이 정하는 바에 따라 지속적이고 안정적으로 서비스를 제공하는데 최선을 다 하여야 합니다.</li>
													<li>② 회사는 이용자가 안전하게 서비스를 이용 할 수 있도록 이용자의 개인정보(신용정보 포함) 보호를 위한 보안 시스템을 갖추어야 하며, 개인정보 처리 방침을 공시하고 준수 합니다.</li>
													<li>③ 회사는 이용자의 정보 수집 시 서비스 제공에 필요한 최소한의 정보를 수집하며 이용자가 제공한 개인정보를 본인의 승낙 없이 타인에게 누설, 제공 하여서는 안됩니다. 
														다만 법령에 의하여 허용되는 경우에는 제공 할 수 있습니다.</li>
												</ol>
											</li>
											<li>제12조 (이용자의 의무)
												<ol class="sub_list">
													<li>① 이용자는 회원 가입을 위한 개인정보 또는 예매를 위한 결제 정보 입력 등 서비스 이용을 위해 필요한 정보를 입력 할 경우 사실과 일치하는 정확한 정보를 입력해야 하며 이용자가 부정확한 정보를
														제공하여 발생하는 불이익에 대하여 회사는 책임을 지지 않습니다.</li>
													<li>② 이용자는 본 약관 제8조 제2항에 기재된 행위를 하여서는 안됩니다.</li>
													<li>③ 이용자는 관계 법령 및 이 약관의 규정 또는 이용 안내 등 회사가 통지하는 사항을 준수하여야 하며, 기타 회사의 업무에 방해가 되는 행위를 해서는 안됩니다.</li>
												</ol>
											</li>
										</ol>
									</dd>
									<dt>제4장 기타</dt>
									<dd>
										<ol class="terms_list">
											<li>제13조 (이용자에 대한 통지)
												<ol class="sub_list">
													<li>① 회사가 회원에 대하여 통지를 하는 경우 회원이 회원 가입 시 제공한 이메일 주소 또는 이동전화 번호를 통해 통지할 수 있습니다.</li>
													<li>② 불특정 다수의 이용자에 대한 통지의 경우 어플리케이션 또는 홈페이지 내의 공지사항에 게시함으로써 개별 통지에 갈음할 수 있습니다.</li>
												</ol>
											</li>
											<li>제14조 (이용자의 개인정보보호)
												<p>회사는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 등 관련 법령이 정하는 바에 따라 이용자의 개인정보를 보호하기 위해 노력합니다.</p>
											</li>
											<li>제15조 (정보의 제공 및 광고의 게재)
												<ol class="sub_list">
													<li>① 회사는 서비스를 운영함에 있어 회사의 서비스 관련 각종 정보 및 광고(회사 및 제휴사 광고 포함)를 서비스 화면에 게재할 수 있습니다.</li>
													<li>② 이용자가 서비스상에 게재되어 있는 광고를 이용하거나 서비스를 통한 광고주의 판촉 활동에 참여하는 등의 방법으로 교신 또는 거래를 하는 것은 이용자의 선택입니다. 회사는 이용자와 광고주를
														연결하는 시스템만 제공할 뿐, 광고주 혹은 이용자를 대변하지 않습니다.</li>
												</ol>
											</li>
											<li>제16조 (회사의 연락처)
												<p>회사의 상호, 주소, 및 전화번호 등은 다음과 같습니다.</p>
												<ol class="sub_list">
													<li>① 상호: 주식회사 티머니</li>
													<li>② 주소: 서울시 중구 후암로 110 서울시티타워 10층(우편번호 100-741)</li>
													<li>④ E-mail : webmaster@tmoney.co.kr</li>
												</ol>
											</li>
											<li>제17조 (양도금지)
												<p>이용자 및 회사는 이용자의 서비스 사용 및 회원 가입에 따른 본 약관 상의 지위 또는 권리, 의무의 전부 또는 일부를 제3자에게 양도, 위임하거나 담보제공 등의 목적으로 처분할 수 없습니다.</p>
											</li>
											<li>제18조 (손해배상)
												<p>어느 일방이 본 약관의 규정을 위반함으로써 상대방에게 손해가 발생한 경우, 규정을 위반한 일방이 상대방의 손해에 대해 배상하여야 합니다. 
													또한 어느 일방의 규정 위반 행위로 인하여 상대방이 제3자로부터 손해배상청구 또는 소송을 비롯한 각종 이의 제기를 받는 경우 
													귀책 당사자는 자신의 책임과 비용으로 상대방을 면책시켜야 하며, 상대방이 면책되지 못한 경우 그로 인하여 발생한 상대방의 손해에 대해 배상하여야 합니다.</p>
											</li>
											<li>제19조 (약관 외 준칙)
												<p>본 약관에 명시되지 않은 사항에 대해서는 「전자금융거래법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 등 관계 법령과 회사가 정한 서비스의 세부 이용 지침 등에 따릅니다.</p>
											</li>
										</ol>
									</dd>
								</dl>
								<p class="add_rules" style="margin-bottom: 20px;">
									<strong>부칙</strong>제1조 (시행일)<br>본 약관은 2019년 10월 1일부터
									시행합니다.
								</p>
							</div>
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
								<div class="scroll-bar" style="height: 5px; top: 0px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="agreement_wrap">
					<div class="agreement_tit">
						<h4>운송약관 동의</h4>
						<span class="custom_check chk_blue"> <input type="checkbox" class="agree" id="agree2" onclick="fnChgCfmBtn(this);" value="off"> 
							<label for="agree2">동의</label>
						</span>
					</div>
					<div class="scroll-wrapper agreement_cont scrollbar-inner" style="position: relative;">		
					<div class="agreement_cont scrollbar-inner scroll-content scroll-scrolly_visible" style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 120px;">
							<div class="terms_wrap" id="transport">
								<h1>고속버스 운송사업 운송약관</h1>
								<p class="date">시 행 2016. 03. 09.</p>
								<ol class="terms_list">
									<li>제1조 (목 적) 이 운송약관은(이하 약관이라 한다.) 여객자동차 운수사업법(이하 법이라 한다.)
										제9조의 규정에 의하여 고속버스운송회사(이하 회사라 한다.)와 여객간의 운송에 관한 책임한계 및 경영에 필요한 사항을 규정함을 목적으로 한다.</li>
									<li>제2조 (용어의 정의) 이 약관에 사용하는 용어의 정의는 다음과 같다.
										<ol class="sub_list">
											<li>1. 승차권이란 여객자동차운수사업법 시행규칙(이하 규칙이라 한다.) 제30조의 규정에 따라 운송을 위하여 회사가 발행하는 증표를 말한다.</li>
											<li>2. 운임이란 회사에서 법 제8조의 규정에 의하여 관할관청에 신고 수리된 금액을 말한다.</li>
											<li>3. 여객의 휴대품이란 여객이 소지하는 물품중 제23조의 규격기준에 부합하고 제26조의 소지제한 물품이 아닌 것으로 여객이 차내 반입하는 물품을 말한다.</li>
											<li>4. 여객의 휴대화물이란 법 제18조의 규정에 의하여 운송되는 화물로 제23조의 규격 기준에 부합하고 제26조의 소지제한 물품이 아닌 것으로 물품적재 장치에 실은 물품을 말한다.</li>
											<li>5. 인터넷승차권(홈티켓)이란 여객이 전국고속버스운송사업조합에서 운영하는 인터넷 홈페이지 내의 승차권 예약•예매서비스를 통해 지정된 양식으로 여객이 직접 발행한 승차권을 말한다.</li>
											<li>6. 모바일승차권이란 여객이 전국고속버스운송사업조합에서 지정하는 고속버스 모바일앱내의 승차권 	예매 서비스를 통해 휴대폰으로 전송받은 승차권을 말한다.</li>
										</ol>
									</li>
									<li>제3조 (약관의 적용)
										<ol class="sub_list">
											<li>① 이 약관은 회사에 의한 여객의 운송 또는 이에 부수되는 업무에 적용된다.</li>
											<li>② 이 약관이 관계법규에 저촉된 때에는 적용하지 아니한다.</li>
										</ol>
									</li>
									<li>제4조 (여객의 동의) 여객이 회사가 제공하는 승차권 예약•예매서비스를 통해 승차권 예매, 인터넷 승차권(홈티켓), 모바일승차권 구입 발행받은 경우에는 이 약관 및 이에 의하여 정하여진 규정에 동의한 것으로 본다.</li>
									<li>제5조 (약관의 변경) 이 약관 및 이에 의하여 정하여진 규정은 관할관청의 인가 또는 사업 	개선명령에 의하여 변경될 수 있다.</li>
									<li>제6조 (게시) 회사의 각 영업소에는 여객 운임표, 운송약관, 운행시간표 등을 여객이 보기 쉬운곳에 게시하여야 한다.</li>
									<li>제7조 (종업원의 안내) 여객은 승, 하차 질서 확립과 안전운행을 위한 회사원의 안내에 따라야 한다.</li>
									<li>제8조 (운행의 변경) 회사는 천재지변, 악천후, 도로의 정체 기타 불가항력적 사태 및 정부기관의 명령이 있을 때에는 운행의 일부 또는 전부를 취소하거나 운행시간의 변경할 수 있으며 여객 및 휴대화물 등의운송을 제한할 수 있다.</li>
									<li>제9조 (승차권의 발행 등)
										<ol class="sub_list">
											<li>① 회사는 터미널이나 인터넷승차권(홈티켓)을 발행할 때 발행자(터미널 또는 사업자) 회수용, 승객소지용으로 구분이 가능 하도록 발행하여야 하며 이 경우 승차권은 여객의 신청순서에 따라 발행하여야 한다.
												단, 모바일승차권과 차량내 단말기에서 발행된 승차권은 승객용과 회수용으로 구분되지 않는다.</li>
											<li>② 인터넷승차권(홈티켓)은 여객의 컴퓨터 및 출력장치(프린터기)를 통해 지정차량의 출발 1시간 전까지 발행할 수 있다. 
												단, 고객이 원하는 경우 인터넷을 통해 예약을 하고 터미널에서 지정차량의 출발 전까지 승차권을 발권 받을 수 있다.</li>
											<li>③ 인터넷승차권(홈티켓)으로 여객이 발행받을 수 있는 승차권 매수는 1회에 6매까지 가능하며, 지정된 서식(A4규격)에 최대 4매까지 동시 발행이 가능하다.</li>
											<li>④ 모바일승차권으로 여객이 휴대폰으로 전송받을 수 있는 승차권 매수는 1회에 6매까지 가능하다.</li>
											<li>⑤ 발권방법에 따른 승차권의 취소, 변경은 다음 각 호에 가능하며, 발행된 승차권(터미널 창구발행 승차권, 인터넷승차권(홈티켓), 모바일승차권)의 지정차량, 등급 등의 변경은 기 발행된 승차권을 취소한 후 다시 승차권을 발급받은 것으로본다.
												<ol class="sub_list">
													<li>1. 터미널에서 발권한 승차권이나 인터넷승차권(홈티켓)의 취소는 지정된 차량의 도착전까지 	출발지 터미널을 통해서만 가능하며, 변경은 출발지 터미널에서만 가능하다.</li>
													<li>2. 모바일승차권의 취소는 지정된 차량의 도착 전까지 모바일 앱 또는 출발지 터미널을 통해 가능하며, 변경은 지정된 차량의 출발시각 전 모바일 앱 또는 출발지 터미널에 가능하다.</li>
												</ol>
											</li>
										</ol>
									</li>
									<li>제10조 (승차권의 기재사항) 승객소지용 승차권에는 회사의 명칭, 사용구간, 사용시간, 운임액, 유효기간, 지정 좌석번호, 발행일, 발행자의 전화번호를 기재하고 뒷면 또는 앞면에 주요 운송약관을 기재하여	발행하여야 한다.</li>
									<li>제11조 (승차권의 사용)
										<ol class="sub_list">
											<li>① 승차권은 기재사항대로 사용해야 하며 임의로 말소, 개조 또는 분실한 때에는 회사는 이를 무효로 할 수 있다.</li>
											<li>② 승차권의 기재사항대로 사용하지 못한 경우에는 제15조의 규정에 의하여 환급받을 수 있다.</li>
											<li>③ 인터넷승차권(홈티켓)은 여객이 인터넷을 통해 발급받은 이후 기존 승차권과 동일하게 사용되며, 전국고속버스운송사업조합에서 지정한 서식(A4규격)에 의해 출력된 승차권만 유효하며, 
												임의변경, 복사, 위변조 및 효력이 상실된 인터넷승차권(홈티켓)을 사용하여 적발된 경우에는 형법 제214조(유가증권의 위조 등), 제231조(사문서 등의 위조․변조), 제236조(사문서의 부정행사)에 따라 고발 조치할 수 있다.</li>
											<li>④ 인터넷승차권(홈티켓) 출력시 장애가 발생할 경우, 1회에 한해 재발행 가능하며 재발행이 안된 경우에는 해당터미널(왕복발권지) 매표창구에서 재발급이 가능하다.</li>
											<li>⑤ 모바일승차권은 전국고속버스운송사업조합에서 지정한 고속버스 모바일앱을 통해 본인의 모바일로 	전송받은 승차권만 유효하며, 임의변경, 복사, 위변조 및 효력이 상실된 모바일승차권을 사용하여 적발된 경우에는 
												형법 제214조(유가증권의 위조 등), 제231조(사문서등의 위조․변조), 제236조(사문서의	부정행사)에 따라 고발조치할 수 있다.</li>
										</ol>
									</li>
									<li>제12조 (무임운송) 승차권을 구입한 여객이 동반하는 6세 미만의 소아 1인에 대하여는 무임으로 	운송한다. 다만, 여객이 동반하는 소아가 1인을 초과하거나 좌석 배정을 원할 때에는 소정의 승차권을 구입하여야 한다.</li>
									<li>제13조 (할인) 운임의 할인은 법령 기타 규정에 의하거나 관할 관청의 인가를 얻어야 하며, 회사는 이를 게시하여야 한다.</li>
									<li>제14조 (승차권 유효기간) 승차권은 적용 당일 당회에 한하여 유효하며, 사용하지 못한 승차권은 	제15조의 규정에 의거 환급 받을 수 있다.</li>
									<li>제15조 (취소수수료 및 운임의 환급)
										<ol class="sub_list">
											<li>① 여객의 사정에 의하여 사용하지 않은 승차권을 취소하는 경우 회사는 다음 각호에 따른 수수료를 제외한 금액을 환불하여야 한다. 
												단, 모바일 앱에서의 시간 변경은 지정차량의 출발일에 한하여 지정차량 출발 1시간 이전까지 1회만 가능하며 이 경우 수수료를 징구하지 아니할 수 있다.
												<ol class="sub_list">
													<li>1. 지정차 출발 2일전까지 없음</li>
													<li>2. 지정차 출발 1일전~1시간 이전까지 승차권 운임액의 5%</li>
													<li>3. 지정차 출발 1시간 이내~출발 직전까지 승차권 운임액의 10%</li>
													<li>4. 지정차 출발 후 목적지 도착예정시간까지 승차권 운임액의 30%</li>
													<li>5. 지정차 출발 후 목적지 도착예정시간이 지난 경우 승차권 운임액의 100%</li>
													<li>6. 당일 출발하는 지정차의 승차권을 발행하였을 경우
														<ol class="sub_list">
															<li>가. 승차권 발행시점 기준 1시간이내 없음</li>
															<li>나. 승차권 발행시점 기준 1시간이후~지정차 출발 1시간 이전까지 승차권 운임액의 5%</li>
															<li>다. 승차권 발행시점 기준 1시간이후~지정차 출발 1시간 이내까지 승차권 운임액의 10%</li>
														</ol>
													</li>
												</ol>
											</li>
											<li>② 여객의 사정에 의하여 인터넷 또는 ARS 예약을 취소하는 경우 회사는 다음 각호에 따라 수수료를 징수한다.
												<ol class="sub_list">
													<li>1. 지정차 출발 2일전까지 없음</li>
													<li>2. 지정차 출발 1일전~1시간 이전까지 예약 운임액의 5%</li>
													<li>3. 지정차 출발 1시간 이내~출발 직전까지 예약 운임액의 10%</li>
													<li>4. 예약을 취소하지 않고 지정차 출발시간이 지났을 경우에는 자동취소(부도처리) 후 예약 운임액의 30%</li>
													<li>5. 당일 출발하는 지정차를 예약하였을 경우
														<ol class="sub_list">
															<li>가. 예약시점 기준 1시간이내 없음</li>
															<li>나. 예약시점 기준 1시간이후~지정차 출발 1시간 이전까지 예약 운임액의 5%</li>
															<li>다. 예약시점 기준 1시간이후~지정차 출발 1시간 이내까지 예약 운임액의 10%</li>
														</ol>
													</li>
												</ol>
											</li>
											<li>③ 환승 고객이 환승휴게소에서 최종목적지를 변경할 경우에는 변경신청서를 작성하여 환승승차권을 구입(교환)하고 변경구간의 요금은 차감 정산한다.</li>
											<li>④ 회사의 사정에 의한 운임액의 환급은 다음 각 호의 기준에 따른다.
												<ol class="sub_list">
													<li>1. 출발 전 운행이 취소되어 여객이 환급을 요구할 경우에는 그 운임액의 20%를 가산</li>
													<li>2. 운송도중 고장이나 교통사고 등으로 인하여 수송을 완수하지 못한 경우에는 그 운임액의 20%를 가산</li>
													<li>3. 전산장애 등 회사의 귀책사유로 인하여 여객이 지정차를 탑승하지 못하게 된 경우에는 그 운임액의 20%를 가산</li>
													<li>4. 운송도중 버스고장 등 운송사의 귀책사유로 인해 운행시간이 예상 소요시간 보다 50%이상 더 소요된 경우 그 운임액의 20%, 100%이상 더 소요된 경우에는 그 운임액의 40%를 환급하여야 한다.</li>
												</ol>
											</li>
											<li>⑤ 제8조의 규정에 의한 사유로 인하여 운행의 일부 또는 전부를 취소하거나 지연도착된 경우에는 제3항의 규정은 적용하지 아니한다.</li>
											<li>⑥ 환급 및 수수료 계산시 100원 단위 미만은 절사한다. 다만, 환급 및 수수료가 100원 미만일 경우에는 원 단위를 절사한다.</li>
											<li>⑦ 신용카드로 결제를 통하여 발급된 승차권에 대한 운임의 환급은 해당카드의 매출 취소로만 가능하며, 수수료는 제1항의 규정을 준용한다.</li>
										</ol>
									</li>
									<li>제16조 (승차권무효)
										<ol class="sub_list">
											<li>① 여객이 사정에 의하여 사용하지 않은 승차권(인터넷승차권(홈티켓), 모바일승차권 포함)은 지정차 출발 후 사용할 수 없다.</li>
											<li>② 인터넷 승차권(홈티켓)은 전국고속버스운송사업조합에서 운영하는 인터넷 홈페이지내에서 지정한 서식(A4규격)에 의해 출력된 승차권만 유효하며, 
												임의변경, 복사, 위변조 및 효력이 상실된 인터넷 승차권(홈티켓)은 무효로 한다.</li>
											<li>③ 모바일승차권은 전국고속버스운송사업조합에서 지정한 고속버스 모바일앱을 통해 본인에게 전송받은 승차권만 유효하며, 임의변경, 복사, 위변조 및 효력이 상실된 모바일승차권은 무효로 한다.</li>
										</ol>
									</li>
									<li>제17조 (운송책임의 시, 종기) 회사의 운송책임에 대한 시, 종기는 승차권의 기재내용에 따라 시발지를 출발하여 목적지에 도착할 때까지로 한다.</li>
									<li>제18조 (여객의 금지행위) 여객은 차내에서 비상시 또는 부득이한 경우를 제외하고는 다음 각 호의 행위를 하여서는 아니 된다.
										<ol class="sub_list">
											<li>1. 주행 중 함부로 운전사에게 말을 하는 행위</li>
											<li>2. 물품을 함부로 차 밖으로 던지는 행위</li>
											<li>3. 종업원 승낙 없이 자동차의 기계장치, 비상구 등을 조작하는 행위</li>
											<li>4. 운행 중 출입문을 열거나 닫는 행위</li>
											<li>5. 다른 여객에 대하여 거부 요구, 물품의 판매 또는 배부, 권유, 연설 등을 하는 행위</li>
											<li>6. 차내에서 담배를 피우는 행위</li>
											<li>7. 운행 중 자동차에 뛰어 오르거나 자동차에서 뛰어 내리는 행위</li>
											<li>8. 차내에서 난폭한 언동으로 타인에게 불안감이나 혐오감을 주는 행위</li>
											<li>9. 기타 종업원이 여객이 안전 또는 차내 질서유지를 위하여 제지하는 경우 이에 불응하는 행위</li>
											<li>10. 불가능한 구간의 하차 요구 행위</li>
										</ol>
									</li>
									<li>제19조 (승차권의 점검 등과 부가운임을 받는 경우 등)
										<ol class="sub_list">
											<li>① 여객은 고속버스 안내원 기타 종업원이 승차권의 점검 또는 회수를 하기 위하여 그 승차권의 제시 또는 교부를 요구할 때에는 거부하지 못한다.</li>
											<li>② 회사는 고속버스 이용자가 다음 각 호의 1에 해당하는 경우 승차구간의 기준 운임의 10배 이내에 해당하는 부가 운임을 요구할 수 있다.</li> 
										</ol>
										<ol class="sub_list">
											<li>1. 승차권을 소지하지 않았거나 환승정류소에서 승차권을 변경하지 않고 승차한경우</li>
											<li>2. 승차권의 위조 또는 표시의 변조, 훼손 등으로 유효하지 않은 승차권을 소지한경우</li>
											<li>3. 기타 승차권, 할인증 등을 부정 사용하였을 때와 승차권의 제시를 거부한 경우</li>
										</ol>
									</li>
									<li>제20조 (운송의 거절) 회사는 다음 각 호에 해당하는 여객에 대하여는 승차 또는 계속 승차를 거부할 수 있다.
										<ol class="sub_list">
											<li>1. 제19조에서 규정한 여객의 금지 행위와 미풍양속에 위배되는 행위를 한자에 대하여 안내원 또는 종업원이 제지하여도 이에 따르지 아니한 자</li>
											<li>2. 제26조 각 호에 해당하는 물품을 휴대한 자</li>
											<li>3. 만취 또는 불결한 복장을 한 자로서 다른 여객에게 폐를 끼칠 우려가 있는 자</li>
											<li>4. 간호인을 동반하지 아니한 중병 또는 정신병환자</li>
											<li>5. 전염병 예방법에 의한 전염병 환자</li>
										</ol>
									</li>
									<li>제21조 (여객의 휴대화물 및 휴대품 운송제한) 회사는 제26조에 따른 소지제한 물품이나 여객운송에 덧붙여 무임으로 운송할 수 있는 휴대화물과 휴대품에 대하여 
										규격이나 수량 등을 초과할 경우 차내 반입이나 적재를 제한할 수 있다.</li>
									<li>제22조 (허용중량, 용적 및 포장)
										<ol class="sub_list">
											<li>① 차내 반입이 허용되는 여객의 휴대품은 1인당 중량 10킬로그램 이하이거나 부피가 4만 세제곱센티미터 미만이어야 하며, 모든 휴대품은 포장이 잘되어 있어야한다.</li>
											<li>② 차량에 적재가 허용되는 여객의 휴대화물은 1인당 1개이고, 중량 20킬로그램 미만이거나 부피가 4만 세제곱센티미터 미만이어야 하며, 모든 휴대화물은 포장이 잘 되어 있어야 한다.</li>
										</ol>
									</li>
									<li>제23조 (휴대품 및 휴대화물의 보관책임) 여객의 휴대품 및 휴대화물은 여객의 책임하에 보관하여야 하며, 회사는 책임을 지지 않는다. 다만, 회사의 귀책에 의한 경우는 그러하지 아니하다.</li>
									<li>제24조 (내용물의 조사) 회사는 안전운행이나 기타 필요하다고 인정되는 경우에는 여객 또는 여객이 지정하는 제3자의 입회하에 휴대품, 휴대화물의 내용을 조사할 수 있다.</li>
									<li>제25조 (물품의 소지제한) 여객은 다음 각 호의 물품을 소지할 수 없다. 다만, 품명, 수량, 포장방법에 있어서 회사에서 인정한 것은 제외한다.
										<ol class="sub_list">
											<li>1. 폭발성 물질, 부식성 물질, 인화성 물질 등 위험물로서 여객에게 위해를 끼칠염려가 있는 물품</li>
											<li>2. 시체</li>
											<li>3. 동물(단, 장애인 보조견 및 전용운반상자에 넣은 애완동물 제외)</li>
											<li>4. 불결, 악취 등으로 승객에게 피해를 끼칠 염려가 있는 물품</li>
											<li>5. 자동차의 통로, 출입구 및 비상구를 막을 염려가 있는 물품</li>
											<li>6. 기타 여객에게 피해를 주거나 차량을 훼손할 염려가 있는 물품</li>
											<li>7. 여객자동차운수사업법 등의 법규 또는 정부의 지시에 의거 운송이 금지되는 물품</li>
										</ol>
									</li>
									<li>제26조 (무임 휴대화물, 휴대품 등의 요금)
										<ol class="sub_list">
											<li>① 여객이 무임으로 운송할 수 있는 휴대품 및 휴대화물은 각 1개로 한정되며, 회사는 휴대품 및 휴대화물의 중량이나 부피를 초과하는 경우 규격에 맞게 재포장을 요구할 수 있다.</li>
											<li>② 무임으로 운송이 가능한 물품에 대하여는 별도로 정한 소화물 운송약관에 따라 운송하여야 한다.</li>
										</ol>
									</li>
									<li>제27조 (운송상의 변경) 여객의 휴대품 및 휴대화물은 여객과 동일한 차량으로 운송함을 원칙으로 하나, 
										천재지변, 차량의 고장 및 당해 차량의 적재량 초과 등 불가피한 때에는 여객의 동의 하에 휴대품 및 휴대화물의 전부 또는 일부를 다른 차량으로 운송할 수 있다.</li>
									<li>제28조 (사고시의 조치) 회사는 운송도중 천재지변이나 버스의 고장 및 교통사고 등으로 인하여 운송을 중단하였을 경우에는 최선을 다하여 다음의 조치를 하여야 한다.
										<ol class="sub_list">
											<li>1. 예비차 등을 투입하여 운송을 계속한다.</li>
											<li>2. 종점까지 운송이 불가능한 경우에는 여객의 의사에 따라 출발지까지 환송한다.</li>
											<li>3. 수하물의 멸실 방지를 위한 노력을 한다.</li>
											<li>4. 기타 여객의 보호와 편의를 위한 최대한의 대책을 강구한다.</li>
										</ol>
									</li>
									<li>제29조 (사상자에 대한 조치) 회사는 천재지변 기타의 사고로 여객이 사상하였을 때에는 다음의 조치를 취하여야한다.
										<ol class="sub_list">
											<li>1. 신속히 응급조치를 취한다.</li>
											<li>2. 사망자나 중경상자가 있을 때에는 신속히 그 사실을 가족 또는 연고자에게 통지한다.</li>
											<li>3. 유류품을 보관한다.</li>
											<li>4. 기타 사상자를 위한 보호 등 적절한 조치를 취한다.</li>
										</ol>
									</li>
									<li>제30조 (배상책임) 회사의 귀책사유로 인하여 여객이 피해나 손해를 입었을 경우에 회사는 당해 여객에 대하여 배상을 하여야 한다. 
										여객이 고의나 과실 또는 이 약관 및 이에 관련한 법규에 위반하여 회사에 	손해를 입혔을 경우에 회사는 여객에 대하여 그 손해에 대한 배상을 청구할 수 있다.</li>
									<li>제31조 (면책사항) 다음 각 호의 사항에 해당되는 경우에는 이를 회사의 면책 사항으로 한다.
										<ol class="sub_list">
											<li>1. 천재지변 기타 불가항력적인 사태로 인한 불의의 피해</li>
											<li>2. 여객의 휴대품 및 휴대화물의 차내 분실(회사에서 주의 의무를 다한 경우)</li>
											<li>3. 운송도중 여객이 무단이탈하여 초래한 피해</li>
											<li>4. 제19조에서 규정한 여객의 금지사항을 위반하여 발생된 피해 및 제21조에서 규정한 운송을 거절함으로서 발생된 손해</li>
											<li>5. 여객의 휴대품 및 휴대화물의 변질, 소모 또는 동물의 사망 및 상병의 경우</li>
											<li>6. 포장의 불완전으로 인한 휴대화물의 파손</li>
											<li>7. 여객의 과실 또는 태만으로 인한 손해</li>
											<li>8. 여객이 약관 및 이에 관련한 법규에 위반하여 초래한 피해 및 손해</li>
										</ol>
									</li>
									<li>제32조 (기타) 이 약관에 정해지지 아니한 사항은 여객자동차운수사업법률 등 관련규정에 따른다.</li>
								</ol>
								<p class="add_rules">
									<strong>부칙</strong>이 약관은 관할관청으로부터 신고 수리된 후 10일이 경과한 날부터 시행한다.<br>다만, 제15조는 2016.3.31일부터 시행한다.
								</p>
							</div>
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
								<div class="scroll-bar" style="height: 3px; top: 15.4758px;"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="agreement_wrap">
					<div class="agreement_tit">
						<h4>개인정보 수집 및 이용 동의</h4>
						<span class="custom_check chk_blue"> <input type="checkbox" class="agree" 
							id="agree3" onclick="fnChgCfmBtn(this);" value="off"> <label for="agree3">동의</label>
						</span>
					</div>
					<div class="scroll-wrapper agreement_cont scrollbar-inner"
						style="position: relative;">
						<div
							class="agreement_cont scrollbar-inner scroll-content scroll-scrolly_visible"
							style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 120px;">
							<div class="terms_wrap">
								<h1>개인정보 수집 및 이용 동의</h1>
								<dl>
									<dt>
										<span class="emphasis">1. 개인정보를 제공받는 자</span>
									</dt>
									<dd>
										<p>고속버스 승차권 온라인 예매 서비스의 제공</p>
									</dd>
									<dt>2. 수집하는 항목</dt>
									<dd>
										<p>신용카드 번호ㆍ유효기간ㆍ신용카드 비밀번호 앞 2자리, 생년월일, 휴대전화번호</p>
									</dd>
									<dt>
										<span class="emphasis">3. 보유 및 이용 기간</span>
									</dt>
									<dd>
										<p>5년 (근거: 전자상거래 등에서의 소비자 보호에 관한 법률)</p>
									</dd>
									<dt>4. 개인정보 수집 및 이용 동의 거부 시 승차권 예매 하실 수 없습니다.</dt>
								</dl>
								<p>시행일자 : 2017년 5월 18일</p>
							</div>
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
								<div class="scroll-bar" style="height: 51px; top: 0px;"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="agreement_wrap">
					<div class="agreement_tit">
						<h4>개인정보 제3자 제공에 대한 동의</h4>
						<span class="custom_check chk_blue"> <input type="checkbox" class="agree" 
							id="agree4" onclick="fnChgCfmBtn(this);" value="off"> <label for="agree4">동의</label>
						</span>
					</div>
					<div class="scroll-wrapper agreement_cont scrollbar-inner"
						style="position: relative;">
						<div class="agreement_cont scrollbar-inner scroll-content scroll-scrolly_visible"
							style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 120px;">
							<div class="terms_wrap">
								<h1>개인정보 제3자 제공에 대한 동의</h1>
								<dl>
									<dt>1. 개인정보를 제공받는자: 고속버스 터미널, 고속버스운수사</dt>
									<dd>
										<p>터미널: 서울경부 센트럴시티(서울) 동서울 상봉 파주문산 파주운정 서울남부 인천 부천 송내 김포
											김포공항 인천공항T1 송도 호계금호 호계동 서수원 수원 용인신갈 영통 아주대 신갈시외 고양화정 고양백석
											인천동항T2 죽전 신갈영덕 성남 광명 철산 오산 안성 안성중대 안성풍림 안성공도 안성한경 안양 평촌 안성대림
											안성회관 여주대 여주 양지 오천 이천시외 부밭 능서 포천 신철원 철원 용인유림 용인 경기광주 둔전 삼계리 경방
											초부리 모현 매산리 양벌리 이천 구리 의정부 이천마장 이천부발 평택용이 평택대 안중오거리 안중 평택시외 평택
											운천 장현 안산 상록수역 시흥시화 강릉 동해 동해그린 강원대 삼척 속초 횡계 횡성 원주 횡성시외 홍천 낙산
											원주혁신 원주문막 춘천 청평 가평 강촌 화천 양양 영월 고한 태백 대전복합 대전시외 대전청사 청사시외 대전도룡
											천안IC 천안 당진 서산 정안 공주 인삼랜드 금산 금산추부 배방정류소 안산테크노밸리 아산(둔포) 아산온양
											아산서부 아산탕정사무소 아산 KTX 아산둔포 아산 천안공단 선문대 세종시외 탕정삼성LCD 조치원 세종연구단지
											세종시 세종청 홍대세종 고대세종 오송역 오송단지 세종시(연구) 유성 논산 연무대 여주종합 기지시 홍성 내포
											청양 정산 태안 보령 안면도 창기리 예산 덕산스파 청주(고속) 청주(센트럴) 남청주 북청주 청주 항 속리산
											보은 옥천 중앙탑면 충주 황간 제천하소 제천 증평 괴산 평동 단양상진 단양 사평리 영춘 구인사 대천욕장 명지대
											동백 강남마을 세종리젠 새릉골 구성 연원마을 죽전보정 수지현대 현대타운 독바위 범계 안양(경) 산의초교 추풍령
											태안 꽃지 광주(유ㆍ스퀘어) 광주비야 목포 여천 여수 엑스포 순천신대지구 순천대 순천 순천종합 순천만 구례
											광양 동광양 섬진강 나주 강진 고 녹동 무안 해제 보성 벌교 영광 영산포 영암 완도 관산 회진 원동 노력항
											장흥 함평 담양 장성 문장 지도 화순 능주 옥과 곡성 진도 삼호 남악 해남 전주 호남제일 전주시외 군산
											군산대야 익산팔봉 완주 애통리 김제 전북혁신 자치인재원 남원 덕과 태인 정읍 흥덕 고창 부안 전북강진 순창
											봉동 진안 안천 무주 부산 부산시외 부산사상 진해 마산 내서 창원 창원역 울산시외 울산 울산신복 진주 진주시외
											진주 진주개양 진주혁신 통영 장승포 고현 김해 김해장유 장유인천 김해 항 양산 밀양 동대구 서대구 대구용계
											대구혁신 구미 선산 경주 김천 김천혁신 낙동강 상주 포항 청 포항 풍기 영주 안동 영덕 평해 영천 영천망정동
											점촌 예천 경북도청 울진 광비 삼근 백암온천 후포 온정 대구공항 영주장수 영주꽃동산 동래 석계 통도사 언양
											인보 내남 경주 건천 대창 진량</p>

										<p>고속운수사: 금호고속㈜ ㈜동부고속 ㈜동양고속 ㈜삼화고속 금호속리산고속㈜ ㈜중앙고속 ㈜천일고속
											㈜한일고속 ㈜동양고속운수 ㈜경기고속 경일고속㈜ ㈜금남고속 ㈜대원고속 대한여객자동차㈜ ㈜아진고속 코리아와이드경북
											전북고속 충주 호남고속 고려여객㈜-시외 고 여객자동차㈜ 천일여객㈜ 경원여객㈜ ㈜성남고속 ㈜천마고속 ㈜아성고속
											경남여객(시외) 경남여객 서울고속㈜ 새서울고속 대한고속 금건 진흥고속 대원공항 코리아와이드대성 금강고속
											강원고속㈜ 광신고속 ㈜경남고속 경남버스㈜-시외 ㈜중부고속 ㈜가야강남 ㈜진안고속 경원여객 ㈜충남고속 한양고속
											㈜삼흥고속</p>
									</dd>
									<dt>2. 개인정보를 제공받는 자의 개인정보 이용 목적 : 배차정보 변경, 감차, 사고 등 특수한
										상황에서 터미널, 고속사가 고객에게 변경 정보를 고지할 필요가 있을 때 이용</dt>
									<dt>3. 제공하는 개인정보의 항목 : 휴대폰번호</dt>
									<dt>4. 개인정보를 제공받는 자의 개인정보 보유 및 이용 기간 : 제공목적 달성 후 즉시 파기</dt>
									<dt>5. 개인정보 제3자 제공 동시 거부 시 승차원 예매 하실 수 없습니다.</dt>
								</dl>
							</div>
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
								<div class="scroll-bar" style="height: 24px; top: 0px;"></div>
							</div>
						</div>
					</div>
				</div>

				<p class="agree_all chk_bor">
					<span class="custom_check chk_purple"> 
					<input type="checkbox" id="agreeAll" value="off"> 
					<label for="agreeAll" class="agreeAll" onclick="fnAgreeAllCilck();">전체 약관에 동의합니다.</label>
					</span>
				</p>
			</div>
			<!-- 승차권 정보 -->
			<h4 class="mo_page">가는 편 승차권 정보</h4>
			<div class="box_detail_info">
				<div class="routeHead">
					<p class="date">${drive.dr_depPlandDate} 
						<span id="dayOfWeek"></span>
						${drive.dr_depPlandTime}
					</p>
				</div>
				<div class="routeBody">
					<div class="routeArea route_wrap">
						<div class="inner">
							<!-- 출발지 -->
							<span class="roundBox departure">${drive.lineVo.li_te_depTerminalId}</span> 
							<!-- 도착지 -->
							<span class="roundBox arrive">${drive.lineVo.li_te_arrTerminalId}</span> 
						</div>
						<div class="detail_info">
							<!-- 소요시간 -->
							<span id="takeDrtm"> 
								<c:choose>
							        <c:when test="${drive.lineVo.li_travelTime ne null}">
							            <c:set var="hours" value="${drive.lineVo.li_travelTime.hour}" />
							            <c:set var="minutes" value="${drive.lineVo.li_travelTime.minute}" />
							            <c:out value="${hours}시간 ${minutes}분 소요"/>
							        </c:when>
							        <c:otherwise>0분</c:otherwise>
						    	</c:choose>
							</span> 
						</div>
					</div>
					<div class="routeArea route_wrap mob_route">
						<div class="tbl_type2">
							<table class="tbl_info">
								<caption>
									<strong>버스 정보</strong>
									<p>고속사, 등급, 출발</p>
								</caption>
								<colgroup>
									<col style="width: 68px;">
									<col style="width: *;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">고속사</th>
										<td><span>${drive.busVo.companyVo.co_name}</span> 
									</tr>
									<tr>
										<th scope="row">등급</th>
										<td>${drive.busVo.bus_seatGrade}</td>
									</tr>
									<tr>
										<th scope="row">매수</th>
										<td>
											<c:if test="${adltSeatCnt > 0}">
												<span id="">성인 ${adltSeatCnt}명 </span>
											</c:if>
											<c:if test="${adltSeatCnt > 0 && chldSeatCnt > 0}">
												,
											</c:if>
											<c:if test="${chldSeatCnt > 0}">
												<span id="">청소년 ${chldSeatCnt}명</span>
											</c:if>
											<input type="hidden" name="bk_adult" value='${adltSeatCnt}'/>
											<input type="hidden" name="bk_teen" value='${chldSeatCnt}'/>
											<input type="hidden" name="bk_totalPeople" value='${chldSeatCnt + adltSeatCnt}'/>
										</td>
									</tr>
									<tr>
										<th scope="row">좌석</th>
										<td>${selectedSeatNum}번</td>
										<input type="hidden" name="se_selectedSeatNumString" value="${selectedSeatNum}"/>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- 결제정보 입력 -->
			<h4 class="mo_page">결제정보 입력</h4>

			<!-- 결제금액 정보 -->
			<div class="custom_input clfix">
				<div class="payment_sum" style="height: 200px; width: 100%">
					<div class="tbl_type3">
						<table class="taR">
							<caption>결제금액 정보</caption>
							<colgroup>
								<col style="width: 50%;">
								<col style="width: *;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="txt_black">예매금액</th>
								<td><strong id="estimatedAmount">${estimatedAmount}원</strong>
								<input type="hidden" name="bk_fee" value="${estimatedAmount}"/></td>
								</tr>
								<tr>
									<th scope="row">보유 마일리지</th>
									<td><span id="remainingPoint">${point} </span>POINT</td>
								</tr>	
								<tr>
									<th scope="row">사용 마일리지</th>
									<td><input type="text" placeholder="" id="bk_usePoint" name="bk_usePoint" style="width: 75px;" value="0">POINT</td>
								</tr>
								<tr>
									<th scope="row"><span id="adtnPrdNm">&nbsp;</span></th>
									<td><span id="adtnPrdCnt">&nbsp;</span></td>
								</tr>
								<tr class="total">
									<th scope="row" class="txt_black">총 결제금액</th>
									<td><strong id="totalAmountSpan">${estimatedAmount}</strong>
									<input type="hidden" id="totalAmount" name="bk_totalPrice" value="${estimatedAmount}"/></td>
								</tr>
							</tbody>
						</table>
					</div>
					<p class="btn bottom" style="float: right;">
						<!-- 포트원 결제하기 버튼 -->
						<input type="button" id="stplCfmBtn" class="btnL btn_confirm ready" value="결제하기" onclick="requestPay();"/>
						<button id="submitButton" class="btnL btn_confirm ready" style="display: none;"></button>
					</p>
				</div>
			</div>
		</form>
	</div>
</body>
</html>