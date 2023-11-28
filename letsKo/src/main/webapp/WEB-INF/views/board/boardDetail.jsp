<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
.form-control:disabled{
	background-color: #fff;
}
.file{
	font-weight: normal;
    text-decoration: none;
    border: none !important;
	color: #909090 !important;
    text-align: left;
    font-size: 12px !important;
    font-weight: normal;
    word-break: break-all;
    overflow: hidden;
    line-height: 1.5;
}
</style>
<script type="text/javascript">
</script>
<title>공지사항 상세조회</title>
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
				<p class="noti">고속버스 홈페이지의 새로운 소식을 확인하세요.</p>
			</div>
			<div class="board_view">
				<div class="title label">
					<p>${board.bo_title}</p>
					<span>${board.bo_regDate_str}</span>
				</div>
				<c:if test="${board.bo_modDate != null}">
					<div class="form-group" style="float:right;">
						<label>수정일 ${board.bo_modDate_str}</label> 
					</div>
				</c:if>

				<div class="cont">
					<p>&nbsp;</p>
					<p class="MsoNoSpacing" align="center" style="text-align: center">
						<b style="">
						<span style="font-size: 9.0pt"><span style="font-size: 14pt;">${board.bo_title}</span>
							<span lang="EN-US">
								<br style=""> 
							</span>
						</span>
						</b>
					</p>
					<p>&nbsp;</p>
					<p class="MsoNoSpacing">
						<textarea type="text" class="form-control" disabled style="min-height: 400px">${board.bo_contents}</textarea>
					</p>
				</div>
			</div>
			<div class="form-group">
				<label>첨부파일</label>
				<c:forEach items="${boardFileList}" var="boardFile">
					<a class="file" href="<c:url value='/download${boardFile.bf_name}'/>"
						download="${boardFile.bf_originalName}">${boardFile.bf_originalName}</a>
				</c:forEach>
			</div>
			<p class="btns col1">
			<a href="<c:url value='/board/boardList${cri.getUrl}'/>" class="btnL btn_normal">목록</a>
			</p>
	</div>
</body>
</html>