package kr.kh.letsKo.service;

import java.util.List;

import kr.kh.letsKo.vo.LineVO;
import kr.kh.letsKo.vo.TerminalVO;

public interface LineService {

	
	List<LineVO> getLineList();

    boolean insertLine(LineVO lineVO);

    boolean deleteLineByNum(int li_num);

    LineVO getLineByNum(int li_num);

    boolean updateLine(LineVO lineVO);

	boolean isDuplicateLine(LineVO lineVo);



	
}
