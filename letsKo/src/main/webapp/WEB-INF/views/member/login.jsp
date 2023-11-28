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
.auto_login{
	font-size: 12px;
    color: #a1a6b2;
    margin-left: 50px;
}
</style>
	<title>로그인</title>
</head>
<body>
	<div class="page">
		<form action="<c:url value='/member/login'/>" name="lgnUsrInfForm" method="post">
		<div class="login_wrap">
			<!-- 회원로그인 -->
			<div class="box_login">
				<h3 class="mob_h3">회원 로그인</h3>
				<p class="h3_desc"><span class="text_blue">고속버스 통합 예매 홈페이지</span>는 고속버스모바일앱의 회원 아이디와 비밀번호로 이용이 가능합니다.</p>
				<div class="inner">
					<fieldset>
						<legend>회원로그인</legend>
						<ul class="loginList">
							<li>
								<div class="box_inputForm">
									<strong>아이디</strong>
									<span class="box_label">
										<input type="text" name="me_id" id="me_id" placeholder="아이디를 입력하세요" >
									</span>
								</div>
							</li>
							<li>
								<div class="box_inputForm">
									<strong>비밀번호</strong>
									<span class="box_label">
										<input type="password" name="me_pw" id="me_pw" placeholder="비밀번호를 입력하세요">
									</span>
								</div>
							</li>
						</ul>
					</fieldset>
					
					<p class="btn_squareBox"><button id="btn_confirm" class="btn_confirm ready" >로그인</button></p>
					<div class="box_searchId col2">
						<a href="/member/findIdView"><span class="ico_searchId">아이디찾기</span></a>
						<a href="/member/findPwView"><span class="ico_searchPW">비밀번호찾기</span></a>
						<div class="form-check-inline auto_login">
							<label class="form-check-label"> 			   
								<input type="checkbox" class="form-check-input" value="true" name="autoLogin">자동로그인
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="join_wrap">
				<p>
					<span>고속버스 통합회원으로 가입하시면 홈페이지와 모바일앱과의 예매내역 공유로 더욱 편리한 고속버스 이용이 가능합니다.</span>
					<a href="javascript:mbrsJoin();" class="btn_join">통합회원가입</a>
				</p>
			</div>
			<input type="hidden" id="mbrsDvsCd" name="mbrsDvsCd">
			<input type="hidden" id="returnUrl" name="returnUrl" value="/mbrs/mbrspage/myPageMain.do">
			<input type="hidden" id="popUpDvs" name="popUpDvs" value="N">
			<!-- //회원로그인 -->
		</div>
		<a href="http://www.epassmobile.co.kr" class="bnr_app" target="_blank">예매부터 탑승까지 원스탑 모바일 서비스! <strong>고속버스 모바일앱</strong></a>
		<input type="hidden" id="hidfrmId" name="hidfrmId" value="">
		<input type="hidden" id="transkeyUuid_" name="transkeyUuid_" value="f0a0ab9c13b783c27643f6e452772ec607660de99e8bcff36bedeb1eb0b02486">
		<input type="hidden" id="transkey_usrPwd_" name="transkey_usrPwd_" value="">
		<input type="hidden" id="transkey_HM_usrPwd_" name="transkey_HM_usrPwd_" value="">
		</form>
	</div>
</body>
</html>
