package kr.kh.letsKo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TerminalOperatorController {
	
	// 협회장 인사말
	@GetMapping("/terminalOperator/presidentsMessage")
	public String presidentsMessage(Model model) {
		model.addAttribute("title", "협회장 인사말");
		model.addAttribute("subject", "협회장 인사말"); 
		return "/terminalOperator/presidentsMessage";
	}
	
	// 연혁
	@GetMapping("/terminalOperator/corporateHistory")
	public String corporateHistory(Model model) {
		model.addAttribute("title", "연혁");
		model.addAttribute("subject", "연혁"); 
		return "/terminalOperator/corporateHistory";
	}
	
	// 설립목적 및 사업
	@GetMapping("/terminalOperator/purposeNservices")
	public String purposeNservices(Model model) {
		model.addAttribute("title", "설립목적 및 사업");
		model.addAttribute("subject", "설립목적 및 사업"); 
		return "/terminalOperator/purposeNservices";
	}
	
	// 조직도
	@GetMapping("/terminalOperator/organizationChart")
	public String organizationChart(Model model) {
		model.addAttribute("title", "조직도");
		model.addAttribute("subject", "조직도"); 
		return "/terminalOperator/organizationChart";
	}
	
	// 찾아오시는 길
	@GetMapping("/terminalOperator/directions")
	public String directions(Model model) {
		model.addAttribute("title", "찾아오시는 길");
		model.addAttribute("subject", "찾아오시는 길"); 
		return "/terminalOperator/directions";
	}
	
}
