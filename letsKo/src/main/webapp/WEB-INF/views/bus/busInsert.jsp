<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js"></script>
<style>
/*스크롤바 삭제*/
body::-webkit-scrollbar {
  display: none;
}
body{
  -ms-overflow-style: none; /* 인터넷 익스플로러 */
  scrollbar-width: none; /* 파이어폭스 */
}
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_route_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
input[type=text], input[type=password] {
	width: 50% !important; height: 35px !important; 
}
.form-group{
	width: 50% !important; height: 35px !important;
}
.titleBus{
	font-weight: bold; font-size: 17px; line-height: 4;
}
</style>    
	<title>고속버스 등록</title>
</head>
<body>
	<div class="breadcrumb">
		<ul class="breadcrumb_list">
			<li><a href="/" class="selectric tag1">HOME</a></li>
			<li>
				<div class="select-box">
					<div class="selectricWrapper selectric-select">
						<a class="selectric tag2">
							<p class="label">고속버스 관리</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1" style="display: none;">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="/company/companyList">고속사 관리</a></li>
									<li class="selected"><a class="link-item" href="/bus/busList">고속버스 관리</a></li>
									<li class=""><a class="link-item" href="#">터미널 관리</a></li>
									<li class=""><a class="link-item" href="/line/list">노선 관리</a></li>
									<li class=""><a class="link-item" href="/drive/list">운행 관리</a></li>
									<li class=""><a class="link-item" href="/board/boardList">공지사항 조회</a></li>
									<li class="last"><a class="link-item" href="/board/boardListAdmin">공지사항 등록</a></li>
								</ul>
							</div>
						</div>
						<input class="selectricInput" tabindex="0">
					</div>
				</div>
			</li>
		</ul>
	</div>
	
	
	<form action="<c:url value='/bus/busInsert'/>" method="post">
		
		<div class="container">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr>
					<td class="titleBus">고속사</td>
					<td class="titleBus">
						<select class="form-group" name="bus_co_num">
					    	<c:forEach items="${companyList}" var="company">
				 	  			<option value="${company.co_num}">${company.co_name}</option>
				   			</c:forEach>
					  	</select>
					</td>
				</tr>
				<tr>
					<td class="titleBus">버스번호</td>
					<td style="padding-top: 5px;">
						<label id="check-id-error" class="error"></label>
						<input type="text" name="bus_carNumber" class="form-control" placeholder="차량번호">
						<input type="hidden" name="bus_totalSeat" class="form-control" value ="0">
					</td>
				</tr>
				<tr>
					<td class="titleBus">등급</td>
					<td class="titleBus">
						<select class="form-group" name="bus_seatGrade">
				 	  			<option value="일반">일반</option>
				 	  			<option value="우등" >우등</option>
				 	  			<option value="프리미엄" >프리미엄</option>
				  		</select>
					</td>
				</tr>
			</table>
		</div>
		<button class="btn btn-success col-5 offset-3" style="margin-top: 10px;">등록하기</button>
	</form>
</body>

<script type="text/javascript">
	let flag = false;
	$('[name=bus_carNumber]').keyup(function(){
		flag = false;
		let bus_carNumber = $(this).val();
		
		$.ajax({
			async : false, 
			type : 'post', 
			url : '<c:url value="/bus/check/name"/>', 
			data : {bus_carNumber : bus_carNumber}, 
			success : function(data){
				
				if(data){
					$('#check-id-error').text('사용 가능한 버스번호 입니다.');
					flag = true;
				}else{
					$('#check-id-error').text('이미 사용중인 버스번호 입니다.');
				}
			},
			error : function(a,b,c){
				console.log(a);
			}
		});
	})
	
	$(function(){
	    $("form").validate({
	        rules: {
	        	bus_carNumber: {
	                required : true,
	            }
	          
	        },
	        //규칙체크 실패시 출력될 메시지
	        messages : {
	            bus_carNumber: {
	                required : "필수로입력하세요",
	                
	            }
	          
	        }
	  		
	    });
	})
		
</script>
</html>