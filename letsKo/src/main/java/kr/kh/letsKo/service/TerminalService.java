package kr.kh.letsKo.service;

import java.util.List;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.vo.CityVO;
import kr.kh.letsKo.vo.TerminalVO;

public interface TerminalService {

	List<CityVO> getCityList();

	boolean insertTerminal(TerminalVO terminalVo);

	List<TerminalVO> getTerminalList();

	boolean deleteTerminal(String te_code);

	TerminalVO selectTerminalByCode(String te_code);

	boolean updateTerminal(String te_code, String te_newcode, Integer te_ci_num, Integer te_ci_newNum);

	List<TerminalVO> selectTerminalByCiNum(String city_num, String depText);

	List<TerminalVO> getArrTerminal(String depText);
	
	List<TerminalVO> getAllTerminalList(Criteria cri);
	
	int selectCountTerminalList(Criteria cri);

	boolean isDuplicateEntry(TerminalVO terminalVo);

	boolean isDuplicateEntry(String te_newcode);

	List<TerminalVO> getTerminalsByCityId(int cityId);

	List<TerminalVO> selectTerminalAjax(String city_num);


	

	

	


}
