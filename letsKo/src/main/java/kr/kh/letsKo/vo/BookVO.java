package kr.kh.letsKo.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class BookVO {
	private int bk_num;						// 예매코드
	private int bk_dr_num;  				// 운행일정 코드
	private String bk_me_id; 				// 회원 아이디
	private Date bk_date;  					// 예매일자
	private int bk_adult;  					// 성인
	private int bk_teen; 					// 청소년
	private int bk_totalPeople; 			// 총인원수
	private int bk_fee; 					// 예매금액
	private int bk_usePoint; 				// 사용마일리지
	private int bk_totalPrice; 				// 총금액(예매금액-사용마일리지)
	private int bk_cancellationStatus;		// 취소유무 0=취소X, 1=취소 
	private int bk_payNum;					// 결제코드 
	private String bk_reservedSeatNum;		// 예약한 좌석
	
	//Drive Table
	private DriveVO driveVo;
	//Cancel Table
	private CancelVO cancelVo;
	
	public String getBk_date() {
		if(bk_date == null) {
			return ""; 
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(bk_date);
	}
	
}
