package kr.kh.letsKo.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import kr.kh.letsKo.vo.BoardVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardVO {
	private int bo_num;
	private String bo_title; 
	private String bo_contents; 
	private int bo_views; 	  // 조회수	
	private Date bo_regDate;  // 등록일
	private Date bo_modDate;  // 수정일 	
	private String bo_me_id;  
	
	private List<BoardFileVO> boardFileVoList;

	public String getBo_modDate_str() {
		if(bo_modDate == null) {
			return ""; // 수정일이 없으면 빈문자열로 처리
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(bo_modDate);
	}
	public String getBo_regDate_str() {
		if(bo_regDate == null) {
			return "";
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(bo_regDate);
	}
}