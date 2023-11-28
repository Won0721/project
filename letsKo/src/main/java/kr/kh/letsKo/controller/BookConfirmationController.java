package kr.kh.letsKo.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.pagination.PageMaker;
import kr.kh.letsKo.service.BookService3;
import kr.kh.letsKo.service.DriveService;
import kr.kh.letsKo.service.MemberService;
import kr.kh.letsKo.vo.BookVO;
import kr.kh.letsKo.vo.CancelVO;
import kr.kh.letsKo.vo.DriveVO;
import kr.kh.letsKo.vo.MemberVO;
import kr.kh.letsKo.vo.SeatVO;

@Controller
public class BookConfirmationController {

	@Autowired
	DriveService driveService;

	@Autowired
	BookService3 bookService3;
	
	@Autowired
	MemberService memberService;
	// 예매확인
	@GetMapping("/bookConfirmation/bookConfirmation")
	public String bookComplete(Model model, HttpSession session, Criteria cri) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "member/loginView");
			return "/main/message";
		}

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date curDate = null;
		Date startDate = null;
		Calendar calendar = Calendar.getInstance();
		startDate = calendar.getTime();
		curDate = calendar.getTime();
		
		List<BookVO> bookList = bookService3.selectBookList(user.getMe_id(), 0, startDate, null, curDate, cri); // 2번째 파라미터가 0이면 예매내역, 1이면 취소내역 확인

		model.addAttribute("bookList", bookList);
		model.addAttribute("title", "예매확인/취소");
		model.addAttribute("subject", "예매내역");
		return "/bookConfirmation/bookConfirmation";
	}

	// 예매취소
	@GetMapping("/bookConfirmation/bookCancel")
	public String bookCancel(Model model, Integer dr_num, int bk_num) {
		BookVO book = bookService3.selectBookInfo(bk_num);
		DriveVO drive = driveService.getDriveByNum(dr_num);

		model.addAttribute("book", book);
		model.addAttribute("drive", drive);
		model.addAttribute("title", "예매확인/취소");
		model.addAttribute("subject", "예매취소");

		return "/bookConfirmation/bookCancel";
	}

	// 예매취소 POST
	@PostMapping("/bookConfirmation/bookCancel")
	public String bookCancelPost(Model model, CancelVO cancelVO, int dr_num, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		// 예매취소버튼 클릭시 해야할것
		// 1. 해당 예약 bk_num주고 bk_cancellationStatus = 1(취소)로 업데이트
		int bk_cancellationStatus = bookService3.updateBk_cancellationStatus(cancelVO.getCa_bk_num());
		// 2.취소테이블 DB에 데이터 저장
		boolean cancel = bookService3.insertCancel(cancelVO);
		System.out.println(dr_num);
		// 3-1. 좌석 삭제 dr_num으로 driveTB 조회 버스코드를 얻고,
		int bus_num = bookService3.selectBusNum(dr_num);
		// 3-2. 예매TB에서 예약된좌석을 얻고 스플릿해서 for문으로 좌석TB에 예약된좌석번호, 버스코드를 삭제
		String se_selectedSeatNumString = bookService3.selectBk_ReservedSeatNum(cancelVO.getCa_bk_num());
		String[] selectedSeatArray = se_selectedSeatNumString.split(",");
		int se_selectedSeatNum = 0;
		SeatVO seatVO = new SeatVO();
		boolean resultSeat = false;
		for (int i = 0; i < selectedSeatArray.length; i++) {
			se_selectedSeatNum = Integer.parseInt(selectedSeatArray[i]);
			seatVO.setSe_bus_code(bus_num);
			seatVO.setSe_selectedSeatNum(se_selectedSeatNum);
			resultSeat = bookService3.deleteSeat(seatVO);
		}
		// 4. 드라이브TB 잔여좌석 업데이트
		int selectedSeatArrayLength = selectedSeatArray.length;
		boolean reservationAvailable = bookService3.returnReservationAvailable(dr_num, selectedSeatArrayLength);

		model.addAttribute("msg", "취소가 완료되었습니다.");		
		model.addAttribute("url", "bookConfirmation/bookCancelList");
		return "/main/message";
	}

	// 예매취소 리스트
	@GetMapping("/bookConfirmation/bookCancelList")
	public String bookCancelList(Model model, HttpSession session, Criteria cri) {
		cri.setPerPageNum(3);
		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "member/loginView");
			return "/main/message";
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();

        // 현재 날짜 설정
        Date curDate = calendar.getTime();
        System.out.println("현재 날짜: " + dateFormat.format(curDate));

        // 3개월 전 날짜 계산
        calendar.add(Calendar.MONTH, -3);
        Date threeMonthsAgo = calendar.getTime();
		
		List<BookVO> bookList = bookService3.selectBookList(user.getMe_id(), 1, threeMonthsAgo, null, null, cri); // 2번째 파라미터가 0이면 예매내역, 1이면 취소내역 확인
		// 현재 페이지 정보(검색어, 타입)에 맞는 전체 게시글 수를 가져옴 
		int totalCount = bookService3.selectBookListCnt(user.getMe_id(), 1, threeMonthsAgo, null, null, cri);
		// 페이지네이션 페이지 수
		final int DISPLAY_PAGE_NUM = 3;
		PageMaker pm = new PageMaker(DISPLAY_PAGE_NUM, cri, totalCount);
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("pm", pm);
		model.addAttribute("title", "예매확인/취소");
		model.addAttribute("subject", "취소내역");
		return "/bookConfirmation/bookCancelList";
	}

}
