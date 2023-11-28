package kr.kh.letsKo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.letsKo.dao.LineDAO;
import kr.kh.letsKo.dao.TerminalDAO;
import kr.kh.letsKo.vo.LineVO;
import kr.kh.letsKo.vo.TerminalVO;
@Service
public class LineServiceImp implements LineService {

    @Autowired
    LineDAO lineDao;  
    
    @Autowired
    TerminalDAO terminalDao;

    // 노선 등록
    @Override
    public boolean insertLine(LineVO lineVO) {
        if (lineVO == null) {
            System.out.println("[insertLine] lineVO is null");
            return false;
        }

        try {
            lineDao.insertLine(lineVO);  
            return true;
        } catch (Exception e) {
            System.out.println("[insertLine] Error: " + e.getMessage());
            return false;
        }
    }

    // 중복 체크
    public boolean isDuplicateLine(LineVO lineVo) {
        return lineDao.isDuplicateLine(lineVo);  
    }

    // 노선 리스트
    @Override
    public List<LineVO> getLineList() {
        return lineDao.selectLineList();  
    }

    // 노선 삭제
    @Override
    public boolean deleteLineByNum(int li_num) {
        if (li_num <= 0) {
            System.out.println("[deleteLineByNum] li_num is invalid");
            return false;
        }

        try {
            lineDao.deleteLineByNum(li_num);  
            return true;
        } catch (Exception e) {
            System.out.println("[deleteLineByNum] Error: " + e.getMessage());
            return false;
        }
    }

    // 노선 코드로 조회
    @Override
    public LineVO getLineByNum(int li_num) {
        return lineDao.getLineByNum(li_num);  
    }

    // 노선 수정
    @Override
    public boolean updateLine(LineVO lineVO) {
        if (lineVO == null || lineVO.getLi_num() <= 0) {
            System.out.println("[updateLine] Invalid input");
            return false;
        }

        
        if (lineVO.isLi_use() && isDuplicateEntry(lineVO)) {
            System.out.println("[updateLine] 이미 등록된 노선입니다.");
            return false;
        }

        try {
            lineDao.updateLine(lineVO);
            return true;
        } catch (Exception e) {
            System.out.println("[updateLine] Error: " + e.getMessage());
            return false;
        }
    }

    // 터미널, 노선 수정시 중복 체크
    private boolean isDuplicateEntry(Object entry) {
        if (entry instanceof LineVO) {
            LineVO line = (LineVO) entry;

            // li_use가 변경되었을 때만 중복 체크를 피함
            if (line.isLi_use() != lineDao.isExistingLine(line)) {
                return false;
            }

            // li_use가 true이거나 기존에 등록된 노선과 중복되지 않을 때만 중복 체크 수행
            return line.isLi_use() || lineDao.isDuplicateLine(line);
        } else if (entry instanceof TerminalVO) {
            TerminalVO terminal = (TerminalVO) entry;
            List<TerminalVO> terminalList = terminalDao.selectTerminalList();  
            return terminalList.stream().anyMatch(t -> t.getTe_code().equals(terminal.getTe_code()));
        }
        return false;
    }

	


}