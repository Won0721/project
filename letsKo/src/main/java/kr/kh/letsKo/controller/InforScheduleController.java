package kr.kh.letsKo.controller;

import java.time.LocalDate;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.letsKo.service.InforScheduleService;
import kr.kh.letsKo.vo.DriveVO;

@Controller
public class InforScheduleController {
	
	@Autowired
	InforScheduleService inforScheduleService;
	
	@GetMapping("/inforSchedule/timeList")
	public String inforSchedule(Model model) {
		LocalDate currentDate = LocalDate.now();  // 현재 날짜로 초기화

        
        List<DriveVO> schedule = inforScheduleService.getScheduleByDate(currentDate);
		model.addAttribute("title", "시간표 조회");
		model.addAttribute("subject", "시간표 조회"); 
		model.addAttribute("schedule", schedule);
		return "/inforSchedule/timeList";
	}

}
