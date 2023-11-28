package kr.kh.letsKo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.letsKo.service.CompanyService;
import kr.kh.letsKo.util.Message;
import kr.kh.letsKo.vo.CompanyVO;
import kr.kh.letsKo.vo.MemberVO;

@Controller
public class CompanyController {
	
	@Autowired
	CompanyService companyService;
	
	// 고속사 조회 화면으로 가기
	@GetMapping("/company/companyList")
	public String companyList(Model model, HttpSession session) {
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
		
		List<CompanyVO> companyList = companyService.getCompanyList();
		model.addAttribute("companyList", companyList);
		model.addAttribute("title", "고속사 조회");
		model.addAttribute("subject", "고속사 조회"); 

		return "/company/companyList";
	}
		
	// 고속사 등록화면
	@GetMapping("/company/companyInsert")
	public String companyPostPage(Model model, HttpSession session) {
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
		
		model.addAttribute("title", "고속사 등록");
		model.addAttribute("subject", "고속사 등록"); 
		return "/company/companyInsert";
	}
		
	// 고속사 등록하기		
	@PostMapping("/company/companyInsert")
	public String insertBusPost(Model model, CompanyVO companyVo , MultipartFile[] file2) {
		Message msg;
		List<CompanyVO> companyList = companyService.getCompanyList();
		
		// 중복이름 체크
		for(CompanyVO com : companyList) {
			if(companyVo.getCo_name().equals(com.getCo_name())) {
				msg = new Message("/company/companyList", "등록된 고속사 입니다.");
				model.addAttribute("msg", msg);
				return "message";
			}
		}	

		if(companyService.insertCompany(companyVo,file2)) {
			msg = new Message("/company/companyList", "고속사 등록 완료.");
		}else {
			msg = new Message("/company/companyInsert", "고속사를 등록 실패.");	
		}
		
		model.addAttribute("msg", msg);
		return "message";
	}
		
	// 고속사 수정 화면페이지
	@GetMapping("/company/companyUpdate")
	public String updateCompany(Model model, Integer co_num, HttpSession session) {
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
		
		CompanyVO company = companyService.selectCompany(co_num);
		
		model.addAttribute("company", company);
		model.addAttribute("title", "고속사 수정");
		model.addAttribute("subject", "고속사 수정"); 
		return "/company/companyUpdate";
	}
	
	// 고속사 수정 완료
	@PostMapping("/company/companyUpdate")
	public String companyUpdatePost(Model model,String old_co_name,CompanyVO companyVo, MultipartFile[] file2) {
		Message msg;
		
		for (MultipartFile file : file2) {
			if (file == null || file.getOriginalFilename().length() == 0) {
				
				companyService.updateCompanyName(companyVo);
				msg = new Message("/company/companyList", "정상적으로 수정 되었습니다.");
				model.addAttribute("msg", msg);
				return "message";
			}
		}
		
		if(old_co_name.equals(companyVo.getCo_name())) {
			msg = new Message("/company/companyList", "정상적으로 수정 되었습니다.");
			model.addAttribute("msg", msg);
			companyService.updateCompany(companyVo, file2);
			return "message";
		}
		
		// 고속사 빈칸 체크
		if (companyVo.getCo_name().equals("") || companyVo.getCo_name() == null) {
			msg = new Message("/company/companyList", "고속사 입력 필요.");
			model.addAttribute("msg", msg);
			return "message";
		}
		
		// 중복이름 체크
		List<CompanyVO> companyList = companyService.getCompanyList();
		for (CompanyVO com : companyList) {
			if (companyVo.getCo_name().equals(com.getCo_name())) {
				msg = new Message("/company/companyList", "등록된 고속사 입니다.");
				model.addAttribute("msg", msg);
				return "message";
			}
		}
		
		// 수정완
		if (companyService.updateCompany(companyVo, file2)) {
			msg = new Message("/company/companyList", "정상적으로 수정 되었습니다.");
		} else {
			msg = new Message("/company/companyList", "수정 오류");
		}
		
		model.addAttribute("msg", msg);
		return "message";
	}
	
	// 고속사 삭제
	@GetMapping("/company/companyDelete")
	public String companyDelete(Model model, Integer co_num, HttpSession session) {
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
		
		Message msg;
		
		if(companyService.deleteCompany(co_num)) {
			msg = new Message("/company/companyList", "정상적으로 삭제 되었습니다.");
			
		}else {
			msg = new Message("/company/companyList", "오류 발생");
		
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
	@ResponseBody
	@PostMapping("/company/check/name")
	public Object checkName(@RequestParam("co_name")String co_name){
		
		return companyService.checkName(co_name);
	}
}