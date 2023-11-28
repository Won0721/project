package kr.kh.letsKo.service;

import java.time.Duration;
import java.time.LocalTime;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.letsKo.dao.BusDAO;
import kr.kh.letsKo.dao.DriveDAO;
import kr.kh.letsKo.dao.LineDAO;
import kr.kh.letsKo.vo.BusVO;
import kr.kh.letsKo.vo.DriveVO;
import kr.kh.letsKo.vo.LineVO;
@Service
public class DriveServiceImp implements DriveService {
	
	@Autowired
	DriveDAO driveDao;
	
	@Autowired
	BusDAO busDao;
	
	@Autowired
	LineDAO lineDao;
	
	@Autowired
	BusService busService;
	

	@Override
    public List<LineVO> getLineList() {
        return lineDao.selectLineList();  
    }

	 @Override
	 public List<DriveVO> getDriveList() {
	      return driveDao.selectDriveList();
	 }
	 @Override
	 public List<BusVO> getBusList() {
		 return busDao.getAllBusList();
	 }
	 

	 @Override
	 public boolean insertDrive(DriveVO driveVO) {
	     if (driveVO == null) {
	         System.out.println("[insertDrive] driveVO is null");
	         return false;
	     }

	     try {
	         LineVO line = lineDao.getLineByNum(driveVO.getDr_li_num());
	         if (line != null) {
	             Duration travelTime = Duration.between(LocalTime.MIDNIGHT, line.getLi_travelTime());

	             LocalTime depPlandTime = driveVO.getDr_depPlandTime();
	             driveVO.setDr_arrPlandTime(depPlandTime.plus(travelTime));
	         }

	       

	         driveDao.insertDrive(driveVO);

	         // 예매 가능 좌석 수 설정
	         BusVO bus = busService.getBusByNum(driveVO.getDr_bus_num());
	         if (bus != null) {
	             driveVO.setDr_reservationAvailable(bus.getBus_totalSeat());
        

	             driveDao.updateDrive(driveVO); // 업데이트로 예매 가능 좌석 수 설정
	         }

	         return true;
	     } catch (Exception e) {
	         e.printStackTrace();
	         System.out.println("[insertDrive] Error: " + e.getMessage());
	         return false;
	     }
	 }

	 @Override
	 public DriveVO getDriveByNum(int dr_num) {
	     return driveDao.getDriveByNum(dr_num);
	 }

	
	 @Override
	 public boolean updateDrive(DriveVO driveVO) {
	     if (driveVO == null || driveVO.getDr_num() <= 0) {
	         System.out.println("[updateDrive] driveVO is null");
	         return false;
	     }

	     try {
	         LineVO line = lineDao.getLineByNum(driveVO.getDr_li_num());
	         if (line != null) {
	             Duration travelTime = Duration.between(LocalTime.MIDNIGHT, line.getLi_travelTime());
	             
	             LocalTime depPlandTime = driveVO.getDr_depPlandTime();
	             driveVO.setDr_arrPlandTime(depPlandTime.plus(travelTime));
	         }       
	         driveDao.updateDrive(driveVO);
	         
	         // 예매 가능 좌석 수 설정
	         BusVO bus = busService.getBusByNum(driveVO.getDr_bus_num());
	         if (bus != null) {
	             driveVO.setDr_reservationAvailable(bus.getBus_totalSeat());
        

	             driveDao.updateDrive(driveVO); // 업데이트로 예매 가능 좌석 수 설정
	         }

	         return true;
	     } catch (Exception e) {
	         e.printStackTrace();
	         System.out.println("[updateDrive] Error: " + e.getMessage());
	         return false;
	     }
	 }

	 @Override
	    public boolean deleteDriveByNum(int dr_num) {
	        if (dr_num <= 0) {
	            System.out.println("[deleteDriveByNum] dr_num is invalid");
	            return false;
	        }

	        try {
	            driveDao.deleteDriveByNum(dr_num);  
	            return true;
	        } catch (Exception e) {
	            System.out.println("[deleteDriveByNum] Error: " + e.getMessage());
	            return false;
	        }
	 }
	 

	@Override
	public List<DriveVO> selectDrivePlan(String te_depTerminalId, String te_arrTerminalId, String bus_seatGrade, String date2) {
		// TODO Auto-generated method stub
		return driveDao.selectDrivePlan(te_depTerminalId,te_arrTerminalId,bus_seatGrade, date2);
	}

		 
}
