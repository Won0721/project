package kr.kh.letsKo.dao;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import kr.kh.letsKo.vo.LineVO;
import kr.kh.letsKo.vo.TerminalVO;

public interface LineDAO {
	
	
	List<LineVO> selectLineList();

    void insertLine(@Param("line") LineVO lineVO);

    void deleteLineByNum(@Param("li_num") int li_num);

    LineVO getLineByNum(@Param("li_num") int li_num);

    boolean updateLine(@Param("line") LineVO lineVO);

    boolean isDuplicateLine(@Param("line") LineVO lineVo);

	boolean isExistingLine(LineVO line);

	LineVO getLineById(@Param("dr_li_num") int dr_li_num);

	LineVO selectLineByCode(@Param("te_code") String te_code);

	void deleteLineByCode(@Param("te_code") String te_code);


   

	

  


}