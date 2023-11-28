package kr.kh.letsKo.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.letsKo.dao.BoardDAO;
import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.util.UploadFileUtils;
import kr.kh.letsKo.vo.BoardFileVO;
import kr.kh.letsKo.vo.BoardVO;
import kr.kh.letsKo.vo.MemberVO;

@Service
public class BoardServiceImp implements BoardService{
	
	@Autowired
	BoardDAO boardDao;
	
	String uploadPath = "C:\\uploadFiles";
	String uploadBoardFilePath = uploadPath + "\\boardFiles";
	
	@Override
	public List<BoardVO> selectBoardList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria(); 
		}
		return boardDao.selectBoardList(cri);
	}

	@Override
	public int selectCountBoardList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria(); 
		}
		return boardDao.selectCountBoardList(cri);
	}

	@Override
	public BoardVO selectBoard(int bo_num) {
		return boardDao.selectBoard(bo_num);
	}

	@Override
	public List<BoardFileVO> selectBoardFileList(int bo_num) {
		return boardDao.selectBoardFileList(bo_num);
	}

	@Override
	public void updateBoardViews(Integer bo_num) {
		boardDao.updateBoardViews(bo_num);
	}	
	
	
	// 관리자 
	// 공지사항 등록  
	@Override
	public boolean insertBoardAdmin(BoardVO board, MemberVO user, MultipartFile[] boardFileList) {
		if(board == null || 
		   board.getBo_title() == null || board.getBo_title().trim().length() == 0 ||
		   board.getBo_contents() == null) {
			return false;
		}
		board.setBo_me_id(user.getMe_id());  
		boolean res = boardDao.insertBoardAdmin(board);
		if(!res) {
			return false;
		}
		
		// 첨부파일 등록 
		if(boardFileList == null || boardFileList.length == 0) {
			return true;
		}
		for(MultipartFile file : boardFileList) {
			if(file == null || file.getOriginalFilename().length() == 0) {
				continue;
			}
			try {
				String bf_originalName = file.getOriginalFilename();
				String bf_name = UploadFileUtils.uploadFile(uploadBoardFilePath, bf_originalName, file.getBytes());
				BoardFileVO boardFileVO = new BoardFileVO(board.getBo_num(), bf_name, bf_originalName);
				boardDao.insertBoardFileAdmin(boardFileVO);  
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return true;
	}
		
	// 공지사항 수정
	@Override
	public boolean boardUpdateAdmin(BoardVO board, MultipartFile[] boardFileList, Integer[] delFiles, MemberVO user) {
		if(board == null || 
		   board.getBo_title() == null || board.getBo_title().trim().length() == 0 ||
		   board.getBo_contents() == null) {
			return false;
		}
		BoardVO dbBoard = boardDao.selectBoard(board.getBo_num());
		if(dbBoard == null || !dbBoard.getBo_me_id().equals(user.getMe_id())) {
			return false;
		}
		boolean res = boardDao.boardUpdateAdmin(board);
		
		// 첨부파일 업데이트 
		// 추가된 첨부파일을 서버에 업로드 및 DB에 추가
		uploadBoardFileAndInsert(boardFileList, board.getBo_num());
		
		// 삭제된 첨부파일을 서버에서 제거 및 DB에서 제거
		boardDeleteFile(delFiles);
		
		return res;
	}
	
	// 공지사항 파일 삭제
	private void boardDeleteFile(Integer[] delFiles) {
		if(delFiles == null || delFiles.length == 0) {
			return;
		}
		
		for(Integer num : delFiles) {
			if(num == null) {
				continue;
			}
			// 첨부파일 정보를 가져옴 => 서버에서 지워야 하기 때문에
			BoardFileVO boardFileVO = boardDao.selectBoardFile(num);
			if(boardFileVO == null) {
				continue;
			}
			UploadFileUtils.deleteFile(uploadPath, boardFileVO.getBf_name());
			// DB에서 제거 
			boardDao.deleteBoardFile(num);
		}
		
	}
	
	// 공지사항 삭제
	@Override
	public boolean boardDeleteAdmin(Integer bo_num, MemberVO user) {
		if(bo_num == null) {
			return false;
		}
		BoardVO board = boardDao.selectBoard(bo_num); 
		if(board == null || !board.getBo_me_id().equals(user.getMe_id())){
			return false;
		}
		List<BoardFileVO> boardFileList = boardDao.selectBoardFileList(bo_num); 
		System.out.println(boardFileList);
		if(boardFileList != null) {
			for(BoardFileVO boardFileVO : boardFileList) {
				// 실제 파일 제거
				UploadFileUtils.deleteFile(uploadPath, boardFileVO.getBf_name());
				// DB에서 제거
				boardDao.deleteBoardFile(boardFileVO.getBf_num());
			}
		}
		
		return boardDao.boardDeleteAdmin(bo_num);
	}
	
	
	// 공지사항 파일 등록 메서드
	private void uploadBoardFileAndInsert(MultipartFile[] boardFileList, int bf_bo_num) {
		if(boardFileList == null || boardFileList.length == 0) {
			System.out.println("[uploadFileAndInsert] 실패");
			return;
		}
		for(MultipartFile file : boardFileList) {
			if(file == null || file.getOriginalFilename().length() == 0) {
				continue;
			}
			try {
				String bf_name = UploadFileUtils.uploadFile(uploadBoardFilePath, file.getOriginalFilename(), file.getBytes());
				BoardFileVO boardFileVo = new BoardFileVO(bf_bo_num, bf_name, file.getOriginalFilename());
				
				boardDao.insertBoardFileAdmin(boardFileVo);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
