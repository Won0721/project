package kr.kh.letsKo.vo;

import lombok.Data;


import java.time.LocalTime;

@Data
public class LineVO {
    private int li_num;
    private double li_distance;
    private LocalTime li_travelTime;
    private boolean li_use;
    private String li_te_depTerminalId;
    private String li_te_arrTerminalId;

    public boolean isLi_use() {
        return li_use;
    }

    public void setLi_use(boolean li_use) {
        this.li_use = li_use;
    }

    public String getFullRoute() {
        return String.format("%d, %s - %s", li_num, li_te_depTerminalId, li_te_arrTerminalId);
    }

    public LocalTime getLi_travelTime() {
        return li_travelTime;
    }
    
    public void setLi_travelTime(LocalTime li_travelTime) {
        this.li_travelTime = li_travelTime;
    }
    
}