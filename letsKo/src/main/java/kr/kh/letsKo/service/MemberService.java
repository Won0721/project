package kr.kh.letsKo.service;

import kr.kh.letsKo.vo.MemberVO;
import kr.kh.letsKo.vo.VerificationVO;

public interface MemberService {
	
	boolean registSignup(MemberVO member);

	boolean selectMember(MemberVO member);

	boolean checkId(String me_id);

	MemberVO login(MemberVO member);

	void updateMemberSession(MemberVO user);

	MemberVO selectMemberBySession(String me_session_id);

	VerificationVO checkIdVerification(VerificationVO verificationVO);
	
	MemberVO checkExistentEmail(MemberVO memberVO);
	
	void sendEmail(String email, String addr, String subject, String body);

	boolean insertVerification(VerificationVO verificationVO);
	
	String findIdByPhone(String me_phone);

	boolean updatePwById(MemberVO memberVO);

	MemberVO selectMemberInfo(String me_id);
	
	boolean updateUsePoint(MemberVO user, Integer usePoint);
	
	boolean accumulatePoint(MemberVO user, int bk_totalPrice);

	
	// 회원탈퇴
	boolean deleteMember(MemberVO user, String me_pw);

	boolean checkPw(MemberVO user, String me_pw);
	
	//비밀번호 변경
	boolean updatePassword(MemberVO user, String me_pw, String newPw);

	boolean updatePassword(MemberVO user, String memberPw);
	
	//휴대폰번호 변경
	boolean updatePhone(MemberVO user, String memberPw, String me_phone);

	int selectMePoint(String me_id);


	
}
