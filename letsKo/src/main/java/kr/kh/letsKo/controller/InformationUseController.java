package kr.kh.letsKo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InformationUseController {
	
	
	// 예매 안내
	@GetMapping("/informationUse/reservationInfo")
	public String reservationInfo(Model model) {
		model.addAttribute("title", "예매 안내");
		model.addAttribute("subject", "예매 안내"); 
		return "/informationUse/reservationInfo";
	}
	
	// 결제수단 안내
	@GetMapping("/informationUse/paymentMethodInfo")
	public String paymentMethodInfo(Model model) {
		model.addAttribute("title", "결제수단 안내");
		model.addAttribute("subject", "결제수단 안내"); 
		return "/informationUse/paymentMethodInfo";
	}
	
	// 승차권 환불안내
	@GetMapping("/informationUse/ticketRefundInfo")
	public String ticketRefundInfo(Model model) {
		model.addAttribute("title", "승차권 환불안내");
		model.addAttribute("subject", "승차권 환불안내"); 
		return "/informationUse/ticketRefundInfo";
	}
	
	// 마일리지 안내
	@GetMapping("/informationUse/mileageInfo")
	public String mileageInfo(Model model) {
		model.addAttribute("title", "마일리지 안내");
		model.addAttribute("subject", "마일리지 안내"); 
		return "/informationUse/mileageInfo";
	}
	
	// 국민안전 승무원제 안내
	@GetMapping("/informationUse/crewInfo")
	public String crewInfo(Model model) {
		model.addAttribute("title", "국민안전 승무원제 안내");
		model.addAttribute("subject", "국민안전 승무원제 안내"); 
		return "/informationUse/crewInfo";
	}
	
	// 고속버스 터미널 안내
	@GetMapping("/informationUse/terminalInfo")
	public String terminalInfo(Model model) {
		model.addAttribute("title", "고속버스 터미널 안내");
		model.addAttribute("subject", "고속버스 터미널 안내"); 
		return "/informationUse/terminalInfo";
	}
	
	// 고속버스 운송회사 안내
	@GetMapping("/informationUse/transportCompanyInfo")
	public String transportCompanyInfo(Model model) {
		model.addAttribute("title", "고속버스 운송회사 안내");
		model.addAttribute("subject", "고속버스 운송회사 안내"); 
		return "/informationUse/transportCompanyInfo";
	}
}
