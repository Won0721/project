<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
/*스크롤바 삭제*/
body::-webkit-scrollbar {
  display: none;
}
body{
  -ms-overflow-style: none; /* 인터넷 익스플로러 */
  scrollbar-width: none; /* 파이어폭스 */
}
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_route_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
input[type=text], input[type=password] {
	width: 50% !important; height: 35px !important; 
}
.form-group{
	width: 50% !important; height: 35px !important;
}
.titleBus{
	font-weight: bold; font-size: 17px; line-height: 4;
}
</style>  
	<title>고속버스 등록</title>
</head>
<body>
	<div class="breadcrumb">
		<ul class="breadcrumb_list">
			<li><a href="/" class="selectric tag1">HOME</a></li>
			<li>
				<div class="select-box">
					<div class="selectricWrapper selectric-select">
						<a class="selectric tag2">
							<p class="label">고속버스 관리</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1" style="display: none;">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="/company/companyList">고속사 관리</a></li>
									<li class="selected"><a class="link-item" href="/bus/busList">고속버스 관리</a></li>
									<li class=""><a class="link-item" href="#">터미널 관리</a></li>
									<li class=""><a class="link-item" href="/line/list">노선 관리</a></li>
									<li class=""><a class="link-item" href="/drive/list">운행 관리</a></li>
									<li class=""><a class="link-item" href="/board/boardList">공지사항 조회</a></li>
									<li class="last"><a class="link-item" href="/board/boardListAdmin">공지사항 등록</a></li>
								</ul>
							</div>
						</div>
						<input class="selectricInput" tabindex="0">
					</div>
				</div>
			</li>
		</ul>
	</div>
	
	
	<form action="<c:url value='/bus/busUpdate'/>" method="post">
		<div class="container">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr>
					<td class="titleBus">고속사</td>
					<td class="titleBus">
						<select class="form-group" name="bus_co_num">
							<!-- ${terminal.te_code}가 true이면 'selected'를, false이면 빈 문자열을 반환  -->
					    	<c:forEach items="${companyList}" var="company">
				 	  			<option value="${company.co_num}" ${company.co_num eq bus.bus_co_num ? 'selected' : ''}>${company.co_name}</option>
				   			</c:forEach>
					  	</select>	
					</td>
				</tr>
				<tr>
					<td class="titleBus">버스번호</td>
					<td class="titleBus" style="padding-top: 25px;">
						<input type ="hidden" name ="bus_num" value ="${bus.bus_num}">
						<input type ="hidden" name ="bus_oldCarNumber" value ="${bus.bus_carNumber}">
						<input type ="hidden" name ="bus_seatGrade" value ="${bus.bus_seatGrade}">
						<input type="text" name="bus_carNumber" class="form-control" value="${bus.bus_carNumber}" style="padding-top: 10px; padding-bottom: 10px;">
					</td>
				</tr>
				
			</table>
		</div>
		<button class="btn btn-success col-5 offset-3" style="margin-top: 10px;">등록하기</button>
	</form>
</body>
</html>