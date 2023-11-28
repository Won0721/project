<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
.title_wrap {
	background:
		url(https://www.kobus.co.kr/images/page/visual_businessT_bg.jpg)
		center 0 no-repeat;
	background-size: cover;
}
.bus_img {display: inline-block;line-height: 3;}
.company_name {width: 300px;padding-left: 50px;}
.table-item{line-height:3}
.cell-button{text-align : center;}
.update{text-align : center; line-height: 3;}
</style>
<title>고속사</title>
<script type="text/javascript">
$(document).ready(function(){
	$('.delete').submit(function() {
	    if (confirm('삭제하시겠습니까?')) {
	        return true; 
	    } else {
	        return false; 
	    }
	});
});
</script>
</head>

<body>
	<!-- 헤더 밑 드랍다운 -->
	<div class="breadcrumb">
		<ul class="breadcrumb_list">
			<li><a href="/" class="selectric tag1">HOME</a></li>
			<li>
				<div class="select-box">
					<div class="selectricWrapper selectric-select">
						<a class="selectric tag2">
							<p class="label">고속사 관리</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class="selected"><a class="link-item"
										href="<c:url value='/company/companyList'/>">고속사 관리</a></li>
									<li class=""><a class="link-item"
										href="<c:url value='/bus/busList'/>">고속버스 관리</a></li>
									<li class=""><a class="link-item"
										href="<c:url value='/terminal/list'/>">터미널 관리</a></li>
									<li class=""><a class="link-item"
										href="<c:url value='/line/list'/>">노선 관리</a></li>
									<li class=""><a class="link-item"
										href="<c:url value='/drive/list'/>">운행 관리</a></li>
									<li class=""><a class="link-item"
										href="<c:url value='/board/boardList'/>">공지사항 조회</a></li>
									<li class="last"><a class="link-item"
										href="<c:url value='/board/boardListAdmin'/>">공지사항 등록</a></li>
								</ul>
							</div>
						</div>
						<input class="selectricInput" tabindex="0">
					</div>

				</div>
			</li>
		</ul>
	</div>
	<!-- 헤더 밑 드랍다운 -->
	<div class="page customer">
		<div class="noti_wrap hide_mo">
			<p class="noti">고속사 상세관리</p>
		</div>
		<div class="board_list" style="margin-top: 30px;">
			<table class="table table-hover">
				<tr>
					<th class="table-cell" style="width: 300px;"><span style="margin-left: 50px;">고속사</span></th>
					<th class="table-cell" style ="text-align : center;">수정</th>
					<th class="table-cell" style="text-align : center;">삭제</th>
				</tr>

				<c:forEach items="${companyList}" var="company">
					<tr>
						<td class="table-cell">
							<span class="bus_img">
								<c:forEach items="${company.companyFileVoList }" var="companyfile">
										<img src="<c:url value='/download${companyfile.cf_name}'/>" alt="..." height="25px" />
								</c:forEach>
							</span>
							<span class ="table-item"> 
							 ${company.co_name}
							</span>
						</td>
						<td class="table-cell update">
					
						<a
							href="<c:url value='/company/companyUpdate?co_num=${company.co_num}'/>"
							class="btn btn-outline-info">수정</a>
					
						</td>
						
						<td class="table-cell" style ="text-align : center; line-height: 3">
								<form action="<c:url value='/company/companyDelete'/>" method="get" class="delete">
									<input type="hidden" value="${company.co_num}" name="co_num">
									<button class ="btn btn-outline-danger">삭제</button>
								</form>
						</td>	
						
					</tr>
				</c:forEach>


			</table>
		</div>
	<a class="btn btn-outline-dark"
		href="<c:url value='/company/companyInsert'/>">회사 신규 등록</a>
	</div>

</body>
</html>