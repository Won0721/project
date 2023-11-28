package kr.kh.letsKo.service;

import java.util.List;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.vo.BusVO;

public interface BusService {

	boolean insertBus(BusVO busVo);

	boolean deleteBus(Integer bus_num);

	BusVO selectBus(Integer bus_num);

	boolean updateBus(BusVO busVo);

	List<BusVO> getBusList(Criteria cri);

	int selectCountBusList(Criteria cri);

	List<BusVO> getAllBusList();
	
	String getCompanyNameByCoNum(Integer co_num);

	Object checkName(String bus_carNumber);

	BusVO getBusByNum(int busNum);



}