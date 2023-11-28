<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_informationT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}.contentWrap {
	margin-bottom: 30px;
}
.table-item{
	line-height : 3;
}
.titleTerminal{
	font-weight: bold; font-size: 15px; text-align: center;
}
.contentTerminal{
	text-align: center;
}
</style>
    <title>터미널 리스트</title>
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
    
    <!-- 검색 기능 -->
    <div class="search_wrap type2" style="border: 0;">
		 <form action="<c:url value='/terminal/list'/>" method="get">
			<p class="search_box" style="margin-left: 70px; width: 92%; background: white;">
				<input type="text" name="search" class="form-control" value="${pm.cri.search}" placeholder="터미널명 검색하기"
					style="float: left; width: 90%; background: #f3f4f6;">
				<button class="btn" style="background-color: white; margin-left: 10px;">검색</button>
			</p>
		</form>
	</div>
    
    <div class="container">
	    <table class="table table-hover">
	        <thead>
	            <tr>
	                <th class="titleTerminal">지역</th>
	                <th class="titleTerminal">터미널명</th>
	                <th class="titleTerminal">수정</th>
	                <th class="titleTerminal">삭제</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${terminalList}" var="terminal">
	                <tr>
	                    <td class="contentTerminal">${terminal.cityVo.ci_name}</td>
	                    <td class="contentTerminal">${terminal.te_code}</td>
	                    <td class="contentTerminal">
	                        <a class="btn btn-outline-info" href="<c:url value='/terminal/edit'/>?te_code=${terminal.te_code}">수정</a>
	                    </td>
	                    <td class="contentTerminal">
	                        <a class="btn btn-outline-danger" href="<c:url value='/terminal/delete'/>?te_code=${terminal.te_code}">삭제</a>
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	    <a class="btn btn-outline-dark" href="<c:url value='/terminal/insert'/>">터미널 등록</a>
    </div>
    
    <!-- 페이징 처리 부분 -->
    <ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<li class="page-item"><a class="page-link"
				href="<c:url value='/terminal/list${pm.cri.getUrl(pm.startPage-1)}'/>">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<li class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>">
				<a class="page-link" href="<c:url value='/terminal/list${pm.cri.getUrl(i)}'/>">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${pm.next}">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/terminal/list${pm.cri.getUrl(pm.endPage+1)}'/>">다음</a>
			</li>
		</c:if>
	</ul>
</body>
</html>
