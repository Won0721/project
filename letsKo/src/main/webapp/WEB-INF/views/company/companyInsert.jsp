<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
.error {
	color: #f00;
}
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_businessT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
label{
	display: none;
}
.titleCompany{
	font-weight: bold; font-size: 17px; line-height: 4;
}
</style>
<title>고속사 신규 등록</title>
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
                        <p class="label">고속사 관리</p>
                          <b class="button">▾</b>
                     </a>
                   <div class="selectricItems infor" tabindex="-1" >
                      <div class="selectricScroll">
                         <ul>
                            <li class="selected"><a class ="link-item" href="<c:url value='/company/companyList'/>">고속사 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/bus/busList'/>">고속버스 관리</a></li>
                            <li class=""><a class ="link-item" href="<c:url value='/terminal/list'/>">터미널 관리</a></li>
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

	<form name="companyfFrm" id="companyfFrm" action="<c:url value='/company/companyInsert'/>" method="post" enctype="multipart/form-data">
		<div class="container">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr>
					<td class="titleCompany">고속사명</td>
					<td>
						<label id="check-id-error" class="error"></label> 
						<input type="text" name="co_name" id ="co_name" class="form-control" style ="width: 50%; height: 35px; margin-top: 20px;">
					</td>
				</tr>
				<tr>
					<td class="titleCompany">고속사 이미지</td>
					<td style="padding-top: 5px;">
						<input type="file" class="form-control" name="file2" id ="file2" style ="width: 50%; height: 35px; margin-top: 20px;">
					</td>
				</tr>
			</table>
		</div>
	</form>
	<button type ="submit" form="companyfFrm" class="btn btn-success col-5 offset-3" 
		onclick="return companyForm();" style="margin-top: 10px;">등록하기</button>
</body>

<script type="text/javascript">
function companyForm() {
    var co_name = document.getElementById('co_name').value;
    var file2 = document.getElementById('file2').value;
    
    if (!co_name && !file2) {
        alert("내용을 입력해주세요.");
        return false;
    }else if(!co_name){
    	alert("고속사 입력 필요.");
    	return false;
    }else if(!file2){
    	alert("파일 등록 필요.");
    	return false;
    }

    return true;
}

	let flag = false;
	$('[name=co_name]').keyup(function() {
		flag = false;
		let co_name = $(this).val();

		$.ajax({
			async : false,
			type : 'post',
			url : '<c:url value="/company/check/name"/>',
			data : {
				co_name : co_name
			},
			success : function(data) {
				if (data) {
					$('#check-id-error').text('사용 가능한 고속사명 입니다.');
					flag = true;
				} else {
					$('#check-id-error').text('이미 사용중인 고속사명 입니다.');
				}
			}
		});
	})

	$(function() {
		$("form").validate({
			rules : {
				co_name : {
					required : true,
				}

			},
			//규칙체크 실패시 출력될 메시지
			messages : {
				co_name : {
					required : "필수로입력하세요",

				}

			},
			submitHandler : function() {
				if (!flag) {
					alert('고속사 중복검사를 하세요.');
					return false;
				}
				return true;
			}
		});
	})
</script>
</html>