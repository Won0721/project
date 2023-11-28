package kr.kh.letsKo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.pagination.PageMaker;
import kr.kh.letsKo.service.BusService;
import kr.kh.letsKo.service.CompanyService;
import kr.kh.letsKo.util.Message;
import kr.kh.letsKo.vo.BusVO;
import kr.kh.letsKo.vo.CompanyVO;
import kr.kh.letsKo.vo.MemberVO;

@Controller
public class BusController {
	@Autowired
	BusService busService;
		
	@Autowired
	CompanyService companyService;
	
	// 고속버스 조회 화면 
		@GetMapping("/bus/busList")
		public String busList(Model model, Criteria cri, HttpSession session) {
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
			
			List<BusVO> busList = busService.getBusList(cri);
			int totalCount = busService.selectCountBusList(cri);
			// 페이지네이션 페이지 수
			final int DISPLAY_PAGE_NUM = 3;
			PageMaker pm = new PageMaker(DISPLAY_PAGE_NUM, cri, totalCount);
			
			model.addAttribute("busList", busList);
			model.addAttribute("pm", pm);
			model.addAttribute("title", "고속버스 조회");
			model.addAttribute("subject", "고속버스 조회"); 
			
			return "/bus/busList";
		}
		
		// 고속버스 등록 화면페이지 
		@GetMapping("/bus/busInsert")
		public String busInsertPage(Model model, HttpSession session) {
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
			
			List<CompanyVO> companyList = companyService.getCompanyList();
			model.addAttribute("companyList", companyList);
			model.addAttribute("title", "고속버스 등록");
			model.addAttribute("subject", "고속버스 등록"); 
			return "/bus/busInsert";
		}
		
		// 고속버스 등록완료
		@PostMapping("/bus/busInsert")
		public String busInsert(Model model, BusVO busVo) {
			Message msg;
			
			List<BusVO> busList = busService.getAllBusList();
			
			if(busVo.getBus_seatGrade().equals("일반")) {
				busVo.setBus_totalSeat(41);
			}else if(busVo.getBus_seatGrade().equals("우등")) {
				busVo.setBus_totalSeat(28);
			}else {
				busVo.setBus_totalSeat(21);
			}
			for (BusVO bus : busList) {
				if(bus.getBus_carNumber().equals(busVo.getBus_carNumber())) {
					msg = new Message("/bus/busList", "이미 등록된 차량번호 입니다.");
					model.addAttribute("msg", msg);
					return "message";
				}
			}
			if(busService.insertBus(busVo)) {
				msg = new Message("/bus/busList", "버스를 등록 완료.");
			}else{
				msg = new Message("/bus/busInsert", "버스를 등록 실패.");
			}
			model.addAttribute("msg", msg);
			return "message";
		}
		
		// 고속버스 수정 화면페이지
		@GetMapping("/bus/busUpdate")
		public String busUpdate(Model model, Integer bus_num, HttpSession session) {
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
			
			BusVO bus = busService.selectBus(bus_num);
			List<CompanyVO> companyList = companyService.getCompanyList();
			
			model.addAttribute("bus", bus);
			model.addAttribute("companyList", companyList);
			model.addAttribute("title", "고속버스 수정");
			model.addAttribute("subject", "고속버스 수정"); 
			return "/bus/busUpdate";
		}
		
		// 고속버스 수정 완료
		@PostMapping("/bus/busUpdate")
		public String busUpdatePost(Model model, BusVO busVo, String bus_oldCarNumber) {
			Message msg;
			
			if(bus_oldCarNumber.equals(busVo.getBus_carNumber())) {
				busService.updateBus(busVo);
				msg = new Message("/bus/busList", "정상적으로 수정 되었습니다.");
				model.addAttribute("msg", msg);
				return "message";
			}
			
			List<BusVO> busList = busService.getAllBusList();
			for (BusVO bus : busList) {
				
				if(bus.getBus_carNumber().equals(busVo.getBus_carNumber())) {
					msg = new Message("/bus/busList", "이미 등록된 차량번호 입니다.");
					model.addAttribute("msg", msg);
					return "message";
				}
			}
			if(busService.updateBus(busVo)){
				msg = new Message("/bus/busList", "정상적으로 수정 되었습니다.");
			}else {
				msg = new Message("/bus/busList", "수정 오류");
			}

					
			model.addAttribute("msg", msg);
			return "message";
		}
		// 고속버스 삭제
		@GetMapping("/bus/busDelete")
		public String busDelete(Model model, Integer bus_num, HttpSession session) {
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
			
			Message msg;
			if (busService.deleteBus(bus_num)) {
				msg = new Message("/bus/busList", "정상적으로 삭제 되었습니다.");

			} else {
				msg = new Message("/bus/busList", "오류 발생");
			}
			model.addAttribute("msg", msg);
			return "message";
		}
		
		@ResponseBody
		@PostMapping("/bus/check/name")
		public Object ajaxTest3(@RequestParam("bus_carNumber")String bus_carNumber){
			
			return busService.checkName(bus_carNumber);
		}
}