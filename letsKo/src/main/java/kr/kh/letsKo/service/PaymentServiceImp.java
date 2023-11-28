package kr.kh.letsKo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.letsKo.dao.PaymentDAO;
import kr.kh.letsKo.vo.BookVO;
import kr.kh.letsKo.vo.DriveVO;
import kr.kh.letsKo.vo.SeatVO;

@Service
public class PaymentServiceImp implements PaymentService {

	@Autowired
	PaymentDAO paymentDao;

	@Override
	public boolean insertBookPayment(BookVO bookVO) {
		return paymentDao.insertBookPayment(bookVO);
	}

	@Override
	public boolean insertSeat(SeatVO seatVO) {
		return paymentDao.insertSeat(seatVO);
	}

	@Override
	public SeatVO existedSeatCheck(SeatVO seatVO) {
		return paymentDao.existedSeatCheck(seatVO);
	}
	
}
