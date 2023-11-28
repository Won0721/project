<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_customerT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
.table-cell{
	line-height: 2;
	text-align: center;
}
</style>   
<title>공지사항 등록</title>
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
	                    <p class="label">공지사항</p>
	                  <b class="button">▾</b>
	                 </a>
	               <div class="selectricItems infor" tabindex="-1" >
	                  <div class="selectricScroll">
	                     <ul>
	                         <li class=""><a class="link-item" href="<c:url value='/book/bookSearch'/>">고속버스 예매</a></li>
							 <li class=""><a class="link-item" href="<c:url value='/bookConfirmation/bookConfirmation'/>">예매확인</a></li>
							 <li class=""><a class="link-item" href="<c:url value='/inforSchedule/timeList'/>">운행정보</a></li>
							 <li class=""><a class="link-item" href="<c:url value='/informationUse/reservationInfo'/>">이용안내</a></li>
							 <li class="selected"><a class="link-item" href="<c:url value='/board/boardList'/>">공지사항</a></li>
							 <li class=""><a class="link-item" href="<c:url value='/customerCenter/question'/>">고객센터</a></li>
							 <li class=""><a class="link-item" href="<c:url value='/busAssociation/chairmansMsg'/>">전국고속버스운송사업조합</a></li>
							 <li class="last"><a class="link-item" href="<c:url value='/terminalOperator/presidentsMessage'/>">터미널사업자협회</a></li>
	                     </ul>
	                  </div>
	            	</div>
	               <input class="selectricInput" tabindex="0">
	            </div>
	         </div>
	      </li>
	   </ul>
	</div>
	
	<!-- 상단 문구-->
	<div class="page customer">
			<input type="hidden" id="ntcNo" name="ntcNo"> 
			<input type="hidden" id="pageIdx" name="pageIdx" value="1">
			<div class="noti_wrap hide_mo">
				<p class="noti">고속버스 홈페이지의 새로운 소식을 확인하세요.</p>
			</div>
	
			<!-- 검색버튼 -->
			<div class="search_wrap type2">
			<form action="<c:url value='/board/boardList'/>" method="get">
					<p style="float:left;">
						<select class="form-control" name="type" style="width: 60px; height:36px;">
							<option value="all" <c:if test="${pm.cri.type == 'all'}">selected</c:if>>전체</option>
							<option value="bo_title" <c:if test="${pm.cri.type == 'bo_title'}">selected</c:if>>제목</option>
							<option value="bo_contents" <c:if test="${pm.cri.type == 'bo_contents'}">selected</c:if>>내용</option>
						</select>
					</p>
					<p class="search_box" style="margin-left:70px; width:92%; background:white;">
						<input type="text" class="form-control" name="search" value="${pm.cri.search}" style="float:left; width:90%; background:#f3f4f6;">
						<button class="btn" style="background-color:white; margin-left:10px;">검색</button>
					</p>
			</form>
			</div> 
		         
			<!-- 게시판 목록조회 -->
			<div class="board_list" style="margin-top : 30px;">
				<table class="table table-hover">
					<tr>
				        <th class="table-cell">번호</th>
				        <th class="table-cell">제목</th>
				        <th class="table-cell">등록일</th>
				        <th class="table-cell">조회수</th>
				        <th class="table-cell">작성자</th>
				        <th class="table-cell">수정</th>
				        <th class="table-cell">삭제</th>
					</tr>
					<c:forEach items="${boardList}" var="board" varStatus="vs">
					    <tr>
					      <td class="table-cell">${pm.totalCount - (pm.cri.perPageNum * (pm.cri.page - 1)) - vs.index}</td>
					      <td class="table-cell">
					      	<a href="<c:url value='/board/boardDetail?bo_num=${board.bo_num}'/>">${board.bo_title}</a>
					      </td>
					      <td class="table-cell">${board.bo_regDate_str}</td>
					      <td class="table-cell">${board.bo_views}</td>
					      <td class="table-cell">${board.bo_me_id}</td>
					      <td class="table-cell"><a href="<c:url value='/board/boardUpdateAdminView?bo_num=${board.bo_num}'/>" class="btn btn-outline-info">수정</a></td>
					      <td class="table-cell"><a href="<c:url value='/board/boardDeleteAdmin?bo_num=${board.bo_num}'/>" class="btn btn-outline-danger">삭제</a></td>
					    </tr>
				    </c:forEach>
				</table>
			</div>
			
			<a class="btn btn-outline-dark" style = "margin-top:20px;" href="<c:url value='/board/boardInsertViewAdmin'/>">공지사항 등록</a>
	
			<!-- 페이지 네이션 	-->
			<ul class="pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" 
							href="<c:url value='/board/boardListAdmin${pm.cri.getUrl(pm.startPage-1)}'/>">이전</a>
					</li>
				</c:if>
				<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
					<li class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>">
						<a class="page-link" href="<c:url value='/board/boardListAdmin${pm.cri.getUrl(i)}'/>">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${pm.next}">
					<li class="page-item">
						<a class="page-link" href="<c:url value='/board/boardListAdmin${pm.cri.getUrl(pm.endPage+1)}'/>">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
</body>
</html>