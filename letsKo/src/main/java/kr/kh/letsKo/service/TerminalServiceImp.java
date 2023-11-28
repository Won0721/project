package kr.kh.letsKo.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.letsKo.dao.LineDAO;
import kr.kh.letsKo.dao.TerminalDAO;
import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.vo.BusVO;
import kr.kh.letsKo.vo.CityVO;
import kr.kh.letsKo.vo.LineVO;
import kr.kh.letsKo.vo.TerminalVO;

@Service
public class TerminalServiceImp implements TerminalService {
	@Autowired
	TerminalDAO terminalDao;
	
	@Autowired
	LineDAO lineDao;
	@Override
	public List<CityVO> getCityList() {
		// TODO Auto-generated method stub
		return terminalDao.selectCityList();
	}
	@Override
    public List<TerminalVO> getTerminalsByCityId(int cityId) {
        return terminalDao.getTerminalsByCityId(cityId);
    }

	@Override
	public boolean insertTerminal(TerminalVO terminalVo) {
		// TODO Auto-generated method stub
		return terminalDao.insertTermianl(terminalVo);
	}

	@Override
	public List<TerminalVO> getTerminalList() {
		
	    return terminalDao.getTerminalList();
	}

	@Override
	public boolean deleteTerminal(String te_code) {
		
		return terminalDao.deleteTerminal(te_code);
	}

	@Override
	public TerminalVO selectTerminalByCode(String te_code) {
		

		return terminalDao.selectTerminalByCode(te_code);
	}

	@Override
	public boolean updateTerminal(String te_code, String te_newcode, Integer te_ci_num, Integer te_ci_newNum) {
		
		return terminalDao.updateTerminal(te_code, te_newcode, te_ci_num, te_ci_newNum);
	}

	@Override
	public List<TerminalVO> selectTerminalByCiNum(String num, String deptText) {
		
		return terminalDao.selectTerminalByCiNum(num, deptText);
	}

	@Override
	public List<TerminalVO> getArrTerminal(String depText) {
		// TODO Auto-generated method stub
		return terminalDao.getArrTerminal(depText);
	}
	
		@Override
		public List<TerminalVO> getAllTerminalList(Criteria cri) {
			if(cri == null) {
				cri = new Criteria(); 
			}
			return terminalDao.selectTerminalList(cri);
		}
		
		@Override
		public int selectCountTerminalList(Criteria cri) {
			if(cri == null) {
				cri = new Criteria(); 
			}
			return terminalDao.selectCountTerminalList(cri);
		}
		
		@Override
	    public boolean isDuplicateEntry(TerminalVO terminalVo) {
	        return terminalDao.isDuplicateEntry(terminalVo);
	    }
		@Override
	    public boolean isDuplicateEntry(String te_newcode) {
	        return terminalDao.isDuplicateEntry(te_newcode);
	    }
		@Override
		public List<TerminalVO> selectTerminalAjax(String city_num) {
			// TODO Auto-generated method stub
			return terminalDao.selectTerminalAjax(city_num);
		}
		



}
