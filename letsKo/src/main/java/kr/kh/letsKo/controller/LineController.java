package kr.kh.letsKo.controller;

import java.time.LocalTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.letsKo.service.LineService;
import kr.kh.letsKo.service.TerminalService;
import kr.kh.letsKo.util.Message;
import kr.kh.letsKo.vo.CityVO;
import kr.kh.letsKo.vo.LineVO;
import kr.kh.letsKo.vo.MemberVO;
import kr.kh.letsKo.vo.TerminalVO;


@Controller
public class LineController {
    
    @Autowired
    LineService lineService;  
    
    @Autowired
    TerminalService terminalService;
    
    @GetMapping("/line/terminals/{cityId}")
    @ResponseBody
    public List<TerminalVO> getTerminalsByCityId(@PathVariable int cityId) {
        return terminalService.getTerminalsByCityId(cityId);
    }

    // 노선 등록 페이지로 이동
    @GetMapping("/line/insert")
    public String lineInsertPage(Model model, HttpSession session) {
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
		
        List<TerminalVO> terminalList = terminalService.getTerminalList(); 
        List<CityVO> cityList = terminalService.getCityList();
    	
    	model.addAttribute("cityList",cityList);        
        model.addAttribute("terminalList", terminalList);
        model.addAttribute("title", "노선 등록");
        model.addAttribute("subject", "노선 등록");
        return "/line/insert";
    }

    // 노선 등록
    @PostMapping("/line/insert")
    public String lineInsert(
            Model model,
            @RequestParam("li_te_depTerminalId") String depTerminalId,
            @RequestParam("li_te_arrTerminalId") String arrTerminalId,
            @RequestParam("li_distance") double distance,
            @RequestParam("li_travelTime") String travelTime,
            @RequestParam("hiddenLiTravelTimeHour") int hour,
            @RequestParam("hiddenLiTravelTimeMinute") int minute,
            @RequestParam(name = "li_use", required = false) boolean use) {
        
        Message msg;

        // li_travelTime을 LocalTime으로 설정
        LocalTime localTravelTime = LocalTime.of(hour, minute);

       
        LineVO lineVo = new LineVO();
        lineVo.setLi_te_depTerminalId(depTerminalId);
        lineVo.setLi_te_arrTerminalId(arrTerminalId);
        lineVo.setLi_distance(distance);
        lineVo.setLi_travelTime(localTravelTime);
        lineVo.setLi_use(use);

        if (lineService.isDuplicateLine(lineVo)) { 
            msg = new Message("/line/insert", "이미 등록된 노선입니다.");
        } else {
            if (lineService.insertLine(lineVo)) {  
                msg = new Message("/line/list", "노선 등록 완료.");
            } else {
                msg = new Message("/line/insert", "노선 등록 실패.");
            }
        }

        model.addAttribute("msg", msg);
        return "message";
    }


    // 노선 목록 페이지로 이동
    @GetMapping("/line/list")
    public String lineListPage(Model model, HttpSession session) {
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
		
        List<LineVO> lineList = lineService.getLineList();  
        model.addAttribute("lineList", lineList);
        model.addAttribute("title", "노선 조회");
        model.addAttribute("subject", "노선 조회");
      
        return "/line/list";
    }

    // 노선 수정 페이지로 이동
    @GetMapping("/line/edit")
    public String editLine(@RequestParam("li_num") int li_num, Model model, HttpSession session) {
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
		
        LineVO line = lineService.getLineByNum(li_num);  
        List<TerminalVO> terminalList = terminalService.getTerminalList(); 
        model.addAttribute("line", line);
        model.addAttribute("terminalList", terminalList);
        model.addAttribute("title", "노선 수정");
        model.addAttribute("subject", "노선 수정");
        return "/line/update";
    }

    // 노선 수정
    @PostMapping("/line/update")
    public String updateLine(
            Model model,
            @RequestParam("li_num") int li_num,
            @RequestParam("li_te_depTerminalId") String depTerminalId,
            @RequestParam("li_te_arrTerminalId") String arrTerminalId,
            @RequestParam("li_distance") double distance,
            @RequestParam("li_travelTime") String travelTime,
            @RequestParam("hiddenLiTravelTimeHour") int hour,
            @RequestParam("hiddenLiTravelTimeMinute") int minute,
            @RequestParam(name = "li_use", required = false) boolean use) {

        Message msg;

        // li_travelTime을 LocalTime으로 설정
        LocalTime localTravelTime = LocalTime.of(hour, minute);

       
        LineVO lineVo = new LineVO();
        lineVo.setLi_num(li_num);
        lineVo.setLi_te_depTerminalId(depTerminalId);
        lineVo.setLi_te_arrTerminalId(arrTerminalId);
        lineVo.setLi_distance(distance);
        lineVo.setLi_travelTime(localTravelTime);
        lineVo.setLi_use(use);

        if (lineService.updateLine(lineVo)) {  
            msg = new Message("/line/list", "노선 수정 완료.");
        } else {
            msg = new Message("/line/edit?li_num=" + li_num, "이미 등록된 노선입니다.");
        }

        model.addAttribute("msg", msg);
        return "message";
    }


    // 노선 삭제
    @GetMapping("/line/delete")
    public String deleteLineByNum(@RequestParam("li_num") int li_num, Model model, HttpSession session) {
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
		
        boolean result = lineService.deleteLineByNum(li_num);  

        Message msg;
        if (result) {
            msg = new Message("/line/list", "노선 삭제 완료.");
        } else {
            msg = new Message("/line/list", "노선 삭제 실패.");
        }

        model.addAttribute("msg", msg);
        return "message";
    }
}
