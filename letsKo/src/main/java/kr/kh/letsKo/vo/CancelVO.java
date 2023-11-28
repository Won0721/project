package kr.kh.letsKo.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class CancelVO {
	private int ca_num;	
	private Date ca_cancelDate;		// 취소일자
	private int ca_cancelFee; 		// 취소수수료
	private int ca_refundAmount; 	// 반환금액
	private int ca_refundPoint; 	// 반환포인트
	private int ca_bk_num;			// bookTB 연결 외래키 

	public String getCa_cancelDate() {
		if(ca_cancelDate == null) {
			return ""; 
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd (EEE) HH:mm:ss");
		return format.format(ca_cancelDate);
	}

}