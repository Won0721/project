package kr.kh.letsKo.vo;

import lombok.Data;

@Data
public class TerminalVO {
	private String te_code;
    private int te_ci_num;
    private String te_ci_newname;
    
    private CityVO cityVo;
    
    
    public String getTe_ci_newname() {
        return te_ci_newname;
    }

    public void setTe_ci_newname(String te_ci_newname) {
        this.te_ci_newname = te_ci_newname;
    }
}