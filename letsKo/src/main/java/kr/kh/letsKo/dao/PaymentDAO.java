package kr.kh.letsKo.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.letsKo.vo.BookVO;
import kr.kh.letsKo.vo.DriveVO;
import kr.kh.letsKo.vo.SeatVO;

public interface PaymentDAO {

	boolean insertBookPayment(@Param("bookVO")BookVO bookVO);

	boolean insertSeat(@Param("seatVO")SeatVO seatVO);

	SeatVO existedSeatCheck(@Param("seatVO")SeatVO seatVO);

}
