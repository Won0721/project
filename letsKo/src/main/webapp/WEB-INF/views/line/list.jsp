<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_informationT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
.lineCss{
	text-align: center; line-height: 3;
}
</style>
    <title>노선 목록</title>
</head>
<body>
    <div class="breadcrumb">
       <ul class="breadcrumb_list">
          <li><a href="/" class ="selectric tag1">HOME</a></li>
          <li>
             <div class="select-box">
                <div class="selectricWrapper selectric-select">      
                     <a class="selectric tag2">
                        <p class="label">노선 관리</p>
                          <b class="button">▾</b>
                     </a>
                   <div class="selectricItems infor" tabindex="-1" >
                      <div class="selectricScroll">
                         <ul>
                            <li class=""><a class ="link-item" href="<c:url value='/company/companyList'/>">고속사 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/bus/busList'/>">고속버스 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/terminal/list'/>">터미널 관리</a></li>
                            <li class="selected"><a class ="link-item" href="<c:url value='/line/list'/>">노선 관리</a></li>
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
    
     <div class="container">
	    <table class="table table-hover">
	        <thead>
	            <tr>
	            	<th class="lineCss">노선 번호</th>
	                <th class="lineCss">총 거리</th>
	                <th class="lineCss">소요 시간</th>
	                <th class="lineCss">출발 터미널</th>
	                <th class="lineCss">도착 터미널</th>
	                <th class="lineCss">사용 여부</th>
	                <th class="lineCss">수정</th>
	                <th class="lineCss">삭제</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${lineList}" var="line">
                <tr>
                    <td class="lineCss">${line.li_num}</td>
                    <td class="lineCss">${line.li_distance}Km</td>
                    <td class="lineCss">
					    <c:choose>
					        <c:when test="${line.li_travelTime ne null}">
					            <c:set var="hours" value="${line.li_travelTime.hour}" />
					            <c:set var="minutes" value="${line.li_travelTime.minute}" />
					            <c:out value="${hours}시간${minutes}분"/>
					        </c:when>
					        <c:otherwise>0분</c:otherwise>
					    </c:choose>
					</td>
                    <td class="lineCss">${line.li_te_depTerminalId}</td>
                    <td class="lineCss">${line.li_te_arrTerminalId}</td>
                    <td class="lineCss">
                    	<c:choose>
	                        <c:when test="${line.li_use}">사용</c:when>
	                        <c:otherwise>미사용</c:otherwise>
                   		</c:choose>
                   	</td>
                    <td class="lineCss">
                        <a class="btn btn-outline-info" href="<c:url value='/line/edit'/>?li_num=${line.li_num}">수정</a>
                    </td>
                    <td class="lineCss">
                        <a class="btn btn-outline-danger" href="<c:url value='/line/delete'/>?li_num=${line.li_num}">삭제</a>
                    </td>
                </tr>
            </c:forEach>
       		</tbody>
	    </table>
	    <a class="btn btn-outline-dark" href="<c:url value='/line/insert'/>">노선 등록</a>
    </div>
</body>
</html>