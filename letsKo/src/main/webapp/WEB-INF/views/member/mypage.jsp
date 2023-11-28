<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.title_wrap {
	background:	url(https://www.kobus.co.kr/images/page/visual_pc_mypage.jpg) center 0 no-repeat;
	background-size: cover;
}
.myPage_list {
	color: black;
	line-height: 2;
	text-align: center;
    display: flex;
    justify-content: center;
    list-style-type: none;
    padding: 0; 
}

</style>
<title>마이페이지</title>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		var phoneNumberElement = document.getElementById("me_phone");
		if (phoneNumberElement) {
			var phoneNumber = phoneNumberElement.innerText;
			var formattedPhoneNumber = formatPhoneNumber(phoneNumber);
			phoneNumberElement.innerText = formattedPhoneNumber;
		}
	});
</script>
</head>
<body>

	<div class="page">
		<ul class="myPage_list">
			<li class="history">
				<div class="row">
					<a href="/bookConfirmation/bookConfirmation" class="txt_myMenu">
					<span>예매내역</span>
						
					 <strong id="mrsCfmPT" style="color: black;">
							 <c:if test="${bookCount ne 0}">
							 	${bookCount}건
							 </c:if>
							 <c:if test="${bookCount eq 0}">
								 0건
							 </c:if>
					 </strong>
					        
					    
						
					</a>
				</div>
			</li>

			<li class="mileage">
				<div class="row">
					<a href="<c:url value='/member/pointView'/>" class="txt_myMenu">
						<span>마일리지</span> 
						<strong style="color: black;" class="me_point">
							<fmt:formatNumber type="number" pattern="#,##0 POINT" value="${point}" var="me_point"/>
							${me_point}
						</strong>
					</a>
				</div>
			</li>

			<li class="payment">
				<div class="row">
					<a href="<c:url value='/member/paymentDetailView'/>" class="txt_myMenu">
						<span>결제내역</span>
						<strong style="color: black;">
						<c:if test="${payCount ne 0}">
							${payCount}건
						</c:if>
						<c:if test="${payCount eq 0}">
							0건
						</c:if>
						</strong>
					</a>
				</div>
			</li>
		</ul>
		<!-- 나의 계정정보 -->
		<div class="myAccount">
			<ul>
				<li>
					<strong>계정정보</strong> <span class="detail" id="mbrsId">${user.me_id}</span>
					<div class="btnBox">
						<a href="<c:url value='/member/updatePassword'/>" class="btn btn_sm_link_blue">비밀번호 변경</a> 
						<a href="<c:url value='/member/deleteMember'/>" class="btn btn_sm_link_blue">회원탈퇴</a>
					</div>
				</li>
				<li>
					<strong>휴대폰번호</strong> <span class="detail" id="me_phone">${user.me_phone}</span>
					<div class="btnBox">
						<a href="/member/updatePhone" class="btn btn_sm_link_blue">휴대폰번호 변경</a>
					</div>
				</li>
				<li>
					<strong>마일리지</strong> 
						<span class="detail" class="me_point">
							<fmt:formatNumber type="number" pattern="#,##0 POINT" value="${point}" var="me_point"/>
							${me_point}
						</span>
					<div class="btnBox">
						<a href="<c:url value='/member/pointView'/>" class="btn btn_sm_link_blue">마일리지 상세보기</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>