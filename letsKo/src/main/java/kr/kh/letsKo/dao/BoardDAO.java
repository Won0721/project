package kr.kh.letsKo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.vo.BoardFileVO;
import kr.kh.letsKo.vo.BoardVO;

public interface BoardDAO {

	List<BoardVO> selectBoardList(@Param("cri")Criteria cri);

	int selectCountBoardList(@Param("cri")Criteria cri);

	BoardVO selectBoard(@Param("bo_num")int bo_num);

	List<BoardFileVO> selectBoardFileList(@Param("bo_num")int bo_num);
	
	BoardFileVO selectBoardFile(@Param("bf_num")int bf_num);
	
	int selectBoardFileNumber(@Param("bf_bo_num")int bf_bo_num);
	
	void updateBoardViews(@Param("bo_num")Integer bo_num);
	
	void deleteBoardFile(@Param("bf_num")Integer bf_num);
	
	
	// 관리자 
	boolean insertBoardAdmin(@Param("board")BoardVO board);

	void insertBoardFileAdmin(@Param("boardFileVO")BoardFileVO boardFileVO);

	boolean boardUpdateAdmin(@Param("board")BoardVO board);

	boolean boardDeleteAdmin(@Param("bo_num")Integer bo_num);
	
}
