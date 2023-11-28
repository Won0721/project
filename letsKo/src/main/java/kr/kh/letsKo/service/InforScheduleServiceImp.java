package kr.kh.letsKo.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.letsKo.dao.DriveDAO;
import kr.kh.letsKo.vo.DriveVO;

@Service
public class InforScheduleServiceImp implements InforScheduleService {
	
	
	@Autowired
    private DriveDAO driveDao;

	@Override
    public List<DriveVO> getScheduleByDate(LocalDate date) {
        return driveDao.getScheduleByDate(date);
    }
}
