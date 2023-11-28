package kr.kh.letsKo.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CompanyFileVO {
	private int cf_num,cf_co_num; 
	private String cf_name, cf_originalname;
	
	
	public CompanyFileVO(int cf_co_num, String cf_name, String cf_originalname) {
		this.cf_co_num = cf_co_num;
		this.cf_name = cf_name;
		this.cf_originalname = cf_originalname;
	}
}