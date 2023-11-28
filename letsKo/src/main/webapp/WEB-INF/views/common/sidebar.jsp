<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="/resources/static/css/styles.css" rel="stylesheet" />
    <style type="text/css">

       .list-group-flush>.list-group-item{
          display: block;
          position: relative;
          padding: 9px 10px 9px 30px;
          border: none;
       }
       .collapse>.list-group-item,
       .collapsing>.list-group-item{
          border: 0;
          padding-left: 40px !important;
       }
       .collapse > .list-group-item:hover {
        color: #68B3CE; /* 원하는 글씨 색상으로 변경 */
        
      }
      #sidebar-wrapper {
          width: 220px;
          position: relative;
          min-height: 828px;
          height: 100vh;
          padding-top: 44px;
      }
      #sidebar-wrapper h1 a {
         background: url(https://www.kobus.co.kr/images/common/logo_pc.png) center 0 no-repeat;
          padding-top: 65px;
          font-size: 16px;
          font-weight: bold;
          text-align: center;
          display: block;
      }
      #sidebar-wrapper h1 {
         height: 110px;
          box-sizing: content-box;
          margin-bottom: 0;
      }
      a{
         text-decoration: none;
         color: #212529;
      }
      a:hover{
         text-decoration: none;
         color: #212529;
      }
      .ft-5{
         font-size: 13px;
      }
      .ft-6{
         font-size: 14px;
      }

    </style>
    <title>고속버스통합예매</title>
</head>
<body>

   <div class="border-end bg-white" id="sidebar-wrapper">
      <h1 class="logo">
         <a href="/">고속버스통합예매</a>
       </h1>
       <div class="list-group list-group-flush">
       
       	   <a class="list-group-item list-group-item-action list-group-item-light ft-6" href="<c:url value='/book/bookSearch'/>">고속버스 예매</a>
           <a class="list-group-item list-group-item-action list-group-item-light ft-6" data-toggle="collapse" data-target=".h" href="#!">예매확인/취소</a>
           <div class="collapse h">
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="/bookConfirmation/bookConfirmation">예매 내역</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="/bookConfirmation/bookCancelList">예매취소 내역</a>

           </div>
           <a class="list-group-item list-group-item-action list-group-item-light ft-6" data-toggle="collapse" data-target=".b" href="#!">운행정보</a>
           <div class="collapse b">
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="/inforSchedule/timeList">시간표조회</a>
           </div>
            
           <a class="list-group-item list-group-item-action list-group-item-light ft-6" data-toggle="collapse" data-target=".d" href="#!">이용안내</a>
           <div class="collapse d">
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/informationUse/reservationInfo'/>">예매 안내</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/informationUse/paymentMethodInfo'/>">결제수단 안내</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/informationUse/ticketRefundInfo'/>">승차권 환불안내</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/informationUse/mileageInfo'/>">마일리지 안내</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/informationUse/crewInfo'/>">국민안전 승무원제 안내</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/informationUse/terminalInfo'/>">고속버스 터미널 안내</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/informationUse/transportCompanyInfo'/>">고속버스 운송회사 안내</a>
           </div>
            
           <a class="list-group-item list-group-item-action list-group-item-light ft-6" href="<c:url value='/board/boardList'/>">공지사항</a>
            
           <a class="list-group-item list-group-item-action list-group-item-light ft-6" data-toggle="collapse" data-target=".e" href="#!">고객센터</a>
           <div class="collapse e">
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/customerCenter/question'/>">자주하는 질문</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/customerCenter/lostNfound'/>">유실물 센터 안내</a>
           </div>
            
           <a class="list-group-item list-group-item-action list-group-item-light ft-6" data-toggle="collapse" data-target=".f" href="#!">전국고속버스운송사업조합</a>
           <div class="collapse f">
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/busAssociation/chairmansMsg'/>">이사장 인사말</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/busAssociation/history'/>">연혁</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/busAssociation/purposeNservices'/>">설립목적 및 사업</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/busAssociation/organizationChart'/>">조직도</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/busAssociation/membershipStatus'/>">회원사 현황</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/busAssociation/directions'/>">찾아오시는 길</a>
           </div>
           
           <a class="list-group-item list-group-item-action list-group-item-light ft-6" data-toggle="collapse" data-target=".g" href="#!">터미널 사업자 협회</a>
           <div class="collapse g">
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/terminalOperator/presidentsMessage'/>">협회장 인사말</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/terminalOperator/corporateHistory'/>">연혁</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/terminalOperator/purposeNservices'/>">설립목적 및 사업</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/terminalOperator/organizationChart'/>">조직도</a>
              <a class="list-group-item list-group-item-action list-group-item-light ft-5" href="<c:url value='/terminalOperator/directions'/>">찾아오시는 길</a>
          </div>
      </div>
   </div>
   <script type="text/javascript">
      $('.list-group-item').click(function(e){
         let target = $(this).data('target');
         $(target).siblings('.collapse').removeClass('show')
      })
   </script>

</body>
</html>