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
<title>회원탈퇴</title>

</head>

<script type="text/javascript">
	$(document).ready(function() {

		$("#delete").on("click", function() {

			if ($("#memberPw").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#memberPw").focus();
				return false
			}

			if ($("#memberPw2").val() == "") {
				alert("비밀번호 확인을 입력해주세요");
				$("#memberPw2").focus();
				return false
			}

			if ($("#memberPw").val() != $("#memberPw2").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#memberPw").focus();

				return false;
			}

			$.ajax({
				url : "/member/checkPw",
				type : "POST",
				dataType : "json",
				data : $("#deleteForm").serializeArray(),
				success : function(data) {
					console.log(data)
					if (!data) {
						alert("비밀번호를 확인해주세요.");
						return;
					} else {
						if (confirm("탈퇴하시겠습니까?")) {
							$("#deleteForm").submit();
						}

					}
				}
			})
		});
	})
</script>
<body>

	<section id="container">
		<form action="/member/deleteMember" name="deleteForm" id="deleteForm"
			method="post">
			<input type="hidden" id="memberId" name="memberId"
				value="${login.me_id}">
			<div class="login_wrap">

				<div class="box_login">
					<h3 class="mob_h3">회원 탈퇴</h3>
					<p class="lead">회원탈퇴를 하려면 비밀번호를 입력해주세요.</p>
					<div class="inner">
						<fieldset>
							<legend>회원탈퇴</legend>
							<ul class="loginList">
								<li>
									<div class="box_inputForm">
										<strong>비밀번호</strong> 
										<span class="box_label"> 
											<input type="password" id="memberPw" name="memberPw" class="form-control form-control-inline text-center" />
										</span>
									</div>
								</li>
								<li>
									<div class="box_inputForm">
										<strong>비밀번호 확인</strong> 
										<span class="box_label"> 
											<input type="password" id="memberPw2" name="memberPw2" class="form-control form-control-inline text-center" />
										</span>
									</div>
								</li>
							</ul>
						</fieldset>
						<p class="btn_squareBox">
							<button type="button" id="delete" name="delete" class="btn_confirm ready" style="height:137px;">회원 탈퇴</button>
						</p>
					</div>
				</div>

				<div class="join_wrap">
					<p>고속버스 통합회원으로 가입하시면 홈페이지와 모바일앱과의 예매내역 공유로 더욱 편리한 고속버스 이용이
						가능합니다.</p>
				</div>
			</div>
			<a href="http://www.epassmobile.co.kr" class="bnr_app" target="_blank">예매부터 탑승까지 원스탑 모바일 서비스! 
				<strong>고속버스 모바일앱</strong>
			</a> 
			<input type="hidden" id="hidfrmId" name="hidfrmId" value="">
			<input type="hidden" id="transkeyUuid_" name="transkeyUuid_" value="fa23e81d01f998d4921ecdf67a4fc0ca9594627c1cd943489a80acee6a2bbe5e">
			<input type="hidden" id="transkey_usrPwd_" name="transkey_usrPwd_" value="">
			<input type="hidden" id="transkey_HM_usrPwd_" name="transkey_HM_usrPwd_" value="">
		</form>
	</section>
</body>
</html>