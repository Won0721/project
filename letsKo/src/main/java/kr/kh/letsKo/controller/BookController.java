package kr.kh.letsKo.controller;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.kh.letsKo.service.BookService;
import kr.kh.letsKo.service.DriveService;
import kr.kh.letsKo.service.InforScheduleService;
import kr.kh.letsKo.service.LineService;
import kr.kh.letsKo.service.TerminalService;
import kr.kh.letsKo.util.Message;
import kr.kh.letsKo.vo.DriveVO;
import kr.kh.letsKo.vo.TerminalVO;

@Controller
public class BookController {
	
	@Autowired
	BookService bookService;
	
	@Autowired
	DriveService driveService;
	
	@Autowired
	TerminalService terminalService;
	
	@Autowired 
	LineService lineService;
	
	@Autowired
	InforScheduleService inforScheduleService;
	
	// 결제정보 입력 화면페이지
	@GetMapping("/book/book")
	public String inputPaymentInfoView(Model model, String deprCd, String arvlCd, String bus_seatGrade, String book_date) {		
		
		String date = book_date.replaceAll("[^0-9]", "");	
		String setDate = date.substring(0, 4) + "-" + date.substring(4, 6) + "-" + date.substring(6);
		List<DriveVO> driveList = driveService.selectDrivePlan(deprCd , arvlCd, bus_seatGrade, setDate);
		int distance = 0;
		if(driveList.size() != 0) {
			DriveVO driveEx = driveList.get(0);
			model.addAttribute("driveEx", driveEx);
			distance = (int) driveEx.getLineVo().getLi_distance();
		}
		
		// 요금정보 
		int price =  (distance * 200);
		int priceBottom = (price / 1000) * 1000;
		int priceMid = (int) (priceBottom * 1.2);
		int priceHigh = (int) (priceBottom * 1.4);

		// DecimalFormat을 사용하여 요금 포맷팅
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
		String formattedBottom = decimalFormat.format(priceBottom);
		String formattedMid = decimalFormat.format(priceMid);
		String formattedHigh = decimalFormat.format(priceHigh);

		// 뒤에서 세번째에 위치에 " , " 삽입 
		int positionFromEnd = 3;

		// 기본값
		StringBuilder stringBottom = new StringBuilder(formattedBottom);
		if (stringBottom.length() >= positionFromEnd) {
		    stringBottom.insert(stringBottom.length() - positionFromEnd, ",");
		}

		// 우등값
		StringBuilder stringMid = new StringBuilder(formattedMid);
		if (stringMid.length() >= positionFromEnd) {
		    stringMid.insert(stringMid.length() - positionFromEnd, ",");
		}

		// 프리미엄값
		StringBuilder stringHigh = new StringBuilder(formattedHigh);
		if (stringHigh.length() >= positionFromEnd) {
		    stringHigh.insert(stringHigh.length() - positionFromEnd, ",");
		}

		model.addAttribute("book_date", book_date);
		model.addAttribute("distance", distance);
		model.addAttribute("bottom", stringBottom);
		model.addAttribute("mid", stringMid);
		model.addAttribute("high", stringHigh);

		model.addAttribute("driveList", driveList);
		model.addAttribute("te_depTerminalId", deprCd);
		model.addAttribute("te_arrTerminalId", arvlCd);
		model.addAttribute("title", "고속버스 예매");
		model.addAttribute("subject", "고속버스 예매");
		model.addAttribute("subtitle", "payment");
		model.addAttribute("subtitle_num", "1");
		return "/book/book";
}
	@GetMapping("/book/bookSearch")
	public String bookSearch(Model model) {
		LocalDate currentDate = LocalDate.now();  // 현재 날짜로 초기화

        
		List<DriveVO> schedule = inforScheduleService.getScheduleByDate(currentDate);
		
		model.addAttribute("schedule", schedule);
		model.addAttribute("title", "고속버스 예매");
		model.addAttribute("subject", "고속버스 예매");
		model.addAttribute("subtitle", "payment");
		model.addAttribute("subtitle_num", "1");
		
		return "/book/bookSearch"; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/book/ajax", method = { RequestMethod.GET})
	public List<TerminalVO> bookajax(Model model, @RequestParam("city_num") String city_num , @RequestParam("DepText") String DepText) {
		model.addAttribute("title", "고속버스 예매"); 
		model.addAttribute("subject", "고속버스 예매"); 
		model.addAttribute("subtitle", "payment"); 
		model.addAttribute("subtitle_num", "1"); 
		System.out.println("출발"+DepText);
		List<TerminalVO> list = terminalService.selectTerminalByCiNum(city_num, DepText);
		

		return list; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/book/fetchData", method = { RequestMethod.GET})
	public List<TerminalVO> bookfetchData(Model model, @RequestParam("DepText") String DepText) {
		model.addAttribute("title", "고속버스 예매"); 
		model.addAttribute("subject", "고속버스 예매"); 
		model.addAttribute("subtitle", "payment"); 
		model.addAttribute("subtitle_num", "1"); 
		List<TerminalVO> list = terminalService.getArrTerminal(DepText);
		
		
		return list; 
	}
	
}