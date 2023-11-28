<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <style type="text/css">

       .navbar-light .navbar-nav .nav-link {
          font-weight: bold;
          color: white;
      }
      .navbar-light .navbar-nav .active > .nav-link,
       .navbar-light .navbar-nav .nav-item.active > .nav-link {
           color: white; /* 로그인 메뉴의 텍스트 색상을 하얀색으로 설정 */
       }
       .navbar-light .navbar-nav .active > .nav-link,
       .navbar-light .navbar-nav .nav-item.active > .nav-link:hover {
           color: black; /* 로그인 메뉴의 텍스트 색상을 하얀색으로 설정 */
       }
       .nav-item+.nav-item>.nav-link::before {
        content: '';
        display: block;
        position: absolute;
        top: 11px;
        left: 0;
        width: 1px;
        height: 10px;
        border-left: 1px solid #fff;
        opacity: 0.4;
      }
      .nav-item .nav-link {
        position: relative; /* 로그인 메뉴의 텍스트에 가상 요소 적용 */
      }
      .navbar-nav{
         padding-right: 10px;
      }
      .nv-f{
         font-size: 12px;
      }

    </style>
    <title>header</title>
</head>
<body>

	<nav class="nav-bus navbar navbar-expand-lg navbar-light" style="">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
					data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mt-2 mt-lg-0">		
				<c:if test="${user == null}">
					<li class="nav-item active">
						<a class="nav-link nv-f" href="<c:url value='/member/loginView'/>">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link nv-f" href="<c:url value='/member/signupView'/>">회원가입</a>
					</li>
				</c:if>
				<c:if test="${user != null}">
					<li class="nav-item">
						<a class="nav-link nv-f" href="<c:url value='/member/logout'/>">로그아웃</a>
					</li>
				</c:if>
					<li class="nav-item">
						<a class="nav-link nv-f" href="<c:url value='/member/mypage'/>">마이페이지</a>
					</li>
					<li class="nav-item">
						<a class="nav-link nv-f" href="#!">결제내역조회</a>
					</li>
					<!-- 샘플/ 나중에 지울거임 -->
					<li class="nav-item">
						<a class="nav-link nv-f" href="<c:url value='/payment/inputPaymentInfoView'/>">결제정보 입력</a>
					</li>
					<li class="nav-item">
						<a class="nav-link nv-f" href="#!">사이트맵</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle nv-f" href="#" id="navbardrop" data-toggle="dropdown">
						관리자 기능
						</a>
						<div class="dropdown-menu">				
							<a class="dropdown-item" href="<c:url value='/adminFunction/companyList'/>">고속사 관리</a>
							<a class="dropdown-item" href="<c:url value='/adminFunction/busList'/>">고속버스 관리</a>
							<a class="dropdown-item" href="<c:url value='/adminFunction/lineList'/>">노선 관리</a>
							<a class="dropdown-item" href="<c:url value='/adminFunction/scheduleList'/>">운행 관리</a>
							<a class="dropdown-item" href="<c:url value='/adminFunction/boardListAdmin'/>">공지사항 조회</a>
							<a class="dropdown-item" href="<c:url value='/adminFunction/boardInsertViewAdmin'/>">공지사항 등록</a>
						</div>
					</li>		
				</ul>
			</div>
		</div>
	</nav>  
</body>
</html>