package kr.kh.letsKo.dao;


import java.time.LocalDate;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.letsKo.vo.DriveVO;

public interface DriveDAO  {

	List<DriveVO> selectDriveList();

	void insertDrive(@Param("drive") DriveVO driveVO);

	DriveVO getDriveByNum(int dr_num);

	DriveVO getDriveByNum(@Param("dr_num") Integer dr_num);

	void updateDrive(@Param("drive") DriveVO driveVO);

	List<DriveVO> selectDrivePlan(@Param("te_dep") String te_depTerminalId, @Param("te_arr") String te_arrTerminalId, @Param("seat") String bus_seatGrade, @Param("date") String date2);
	
	void deleteDriveByNum(@Param("dr_num") int dr_num);

	List<DriveVO> getScheduleByDate(LocalDate date);


}
