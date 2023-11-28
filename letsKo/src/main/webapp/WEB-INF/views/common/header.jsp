<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="stylesheet" type="text/css" href="/resources/css/layout.css">
<link rel="stylesheet" type="text/css" href="/resources/css/content.css">
<link rel="stylesheet" type="text/css" href="/resources/css/plugin.css">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/ui.jqgrid.custom.css">

<style type="text/css">
.title_wrap {
	position: relative;
	height: 180px;
	padding-top: 75px;
	text-align: center;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	background: content-box;
}

.dropdown-item{
	color : black !important;
	padding : 3px !important;
}
.dropdown-menu{
	margin-top : 10px;
}
.route_box .tab_cont {
    overflow: visible;
}
.tab_wrap.tab_type1 .tabs:after {
    display: none;
    content: '';
    clear: both;
}
.tab_wrap.tab_type1 .tabs li:first-child:after {
    display: none;
    content: '';
    position: absolute;
    bottom: -10px;
    left: 0;
    width: 100%;
    height: 10px;
    background: url(https://www.kobus.co.kr/images/page/tab_shadow.png) center 0 no-repeat;
}.route_box ul.place li, .route_box ul.date li, .route_box .grade, .route_box .check {
    border-radius: 5px;
}.route_box .tabs .oneway {
    border-radius: 5px 0 0 5px;
}.route_box .tabs .roundtrip {
    border-radius: 0 5px 5px 0;
}.route_box ul.place li, .route_box ul.date li, .route_box .grade, .route_box .check {
    border-radius: 5px; 
}.registMember a:before{
	display: block;
    content: '';
    position: absolute;
    top: 3px;
    left: 0;
    width: 1px;
    height: 10px;
    border-left: 1px solid #fff;
    opacity: 0.4;}
   
</style>
</head>

<body>
	<div class="title_wrap in_process">
	
		<div class="util">
			<ul class="clfix navbar-nav ms-auto mt-2 mt-lg-0">
				<c:if test="${user == null || user == ''}">
					<li class="login"><a href="/member/loginView"><span>로그인</span></a></li>
					<li class="registMember"><a href="/member/signupAgreement"><span>회원가입</span></a></li>
				</c:if>
				<c:if test="${user != null}">
					<li class="account">${user.me_email}</li>
					<li class="logout"><a href="/member/logout"><span>로그아웃</span></a></li>
				</c:if>
					<li class="logout"><a href="<c:url value='/member/mypage'/>">마이페이지</a></li>
					<li><a href="<c:url value='/member/paymentDetailView'/>">결제내역조회</a></li>
			
				<li><a href="/sitemap/sitemap">사이트맵</a></li>
				<li class="nav-item dropdown">
				<c:if test="${user.me_authority == 'ADMIN'}">
				<a class="dropdown-toggle nv-f" href="#" id="navbardrop" data-toggle="dropdown">관리자 기능</a>
				</c:if>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="<c:url value='/company/companyList'/>">고속사 관리</a> 
					<a class="dropdown-item" href="<c:url value='/bus/busList'/>">고속버스 관리</a> 
					<a class="dropdown-item" href="<c:url value='/terminal/list'/>">터미널 리스트</a> 
					<a class="dropdown-item" href="<c:url value='/line/list'/>">노선 관리</a>
					<a class="dropdown-item" href="<c:url value='/drive/list'/>">운행 일정</a>
					<a class="dropdown-item" href="<c:url value='/board/boardListAdmin'/>">공지사항</a>
				</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>