package kr.kh.letsKo.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.vo.BookVO;
import kr.kh.letsKo.vo.CancelVO;
import kr.kh.letsKo.vo.SeatVO;

public interface BookDAO3 {

	int selectBusNum(@Param("bk_dr_num")int bk_dr_num);

	List<SeatVO> selectedSeatCheck(@Param("bus_num")int bus_num);

	boolean updateReservationAvailable(@Param("bk_dr_num")int bk_dr_num);

	BookVO selectLastBookInfo();

	BookVO selectBookInfo(@Param("bk_num")int bk_num);

	List<BookVO> selectBookList(@Param("me_id")String me_id, @Param("cancelChoice")int cancelChoice, @Param("startDate")Date startDate, @Param("endDate")Date endDate, @Param("curDate")Date curDate, @Param("cri")Criteria cri);

	int updateBk_cancellationStatus(@Param("ca_bk_num")int ca_bk_num);

	boolean insertCancel(@Param("cancelVO")CancelVO cancelVO);

	String selectBk_ReservedSeatNum(@Param("ca_bk_num")int ca_bk_num);

	boolean deleteSeat(@Param("seatVO")SeatVO seatVO);

	boolean returnReservationAvailable(@Param("dr_num")int dr_num, @Param("selectedSeatArrayLength")int selectedSeatArrayLength);

	int selectBookListCnt(@Param("me_id")String me_id, @Param("cancelChoice")int cancelChoice, @Param("startDate")Date startDate, @Param("endDate")Date endDate, @Param("curDate")Date curDate, @Param("cri")Criteria cri);

	List<BookVO> selectPayList(@Param("me_id")String me_id, @Param("cancelChoice")int cancelChoice, @Param("startDate")Date startDate, @Param("endDate")Date endDate);

	int selectAllPayListCnt(@Param("me_id") String me_id);

	int selectAllBookListCnt(@Param("me_id") String me_id, @Param("curDate") Date curDate);

}
