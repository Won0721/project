package kr.kh.letsKo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.letsKo.pagination.Criteria;
import kr.kh.letsKo.pagination.PageMaker;
import kr.kh.letsKo.service.TerminalService;
import kr.kh.letsKo.util.Message;
import kr.kh.letsKo.vo.CityVO;
import kr.kh.letsKo.vo.MemberVO;
import kr.kh.letsKo.vo.TerminalVO;


@Controller
public class TerminalController {

    @Autowired
    TerminalService terminalService;  
    
    // 터미널 리스트 조회
    @GetMapping("/terminal/list")
    public String terminalList(Model model, Criteria cri, HttpSession session) {
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
    	
    	List<TerminalVO> terminalList = terminalService.getAllTerminalList(cri);
    	int totalCount = terminalService.selectCountTerminalList(cri);
    	
    	final int DISPLAY_PAGE_NUM = 3;
		PageMaker pm = new PageMaker(DISPLAY_PAGE_NUM, cri, totalCount);
    	
    	model.addAttribute("terminalList", terminalList);
    	model.addAttribute("pm", pm);
    	model.addAttribute("title", "터미널 등록");
		model.addAttribute("subject", "터미널 등록"); 
        return "/terminal/list";
    }

    // 터미널 등록 페이지로 이동
    @GetMapping("/terminal/insert")
    public String terminalInsertPage(Model model, HttpSession session) {
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
		
    	List<CityVO> cityList = terminalService.getCityList();
    	
    	model.addAttribute("cityList",cityList);
    	model.addAttribute("title", "터미널 등록");
		model.addAttribute("subject", "터미널 등록"); 
    	return "/terminal/insert";
    }
    
    // 터미널 등록 
    @PostMapping("/terminal/insert")
    public String terminalInsert(Model model, TerminalVO terminalVo) {
        Message msg;

        if(terminalService.isDuplicateEntry(terminalVo)) {
            msg = new Message("/terminal/list", "이미 등록된 터미널입니다.");
        } else if(terminalService.insertTerminal(terminalVo)) {
            msg = new Message("/terminal/list", "터미널 등록 완료.");
        } else {
            msg = new Message("/terminal/list", "터미널 등록 실패.");
        }

        model.addAttribute("msg", msg);
        return "message";
    }

    
    // 터미널 삭제
    @GetMapping("/terminal/delete")
    public String deleteTerminalByCode(Model model, String te_code, HttpSession session) {
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
    	
    	if(terminalService.deleteTerminal(te_code)) {
			msg = new Message("/terminal/list", "삭제 완료.");
			
		}else{
			msg = new Message("/terminal/list", "삭제 실패.");
		}
    	model.addAttribute("msg", msg);
        return "message";
    }
  
    // 터미널 수정페이지로 이동
    @GetMapping("/terminal/edit")
    public String editTerminal(Model model, String te_code, Integer te_ci_num, HttpSession session) {
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
    	
    	TerminalVO terminal = terminalService.selectTerminalByCode(te_code);
    	List<CityVO> cityList = terminalService.getCityList();
    	model.addAttribute("terminal", terminal);
    	model.addAttribute("cityList", cityList);
		model.addAttribute("title", "터미널 수정");
		model.addAttribute("subject", "터미널 수정"); 
        return "/terminal/update";
    }

    // 터미널 수정
    @PostMapping("/terminal/edit")
    public String updateTerminal(Model model, String te_code, String te_newcode, Integer te_ci_num, Integer te_ci_newNum) {
        Message msg;
        
        // 중복 체크
        if (terminalService.isDuplicateEntry(te_newcode)) {
            msg = new Message("/terminal/list", "등록되어 있는 터미널명.");
            model.addAttribute("msg", msg);
            return "message";
        }

        // 수정
        if (terminalService.updateTerminal(te_code, te_newcode, te_ci_num, te_ci_newNum)) {
            msg = new Message("/terminal/list", "수정완료.");
            model.addAttribute("msg", msg);
            return "message";
        }

        return "message";
    }
    
    @ResponseBody
	@RequestMapping(value = "/terminal/ajax", method = {RequestMethod.GET})
	public List<TerminalVO> bookajax(Model model, @RequestParam("city_num") String city_num) {

		List<TerminalVO> list = terminalService.selectTerminalAjax(city_num);	

		return list; 
	}
}