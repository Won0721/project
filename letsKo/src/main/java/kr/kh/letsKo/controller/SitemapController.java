package kr.kh.letsKo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.letsKo.vo.MemberVO;

@Controller
public class SitemapController {
	
	// 사이트맵
	@GetMapping("/sitemap/sitemap")
	public String sitemap(Model model, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		model.addAttribute("user", user);
		model.addAttribute("title", "사이트맵");
		model.addAttribute("subject", "사이트맵"); 
		return "/sitemap/sitemap";
	}
	
	// 서비스 이용약관
	@GetMapping("/sitemap/serviceAgreement")
	public String serviceAgreement(Model model) {
		model.addAttribute("title", "사이트맵");
		model.addAttribute("subject", "사이트맵"); 
		return "/sitemap/serviceAgreement";
	}
	
	// 개인정보 처리방침
	@GetMapping("/sitemap/privacyPolicy")
	public String privacyPolicy(Model model) {
		model.addAttribute("title", "사이트맵");
		model.addAttribute("subject", "사이트맵"); 
		return "/sitemap/privacyPolicy";
	}
	
	// 고속버스 운송약관
	@GetMapping("/sitemap/busAgreement")
	public String busAgreement(Model model) {
		model.addAttribute("title", "사이트맵");
		model.addAttribute("subject", "사이트맵"); 
		return "/sitemap/busAgreement";
	}
	
	// 전자금융거래 이용약관 
	@GetMapping("/sitemap/electronicFinancialTransaction")
	public String electronicFinancialTransaction(Model model) {
		model.addAttribute("title", "사이트맵");
		model.addAttribute("subject", "사이트맵"); 
		return "/sitemap/electronicFinancialTransaction";
	}
	
}
