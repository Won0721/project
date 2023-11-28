package kr.kh.letsKo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.letsKo.service.BookService3;
import kr.kh.letsKo.service.DriveService;
import kr.kh.letsKo.vo.BusVO;
import kr.kh.letsKo.vo.DriveVO;
import kr.kh.letsKo.vo.MemberVO;
import kr.kh.letsKo.vo.SeatVO;

@Controller
public class BookController3 {
	
	
	@Autowired
	DriveService driveService;
	
	@Autowired
	BookService3 bookService3;
	
	
	// 고속버스예매 매수 및 좌석선택 
	@GetMapping("/book3/selectSeats")
	public String selectSeatsView(Model model, Integer dr_num, HttpSession session) { 
		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "member/loginView");
			return "/main/message";
		}
		DriveVO drive = driveService.getDriveByNum(dr_num);
		BusVO bus = drive.getBusVo();
		int distance = (int) drive.getLineVo().getLi_distance();
		String grade = drive.getBusVo().getBus_seatGrade();
		
		int setPrice = distance * 200;
		int priceBot = (setPrice / 1000) * 1000;
		int price = 0;
		if(grade.equals("일반")) {
			price = priceBot;
		}else if(grade.equals("우등")) {
			price = (int) (priceBot * 1.2);
		}else {
			price = (int) (priceBot * 1.4);
		}
		// bus_num으로 예약된 좌석이 있는지 조회
		int bus_num = bus.getBus_num();
		List<SeatVO> seatList = bookService3.selectedSeatCheck(bus_num);
		
		StringBuffer seatBuffer = new StringBuffer();
		int chkSize = seatList.size(); 
		int i = 0;
		for(SeatVO seat : seatList) {
			i++;
			String num = Integer.toString(seat.getSe_selectedSeatNum());
			seatBuffer.append(num);
			if(i<chkSize){
				seatBuffer.append(",");
			}
		}
		String seatArray = seatBuffer.toString(); 
		model.addAttribute("price", price);
		model.addAttribute("drive", drive);
		model.addAttribute("seatArray", seatArray);
		model.addAttribute("title", "고속버스 예매"); 
		model.addAttribute("subject", "고속버스 예매"); 
		model.addAttribute("subtitle", "payment"); 
		model.addAttribute("subtitle_num", "1"); 
		return "/book3/selectSeats";
	}
	
}