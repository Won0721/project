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
<title>휴대폰번호 변경</title>
</head>
<script type="text/javascript">
	function phoneFormat(phoneNumber) {
		// 특수 문자 제거
		const value = phoneNumber.replace(/[^0-9]/g, '');

		// 첫 번째 및 두 번째 세그먼트의 길이 결정
		const firstLength = 3;
		const secondLength = value.length > 7 ? 4 : 3;

		return [
		// 첫 번째 세그먼트 (예: 000 또는 00)
		value.slice(0, firstLength),
		// 두 번째 세그먼트 (예: 0000 또는 000)
		value.slice(firstLength, firstLength + secondLength),
		// 나머지 숫자
		value.slice(firstLength + secondLength), ].join('-');
	}

	$(document).ready(function() {
		$("#updatePh").on("click", function(event) {
			event.preventDefault(); // 폼 제출 방지

			var memberPw = $("#memberPw").val();
			var memberPh = $("#memberPh").val();

			if (memberPw === "" || memberPh === "") {
				alert("비밀번호와 새 휴대폰 번호를 모두 입력하세요.");
				return;
			}

			// 서버로 전송 전에 휴대폰 번호 형식 지정
			var formattedPhoneNumber = phoneFormat(memberPh);
			$("#memberPh").val(formattedPhoneNumber);

			$.ajax({
				url : "/member/checkPw",
				type : "POST",
				dataType : "json",
				data : $("#updatePhone").serialize(), // 폼 직렬화
				success : function(data) {
					console.log(data);
					if (!data) {
						alert("비밀번호가 일치하지 않습니다.");
					} else {
						if (confirm("변경하시겠습니까?")) {
							$("#updatePhone").submit(); // 폼 제출
						}
					}
				}
			});
		});
	});
</script>
<body>
	<section id="container">
		<form action="/member/updatePhone" name="updatePhone" id="updatePhone"
			method="post">
			<input type="hidden" id="memberId" name="memberId"
				value="${login.me_id}">
			<div class="login_wrap">
				<!-- 회원 탈퇴(CSS만 로그인으로 따옴) -->
				<div class="box_login">
					<h3 class="mob_h3">휴대폰번호 변경</h3>
					<p class="lead">휴대폰번호를 변경해주세요.</p>
					<div class="inner">
						<fieldset>
							<legend>휴대폰번호 변경</legend>
							<ul class="loginList">
								<li>
									<div class="box_inputForm">
										<strong>현재비밀번호</strong> <span class="box_label"> <input
											type="password" id="memberPw" name="memberPw"
											class="form-control form-control-inline text-center" />
										</span>
									</div>
								</li>
								<li>
									<div class="box_inputForm">
										<strong>새 휴대폰번호</strong> <span class="box_label"> <input
											type="text" id="memberPh" name="memberPh"
											class="form-control form-control-inline text-center" />
										</span>
									</div>
								</li>
							</ul>
						</fieldset>
						<p class="btn_squareBox">
							<button type="button" id="updatePh" name="updatePh"
								class="btn_confirm ready" style="height: 137px;">휴대폰번호
								변경</button>
						</p>
					</div>
				</div>
			</div>
		</form>
	</section>
</body>
</html>