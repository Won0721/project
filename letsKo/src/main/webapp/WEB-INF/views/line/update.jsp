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
label{
	display: none;
}
.lineCss{
	line-height: 3;
}
input[type=text], input[type=password] {
	width: 50% !important; height: 35px !important; 
}
</style>
    <title>노선 수정</title>
</head>
<script type="text/javascript">
	    // li_travelTime을 LocalTime으로 변환하는 함수
	    function parseTime(input) {
	        const parts = input.split(':');
	        return {
	            hour: parseInt(parts[0], 10),
	            minute: parseInt(parts[1], 10)
	        };
	    }
	
	    // 폼이 서버로 전송되기 전에 실행될 함수
	    function onSubmit() {
	        // li_travelTime 값을 가져와서 LocalTime으로 변환
	        const inputTime = document.getElementById('li_travelTime').value;
	        const parsedTime = parseTime(inputTime);
	
	        // 변환된 값을 숨겨진 input에 설정
	        document.getElementById('hiddenLiTravelTimeHour').value = parsedTime.hour;
	        document.getElementById('hiddenLiTravelTimeMinute').value = parsedTime.minute;
	
	        // 폼을 서버로 전송
	        document.getElementById('lineForm').submit();
	    }
</script>
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
    
    <form action="/line/update" method="post">
    <div class="container">
    	<!-- 숨겨진 input 필드 추가 -->
		<input type="hidden" id="hiddenLiTravelTimeHour" name="hiddenLiTravelTimeHour">
		<input type="hidden" id="hiddenLiTravelTimeMinute" name="hiddenLiTravelTimeMinute">
		
			<table class="table table-hover" style="margin-top: 30px;">
				<tr>
					<td class="lineCss">노선번호</td>
					<td class="lineCss">
						 <label for="li_num">노선 번호</label>
				         <input type="text" id="li_num" name="li_num" value="${line.li_num}" readonly><br>
					</td>
				</tr>
				<tr>
					<td class="lineCss">출발 터미널</td>
					<td>
						<label for="li_te_depTerminalId">출발 터미널</label>
				        <select id="li_te_depTerminalId" name="li_te_depTerminalId" required style="width: 50%; height: 35px;">
				            <c:forEach items="${terminalList}" var="terminal">
				                <option value="${terminal.te_code}" ${terminal.te_code eq line.li_te_depTerminalId ? 'selected' : ''}>${terminal.te_code}</option>
				            </c:forEach>
				        </select>
					</td>
				</tr>
				<tr>
					<td class="lineCss">도착 터미널</td>
					<td>
						<label for="li_te_arrTerminalId">도착 터미널</label>
				        <select id="li_te_arrTerminalId" name="li_te_arrTerminalId" required style="width: 50%; height: 35px;">
				            <c:forEach items="${terminalList}" var="terminal">
				                <option value="${terminal.te_code}" ${terminal.te_code eq line.li_te_arrTerminalId ? 'selected' : ''}>${terminal.te_code}</option>
				            </c:forEach>
				        </select>
					</td>
				</tr>
				<tr>
					<td class="lineCss">총 거리</td>
					<td class="lineCss">
						<label for="li_distance">총 거리</label>
      					<input type="text" id="li_distance" name="li_distance" placeholder="예: 123.0" value="${line.li_distance}" required><br>
					</td>
				</tr>
				<tr>
					<td class="lineCss">소요시간</td>
					<td class="lineCss">
						<label for="li_travelTime">소요 시간</label>
        				<input type="text" id="li_travelTime" name="li_travelTime" placeholder="예: 01:10" value="${line.li_travelTime}" required><br>
					</td>
				</tr>
				<tr>
					<td class="lineCss">사용여부</td>
					<td class="lineCss">
						<label for="li_use">사용 여부</label>
      					<input type="checkbox" id="li_use" name="li_use" style="width: 4%; height: 35px;" ${line.li_use ? 'checked' : ''}><br>
					</td>
				</tr>
			</table>
		</div>
		<p class="btns col1">
		<button type="submit" class="btnL btn_normal" onclick="onSubmit()">수정</button>
    </form>
    <p class="btns col1">
    <a href="/line/list" class="btnL btn_normal">노선 목록으로 돌아가기</a>
</body>
</html>
