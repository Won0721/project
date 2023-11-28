package kr.kh.letsKo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.letsKo.dao.BusDAO;
import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.vo.BusVO;
import kr.kh.letsKo.vo.CompanyVO;

@Service
public class BusServiceImp implements BusService{
	@Autowired
	BusDAO busDao;
	// 버스 등록 메서드
	
	@Override
	public boolean insertBus(BusVO busVo) {
		if(busVo.getBus_carNumber().equals("") || busVo.getBus_seatGrade() == null || busVo.getBus_totalSeat() == 0 || busVo.getBus_seatGrade() == null) {
			return false;
		}
		
		return busDao.insertBus(busVo);
	}
	
	// 등록된 버스 리스트 조회
	@Override
	public List<BusVO> getBusList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria(); 
		}
		return busDao.selectBusList(cri);
	}
	
	@Override
	public int selectCountBusList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria(); 
		}
		return busDao.selectCountBusList(cri);
	}
	// 고속버스 삭제
	@Override
	public boolean deleteBus(Integer bus_num) {

		return busDao.deleteBus(bus_num);
	}
	
	// 고속버스 선택
	@Override
	public BusVO selectBus(Integer bus_num) {
		
		return busDao.selectBus(bus_num);
	}
	
	// 고속버스 수정
	@Override
	public boolean updateBus(BusVO busVo) {

		return busDao.updateBus(busVo);
	}

	@Override
	public List<BusVO> getAllBusList() {
		// TODO Auto-generated method stub
		return busDao.getAllBusList();
	}
	@Override
	public String getCompanyNameByCoNum(Integer co_num) {
	    return busDao.getCompanyNameByCoNum(co_num);
	}	
	@Override
	public BusVO getBusByNum(int busNum) {
	    return busDao.getBusByNum(busNum);
	}
	

	@Override
	public Object checkName(String bus_carNumber) {
		// TODO Auto-generated method stub
		return busDao.selectBusByName(bus_carNumber) == null;
	}

		
}