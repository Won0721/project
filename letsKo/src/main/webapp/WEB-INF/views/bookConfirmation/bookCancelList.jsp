<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.title_wrap {
	background: url(https://www.kobus.co.kr/images/page/visual_chkTicket_bg.jpg) center 0 no-repeat;
	background-size: cover;
}

</style>

<title>취소 내역</title>
<script type="text/javascript">
	//요일 메이커
	$(function(){
		$('.dayOfWeek').each(function(){
			var date = $(this).data('date');
			showDayOfWeek(this, date);
		})
		
		$(".bk_fee").each(function(){
			$(this).text(numberFormat($(this).text() +" 원"));
		})
		$(".bk_usePoint").each(function(){
			$(this).text(numberFormat($(this).text() +" POINT"));
		})
		$(".bk_totalPrice").each(function(){
			$(this).text(numberFormat($(this).text() +" 원"));
		})
		$(".ca_cancelFee").each(function(){
			$(this).text(numberFormat($(this).text() +" 원"));
		})
		$(".ca_refundPoint").each(function(){
			$(this).text(numberFormat($(this).text() +" 원"));
		})
		$(".ca_refundAmount").each(function(){
			$(this).text(numberFormat($(this).text() +" 원"));
		})
	})
	
	function showDayOfWeek(obj,date){
		const driveDate = new Date(date);
		// 요일을 추출
		const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
		const dayOfWeek = daysOfWeek[driveDate.getDay()]; // 0(일요일)부터 6(토요일)까지의 숫자를 반환
		// 요일을 해당 요소에 설정
		$(obj).text(dayOfWeek)
	}
	

</script>
</head>
<body>
	<!-- 헤더 밑 드랍다운 -->
	<div class="breadcrumb">
		<ul class="breadcrumb_list">
			<li><a href="/" class="selectric tag1">HOME</a></li>
			<li>
				<div class="select-box">
					<div class="selectricWrapper selectric-select">
						<a class="selectric tag2">
							<p class="label">예매확인</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>
									<li class=""><a class="link-item" href="<c:url value='#'/>">고속버스 예매</a></li>
									<li class="selected"><a class="link-item" href="<c:url value='/bookConfirmation/bookConfirmation'/>">예매확인</a></li>
									<li class=""><a class="link-item" href="<c:url value='#'/>">운행정보</a></li>
									<li class=""><a class="link-item" href="<c:url value='#'/>">이용안내</a></li>
									<li class=""><a class="link-item" href="<c:url value='/board/boardList'/>">공지사항</a></li>
									<li class=""><a class="link-item" href="<c:url value='#'/>">고객센터</a></li>
									<li class=""><a class="link-item" href="<c:url value='#'/>">전국고속버스운송사업조합</a></li>
									<li class="last"><a class="link-item" href="<c:url value='#'/>">터미널사업자협회</a></li>
								</ul>
							</div>
						</div>
						<input class="selectricInput" tabindex="0">
					</div>
				</div>
			</li>
			<li>
				<div class="select-box">
					<div class="selectricWrapper selectric-select">
						<a class="selectric tag2">
							<p class="label">예매확인/취소</p> <b class="button">▾</b>
						</a>
						<div class="selectricItems infor" tabindex="-1">
							<div class="selectricScroll">
								<ul>

									<li class="selected"><a class="link-item" href="<c:url value='/bookConfirmation/bookConfirmation'/>">예매확인/취소</a></li>

								</ul>
							</div>
						</div>
						<input class="selectricInput" tabindex="0">
					</div>
				</div>
			</li>
		</ul>
	</div>
	<form action="<c:url value='/bookCinfirmation/bookCancelList'/>" method="POST">
	
		<div class="page">
			<div class="tab_wrap tab_type1" style="border-bottom:1px solid #e6e6e6;">
				<span style="color:#5691bd; font-size: 20px; margin-left: 50px;">취소내역</span>
			</div>
			
			<section class="detail_info_wrap mobileTicket marT30">
				<c:forEach items="${bookList}" var="book" varStatus="vs">	
					<div class="box_detail_info">
						<div class="routeHead" style="margin-top: 50px;">
							<p class="date txt_black">${book.driveVo.dr_depPlandDate}
							(<span id="dayOfWeek" class="dayOfWeek" data-date="${book.driveVo.dr_depPlandDate}"></span>)
							&nbsp;${book.driveVo.dr_depPlandTime} 출발</p>
							<p class="ticketPrice cancel">
								취소일시 
								<span class="txt_cancelDate">${book.cancelVo.ca_cancelDate}</span>
							</p>
						</div>
						<div class="routeBody">
							<div class="routeArea route_wrap cancel_com">
								<div class="inner">
									<span class="roundBox departure">${book.driveVo.lineVo.li_te_depTerminalId}</span>
									<span class="roundBox arrive">${book.driveVo.lineVo.li_te_arrTerminalId}</span>
								</div>
								<div class="detail_info">
								<!-- 예상소요시간 -->
								<span> 
									<c:choose>
										<c:when test="${book.driveVo.lineVo.li_travelTime ne null}">
											<c:set var="hours" value="${book.driveVo.lineVo.li_travelTime.hour}" />
											<c:set var="minutes"
												value="${book.driveVo.lineVo.li_travelTime.minute}" />
											<c:out value="${hours}시간 ${minutes}분 소요" />
										</c:when>
										<c:otherwise>0분</c:otherwise>
									</c:choose>
								</span>
								</div>
							</div>
							<div class="routeArea route_wrap mob_route">
								<div class="tbl_type2">
									<table class="taR">
										<caption>
											<strong>취소결제 정보</strong>
											<p>예매금액, 사용마일리지, 총 결제금액, 취소 위약금, 총 반환금액</p>
										</caption>
										<colgroup>
											<col style="width:100px;">
											<col style="width:*;">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">예매금액</th>
												<td><span class="bk_fee">${book.bk_fee}</span></td>
											</tr>
											<tr>
												<th scope="row">사용 마일리지</th>
												<td><span class="bk_usePoint">${book.bk_usePoint}</span></td>
											</tr>
											<tr>
												<th scope="row">총 결제 금액</th>
												<td><span class="bk_totalPrice">${book.bk_totalPrice}</span></td>
											</tr>
											<tr>
												<th scope="row">취소 수수료</th>
												<td><span class="ca_cancelFee">${book.cancelVo.ca_cancelFee}</span></td>
											</tr>
											<tr>
												<th scope="row">반환 마일리지</th>
												<td><span class="ca_refundPoint">${book.cancelVo.ca_refundPoint}</span></td>
											</tr>
											<tr>
												<th scope="row">총 반환 금액</th>
												<td><strong><span class="ca_refundAmount">${book.cancelVo.ca_refundAmount}</span></strong></td>
											</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>	
			</c:forEach>
		</section>
		
		<ul class="desc_list marT30">
			<li>조회 시점에서 3개월 전까지의 취소 내역이 표시됩니다.(취소일자 기준)</li>
			<li><strong class="txt_puple">승차권 예매는 변경이 불가</strong>하니 변경을 원하시면 취소 후 다시 예매를 진행하시기 바랍니다.</li>
			<li>마일리지 승차권 취소 시, 마일리지 수수료 정책에 따라 처리됩니다.
				<ul class="dash_list">
					<li>출발 시간 이전 취소 시 100% 마일리지 환급</li>
					<li>출발 시간 이후 취소 시 100% 마일리지 차감</li>
				</ul>
			</li>
			<li>신용카드 예매 취소 또는 변경 시 일주일 내로 예매했던 카드로 청구 취소 처리가 되면서 반환됩니다.</li>
			</li>
		</ul>
		
		<!-- 페이지 네이션 	-->
		<ul class="pagination justify-content-center" style="margin-top: 30px;">
			<c:if test="${pm.prev}">
				<li class="page-item"><a class="page-link"
					href="<c:url value='/bookConfirmation/bookCancelList${pm.cri.getUrl(pm.startPage-1)}'/>">이전</a>
				</li>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
				<li class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>">
					<a class="page-link"
					href="<c:url value='/bookConfirmation/bookCancelList${pm.cri.getUrl(i)}'/>">${i}</a>
				</li>
			</c:forEach>
			<c:if test="${pm.next}">
				<li class="page-item"><a class="page-link"
					href="<c:url value='/bookConfirmation/bookCancelList${pm.cri.getUrl(pm.endPage+1)}'/>">다음</a>
				</li>
			</c:if>
		</ul>
	
	</div>
	</form>
</body>
</html>