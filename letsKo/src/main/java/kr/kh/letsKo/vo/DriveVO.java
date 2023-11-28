package kr.kh.letsKo.vo;

import lombok.Data;


import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.kh.letsKo.dao.LineDAO;

import kr.kh.letsKo.service.BusService;


@Component
@Data
public class DriveVO {
    
    private int dr_num;
    private LocalDate dr_depPlandDate;
    private LocalTime dr_depPlandTime;
    private LocalTime dr_arrPlandTime;
    private int dr_reservationAvailable;
    private int dr_li_num;
    private int dr_bus_num;
    
    @Autowired
    private LineDAO lineDao;
    

    @Autowired
    private BusService busService;

    
    private LineVO lineVo;
    private BusVO busVo;
    
    public DriveVO() {
    	
    }
   


    public DriveVO(LineDAO lineDao) {
        this.lineDao = lineDao;
    }
    
    

    public LocalTime getDr_depPlandTime() {
        return dr_depPlandTime;
    }

    public void setDr_depPlandTime(LocalTime dr_depPlandTime) {
        this.dr_depPlandTime = dr_depPlandTime;

        if (dr_li_num > 0) {
            LineVO line = lineDao.getLineById(dr_li_num);
            if (line != null) {
                int seconds = dr_depPlandTime.toSecondOfDay();
                Duration travelTime = Duration.ofSeconds(seconds);
                setDr_arrPlandTime(dr_depPlandTime, travelTime);
            }
        }
      
    }

    public void setDr_arrPlandTime(LocalTime depPlandTime, Duration travelTime) {
        if (lineVo != null) {
            Duration newTravelTime = Duration.between(LocalTime.MIDNIGHT, lineDao.getLineById(dr_li_num).getLi_travelTime());
            this.dr_arrPlandTime = depPlandTime.plus(newTravelTime);
            
        } else {
            this.dr_arrPlandTime = depPlandTime.plus(travelTime);
            
        }
    }
    

    
}