<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_joinT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
.box_inputForm input {
    width: 100%;
    height: 28px;
    margin: 0;
    padding: 0;
    border: none;
    background: transparent !important;
    font-size: 16px;
    color: #000;
}
</style>
<title>본인인증</title>
</head>
<script type="text/javascript">

	function joinHpAouCheck(){  
		
		if($("input[name=ve_email]").val()== "" || $("input[name=ve_verification]").val()== ""){
			alert("인증번호를 입력해주세요.");
		}else{
		let data = {
				ve_email : $("#ve_email").val(),
				ve_verification : $("#ve_verification").val()
			};
			$.ajax({
				async : false, /*비동기 : false => 동기화*/
				type : 'post', /*전송 방식 : get/post*/
				url : '<c:url value="/member/idVerification"/>', /*데이터를 보낼 url*/
				data : JSON.stringify(data), /*보낼 데이터, 보통 객체나 json으로 보냄*/
				contentType : "application/json; charset=UTF-8", /*서버로 보낼 데이터의 타입 */
				dataType : "json", /* 서버에서 화면으로 보낸 데이터의 타입 */
				success : function(data){ /* ajax가 성공하면 실행될 메서드로 서버에서 보낸 데이터를 매개변수에 저장 */
					console.log(data);
					if(data.res){
						// 새로운 폼 엘리먼트를 동적으로 생성합니다.
						var form = document.createElement('form');
						form.setAttribute('method', 'post'); // POST 요청으로 설정
						form.setAttribute('action', '/member/signupView'); // 전송할 URL 설정

						// POST 요청으로 보낼 데이터를 생성합니다.
						var me_emailInput = document.createElement('input');
						me_emailInput.setAttribute('type', 'hidden'); // 숨겨진 입력 필드
						me_emailInput.setAttribute('name', 'me_email'); // 파라미터 이름
						me_emailInput.setAttribute('value', data.me_email); // 실제 값은 여기에 입력

						// 폼에 입력 필드를 추가합니다.
						form.appendChild(me_emailInput);

						// 폼을 문서에 추가하고 자동으로 제출합니다.
						document.body.appendChild(form);
						form.submit();
						
					}else{
						alert("인증번호를 잘못 입력하셨습니다.");
					}
				}
			});
		}
	}
	
	
	function sendEmail(){
		let data = {
				ve_email : $("#ve_email").val()
			};
			$.ajax({
				async : false, /*비동기 : false => 동기화*/
				type : 'post', /*전송 방식 : get/post*/
				url : '<c:url value="/member/sendEmail"/>', /*데이터를 보낼 url*/
				data : JSON.stringify(data), /*보낼 데이터, 보통 객체나 json으로 보냄*/
				contentType : "application/json; charset=UTF-8", /*서버로 보낼 데이터의 타입 */
				dataType : "json", /* 서버에서 화면으로 보낸 데이터의 타입 */
				success : function(data){ /* ajax가 성공하면 실행될 메서드로 서버에서 보낸 데이터를 매개변수에 저장 */
					console.log(data);
 					if(data.res){
						alert('email로 인증번호를 전송하였습니다.')
					}else{
						alert("인증번호를 잘못 입력하셨습니다.");
					} 
				}
			});
		}

</script>
<body>
	<div class="page">
		<div class="noti_wrap taL">
			<p class="noti">본인인증을 위한 이메일을 입력해주세요.</p>
		</div>
		<div class="border-box box_changeNum">
			<div class="inner">
				<div class="box_inputForm">
					<strong>이메일</strong>
					<span class="box_label">
						<input type="text" name="ve_email" id="ve_email" class="input" placeholder="이메일을 입력하세요" style="width: 100%"> 
					</span>
				</div>
			</div>
		</div>
		<p class="btns col1">
			<a href="#" onclick="javascript:sendEmail();" id="btn_confirm" class="btnL btn_confirm">이메일 발송</a><!-- ready class 있음 -->
		</p>
		
		<!-- 인증번호 발송 후 -->
		<div id="AuthNoFormId" style="">
			<div class="border-box box_changeNum marT30">
				<div class="inner">
					<div class="box_inputForm">
						<strong>인증번호</strong>
						<span class="box_label">
							<label for="ve_verification" class=""></label>
							<input type="text" name="ve_verification" id="ve_verification" class="input" placeholder="인증번호를 입력하세요" style="width: 100%">
						</span>
					</div>
					<div class="box_limit">
						<button type="button" name="reHpve_verification" class="btnS btn_normal white mobNone">인증번호 재발송</button>
					</div>
				</div>
			</div>
			<p class="btns col1">
				<a href="#" onclick="javascript:sendEmail();" class="btnL btn_confirm ready mobBlock">인증번호 재발송</a>
				<a href="javascript:joinHpAouCheck();" id="confirmBtn" class="btnL btn_confirm ready">확인</a><!-- ready class 있음 -->
			</p>
		</div>
	</div>
</body>
</html>