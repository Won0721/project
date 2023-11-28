package kr.kh.letsKo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BusAssociationController {
	
	
	// 이사장 인사말 
	@GetMapping("/busAssociation/chairmansMsg")
	public String boardList(Model model) { 
		model.addAttribute("title", "이사장 인사말"); 
		model.addAttribute("subject", "이사장 인사말"); 
		return "/busAssociation/chairmansMsg";
	}
	
	// 연혁 
	@GetMapping("/busAssociation/history")
	public String history(Model model) { 
		model.addAttribute("title", "연혁"); 
		model.addAttribute("subject", "연혁"); 
		return "/busAssociation/history";
	}
	
	// 설립목적 및 사업 
	@GetMapping("/busAssociation/purposeNservices")
	public String purposeNservices(Model model) { 
		model.addAttribute("title", "설립목적 및 사업"); 
		model.addAttribute("subject", "설립목적 및 사업"); 
		return "/busAssociation/purposeNservices";
	}
	
	// 조직도 
	@GetMapping("/busAssociation/organizationChart")
	public String organizationChart(Model model) { 
		model.addAttribute("title", "조직도"); 
		model.addAttribute("subject", "조직도"); 
		return "/busAssociation/organizationChart";
	}
	
	// 회원사 현황
	@GetMapping("/busAssociation/membershipStatus")
	public String membershipStatus(Model model) { 
		model.addAttribute("title", "회원사 현황"); 
		model.addAttribute("subject", "회원사 현황"); 
		return "/busAssociation/membershipStatus";
	}
	
	// 찾아오시는 길
	@GetMapping("/busAssociation/directions")
	public String directions(Model model) { 
		model.addAttribute("title", "찾아오시는 길"); 
		model.addAttribute("subject", "찾아오시는 길"); 
		return "/busAssociation/directions";
	}
}
