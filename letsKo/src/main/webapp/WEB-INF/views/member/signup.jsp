<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_joinT_bg.jpg) center 0 no-repeat;
	background-size: cover;
}
input[type=text], input[type=password]{
	width:100%; height: 33px;
}
</style>
<title>회원가입</title>
</head>
<script type="text/javascript">
	function fnClickSelectBox(obj){
		let checkTag = $(".selectricOpen");
		console.log(checkTag);
		if (checkTag.length == 0){
			$(".selectricWrapper").addClass("selectricOpen");		
		}else{
			$(".selectricWrapper").removeClass("selectricOpen");
		}
	}
	
	function fnClickLi(obj){
		var selected_val = $(obj).text();
		$("#me_yearOfBirth").val(selected_val);
		
		$(".selectOption").removeClass("selected");
		$(obj).addClass("selected");
		$("#selectBox").addClass("add");
		$("#selectBox").html(selected_val);
		$(".selectricWrapper").removeClass("selectricOpen");
	}
	
	function genderCodeSelect(ch){
		$('[name=me_gender]').val(ch);
		if(ch==1){
			$(".female").css("background-position","right 0px").css("color","#bfbfbf");
			$(".male").css("background-position","right -115px").css("color","#000");
		}else{
			$(".female").css("background-position","right -38px").css("color","#000");
			$(".male").css("background-position","right -76px").css("color","#bfbfbf");
		}
	}
	
	// 아이디 중복확인
	let checkId = false;
	function fn_idCheck(){
		let id = $('[name=me_id]').val(); // name이 me_id인 요소의 값을 가져옴 
		if(id.trim() == ''){
			alert('아이디를 입력하세요.');
			return;
		}
		if(!id_check(id)){
			alert('아이디는 영문시작, 영문+숫자로 4자~15자로 만들어주세요.');
			return;	
		}
		
		$.ajax({
			async : true,
			url : '<c:url value="/member/checkId"/>', 
			type : 'post', 
			data : {me_id : id},  
			success : function (data){
				if(data){
					alert('사용 가능한 아이디입니다.');
					checkId = true;
				}else{
					alert('이미 사용중인 아이디입니다.')
				}
			}, 
			error : function(res){
				console.log(res);
			}
		});
	}
	
	$('[name=me_id]').change(function(){ // 아이디 입력값이 바뀌면 검사를 다시 하도록
		checkId = false;
	})
	
	// 휴대폰번호 메이커
    function phoneFormat(phoneNumber) {
       	  // 특수문자 제거
       	  const value = phoneNumber.replace(/[^0-9]/g, '');
       	  // 00 OR 000 지정
       	  const firstLength = 3;
       	  return [
       	    // 첫번째 구간 (00 or 000)
       	    value.slice(0, firstLength),
       	    // 두번째 구간 (000 or 0000)
       	    value.slice(firstLength, value.length - 4),
       	    // 남은 마지막 모든 숫자
       	    value.slice(value.length - 4),
       	  ].join('-');
    }
	
	//이메일 정규식 체크
	function email_check(email) {
		var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		return reg.test(email);
	}
	
	function id_check(id) {
		var reg = /^[a-zA-Z][a-zA-Z0-9]{3,14}$/;
		return reg.test(id);
	}
	
	function check_validation(){
	    var password = $("#me_pw").val();
	    var password_check = $("#me_pw2").val();
	    if (password == null || password == "") {
	        alert('비밀번호를 입력해주세요');
	        return false;
	    }
	    if (password != password_check) {
	        alert('비밀번호가 일치하지 않습니다.');
	        return false;
	    }
	    
	    var phone = $("#me_phone").val();
	    phone = phoneFormat(phone);
	    var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	    if (regPhone.test(phone) == false) {
	        alert('휴대폰 번호를 잘못 입력하였습니다.');
	        return false;
	    } else {
	        if (phone.length > 14) {
	            alert('휴대폰 번호를 잘못 입력하였습니다.');
	            return false;
	        }
	        $("#me_phone").val(phone);
	    }
	    
	    var email = $("#me_email").val();
	    if (email == null || email == "") {
	        alert("이메일을 입력해주세요.");
	        return false;
	    } else {
	        if (!email_check(email)) {
	            alert("이메일 형식에 맞게 입력해주세요");
	            return false;
	        }
	    }
	    var isEmailExistent = chkExistentEmail();
	    
	    if (!isEmailExistent) { // 반대로 처리
	        alert('이미 가입된 이메일입니다.');
	        return false;
	    }
	    
	    if ($("#me_yearOfBirth").val() == null || $("#me_yearOfBirth").val() == '') {
	        alert('출생년도를 선택해 주세요.');
	        return false;
	    }
	    if($('[name=me_gender]').val() == null || $('[name=me_gender]').val() == ''){
	    	alert('성별을 선택해 주세요.')
	    	return false;
	    }
	    return true;
	}
	
	 // 이메일 중복체크 
	function chkExistentEmail() {
	    var isEmailExistent = false;
	    let data = {
	    		me_email : $("#me_email").val()
			};
	    
	    $.ajax({
	        async: false, 
	        type: 'post',
	        url: "<c:url value='/member/checkExistentEmail'/>",
	        data:  JSON.stringify(data),
	        contentType : "application/json; charset=UTF-8",
	        dataType : "json", 
	        success: function(data) {
	            if (data) {
	                isEmailExistent = true;
	            }
	        },
	        error: function(res) {
	            console.log(res);
	        }
	    });
	    return isEmailExistent; 
	}
	 

	$(document).ready(function() {
	    $('form').submit(function(){
	        if(!checkId){
	            alert('아이디 중복 검사를 하세요.');
	            return false;
	        }
	        if(!check_validation()){
	            return false;
	        }
	    });
	});	 
</script>
<body>
	<div class="page">
			<div class="noti_wrap mobNone">
				<p class="noti">회원정보를 입력해주세요.</p>
			</div>
			<form action="<c:url value='/member/registSignup'/>" method="post">
				<div class="inner">
					<div class="box_inputForm" id="idDiv">
						<strong>아이디</strong>
						<span class="box_label">
							<input type="text" name="me_id" id="me_id" class="input" placeholder="영문시작, 영문+숫자 4자-15자" style="width:80%">
							<a href="#" onclick="fn_idCheck();" class="btn btn-outline-dark" style="width:18%; height:32px;">중복검사</a>
						</span>
					</div>
					<div class="box_inputForm" id="pwdDiv">
						<strong>비밀번호</strong>
						<span class="box_label">
							<input type="password" name="me_pw" id="me_pw" class="input" placeholder="영문,숫자 4자-15자">
						</span>
					</div>
					
					<div class="box_inputForm" id="pwdCfmDiv">
						<strong>비밀번호 확인</strong>
						<span class="box_label">
							<input type="password" name="me_pw2" id="me_pw2" class="input" placeholder="비밀번호를 재입력하세요">
						</span>
					</div>
					
					<div class="box_inputForm" id="hpDiv">
						<strong>휴대폰 번호</strong>
						<span class="box_label">
							<input type="text" name="me_phone" id="me_phone" class="input">
						</span>
					</div>
					<div class="box_inputForm" id="emiDiv">
						<strong>이메일</strong>
						<span class="box_label">
							<input type="text" name="me_email" id="me_email" class="input" value="${me_email}" readonly>
						</span>
					</div>
					<div class="box_inputForm click_box inselect"> <!-- 직접입력 선택시 display: none; 처리 -->
						<strong>출생년도</strong>
						<div class="payment select-box default_txt">
							<div class="selectricWrapper">
							<div class="selectricHideSelect">
							<select title="출생년도 선택">
								<option value="선택">선택하세요.</option>
								<option value="2009">2009</option>
								<option value="2008">2008</option>
								<option value="2007">2007</option>
								<option value="2006">2006</option>
								<option value="2005">2005</option>
								<option value="2004">2004</option>
								<option value="2003">2003</option>
								<option value="2002">2002</option>
								<option value="2001">2001</option>
								<option value="2000">2000</option>
							</select>
							</div>
							<input type="hidden" id="me_yearOfBirth" name="me_yearOfBirth" value="">
							<div class="selectric">
							<p id="selectBox" class="label" onclick="fnClickSelectBox(this)">선택하세요.</p>
							<b class="button">▾</b>
							</div>
							<div class="selectricItems" tabindex="-1" style="width: 512px; height: 400px;">
							<div class="selectricScroll">
								<ul>
									<li class="selectOption" onclick="fnClickLi(this);">선택하세요.</li>
									<li class="selectOption" onclick="fnClickLi(this);">2009</li>
									<li class="selectOption" onclick="fnClickLi(this);">2008</li>
									<li class="selectOption" onclick="fnClickLi(this);">2007</li>
									<li class="selectOption" onclick="fnClickLi(this);">2006</li>
									<li class="selectOption" onclick="fnClickLi(this);">2005</li>
									<li class="selectOption" onclick="fnClickLi(this);">2004</li>
									<li class="selectOption" onclick="fnClickLi(this);">2003</li>
									<li class="selectOption" onclick="fnClickLi(this);">2002</li>
									<li class="selectOption" onclick="fnClickLi(this);">2001</li>
									<li class="selectOption" onclick="fnClickLi(this);">2000</li>
								</ul>
							</div>
							</div>
						</div>
					</div>						
					<div class="box_inputForm">
						<strong>성별</strong>
						<span class="radio_wrap">
							<span class="custom_radio">
								<input type="radio" id="me_gender0" onclick="genderCodeSelect(0);">
								<label for="me_gender0" class="ico_gender female">여자</label>
							</span>
							<span class="custom_radio">
								<input type="radio" id="me_gender1" onclick="genderCodeSelect(1);">
								<label for="me_gender1" class="ico_gender male">남자</label>
							</span>
								<input type="hidden" id="me_gender" name="me_gender" value="">
						</span>
					</div>
				</div>
			</div>
			<p class="btns col1">
				<button id="joinBtn" class="btnL btn_confirm ready">회원가입</button>
			</p>
			</form>
			<ul class="desc_list">
				<li>고객님의 이메일과 출생, 성별은 아이디와 비밀번호 분실 시 필요한 정보입니다.</li>
				<li>고객님의 출생과 성별은 더 나은 서비스를 위해 마케팅 정보로 활용됩니다.</li>
			</ul>
		</div>
</body>
</html>