package kr.kh.letsKo.controller;

import java.time.LocalDate;
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

import kr.kh.letsKo.dao.LineDAO;
import kr.kh.letsKo.service.BusService;
import kr.kh.letsKo.service.DriveService;
import kr.kh.letsKo.util.Message;
import kr.kh.letsKo.vo.BusVO;
import kr.kh.letsKo.vo.DriveVO;
import kr.kh.letsKo.vo.LineVO;
import kr.kh.letsKo.vo.MemberVO;
@Controller
public class DriveController {
	
	@Autowired
	DriveService driveService;

	@Autowired
	LineDAO lineDao;

	@Autowired
	BusService busService;

	
	@GetMapping("/drive/list")
    public String driveListPage(Model model, HttpSession session) {
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
		
        List<DriveVO> driveList = driveService.getDriveList();
        model.addAttribute("driveList", driveList);
        model.addAttribute("title", "운행 일정 조회"); 
		model.addAttribute("subject", "운행 일정 조회"); 
        return "/drive/list";
    }
	
	@GetMapping("/drive/insert")
	public String driveInsertPage(Model model, HttpSession session) {
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
		
	    List<LineVO> lineList = driveService.getLineList();
	    List<BusVO> busList = busService.getAllBusList();

	    // 각 버스의 회사 이름을 가져오기
	    for (BusVO bus : busList) {
	        String companyName = busService.getCompanyNameByCoNum(bus.getBus_co_num());
	        bus.setCo_name(companyName);
	    }

	    model.addAttribute("lineList", lineList);
	    model.addAttribute("busList", busList);
	    model.addAttribute("driveVo", new DriveVO(lineDao));
	    model.addAttribute("title", "운행 일정 등록"); 
	  	model.addAttribute("subject", "운행 일정 등록"); 
	    return "/drive/insert";
	}

	@PostMapping("/drive/insert")
	public String driveInsert(
	    Model model,
	    @RequestParam("dr_li_num") int num,
	    @RequestParam("dr_depPlandDate") String depPlandDate,
	    @RequestParam("dr_depPlandTime") String depPlandTime,
	    @RequestParam("dr_bus_num") int busNum,
	    @RequestParam("hiddenDrDepPlandTimeHour") int hour,
	    @RequestParam("hiddenDrDepPlandTimeMinute") int minute
	) {
	    Message msg;

	    DriveVO driveVo = new DriveVO(lineDao);
	    driveVo.setDr_li_num(num);
	    driveVo.setDr_depPlandDate(LocalDate.parse(depPlandDate));
	    driveVo.setDr_depPlandTime(LocalTime.of(hour, minute));
	    driveVo.setDr_bus_num(busNum);

	    // 예매 가능 좌석 수 설정
	    BusVO bus = busService.getBusByNum(busNum);
	    if (bus != null) {
	        driveVo.setDr_reservationAvailable(bus.getBus_totalSeat());
	    } else {
	        
	    }

	    if (driveService.insertDrive(driveVo)) {
	        msg = new Message("/drive/list", "운행 등록 완료.");
	    } else {
	        msg = new Message("/drive/insert", "운행 등록 실패.");
	    }
	    model.addAttribute("msg", msg);
	    return "message";
	}


    @GetMapping("/drive/edit/{dr_num}")
    public String editDrive(@PathVariable("dr_num") int dr_num, Model model, HttpSession session) {
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
		
        DriveVO drive = driveService.getDriveByNum(dr_num);
        List<LineVO> lineList = driveService.getLineList();
        List<BusVO> busList = driveService.getBusList();
        // 각 버스의 회사 이름을 가져오기
	    for (BusVO bus : busList) {
	        String companyName = busService.getCompanyNameByCoNum(bus.getBus_co_num());
	        bus.setCo_name(companyName);
	    }
        model.addAttribute("drive", drive);
        model.addAttribute("lineList", lineList);
        model.addAttribute("busList", busList);
        model.addAttribute("title", "운행 일정 수정"); 
		model.addAttribute("subject", "운행 일정 수정"); 
        return "/drive/update";
    }

    @PostMapping("/drive/update")
    public String driveUpdate(
        Model model,
        @RequestParam("dr_num") int dr_num,
        @RequestParam("dr_li_num") int liNum,
        @RequestParam("dr_depPlandDate") String depPlandDate,
        @RequestParam("dr_depPlandTime") String depPlandTime,
        @RequestParam("dr_bus_num") int busNum,
        @RequestParam("hiddenDrDepPlandTimeHour") int hour,
        @RequestParam("hiddenDrDepPlandTimeMinute") int minute
    ) {
        Message msg;
        
   
        DriveVO driveVo = new DriveVO(lineDao);
        driveVo.setDr_num(dr_num);
        driveVo.setDr_li_num(liNum);
        driveVo.setDr_depPlandDate(LocalDate.parse(depPlandDate));
        driveVo.setDr_depPlandTime(LocalTime.of(hour, minute));
        driveVo.setDr_bus_num(busNum);

        if (driveService.updateDrive(driveVo)) {
            
            msg = new Message("/drive/list", "운행 수정 완료.");
        } else {
            msg = new Message("/drive/edit?dr_num=" + dr_num, "운행 수정 실패.");
        }

        model.addAttribute("msg", msg);
        return "message";
    }

    @GetMapping("/drive/delete")
    public String deleteDriveByNum(Model model, @RequestParam("dr_num") int dr_num, HttpSession session) {
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
		
    	boolean result = driveService.deleteDriveByNum(dr_num);

        Message msg;

        if (result) {
            msg = new Message("/drive/list", "운행 삭제 완료.");
        } else {
            msg = new Message("/drive/list", "운행 삭제 실패.");
        }

        model.addAttribute("msg", msg);
        return "message";
    }

}
