package kr.kh.letsKo.service;

import kr.kh.letsKo.vo.BookVO;
import kr.kh.letsKo.vo.DriveVO;
import kr.kh.letsKo.vo.SeatVO;

public interface PaymentService {

	boolean insertBookPayment(BookVO bookVO);

	boolean insertSeat(SeatVO seatVO);

	SeatVO existedSeatCheck(SeatVO seatVO);

}
