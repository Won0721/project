package kr.kh.letsKo.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.letsKo.vo.MemberVO;
import kr.kh.letsKo.vo.VerificationVO;

public interface MemberDAO {
	
	// 로그인 로그아웃 관련 
	MemberVO selectMember(@Param("me_id")String me_id);

	boolean insertMember(@Param("member")MemberVO member);

	void updateMemberSession(@Param("user")MemberVO user);

	MemberVO selectMemberBySession(@Param("session_id")String session_id);
	
	VerificationVO checkIdVerification(@Param("verificationVO")VerificationVO verificationVO);
	
	MemberVO selectExistentEmail(@Param("member")MemberVO member);
	
	boolean insertVerification(@Param("verificationVO")VerificationVO verificationVO);
	
	String findIdByPhone(@Param("me_phone")String me_phone);

	boolean updatePwById(@Param("memberVO")MemberVO memberVO);

	MemberVO selectMemberInfo(@Param("me_id")String me_id);
	
	boolean updateUsePoint(@Param("user")MemberVO user, @Param("usePoint") Integer usePoint);
	
	boolean accumulatePoint(@Param("user")MemberVO user, @Param("bk_totalPrice") int bk_totalPrice);

	
	// 회원탈퇴 
	boolean deleteMember(@Param("user")MemberVO user);

	//비밀번호 변경
	boolean updatePassword(@Param("user")MemberVO user);
	
	//휴대폰번호 변경
	boolean updatePhone(@Param("user")MemberVO user);

	int selectMePoint(@Param("me_id") String me_id);

	Object refundPoint(@Param("user") MemberVO user, @Param("bk_totalPrice") int ca_refundPoint);

}