package kr.kh.letsKo.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardFileVO {
	private int bf_num;
	private int bf_bo_num; 
	private String bf_name; 
	private String bf_originalName;  
	
	public BoardFileVO(int bf_bo_num, String bf_name, String bf_originalName) {
		this.bf_bo_num = bf_bo_num;
		this.bf_name = bf_name;
		this.bf_originalName = bf_originalName;
	}
	
}