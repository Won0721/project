<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_businessT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
.titleCompany{
	font-weight: bold; font-size: 17px; line-height: 4;
}
</style>
	<title>고속사 수정</title>
</head>
<body>
	<!-- 헤더 밑 드랍다운 -->
	<div class="breadcrumb">
       <ul class="breadcrumb_list">
          <li><a href="/" class ="selectric tag1">HOME</a></li>
          <li>
             <div class="select-box">
                <div class="selectricWrapper selectric-select">      
                     <a class="selectric tag2">
                        <p class="label">고속사 관리</p>
                          <b class="button">▾</b>
                     </a>
                   <div class="selectricItems infor" tabindex="-1" >
                      <div class="selectricScroll">
                         <ul>
                            <li class="selected"><a class ="link-item" href="<c:url value='/company/companyList'/>">고속사 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/bus/busList'/>">고속버스 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/terminal/list'/>">터미널 관리</a></li>
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
    
	<form action="<c:url value='/company/companyUpdate'/>" method="post" enctype="multipart/form-data">
	
	<div class="container">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr>
					<td class="titleCompany">고속사명</td>
					<td>
						<input type ="hidden" name ="old_co_name" value ="${company.co_name}">
						<input type="text" name="co_name" class="form-control" value="${company.co_name}" style ="width: 50%; height: 35px; margin-top: 20px;">
						<input type ="hidden" name ="co_num" value ="${company.co_num}">
					</td>
				</tr>
				<tr>
					<td class="titleCompany">고속사 이미지</td>
					<td style="padding-top: 5px;">
						<input type="file" class="form-control" name="file2" style ="width: 50%; height: 35px; margin-top: 20px;">
					</td>
				</tr>
			</table>
		</div>
		<button class="btn btn-success col-5 offset-3" style="margin-top: 10px;">수정하기</button>
	</form>
</body>
</html>