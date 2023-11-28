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
input[type=text], input[type=password] {
	width: 50% !important; height: 35px !important; 
}
.titleTerminal{
	font-weight: bold; font-size: 15px; line-height: 4;
}
</style>
    <title>터미널 수정</title>
</head>
<body>
	<div class="breadcrumb">
       <ul class="breadcrumb_list">
          <li><a href="/" class ="selectric tag1">HOME</a></li>
          <li>
             <div class="select-box">
                <div class="selectricWrapper selectric-select">      
                     <a class="selectric tag2">
                        <p class="label">터미널 관리</p>
                          <b class="button">▾</b>
                     </a>
                   <div class="selectricItems infor" tabindex="-1" >
                      <div class="selectricScroll">
                         <ul>
                            <li class=""><a class ="link-item" href="<c:url value='/company/companyList'/>">고속사 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/bus/busList'/>">고속버스 관리</a></li>
                            <li class="selected"><a class ="link-item" href="<c:url value='/terminal/list'/>">터미널 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/line/list'/>">노선 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/drive/list'/>">운행 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/board/boardList'/>">공지사항 조회</a></li>
                            <li class="last"><a class ="link-item" href="<c:url value='/board/boardListAdmin'/>">공지사항 등록</a></li>
                         </ul>
                      </div>
                   </div>
                   <input class="selectricInput" tabindex="0">
                </div>
             </div>
          </li>
       </ul>
    </div>
    
    <form action="/terminal/edit" method="post">
    <div class="container">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr>
					<td class="titleTerminal">터미널명</td>
					<td class="titleTerminal">
						<input type="hidden" id="te_code" name="te_code" value ="${terminal.te_code}">
				        <input type ="hidden" id="te_ci_num" name ="te_ci_num" value ="${terminal.te_ci_num}">
				        <label for="te_code" style="display: none;">터미널명</label>
				        <input type="text" id="te_newcode" name="te_newcode" value ="${terminal.te_code}"><br>
					</td>
				</tr>
				<tr>
					<td class="titleTerminal">도시</td>
					<td class="titleTerminal">
						<label for="te_ci_num" style="display: none;">도시</label>
						<select id="te_ci_newNum" name="te_ci_newNum" required style="width: 50%; height: 35px;">
						    <c:forEach items="${cityList}" var="city">
						        <option value="${city.ci_num}" ${city.ci_num eq terminal.te_ci_num ? 'selected' : ''}>${city.ci_name}</option>
						    </c:forEach>
						</select><br>
					</td>
				</tr>
			</table>
		</div>
		<p class="btns col1">
		<button type="submit" class="btnL btn_normal">수정</button>
    </form>
    <p class="btns col1">
    <a href="/terminal/list" class="btnL btn_normal">터미널 목록으로 돌아가기</a>
</body>
</html>
