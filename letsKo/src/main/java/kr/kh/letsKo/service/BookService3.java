package kr.kh.letsKo.service;

import java.util.Date;
import java.util.List;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.vo.BookVO;
import kr.kh.letsKo.vo.CancelVO;
import kr.kh.letsKo.vo.MemberVO;
import kr.kh.letsKo.vo.SeatVO;

public interface BookService3 {

	int selectBusNum(int bk_dr_num);

	List<SeatVO> selectedSeatCheck(int bus_num);

	boolean updateReservationAvailable(int bk_num);

	BookVO selectLastBookInfo();

	BookVO selectBookInfo(int bk_num);

	List<BookVO> selectBookList(String me_id, int cancelChoice, Date startDate, Date endDate, Date curDate, Criteria cri);

	int updateBk_cancellationStatus(int ca_bk_num);

	boolean insertCancel(CancelVO cancelVO);

	String selectBk_ReservedSeatNum(int ca_bk_num);

	boolean deleteSeat(SeatVO seatVO);

	boolean returnReservationAvailable(int dr_num, int selectedSeatArrayLength);

	int selectBookListCnt(String me_id, int cancelChoice, Date startDate, Date endDate, Date curDate, Criteria cri);

	List<BookVO> selectPayList(String me_id, int cancelChoice, Date startDate, Date endDate);

	int selectAllPayListCnt(String user);

	int selectAllBookListCnt(String me_id, Date curDate);

}