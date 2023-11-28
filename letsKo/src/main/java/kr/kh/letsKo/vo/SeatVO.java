package kr.kh.letsKo.vo;

import lombok.Data;

@Data	
public class SeatVO {
	private int se_num; 				// 좌석코드
	private int se_selectedSeatNum;  	// 예약된좌석번호
	private int se_bus_code;			// 버스코드 
	private String se_selectedSeatNumString; // 예약된좌석번호(,로 구분)
}
