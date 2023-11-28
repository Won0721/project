package kr.kh.letsKo.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class CustomerCenterController {
	
	//자주하는 질문화면
	@GetMapping("/customerCenter/question")
	public String question(Model model) {
		
		model.addAttribute("title", "자주하는 질문");
		model.addAttribute("subject", "자주하는 질문");
		return "/customerCenter/question";
	}
	
	// 유실물센터
	@GetMapping("/customerCenter/lostNfound")
	public String lostNfound(Model model) {
		model.addAttribute("title", "유실물센터 안내");
		model.addAttribute("subject", "유실물센터 안내"); 
		return "/customerCenter/lostNfound";
	}
	
	// 유실물센터 금호고속 
	@GetMapping("/customerCenter/lostNfoundKumho")
	public String lostNfoundKumho(Model model) {
		model.addAttribute("title", "유실물센터 안내");
		model.addAttribute("subject", "유실물센터 안내"); 
		return "/customerCenter/lostNfoundKumho";
	}
	
	// 유실물센터 동부고속 
	@GetMapping("/customerCenter/lostNfoundDongbu")
	public String lostNfoundDongbu(Model model) {
		model.addAttribute("title", "유실물센터 안내");
		model.addAttribute("subject", "유실물센터 안내"); 
		return "/customerCenter/lostNfoundDongbu";
	}
	
	// 유실물센터 동양고속
	@GetMapping("/customerCenter/lostNfoundDongYang")
	public String lostNfoundDongYang(Model model) {
		model.addAttribute("title", "유실물센터 안내");
		model.addAttribute("subject", "유실물센터 안내"); 
		return "/customerCenter/lostNfoundDongYang";
	}
	
	// 유실물센터 중앙고속
	@GetMapping("/customerCenter/lostNfoundJungAng")
	public String lostNfoundJungAng(Model model) {
		model.addAttribute("title", "유실물센터 안내");
		model.addAttribute("subject", "유실물센터 안내"); 
		return "/customerCenter/lostNfoundJungAng";
	}
	
	// 유실물센터 천일고속
	@GetMapping("/customerCenter/lostNfoundChuNil")
	public String lostNfoundChuNil(Model model) {
		model.addAttribute("title", "유실물센터 안내");
		model.addAttribute("subject", "유실물센터 안내"); 
		return "/customerCenter/lostNfoundChuNil";
	}
	
	// 유실물센터 삼화고속
	@GetMapping("/customerCenter/lostNfoundSamHwa")
	public String lostNfoundSamHwa(Model model) {
		model.addAttribute("title", "유실물센터 안내");
		model.addAttribute("subject", "유실물센터 안내"); 
		return "/customerCenter/lostNfoundSamHwa";
	}
	
	// 유실물센터 한일고속
	@GetMapping("/customerCenter/lostNfoundHanIl")
	public String lostNfoundHanIl(Model model) {
		model.addAttribute("title", "유실물센터 안내");
		model.addAttribute("subject", "유실물센터 안내"); 
		return "/customerCenter/lostNfoundHanIl";
	}
	
	// 유실물센터 속리산고속
	@GetMapping("/customerCenter/lostNfoundSoglisan")
	public String lostNfoundSoglisan(Model model) {
		model.addAttribute("title", "유실물센터 안내");
		model.addAttribute("subject", "유실물센터 안내"); 
		return "/customerCenter/lostNfoundSoglisan";
	}
	
}