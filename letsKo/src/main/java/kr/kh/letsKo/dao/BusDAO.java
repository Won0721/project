package kr.kh.letsKo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.vo.BusVO;

public interface BusDAO {
	
	boolean insertBus(@Param("bus") BusVO busVo);
	
	boolean deleteBus(@Param("bus_num") Integer bus_num);

	BusVO selectBus(@Param("bus_num") Integer bus_num);

	boolean updateBus(@Param("bus") BusVO busVo);

	List<BusVO> selectBusList(@Param("cri") Criteria cri);

	Integer selectCountBusList(@Param("cri") Criteria cri);

	List<BusVO> getAllBusList();
	
	String getCompanyNameByCoNum(@Param("co_num") Integer co_num);

	Object selectBusByName(@Param("bus_carNumber") String bus_carNumber);

	BusVO getBusByNum(int busNum);

}