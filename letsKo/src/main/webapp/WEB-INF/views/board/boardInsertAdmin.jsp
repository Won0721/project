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
.input_tag{
	height: 38px !important; width: 93% !important;
	margin-left: 5px;
	vertical-align:middle; 
	border-radius: 7px;
}
.boardFile{
	margin-top: 20px;
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
	
	<div class="page customer">
		<div class="noti_wrap hide_mo">
			<p class="noti">공지사항 등록</p>
		</div>
		<!-- 등록 내용 -->
		<form action="<c:url value='/board/boardInsertAdmin'/>" method="post" enctype="multipart/form-data">
		<div class="cont">
			<p>&nbsp;</p>
			<p class="MsoNoSpacing">
				<span style="font-size: 18px">
					<label>제목</label>
					<input type="text" id="bo_title" name="bo_title" class="input_tag">
				</span>
			</p>
			<p>&nbsp;</p>
			<p class="MsoNoSpacing">
				<textarea type="text" class="form-control" name="bo_contents" style="min-height: 400px" placeholder="내용을 입력하세요."></textarea>
			</p>
		</div>
		<!-- 첨부파일 -->
		<div class="form-group">
			<label class="boardFile">첨부파일</label>
			<input type="file" class="form-control" name="boardFileList"> 
			<input type="file" class="form-control" name="boardFileList"> 
		</div>
		<!-- 등록버튼 -->
		<p class="btns col1">
		<button class="btnL btn_normal">등록하기</button>
		</form>
	</div>
</body>
</html>