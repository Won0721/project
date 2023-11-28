<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="stylesheet" type="text/css" href="/resources/css/layout.css">
<link rel="stylesheet" type="text/css" href="/resources/css/content.css">
<link rel="stylesheet" type="text/css" href="/resources/css/plugin.css">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/ui.jqgrid.custom.css">

<style type="text/css">
/*헤더 밑 드랍다운 css*/
.breadcrumb_list li, .breadcrumb_list a {margin: 0; padding: 0; font-weight: normal; color: #666; font-family: 'Malgun Gothic', '맑은고딕', sans-serif; font-size: 12px; line-height: 1.5; letter-spacing: -0.03em; 
}
.breadcrumb ul.breadcrumb_list > li { float: left; height: 49px; line-height: inherit !important; border-right: 1px solid #e6e6e6;}
.selectricInput { position: absolute !important; top: 0 !important; left: 0 !important; overflow: hidden !important; clip: rect(0, 0, 0, 0) !important; margin: 0 !important; padding: 0 !important; width: 1px !important; height: 1px !important; outline: none !important; border: none !important; background: none !important;}
.infor{z-index :10;}
/*헤더 밑 드랍다운 css*/
/*스크롤바 삭제*/
body::-webkit-scrollbar {
  display: none;
}
body{
  -ms-overflow-style: none; /* 인터넷 익스플로러 */
  scrollbar-width: none; /* 파이어폭스 */
}
.title_wrap {
	position: relative;
	background: #214c5a;
	height: 180px;
	padding-top: 75px;
	text-align: center;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.dropdown-item{
	color : black !important;
	padding : 3px !important;
}
.dropdown-menu{
	margin-top : 10px;
}
/*헤더 밑 드랍다운*/
.breadcrumb_list li, .breadcrumb_list a {margin: 0; padding: 0; font-weight: normal; color: #666; font-family: 'Malgun Gothic', '맑은고딕', sans-serif; font-size: 12px; line-height: 1.5; letter-spacing: -0.03em;}
.breadcrumb ul.breadcrumb_list > li {float: left; height: 49px; line-height: inherit !important; border-right: 1px solid #e6e6e6;}
.selectricInput {position: absolute !important; top: 0 !important; left: 0 !important; overflow: hidden !important; clip: rect(0, 0, 0, 0) !important; margin: 0 !important; padding: 0 !important; width: 1px !important; height: 1px !important; outline: none !important; border: none !important; background: none !important;}
.infor{z-index :10;}

/*스크롤바 삭제*/
body::-webkit-scrollbar {
  display: none;
}
body{
  -ms-overflow-style: none; /* 인터넷 익스플로러 */
  scrollbar-width: none; /* 파이어폭스 */
}
</style>
<script type="text/javascript">
	// 숫자 콤마 메이커 
	function numberFormat(number){
		return number.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//드랍다운
	$(document).ready(function() {
	    $(".select-box").click(function(event) {
	      $(".select-box").not(this).find(".selectricItems").hide();
	      $(this).find(".selectricItems").toggle();
	    });
	});
</script>
</head>

<body>
	<div class="title_wrap in_process">
		<div class="util">
			<ul class="clfix navbar-nav ms-auto mt-2 mt-lg-0">
				<li class="account">${user.me_email}</li>
				<c:if test="${user == null || user == ''}">
					<li class="login"><a href="/member/loginView"><span>로그인</span></a></li>
					<li class="registMember"><a href="/member/signupAgreement"><span>회원가입</span></a></li>
				</c:if>
				<c:if test="${user != null}">
					<li class="logout"><a href="/member/logout"><span>로그아웃</span></a></li>
				</c:if>
					<li><a href="/member/mypage" class="">마이페이지</a></li>
					<li><a href="/member/paymentDetailView">결제내역조회</a></li>
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

		<a href="#" class="back">back</a> <a href="#" class="mo_toggle">메뉴</a>
		<h2 id="headerSubject">${subject}</h2>
		
		
		<c:if test='${subtitle eq "payment"}'>
			<ol class="process">
				<c:if test='${subtitle_num eq "1"}'>
					<li class="active">예매정보입력</li>
					<li class="">결제정보입력</li>
					<li class="last">예매완료</li>
				</c:if>
				<c:if test='${subtitle_num eq "2"}'>
					<li class="">예매정보입력</li>
					<li class="active">결제정보입력</li>
					<li class="last">예매완료</li>
				</c:if>
				<c:if test='${subtitle_num eq "3"}'>
					<li class="">예매정보입력</li>
					<li class="">결제정보입력</li>
					<li class="active last">예매완료</li>
				</c:if>
			</ol>
		</c:if>
		
		<!-- 회원가입 -->
		<c:if test='${subtitle eq "member_agreement"}'>
			<ol class="process">
				<c:if test='${subtitle_num eq "1"}'>
					<li class="active">약관동의</li>
					<li class="">본인인증</li>
					<li class="">정보입력</li>
					<li class="last">가입완료</li>
				</c:if>
				<c:if test='${subtitle_num eq "2"}'>
					<li class="">약관동의</li>
					<li class="active">본인인증</li>
					<li class="">정보입력</li>
					<li class="last">가입완료</li>
				</c:if>
				<c:if test='${subtitle_num eq "3"}'>
					<li class="">약관동의</li>
					<li class="">본인인증</li>
					<li class="active">정보입력</li>
					<li class="last">가입완료</li>
				</c:if>
					<c:if test='${subtitle_num eq "4"}'>
					<li class="">약관동의</li>
					<li class="">본인인증</li>
					<li class="">정보입력</li>
					<li class="active last">가입완료</li>
				</c:if>
			</ol>
		</c:if>
		
		<c:if test='${subtitle eq "book_confirmation"}'>
			<ol class="process">
				<c:if test='${subtitle_num eq "1"}'>
					<li class="active">예매정보변경</li>
					<li class="">결제정보입력</li>
					<li class="last">변경완료</li>
				</c:if>
				<c:if test='${subtitle_num eq "2"}'>
					<li class="">예매정보변경</li>
					<li class="active">결제정보입력</li>
					<li class="last">변경완료</li>
				</c:if>
				<c:if test='${subtitle_num eq "3"}'>
					<li class="">예매정보변경</li>
					<li class="">결제정보입력</li>
					<li class="active">변경완료</li>
				</c:if>
			</ol>
		</c:if>
	</div>
</body>

</html>