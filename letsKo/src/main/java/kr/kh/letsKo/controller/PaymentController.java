package kr.kh.letsKo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.letsKo.service.BookService3;
import kr.kh.letsKo.service.DriveService;
import kr.kh.letsKo.service.MemberService;
import kr.kh.letsKo.service.PaymentService;
import kr.kh.letsKo.vo.BookVO;
import kr.kh.letsKo.vo.DriveVO;
import kr.kh.letsKo.vo.MemberVO;
import kr.kh.letsKo.vo.SeatVO;

@Controller
public class PaymentController{
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	DriveService driveService;

	@Autowired
	MemberService memberService;
	
	@Autowired
	BookService3 bookService3;
	
	// 결제정보 입력
	@PostMapping("/payment/inputPaymentInfoView")
	public String selectSeats(Model model, HttpServletRequest request, HttpSession session) {
		DriveVO drive = driveService.getDriveByNum(Integer.parseInt(request.getParameter("dr_num")));
		MemberVO user = (MemberVO)session.getAttribute("user");
		String me_id = user.getMe_id();
		MemberVO member = memberService.selectMemberInfo(me_id);
		
		model.addAttribute("drive",drive);
		model.addAttribute("estimatedAmount",request.getParameter("estimatedAmount"));
		model.addAttribute("selectedSeatNum",request.getParameter("selectedSeatNum"));
		model.addAttribute("adltSeatCnt",Integer.parseInt(request.getParameter("adltSeatCnt")));
		model.addAttribute("chldSeatCnt",Integer.parseInt(request.getParameter("chldSeatCnt")));
		model.addAttribute("point",member.getMe_point());
		model.addAttribute("me_phone",member.getMe_phone());
		model.addAttribute("me_email",member.getMe_email());
		model.addAttribute("me_id",me_id);
		model.addAttribute("dr_num", Integer.parseInt(request.getParameter("dr_num")));
		
		model.addAttribute("title", "고속버스 예매");
		model.addAttribute("subject", "고속버스 예매"); 
		model.addAttribute("subtitle", "payment"); 
		model.addAttribute("subtitle_num", "2");
		
		return "/payment/inputPaymentInfo";
	}
	
	@PostMapping("/payment/completeReservation")
	public String completeReservation(Model model, BookVO bookVO, HttpServletRequest request, HttpSession session, SeatVO seatVO) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "member/loginView");
			return "/main/message";
		}
		String me_id = user.getMe_id();
		bookVO.setBk_me_id(me_id);
		DriveVO drive = driveService.getDriveByNum(bookVO.getBk_dr_num());
		try {
			// 좌석
			int bus_num = bookService3.selectBusNum(bookVO.getBk_dr_num());
			seatVO.setSe_bus_code(bus_num);
			String selectedSeatNumString = seatVO.getSe_selectedSeatNumString();
			// ,콤마로 나눠서 배열로 만듦
			String[] selectedSeatArray = selectedSeatNumString.split(",");
			int selectedSeatNum = 0;
			boolean resultSeat = false;
			for(int i = 0; i < selectedSeatArray.length; i++) {
				selectedSeatNum = Integer.parseInt(selectedSeatArray[i]);
				
				seatVO.setSe_selectedSeatNum(selectedSeatNum);
				// 선택된 좌석이 존재하는지 체크
				SeatVO existedSeatCheck = paymentService.existedSeatCheck(seatVO);
				if(existedSeatCheck != null) {
					model.addAttribute("msg", "이미 예약된 좌석입니다. 다시 시도해주세요.");
					model.addAttribute("url", "");
					return "/main/message";
				}else {
					resultSeat = paymentService.insertSeat(seatVO);
				}
			}
			
			// 북테이블
			bookVO.setBk_reservedSeatNum(seatVO.getSe_selectedSeatNumString());
			boolean result = paymentService.insertBookPayment(bookVO);
			// 최신 book테이블을 가져옴
			BookVO bookDB = bookService3.selectLastBookInfo();  
			Integer usePoint = bookVO.getBk_usePoint();
			// 멤버 마일리지
			boolean resultMember = memberService.updateUsePoint(user,usePoint); // 사용마일리지 차감
			boolean accumulatePoint = memberService.accumulatePoint(user, bookVO.getBk_totalPrice()); // 결제시 총결제금액 0.05% 마일리지 적립 업데이트

			// 잔여좌석 업데이트 
			boolean reserve = bookService3.updateReservationAvailable(bookVO.getBk_dr_num());
			
			boolean res = false;
			if(result&&resultMember&&resultSeat) {
				res = true;
			}
			
			if(res) {
				// 예약이 성공했을시, completeReservation.jsp 페이지로 이동
				model.addAttribute("title", "고속버스 예매"); 
				model.addAttribute("subject", "고속버스 예매"); 
				model.addAttribute("subtitle", "payment"); 
				model.addAttribute("subtitle_num", "3"); 
				model.addAttribute("bookDB", bookDB);
				model.addAttribute("drive", drive); 
				
				return "/payment/completeReservation";
			}else {
				model.addAttribute("msg", "예매에 실패했습니다. 다시 시도해주세요.");
				model.addAttribute("url", "payment/inputPaymentInfoView");
			}
		}catch(Exception e) {
			model.addAttribute("msg", "예매에 실패했습니다. 다시 시도해주세요.");
			model.addAttribute("url", "payment/inputPaymentInfoView");
			e.printStackTrace();
		}
		user.setMe_point(user.getMe_point());
		return "/main/message";
		
	}
}