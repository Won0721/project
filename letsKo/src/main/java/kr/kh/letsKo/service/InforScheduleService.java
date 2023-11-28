package kr.kh.letsKo.service;

import java.time.LocalDate;
import java.util.List;


import kr.kh.letsKo.vo.DriveVO;



public interface InforScheduleService {
	

	List<DriveVO> getScheduleByDate(LocalDate date);
}
