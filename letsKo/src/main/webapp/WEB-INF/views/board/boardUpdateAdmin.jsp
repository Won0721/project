<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
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
	height: 38px !important; width: 80% !important;
	vertical-align:middle; 
	border-radius: 7px;
}
.boardFile{
	margin-top: 20px;
}
.titleLabel{
	float: left; margin-right: 30px;
}
</style> 
<title>공지사항 수정</title>
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
			<p class="noti">공지사항 수정</p>
		</div>
		<!-- 수정 내용 -->
		<form action="<c:url value='/board/boardUpdateAdmin'/>" method="post" enctype="multipart/form-data">
			<div class="cont">
				<p>&nbsp;</p>
				<input type="hidden" name="bo_num" value="${board.bo_num}">
				<div class="MsoNoSpacing">
					<span style="font-size: 18px">
						<label class="titleLabel">제&nbsp;&nbsp;&nbsp;목</label>
						<input type="text" id="bo_title" name="bo_title" class="input_tag" value="${board.bo_title}">
					</span><p>&nbsp;</p>
					<span style="font-size: 18px">
						<label class="titleLabel">등록일</label>
						<input type="text" id="bo_title" name="bo_regDate" class="input_tag" value="${board.bo_regDate_str}" disabled>
					</span><p>&nbsp;</p>
					<span style="font-size: 18px">
						<label class="titleLabel">조회수</label>
						<input type="text" id="bo_title" name="bo_views" class="input_tag" value="${board.bo_views}" disabled>
					</span><p>&nbsp;</p>
					<span style="font-size: 18px">
						<label class="titleLabel">작성자</label>
						<input type="text" id="bo_title" name="bo_me_id" class="input_tag" value="${board.bo_me_id}" disabled>
					</span>
				</div>	
				<p>&nbsp;</p>
				<p class="MsoNoSpacing">
					<textarea class="form-control" name="bo_contents" style="min-height: 400px">${board.bo_contents}</textarea>
				</p>
			</div>
			
			<!-- 첨부파일 수정 -->
			<div class="form-group" id="file">
				<label class="boardFile">첨부파일</label>
				<c:forEach items="${boardFileList}" var="boardFile">
					<a 	href="<c:url value='/download${boardFile.bf_name}'/>" class="form-control" download="${boardFile.bf_originalName}">${boardFile.bf_originalName} 
						<span class="btn-del" data-num="${boardFile.bf_num}">x</span>
					</a>
				</c:forEach>
				<c:forEach begin="1" end="${2-boardFileList.size()}">
					<input type="file" class="form-control" name="boardFileList">
				</c:forEach>
			</div>
	
			<!-- 수정버튼 -->
			<p class="btns col1">
			<button class="btnL btn_normal">수정하기</button>
		</form>
	</div>
	<script>
         $('.btn-del').click(function(e){
    	  e.preventDefault();
    	  let bf_num = $(this).data('num');
    	  $(this).parent().after('<input type="hidden" name="delFiles" value="'+bf_num+'">')
    	  $(this).parent().remove();
    	  $('#file').append('<input type="file" class="form-control" name="boardFileList">');
      });
    </script>
</body>
</html>