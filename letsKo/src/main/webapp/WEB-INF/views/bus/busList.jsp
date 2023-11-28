<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_route_bg.jpg)
		center 0 no-repeat;
	background-size: cover;
}

.bus_img {
	display: inline-block;
	line-height: 3;
}

.contentWrap {
	margin-bottom: 30px;
}
.table-item{
line-height : 3;}

</style>
<title>고속버스 차량</title>
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
							<p class="label">고속버스 관리</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item"
										href="<c:url value='/company/companyList'/>">고속사 관리</a></li>
									<li class="selected"><a class="link-item"
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
			<p class="noti">고속버스 상세관리</p>
		</div>
		<div class="search_wrap type2" style="border: 0;">
			<form action="<c:url value='/bus/busList'/>" method="get">

				<p class="search_box"
					style="margin-left: 70px; width: 92%; background: white;">
					<input type="text" name="search" class="form-control"
						value="${pm.cri.search}" placeholder="고속사 검색하기"
						style="float: left; width: 90%; background: #f3f4f6;">
					<button class="btn"
						style="background-color: white; margin-left: 10px;">검색</button>
				</p>
			</form>
		</div>

		<div class="board_list" style="margin-top: 30px;">
			<table class="table table-hover ">
				<thead>
					<tr>
						<th class="table-cell"><span class ="first-cell" style ="margin-left : 50px">고속사</span></th>
						<th class="table-cell">차량번호</th>
						<th class="table-cell">등급</th>
						<th class="table-cell" style ="text-align : center;">수정</th>
						<th class="table-cell" style ="text-align : center;">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${busList}" var="bus">
						<tr>
							<td class="table-cell">
								<span class="bus_img">
									<c:forEach
											items="${bus.companyVo.companyFileVoList }" var="companyfile">
											<img src="<c:url value='/download${companyfile.cf_name}'/>"
												alt="..." height="25px" />
									</c:forEach>
								</span> 
								<span class = "table-item">
									${bus.companyVo.co_name}</span>
							</td>
							<td class="table-cell">
								<span class ="table-item">${bus.bus_carNumber}</span>
							</td>
							<td class="table-cell">
								<span class ="table-item">${bus.bus_seatGrade}/${bus.bus_totalSeat}석</span>
							</td>
							<td class="table-cell" style ="text-align : center; line-height: 3"><a
								href="<c:url value='/bus/busUpdate?bus_num=${bus.bus_num}'/>"
								class="btn btn-outline-info">수정</a></td>
							<td class="table-cell" style ="text-align : center; line-height: 3">
								<form action="<c:url value='/bus/busDelete'/>" method="get" class="delete">
									<input type="hidden" value="${bus.bus_num}" name="bus_num">
									<button class ="btn btn-outline-danger">삭제</button>
								</form>
							</td>														
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<a class="btn btn-outline-dark" style = "margin-top:20px;"
			href="<c:url value='/bus/busInsert'/>">고속버스 등록</a>
		<!-- 페이지 네이션 	-->
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
				<li class="page-item"><a class="page-link"
					href="<c:url value='/bus/busList${pm.cri.getUrl(pm.startPage-1)}'/>">이전</a>
				</li>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
				<li class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>">
					<a class="page-link"
					href="<c:url value='/bus/busList${pm.cri.getUrl(i)}'/>">${i}</a>
				</li>
			</c:forEach>
			<c:if test="${pm.next}">
				<li class="page-item"><a class="page-link"
					href="<c:url value='/bus/busList${pm.cri.getUrl(pm.endPage+1)}'/>">다음</a>
				</li>
			</c:if>
		</ul>
	</div>




</body>

</html>