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
	<title>비밀번호 찾기</title>
</head>
<body>
	<form action="<c:url value='/member/findPw'/>" method="post">
		<div class="page login_find">
			<div class="noti_wrap">
				<p class="noti">회원가입 시 입력한 정보를 입력하세요.</p>
			</div>
			<div class="find_wrap pw_find">
				<div class="find_box">
					<div class="find_input clfix">
						<div class="box_inputForm">
							<strong>아이디</strong>
							<span class="box_label" style="height: 45px;">
								<input type="text" name="me_id" id="me_id" class="input" placeholder="아이디를 입력하세요" style="width: 100%; height: 35px;">
							</span>
						</div>
						<button class="btnL btn_confirm ready">확인</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
