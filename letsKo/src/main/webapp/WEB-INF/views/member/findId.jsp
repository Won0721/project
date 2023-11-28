<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_joinT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
.btnL{height: 80px !important;}
input{width: 100% !important; height: 35px !important;}
</style>
	<title>아이디 찾기</title>
</head>
<script type="text/javascript">
	// 휴대폰번호 메이커
	function phoneFormat(phoneNumber) {
	   	  // 특수문자 제거
	   	  const value = phoneNumber.replace(/[^0-9]/g, '');
	   	  // 00 OR 000 지정
	   	  const firstLength = 3;
	   	  return [
	   	    // 첫번째 구간 (00 or 000)
	   	    value.slice(0, firstLength),
	   	    // 두번째 구간 (000 or 0000)
	   	    value.slice(firstLength, value.length - 4),
	   	    // 남은 마지막 모든 숫자
	   	    value.slice(value.length - 4),
	   	  ].join('-');
	}
	
	function fnHpCheck(){
		let me_phone = $("#me_phone").val();
		if(me_phone.length < 10){
			alert('휴대폰 번호를 확인해주세요.');
			location.href = "/member/findIdView"
			return false;
		} 
		me_phone = phoneFormat(me_phone);
		$("#me_phone").val(me_phone);    
	}
	
</script>
<body>
	<form action="<c:url value='/member/findId'/>" method="post">
		<div class="page login_find">
			<div class="noti_wrap">
				<p class="noti">회원가입 시 입력한 휴대폰번호를 입력하세요.</p>
			</div>
			<div class="find_wrap id_find">
				<div class="find_box">
					<div class="find_input clfix">
						<div class="box_inputForm">
							<strong>휴대폰번호</strong> 
								<span class="box_label" style="height: 45px;"> 
									<input type="text" name="me_phone" id="me_phone" placeholder="휴대폰 번호를 입력하세요">
								</span>
						</div>
						<button class="btnL btn_confirm ready" onclick="fnHpCheck();">확인</button>
					</div>
				</div>
			</div>
		</div>	
	</form>
</body>
</html>
