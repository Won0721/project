package kr.kh.letsKo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.service.BookService3;
import kr.kh.letsKo.service.MemberService;
import kr.kh.letsKo.vo.BookVO;
import kr.kh.letsKo.vo.MemberVO;
import kr.kh.letsKo.vo.VerificationVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	@Autowired
	BookService3 bookService3;

	// 회원가입 동의
	@GetMapping("/member/signupAgreement")
	public String signupAgreement(Model model) {
		model.addAttribute("title", "회원가입 동의");
		model.addAttribute("subject", "회원가입");
		model.addAttribute("subtitle", "member_agreement");
		model.addAttribute("subtitle_num", "1");
		return "/member/signupAgreement";
	}

	// 회원가입 인증 화면
	@GetMapping("/member/idVerificationView")
	public String idVerificationView(Model model) {
		model.addAttribute("title", "회원가입 본인인증");
		model.addAttribute("subject", "회원가입");
		model.addAttribute("subtitle", "member_agreement");
		model.addAttribute("subtitle_num", "2");
		return "/member/idVerification";
	}

	// 이메일 인증
	@ResponseBody
	@PostMapping("/member/sendEmail")
	public Map<String, Object> sendEmail(@RequestBody VerificationVO verificationVO) {
		Map<String, Object> map = new HashMap<String, Object>();

		Random random = new Random();
		int min = 100000; // 100000부터 시작
		int max = 999999; // 999999까지의 범위에서 난수 생성
		int randomNum = random.nextInt(max - min + 1) + min;

		verificationVO.setVe_verification(String.valueOf(randomNum));

		String addr = "eunseol.kwak@gmail.com"; // 보내는 사람 구글계정
		String subject = "인증번호 테스트 입니다."; // 메일 제목
		String body = "SMTP메일 테스트입니다.\n" + randomNum; // 메일 내용(인증번호)
		String email = verificationVO.getVe_email();

		if (null != email && !"".equals(email)) {
			memberService.sendEmail(email, addr, subject, body);
			map.put("res", true);
			boolean res = memberService.insertVerification(verificationVO);
			map.put("res", res);
		} else {
			map.put("res", false);
		}
		return map;
	}

	// 회원가입 인증 확인
	@ResponseBody
	@PostMapping("/member/idVerification")
	public Map<String, Object> idVerification(@RequestBody VerificationVO verificationVO) {
		Map<String, Object> map = new HashMap<String, Object>();

		/* 입력한 인증번호와 DB에 입력된 값이 같은지 확인 */
		VerificationVO member = memberService.checkIdVerification(verificationVO);
		boolean res = false;
		if (member != null && !member.equals("")) {
			res = true;
			map.put("me_email", member.getVe_email());
		}
		map.put("res", res);
		return map;
	}

	// 회원가입 화면
	@PostMapping("/member/signupView")
	public String signupView(Model model, HttpServletRequest request) {
		model.addAttribute("title", "회원가입");
		model.addAttribute("subject", "회원가입");
		model.addAttribute("subtitle", "member_agreement");
		model.addAttribute("subtitle_num", "3");
		String me_email = (String) request.getParameter("me_email");
		model.addAttribute("me_email", me_email);
		return "/member/signup";
	}

	// 회원가입 완료
	@PostMapping("/member/registSignup")
	public String registSignup(Model model, MemberVO member) {
		boolean res = memberService.registSignup(member);
		if (res) {
			model.addAttribute("msg", "회원가입이 완료되었습니다.");
			model.addAttribute("url", "member/loginView");
		} else {
			model.addAttribute("msg", "회원가입이 실패하였습니다. 다시 시도해 주세요.");
			model.addAttribute("url", "member/signupView");
		}
		System.out.println(member);
		return "/main/message";
	}

	// 아이디 체크
	@ResponseBody
	@PostMapping("/member/checkId")
	public boolean checkId(@RequestParam("me_id") String me_id) {
		return memberService.checkId(me_id);
	}

	// 로그인 화면
	@GetMapping(value = "/member/loginView")
	public String memberLoginView(Model model) {
		model.addAttribute("title", "로그인");
		model.addAttribute("subject", "로그인");
		return "/member/login";
	}

	// 로그인 완료
	@PostMapping(value = "/member/login")
	public String memberLogin(MemberVO member, Model model) {
		MemberVO user = memberService.login(member);
		if (null != user) {
			if (null != user.getMe_id() && !("").equals(user.getMe_id())) {
			}
			if (null != user.getMe_pw() && !("").equals(user.getMe_pw())) {
				model.addAttribute("msg", "로그인에 성공했습니다.");
				model.addAttribute("url", "");
				model.addAttribute("user", user);
				user.setAutoLogin(member.isAutoLogin());
			}
		} else {
			model.addAttribute("msg", "아이디/비밀번호를 확인해주세요.");
			model.addAttribute("url", "member/loginView");
		}
		return "/main/message";
	}

	// 로그아웃
	@GetMapping("/member/logout")
	public String logout(Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		session.removeAttribute("user");

		if (user != null) {
			user.setMe_session_limit(null);
			memberService.updateMemberSession(user);
		}
		model.addAttribute("msg", "로그아웃에 성공했습니다.");
		model.addAttribute("url", "");
		return "/main/message";
	}

	// 이메일 중복확인
	@ResponseBody
	@PostMapping("/member/checkExistentEmail")
	public Map<String, Object> checkExistentEmail(@RequestBody MemberVO memberVO) {
		Map<String, Object> map = new HashMap<String, Object>();

		MemberVO member = memberService.checkExistentEmail(memberVO);

		boolean res = false;
		/* 가입할 수 있는 email이면 true 리턴 */
		if (member != null && !member.equals("")) {
			res = true;
		}
		map.put("res", res);
		return map;
	}

	// 아이디 찾기 화면
	@GetMapping("/member/findIdView")
	public String findIdView(Model model) {
		model.addAttribute("title", "아이디 찾기");
		model.addAttribute("subject", "아이디 찾기");
		return "/member/findId";
	}

	// 아이디 찾기 완료
	@PostMapping("/member/findId")
	public String findId(Model model, String me_phone) {
		// 파라미터로 me_phone을 넘겨서 me_phone == me_phone인 멤버의 id를 받음
		String id = memberService.findIdByPhone(me_phone);
		if (null == id || "".equals(id)) {
			// id가 null이면
			model.addAttribute("msg", "휴대폰 번호를 확인해주세요.");
			model.addAttribute("url", "member/findIdView");
		} else {
			// id가 null이 아니면
			model.addAttribute("msg", "ID : " + id);
			model.addAttribute("url", "member/loginView");
		}
		return "/main/message";
	}

	// 비밀번호 찾기 화면
	@GetMapping("/member/findPwView")
	public String findPwView(Model model) {
		model.addAttribute("title", "비밀번호 찾기");
		model.addAttribute("subject", "비밀번호 찾기");
		return "/member/findPw";
	}

	// 비밀번호 찾기 완료
	@PostMapping("/member/findPw")
	public String findPw(Model model, MemberVO memberVO) {
		// db에 있는 비밀번호를 임시 비밀번호로 update
		boolean check = memberService.updatePwById(memberVO);
		if (check) {
			model.addAttribute("msg", "임시 비밀번호를 가입된 이메일로 발송하였습니다.");
			model.addAttribute("url", "member/loginView");
		} else {
			model.addAttribute("msg", "존재하지 않는 아이디입니다. 아이디를 확인해주세요.");
			model.addAttribute("url", "member/findPwView");
		}
		return "/main/message";
	}

	
	
	// 마이페이지 
	@GetMapping(value="/member/mypage")
	public String mypage(Model model, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "member/loginView");
			return "/main/message";
		}
		String me_id = user.getMe_id();
		
		// 결제내역 건수
		int payCount = bookService3.selectAllPayListCnt(me_id);
		int point = memberService.selectMePoint(me_id);
		Calendar calendar = Calendar.getInstance();
		Date curDate = calendar.getTime();
		int bookCount = bookService3.selectAllBookListCnt(me_id, curDate);
		System.out.println(user.getMe_point());
		model.addAttribute("point", point);
		model.addAttribute("bookCount", bookCount);
		model.addAttribute("payCount", payCount);
		model.addAttribute("title", "마이페이지");
		model.addAttribute("subject", "마이페이지");
		return "/member/mypage";
	}

	// 회원탈퇴 화면
	@GetMapping("/member/deleteMember")
	public String deleteMemberView(Model model) {
		model.addAttribute("title", "회원탈퇴");
		model.addAttribute("subject", "회원탈퇴");
		return "/member/deleteMember";
	}

	// 회원탈퇴 완료
	@PostMapping("/member/deleteMember")
	public String deleteMember(Model model, String memberPw, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = memberService.deleteMember(user, memberPw);

		if (res) {
			session.removeAttribute("user");
			model.addAttribute("msg", "회원탈퇴에 성공하였습니다.");
			model.addAttribute("url", "");
		} else {
			model.addAttribute("msg", "회원탈퇴에 실패하였습니다.");
			model.addAttribute("url", "member/deleteMember");
		}
		return "/main/message";
	}

	// 비밀번호 확인 화면
	@GetMapping("/member/checkPw")
	public boolean checkPw(String me_pw, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		return memberService.checkPw(user, me_pw);
	}

	// 비밀번호 확인 완료
	@ResponseBody
	@PostMapping("/member/checkPw")
	public boolean checkPwPost(@RequestParam String memberPw, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		return memberService.checkPw(user, memberPw);
	}

	// 비밀번호 변경화면
	@GetMapping("/member/updatePassword")
	public String updatePassword(Model model) {
		model.addAttribute("title", "비밀번호 변경");
		model.addAttribute("subject", "비밀번호 변경");
		return "/member/updatePassword";
	}

	// 비밀번호 변경
	@PostMapping("/member/updatePassword")
	public String updatePassword(Model model, String memberPw, String memberPw1, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = memberService.updatePassword(user, memberPw, memberPw1);

		if (res) {
			session.removeAttribute("user");
			model.addAttribute("msg", "비밀번호 변경에 성공하였습니다.");
			model.addAttribute("url", "");
		} else {
			model.addAttribute("msg", "비밀번호 변경에 실패하였습니다.");
			model.addAttribute("url", "member/updatePassword");
		}
		return "/main/message";
	}

	// 휴대폰번호 변경
	@GetMapping("/member/updatePhone")
	public String updatePhone(Model model) {
		model.addAttribute("title", "휴대폰번호 변경");
		model.addAttribute("subject", "휴대폰번호 변경");
		return "/member/updatePhone";
	}

	// 휴대폰번호 변경
	@PostMapping("/member/updatePhone")
	public String updatePhone(Model model, String memberPw, String memberPh, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = memberService.updatePhone(user, memberPw, memberPh);

		if (res) {
			user.setMemberPh(memberPh);
			;
			model.addAttribute("msg", "휴대폰번호 변경에 성공하였습니다.");
			model.addAttribute("url", "");
		} else {
			model.addAttribute("msg", "휴대폰번호 변경에 실패하였습니다.");
			model.addAttribute("url", "member/updatePhone");
		}
		return "/main/message";
	}

	// 마일리지 화면
	@GetMapping("/member/pointView")
	public String pointView(Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		user.setMe_point(memberService.selectMePoint(user.getMe_id()));
		model.addAttribute("me_point", user.getMe_point());
		model.addAttribute("title", "마일리지");
		model.addAttribute("subject", "마일리지");
		return "/member/pointView";
	}

	@ResponseBody
	@PostMapping("/member/point")
	public Map<String, Object> point(Model model, HttpSession session, @RequestBody Map<String, Object> requestData,
			Criteria cri) {
		Map<String, Object> map = new HashMap();

		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user == null) {
			map.put("result", false);
			return map;
		}
		user.setMe_point(memberService.selectMePoint(user.getMe_id()));

		int pointStatus = Integer.parseInt((String) requestData.get("pointStatus"));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date startDate = null;
		Date endDate = null;

		try {
			if (requestData.get("startDate") != null && !requestData.get("startDate").equals("")) {
				startDate = dateFormat.parse((String) requestData.get("startDate"));
			} else {
				startDate = null;
			}
			if (requestData.get("endDate") != null && !requestData.get("endDate").equals("")) {
				endDate = dateFormat.parse((String) requestData.get("endDate"));
				// endDate에 1일을 더하기
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(endDate);
				calendar.add(Calendar.DAY_OF_MONTH, 1);
				endDate = calendar.getTime();
			} else {
				endDate = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (pointStatus == 0) {
			List<BookVO> bookList1 = bookService3.selectBookList(user.getMe_id(), 0, startDate, endDate, null, cri);
			List<BookVO> bookList2 = bookService3.selectBookList(user.getMe_id(), 1, startDate, endDate, null, cri);
			// 두 리스트를 합치기
			List<BookVO> combinedBookList = new ArrayList<>();
			combinedBookList.addAll(bookList1);
			combinedBookList.addAll(bookList2);
			map.put("bookList", combinedBookList);
		} else if (pointStatus == 1) {
			List<BookVO> bookList = bookService3.selectBookList(user.getMe_id(), 0, startDate, endDate, null, cri);
			map.put("bookList", bookList);
		} else if (pointStatus == 2) {
			List<BookVO> bookList = bookService3.selectBookList(user.getMe_id(), 0, startDate, endDate, null, cri);
			map.put("bookList", bookList);
		} else if (pointStatus == 3) {
			List<BookVO> bookList = bookService3.selectBookList(user.getMe_id(), 1, startDate, endDate, null, cri);
			map.put("bookList", bookList);
		}
		map.put("result", true);
		return map;
	}

	// 결제내역 화면
	@GetMapping("/member/paymentDetailView")
	public String paymentDetailView(Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "member/loginView");
			return "/main/message";
		}
		model.addAttribute("title", "결제내역");
		model.addAttribute("subject", "결제내역");
		return "/member/paymentDetail";
	}

	@ResponseBody
	@PostMapping("/member/paymentDetail")
	public Map<String, Object> paymentDetail(Model model, HttpSession session,
			@RequestBody Map<String, Object> requestData, Criteria cri) {

		Map<String, Object> map = new HashMap();
		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user == null) {
			map.put("result", false);
			return map;
		}

		int payStatus = Integer.parseInt((String) requestData.get("payStatus"));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date startDate = null;
		Date endDate = null;

		try {
			if (requestData.get("startDate") != null && !requestData.get("startDate").equals("")) {
				startDate = dateFormat.parse((String) requestData.get("startDate"));
			} else {
				startDate = null;
			}
			if (requestData.get("endDate") != null && !requestData.get("endDate").equals("")) {
				endDate = dateFormat.parse((String) requestData.get("endDate"));
				// endDate에 1일을 더하기
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(endDate);
				calendar.add(Calendar.DAY_OF_MONTH, 1);
				endDate = calendar.getTime();
			} else {
				endDate = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (payStatus == 0) {
			List<BookVO> bookList1 = bookService3.selectPayList(user.getMe_id(), 0, startDate, endDate);
			List<BookVO> bookList2 = bookService3.selectPayList(user.getMe_id(), 1, startDate, endDate);
			// 두 리스트를 합치기
			List<BookVO> combinedBookList = new ArrayList<>();
			combinedBookList.addAll(bookList1);
			combinedBookList.addAll(bookList2);
			map.put("bookList", combinedBookList);
		} else if (payStatus == 1) {
			List<BookVO> bookList1 = bookService3.selectPayList(user.getMe_id(), 0, startDate, endDate);
			map.put("bookList", bookList1);
		} else if (payStatus == 2) {
			List<BookVO> bookList2 = bookService3.selectPayList(user.getMe_id(), 1, startDate, endDate);
			map.put("bookList", bookList2);
		}
		map.put("result", true);
		return map;
	}
}
