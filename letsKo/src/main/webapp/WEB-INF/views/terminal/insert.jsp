<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_informationT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
.custom-select {
    display: inline-block;
    width: 150px;
    height: calc(1.5em + 1.25rem + 2px);
    padding: 0.1rem 2rem 0.1rem 0.7rem;
    font-size: 0.8rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.custom-select:focus {
    border-color: #80bdff;
    box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
}
input[type=text], input[type=password] {
	width: 50% !important; height: 35px !important; 
}
.titleTerminal{
	font-weight: bold; font-size: 15px; line-height: 4;
}
</style>
    <meta charset="UTF-8">
    <title>터미널 등록</title>
</head>
<body>
    <div class="breadcrumb">
		<ul class="breadcrumb_list">
			<li><a href="/" class="selectric tag1">HOME</a></li>
			<li>
				<div class="select-box">
					<div class="selectricWrapper selectric-select">
						<a class="selectric tag2">
							<p class="label">터미널 관리</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1" style="display: none;">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="/company/companyList">고속사 관리</a></li>
									<li class=""><a class="link-item" href="/bus/busList">고속버스 관리</a></li>
									<li class="selected"><a class="link-item" href="#">터미널 관리</a></li>
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
    
    <form class="form-group" action="/terminal/insert" method="post">
        <div class="container">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr>
					<td class="titleTerminal">터미널명</td>
					<td class="titleTerminal">
						<label for="te_name" style="display: none;">터미널명</label>
       					<input type="text" id="te_code" name="te_code" required placeholder="등록하실 터미널명을 입력해주세요."><br>
					</td>
				</tr>
				<tr>
					<td class="titleTerminal">도시</td>
					<td style="padding-top: 25px;">
						<label for="te_ci_num" style="display: none;">도시</label> 
				        <select class="custom-select" id="te_ci_num" name="te_ci_num" required style="width: 50%; height: 35px;">
				            <c:forEach items="${cityList}" var="city">
				                <option value="${city.ci_num}">${city.ci_name}</option>
				            </c:forEach>
				        </select><br>
					</td>
				</tr>
			</table>
		</div>
		<p class="btns col1">
		<button type="submit" class="btnL btn_normal">등록</button>
	</form><br>
	<p class="btns col1">
    <a href="/terminal/list" class="btnL btn_normal">터미널 목록으로 돌아가기</a>
</body>
</html>
