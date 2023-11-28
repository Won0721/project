package kr.kh.letsKo.service;

import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.letsKo.dao.MemberDAO;
import kr.kh.letsKo.vo.MemberVO;
import kr.kh.letsKo.vo.VerificationVO;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 회원가입
	@Override
	public boolean registSignup(MemberVO member) {
		if(member == null) {
			return false;
		}
		//아이디는 영문으로 시작하고, 4~15자
		String idRegex = "^[a-zA-Z][a-zA-Z0-9]{3,14}$";
		//비번은 영문,숫자,!@#$%로 이루어지고 4~15자  
		String pwRegex = "^[a-zA-Z0-9!@#$%]{3,14}$";
		if(!Pattern.matches(idRegex, member.getMe_id())) {
			return false;
		}
		//비번이 유효성에 맞지 않으면
		if(!Pattern.matches(pwRegex, member.getMe_pw())) {
			return false;
		}
		// 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(member.getMe_pw());
		// 암호화 된 비번을 회원 정보에 수정
		member.setMe_pw(encodedPassword);
		// 이메일 체크
		if(!isValidEmail(member.getMe_email())){
			return false;
		}
		
		// 회원가입
		return memberDao.insertMember(member);
	}
	
	// 정상적인 이메일 형식인지 검증 
	public static boolean isValidEmail(String email) {
	    boolean check = false;
	    String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";   
	    Pattern p = Pattern.compile(regex);
	    Matcher m = p.matcher(email);
	    if(m.matches()) {
	       check = true; 
	    }
	    return check;
    }

	@Override
	public boolean selectMember(MemberVO member) {
		MemberVO dbMember = memberDao.selectMember(member.getMe_id());
		// 가입하려는 아이디가 이미 가입된 경우 
		if(dbMember != null) {
			return false; 
		}
		return true;
	}
	
	@Override
	public boolean checkId(String me_id) {
		return memberDao.selectMember(me_id) == null;
	}
	
	// 로그인 
	@Override
	public MemberVO login(MemberVO member) {
		if(member == null) {
			return null;
		}
		MemberVO dbMember = memberDao.selectMember(member.getMe_id());
		// ID와 일치하는 계정이 없음(가입된 ID가 아니면)
		if(dbMember == null) {
			return null;
		}
		// 비번확인(암호화 안된 문자열, 암호화 된 문자열)
		if(passwordEncoder.matches(member.getMe_pw(), dbMember.getMe_pw())){
			return dbMember;
		}
		return null;
	}

	@Override
	public void updateMemberSession(MemberVO user) {
		if(user == null || user.getMe_id() == null) {
			return ;
		}
		memberDao.updateMemberSession(user);
	}

	@Override
	public MemberVO selectMemberBySession(String session_id) {
		return memberDao.selectMemberBySession(session_id);
	}

	@Override
	public VerificationVO checkIdVerification(VerificationVO verificationVO) {
		return memberDao.checkIdVerification(verificationVO);
	}

	@Override
	public MemberVO checkExistentEmail(MemberVO memberVO) {
		return memberDao.selectExistentEmail(memberVO);
	}

	@Autowired
	private MailSender mailSender;
	
	public void sendEmail(String toAddress, String fromAddress,	String subject, String msgBody) {
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setFrom(fromAddress);
		smm.setTo(toAddress);
		smm.setSubject(subject);
		smm.setText(msgBody);
		
		mailSender.send(smm);
	}
	
	@Override
	public boolean insertVerification(VerificationVO verificationVO) {
		return memberDao.insertVerification(verificationVO);
	}
	
	@Override
	public String findIdByPhone(String me_phone) {
		return memberDao.findIdByPhone(me_phone);
	}
	
	@Override
	public boolean updatePwById(MemberVO memberVO) {
		Random random = new Random();
		int min = 100000;  // 100000부터 시작
		int max = 999999;  // 999999까지의 범위에서 난수 생성
		int randomNum = random.nextInt(max - min + 1) + min;
		String tmpPw = memberVO.getMe_id()+String.valueOf(randomNum);

		// 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(tmpPw);
		// 암호화 된 비번을 회원 정보에 수정
		memberVO.setMe_pw(encodedPassword);
        
		MemberVO member = memberDao.selectMember(memberVO.getMe_id());
		if(null == member) {
			return false;
		}
		
        String addr = "eunseol.kwak@gmail.com"; 				// 보내는 사람 구글계정
		String subject = "임시 비밀번호 입니다.";						// 메일 제목
		String body = "임시비밀번호 = " + tmpPw;					// 메일 내용(인증번호)
		String email = member.getMe_email();
        
		if(null != email && !"".equals(email)) {
			sendEmail(email, addr, subject, body);
		}
		return memberDao.updatePwById(memberVO);
	}
	
	
	// id로 member 정보 가져오기
	@Override
	public MemberVO selectMemberInfo(String me_id) {
		MemberVO member = memberDao.selectMemberInfo(me_id);
		return member;
	}

	
	// user의 사용포인트 업데이트
	@Override
	public boolean updateUsePoint(MemberVO user, Integer usePoint) {
		return memberDao.updateUsePoint(user,usePoint);
	}
	
	// user의 결제 후 적립포인트 업데이트 
	@Override
	public boolean accumulatePoint(MemberVO user, int bk_totalPrice) {
		return memberDao.accumulatePoint(user, bk_totalPrice);
	}
	
	/* ============================================================================= */
	
	
	// 회원탈퇴
	@Override
	public boolean deleteMember(MemberVO user, String me_pw) {
	    if (user == null || me_pw == null) {
	        return false; // 사용자 정보나 비밀번호가 유효하지 않은 경우 false를 반환합니다.
	    }
	    if (passwordEncoder.matches(me_pw, user.getMe_pw())) {
	        // passwordEncoder가 사용자 비밀번호와 입력한 비밀번호를 비교하여 일치하는 경우
	        // memberDao.deleteMember가 회원 삭제 작업을 수행한다고 가정합니다.
	        if (memberDao.deleteMember(user)) {
	            return true; // 삭제가 성공적으로 이루어진 경우 true를 반환합니다.
	        }
	    }
	    return false; // 비밀번호가 일치하지 않는 경우 false를 반환합니다.
	}
	
	// 비밀번호 확인 
	@Override
	public boolean checkPw(MemberVO user, String me_pw) {
		
		return passwordEncoder.matches(me_pw, user.getMe_pw());
	}
	
	//비밀번호 변경
	@Override
	public boolean updatePassword(MemberVO user, String me_pw, String newPw) {
	    if (user == null || me_pw == null || newPw == null) {
	        return false;
	    }	    
	        // PasswordEncoder가 사용자 비밀번호와 입력한 현재 비밀번호를 비교하여 일치하는 경우

	    	String hashedNewPassword = passwordEncoder.encode(newPw);
	    	user.setMe_pw(hashedNewPassword);

	        if (memberDao.updatePassword(user)) {
	            return true; // 비밀번호가 성공적으로 변경되었을 경우 true를 반환
	        }    

	    return false; // 비밀번호가 일치하지 않거나 변경 작업이 실패한 경우 false를 반환
	}

	@Override
	public boolean updatePassword(MemberVO user, String me_pw) {
		if (user == null || me_pw == null ) {
	        return false; 
	    }
		System.out.println(me_pw);
	   
	        //새비번 암호화
	    	String hashedNewPassword = passwordEncoder.encode(me_pw);
	    	//user 비번을 암호화 새 비번 설정
	    	user.setMe_pw(hashedNewPassword);
	        if (memberDao.updatePassword(user)) {
	            return true; 
	    }
	    return false; 
	}

	//휴대폰번호 변경
	@Override
	public boolean updatePhone(MemberVO user, String me_pw, String me_phone) {
	    if (user == null || me_pw == null) {
	        return false; // 사용자 정보나 비밀번호가 유효하지 않은 경우 false를 반환합니다.
	    }
	    if (passwordEncoder.matches(me_pw, user.getMe_pw())) {
	        // passwordEncoder가 사용자 비밀번호와 입력한 비밀번호를 비교하여 일치하는 경우
	        // 비밀번호가 일치하는 경우에만 전화번호 업데이트를 시도합니다.
	        
	        user.setMe_phone(me_phone); // 새로운 전화번호로 업데이트
	        if (memberDao.updatePhone(user)) {
	            return true; 
	        }
	    }
	    return false; // 비밀번호가 일치하지 않는 경우 false를 반환합니다.
	}

	@Override
	public int selectMePoint(String me_id) {
		// TODO Auto-generated method stub
		return memberDao.selectMePoint(me_id);
	}

	
	
}