<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.title_wrap {
	background:
		url(https://www.kobus.co.kr/images/page/visual_pc_mypage.jpg) center 0
		no-repeat;
	background-size: cover;
}

.dropdown_menu {
	padding-top: 14px;
	font-family: 'Malgun Gothic', '맑은고딕', sans-serif;
	font-size: 13px;
	line-height: 1.5;
	letter-spacing: -0.03em;
	color: #666;
	"
}

.table-cell {
	line-height: 2;
	text-align: center;
}

.box_inputForm input {
	width: 100%;
	height: 28px;
	margin: 0;
	padding: 0;
	border: none;
	background: transparent;
	font-size: 16px;
	color: #000;
}
</style>
<title>비밀번호 변경</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			$("#updatePw").on("click", function(){
				
				if($("#memberPw").val()==""){
					alert("현재 비밀번호를 입력해주세요");
					$("#memberPw").focus();
					return false
				}
				if($("#memberPw1").val()==""){
					alert("새 비밀번호를 입력해주세요");
					$("#memberPw1").focus();
					return false
				}
				
				if($("#memberPw2").val()==""){
					alert("새 비밀번호 확인을 입력해주세요");
					$("#memberPw2").focus();
					return false
				}
				
				if ($("#memberPw1").val() != $("#memberPw2").val()) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#memberPw1").focus();
					 
					return false;
				}
				
				$.ajax({
					url : "/member/checkPw",
					type : "POST",
					dataType : "json",
					data : $("#updatePassword").serializeArray(),
					success: function(data){
						console.log(data)
						if(!data){
							alert("비밀번호를 확인해주세요.");
							return;
						}else{
							if(confirm("변경하시겠습니까?")){
								$("#updatePassword").submit();
							}
							
						}
					}
				})
			});
		})
	</script>
<body>
	<section id="container">
		<form action="/member/updatePassword" name="updatePassword" id="updatePassword" method="post">
			<input type="hidden" id="memberId" name="memberId" value="${login.me_id}">
			<div class="login_wrap">
				<!-- 회원 탈퇴(CSS만 로그인으로 따옴) -->
				<div class="box_login">
					<h3 class="mob_h3">비밀번호 변경</h3>
					<p class="lead">비밀번호를 입력해주세요.</p>
					<div class="inner">
						<fieldset>
							<legend>비밀번호 변경</legend>
							<ul class="loginList">
								<li>
									<div class="box_inputForm">
										<strong>현재비밀번호</strong> 
										<span class="box_label"> 
											<input type="password" id="memberPw" name="memberPw" class="form-control form-control-inline text-center" />
										</span>
									</div>
								</li>
								<li>
									<div class="box_inputForm">
										<strong>새 비밀번호</strong> 
										<span class="box_label"> 
											<input type="password" id="memberPw1" name="memberPw1" class="form-control form-control-inline text-center" />
										</span>
									</div>
								</li>
								<li>
									<div class="box_inputForm">
										<strong>새 비밀번호 확인</strong> 
										<span class="box_label"> 
											<input type="password" id="memberPw2" name="memberPw2" class="form-control form-control-inline text-center" />
										</span>
									</div>
								</li>
							</ul>
						</fieldset>
						<p class="btn_squareBox">
							<button type="button" id="updatePw" name="updatePw" class="btn_confirm ready" style="height:210px;">비밀번호 변경</button>
						</p>
					</div>
				</div>
			</div>
		</form>
	</section>
</body>
</html>