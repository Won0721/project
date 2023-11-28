package kr.kh.letsKo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.vo.CityVO;
import kr.kh.letsKo.vo.TerminalVO;

public interface TerminalDAO {

	List<CityVO> selectCityList();

	boolean insertTermianl(@Param("t") TerminalVO terminalVo);

	List<TerminalVO> selectTerminalList();

	boolean deleteTerminal(@Param("te_code") String te_code);

	TerminalVO selectTerminalByCode(@Param("te_code") String te_code);

	boolean updateTerminal(@Param("te_code") String te_code, @Param("te_newcode") String te_newCode, @Param("te_ci_num")  Integer te_ci_num, @Param("te_ci_newnum") Integer te_ci_newNum);

	List<TerminalVO> selectTerminalByCiNum(@Param("num") String num, @Param("depText") String deptText);

	List<TerminalVO> getArrTerminal(@Param("depText") String depText);
	
	List<TerminalVO> selectTerminalList(@Param("cri") Criteria cri);
	
	Integer selectCountTerminalList(@Param("cri") Criteria cri);

	List<TerminalVO> getTerminalList();
	
	boolean isDuplicateEntry(TerminalVO terminalVo);

	boolean isDuplicateEntry(String te_newcode);

	List<TerminalVO> getTerminalsByCityId(int cityId);

	List<TerminalVO> selectTerminalAjax(@Param("city_num") String city_num);

	

	

	
}