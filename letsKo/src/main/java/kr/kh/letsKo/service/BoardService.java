package kr.kh.letsKo.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.vo.BoardFileVO;
import kr.kh.letsKo.vo.BoardVO;
import kr.kh.letsKo.vo.MemberVO;

public interface BoardService {

	List<BoardVO> selectBoardList(Criteria cri);

	int selectCountBoardList(Criteria cri);

	BoardVO selectBoard(int bo_num);

	List<BoardFileVO> selectBoardFileList(int bo_num);

	void updateBoardViews(Integer bo_num);
	
	
	// 관리자
	boolean insertBoardAdmin(BoardVO board, MemberVO user, MultipartFile[] boardFileList);

	boolean boardUpdateAdmin(BoardVO board, MultipartFile[] files, Integer[] delFiles, MemberVO user);

	boolean boardDeleteAdmin(Integer bo_num, MemberVO user);
	
}
