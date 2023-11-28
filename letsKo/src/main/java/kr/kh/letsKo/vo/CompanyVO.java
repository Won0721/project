package kr.kh.letsKo.vo;

import java.util.List;
import lombok.Data;

@Data
public class CompanyVO {
	private int co_num;
	private String co_name;
	
	private List<CompanyFileVO> companyFileVoList;
	
	public String getCo_name() {
        return co_name;
    }

    public void setCo_name(String co_name) {
        this.co_name = co_name;
    }
}