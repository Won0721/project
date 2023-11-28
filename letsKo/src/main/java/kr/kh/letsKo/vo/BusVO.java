package kr.kh.letsKo.vo;

import lombok.Data;

@Data
public class BusVO {	
	int bus_num, bus_co_num; // 버스 고유코드
	String bus_carNumber; // 버스차량번호
	int bus_totalSeat; // 버스총좌석수
	String bus_seatGrade; // 좌석등급
	private String co_name;
	private int dr_reservationAvailable;
	
	private CompanyVO companyVo;
	
	public String getCo_name() {
        if (companyVo != null) {
            return companyVo.getCo_name();
        }
        return co_name;
    }

    public void setCo_name(String co_name) {
        this.co_name = co_name;
    }

    public CompanyVO getCompanyVo() {
        return companyVo;
    }

    public void setCompanyVo(CompanyVO companyVo) {
        this.companyVo = companyVo;
    }
	
}