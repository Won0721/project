package kr.kh.letsKo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.pagination.PageMaker;
import kr.kh.letsKo.service.BoardService;
import kr.kh.letsKo.vo.BoardFileVO;
import kr.kh.letsKo.vo.BoardVO;
import kr.kh.letsKo.vo.MemberVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	// 공지사항 조회
	@GetMapping("/board/boardList")
	public String boardList(Model model, Criteria cri) { 
		List<BoardVO> boardList = boardService.selectBoardList(cri);
		
		// 현재 페이지 정보(검색어, 타입)에 맞는 전체 게시글 수를 가져옴 
		int totalCount = boardService.selectCountBoardList(cri);
		// 페이지네이션 페이지 수
		final int DISPLAY_PAGE_NUM = 3;
		PageMaker pm = new PageMaker(DISPLAY_PAGE_NUM, cri, totalCount);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pm", pm);
		model.addAttribute("title", "공지사항"); 
		model.addAttribute("subject", "공지사항"); 
		return "/board/boardList";
	}
	
	// 공지사항 상세조회
	@GetMapping("/board/boardDetail")
	public String boardDetail(Model model, Integer bo_num) {
		boardService.updateBoardViews(bo_num);
		BoardVO board = boardService.selectBoard(bo_num); 
		List<BoardFileVO> boardFileList = boardService.selectBoardFileList(bo_num);
		
		model.addAttribute("board", board);
		model.addAttribute("boardFileList", boardFileList);
		model.addAttribute("title", "공지사항 상세조회"); 
		model.addAttribute("subject", "공지사항 상세조회"); 
		return "/board/boardDetail";
	}
	
	
	// 관리자 
	
	// 공지사항 조회 화면
		@GetMapping("/board/boardListAdmin")
		public String boardListAdmin(Model model, Criteria cri, HttpSession session) { 
			MemberVO user = (MemberVO) session.getAttribute("user");
			if (user == null) {
				model.addAttribute("msg", "로그인을 해주세요.");
				model.addAttribute("url", "member/loginView");
				return "/main/message";
			}
			if (!user.getMe_authority().equals("ADMIN")) {
				model.addAttribute("msg", "관리자 아이디로 로그인 해주세요.");
				model.addAttribute("url", "");
				return "/main/message";
			}
			
			List<BoardVO> boardList = boardService.selectBoardList(cri);
			
			int totalCount = boardService.selectCountBoardList(cri);
			final int DISPLAY_PAGE_NUM = 3;
			PageMaker pm = new PageMaker(DISPLAY_PAGE_NUM, cri, totalCount);
			
			model.addAttribute("boardList", boardList);
			model.addAttribute("pm", pm);
			model.addAttribute("title", "공지사항 조회"); 
			model.addAttribute("subject", "공지사항 조회"); 
			return "/board/boardListAdmin";
		}
			
		// 공지사항 등록 화면페이지
		@GetMapping("/board/boardInsertViewAdmin")
		public String boardInsertViewAdmin(Model model, HttpSession session) {
			MemberVO user = (MemberVO) session.getAttribute("user");
			if (user == null) {
				model.addAttribute("msg", "로그인을 해주세요.");
				model.addAttribute("url", "member/loginView");
				return "/main/message";
			}
			if (!user.getMe_authority().equals("ADMIN")) {
				model.addAttribute("msg", "관리자 아이디로 로그인 해주세요.");
				model.addAttribute("url", "");
				return "/main/message";
			}
			
			model.addAttribute("title", "공지사항 등록");
			model.addAttribute("subject", "공지사항 등록"); 
			return "/board/boardInsertAdmin"; 
		}
		
		// 공지사항 등록 완료
		@PostMapping("/board/boardInsertAdmin")
		public String boardInsertAdmin(Model model, BoardVO board, HttpSession session, MultipartFile[] boardFileList){
			MemberVO user = (MemberVO)session.getAttribute("user");
			boolean res = boardService.insertBoardAdmin(board, user, boardFileList); 
			if(res) {
				model.addAttribute("msg", "게시글 등록을 성공하였습니다.");
				model.addAttribute("url", "board/boardListAdmin");
			}else {
				model.addAttribute("msg", "게시글 등록을 실패하였습니다.");
				model.addAttribute("url", "board/boardInsertViewAdmin");
			}
			return "/main/message";
		}
		
		// 공지사항 수정 
		@GetMapping("/board/boardUpdateAdminView")
		public String boardUpdateAdminView(Model model, Integer bo_num, HttpSession session) { 
			BoardVO board = boardService.selectBoard(bo_num);
			List<BoardFileVO> boardFileList = boardService.selectBoardFileList(bo_num);
			
			MemberVO user = (MemberVO)session.getAttribute("user");
			if(user == null || board == null || !user.getMe_id().equals(board.getBo_me_id())) {
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("url", "member/login");
				return "/main/message";
			}
			if (!user.getMe_authority().equals("ADMIN")) {
				model.addAttribute("msg", "관리자 아이디로 로그인 해주세요.");
				model.addAttribute("url", "");
				return "/main/message";
			}
			
			model.addAttribute("board", board);
			model.addAttribute("boardFileList", boardFileList);
			model.addAttribute("title", "공지사항 수정");
			model.addAttribute("subject", "공지사항 수정"); 
			return "/board/boardUpdateAdmin";
		}
		
		// 공지사항 수정완료
		@PostMapping("/board/boardUpdateAdmin")
		public String boardUpdateAdmin(Model model, BoardVO board, MultipartFile[] boardFileList, Integer[] delFiles, HttpSession session) {
			MemberVO user = (MemberVO)session.getAttribute("user");
			boolean res = boardService.boardUpdateAdmin(board, boardFileList, delFiles, user);
			
			if(res) {
				model.addAttribute("msg", "게시글을 수정했습니다.");
			}else {
				model.addAttribute("msg", "게시글 수정에 실패했습니다.");
			}
			model.addAttribute("url", "board/boardListAdmin");
			
			return "/main/message";
		}
		
		// 공지사항 삭제 
		@GetMapping("/board/boardDeleteAdmin")
		public String boardDeleteAdmin(Model model, Integer bo_num, HttpSession session) { 
			MemberVO user = (MemberVO)session.getAttribute("user");
			if (user == null) {
				model.addAttribute("msg", "로그인을 해주세요.");
				model.addAttribute("url", "member/loginView");
				return "/main/message";
			}
			if (!user.getMe_authority().equals("ADMIN")) {
				model.addAttribute("msg", "관리자 아이디로 로그인 해주세요.");
				model.addAttribute("url", "");
				return "/main/message";
			}
			
			boolean res = boardService.boardDeleteAdmin(bo_num, user);
			
			if(res) {
				model.addAttribute("msg", "게시글을 삭제했습니다.");
			}else {
				model.addAttribute("msg", "게시글 삭제에 실패했습니다.");
			}
			model.addAttribute("url", "board/boardListAdmin");
			return "/main/message";
		}

}
