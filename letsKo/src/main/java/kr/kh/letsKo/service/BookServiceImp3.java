package kr.kh.letsKo.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.letsKo.dao.BookDAO3;
import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.vo.BookVO;
import kr.kh.letsKo.vo.CancelVO;
import kr.kh.letsKo.vo.SeatVO;

@Service
public class BookServiceImp3 implements BookService3 {
	
	@Autowired
	BookDAO3 bookDao3;

	@Override
	public int selectBusNum(int bk_dr_num) {
		return bookDao3.selectBusNum(bk_dr_num);
	}

	@Override
	public List<SeatVO> selectedSeatCheck(int bus_num) {
		return bookDao3.selectedSeatCheck(bus_num);
	}

	@Override
	public boolean updateReservationAvailable(int bk_dr_num) {
		return bookDao3.updateReservationAvailable(bk_dr_num);
	}

	@Override
	public BookVO selectLastBookInfo() {
		return bookDao3.selectLastBookInfo();
	}


	@Override
	public BookVO selectBookInfo(int bk_num) {
		return bookDao3.selectBookInfo(bk_num);
	}

	 @Override 
		public List<BookVO> selectBookList(String me_id, int cancelChoice, Date startDate, Date endDate, Date curDate, Criteria cri) { 
		 return bookDao3.selectBookList(me_id, cancelChoice, startDate, endDate, curDate, cri); 
	}

	 @Override 
	 public List<BookVO> selectPayList(String me_id, int cancelChoice, Date startDate, Date endDate) { 
		 return bookDao3.selectPayList(me_id, cancelChoice, startDate, endDate); 
	 }
	
	@Override 
	public int updateBk_cancellationStatus(int ca_bk_num) {
		return bookDao3.updateBk_cancellationStatus(ca_bk_num); 
	}

	@Override
	public boolean insertCancel(CancelVO cancelVO) {
		return bookDao3.insertCancel(cancelVO); 
	}

	@Override
	public String selectBk_ReservedSeatNum(int ca_bk_num) {
		return bookDao3.selectBk_ReservedSeatNum(ca_bk_num);
	}

	@Override
	public boolean deleteSeat(SeatVO seatVO) {
		return bookDao3.deleteSeat(seatVO);
	}

	@Override
	public boolean returnReservationAvailable(int dr_num, int selectedSeatArrayLength) {
		return bookDao3.returnReservationAvailable(dr_num, selectedSeatArrayLength);
	}

	@Override
	public int selectBookListCnt(String me_id, int cancelChoice, Date startDate, Date endDate, Date curDate, Criteria cri) {
		return bookDao3.selectBookListCnt(me_id, cancelChoice, startDate, endDate, curDate, cri);
	}

	@Override
	public int selectAllPayListCnt(String me_id) {
		return bookDao3.selectAllPayListCnt(me_id);
	}

	@Override
	public int selectAllBookListCnt(String me_id, Date curDate) {
		return bookDao3.selectAllBookListCnt(me_id, curDate);
	}
	 
}