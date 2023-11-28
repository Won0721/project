package kr.kh.letsKo.vo;

import java.util.Date;
import lombok.Data;

@Data
public class MemberVO {
	private String me_id;
	private String me_pw;
	private String me_phone; 
	private int me_yearOfBirth;
	private String me_email;
	private int me_gender;
	private String me_authority;
	private String me_session_id;
	private Date me_session_limit;
	private int me_point;
	
	private boolean autoLogin; // DB에 저장 안되는 값
	
	//휴대폰 번호 변경후 로그인 유지
	public void setMemberPh(String memberPh){}
			
}
