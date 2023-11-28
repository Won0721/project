package kr.kh.letsKo.service;

import java.util.List;

import kr.kh.letsKo.vo.BusVO;
import kr.kh.letsKo.vo.DriveVO;
import kr.kh.letsKo.vo.LineVO;

public interface DriveService {

	List<DriveVO> getDriveList();

    boolean insertDrive(DriveVO driveVO);

	List<LineVO> getLineList();

	List<BusVO> getBusList();
	
	DriveVO getDriveByNum(int dr_num);

	boolean updateDrive(DriveVO driveVO);

	boolean deleteDriveByNum(int dr_num);

	List<DriveVO> selectDrivePlan(String te_depTerminalId, String te_arrTerminalId, String bus_seatGrade, String date2);	
}
