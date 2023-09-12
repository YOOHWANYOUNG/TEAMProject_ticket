package com.forTicket.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.member.dao.MemberDAO;
import com.forTicket.member.vo.MailDTO;
import com.forTicket.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
    private MailSender mailSender;
	@Autowired
	private MailDTO mailDTO;

	
	@Override
	public int insertMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}
	
	@Override
	public int insertbusiness(MemberVO member) throws DataAccessException {
		return memberDAO.insertbusiness(member);
	}

	@Override
	public MemberVO modMember(String mem_id) throws DataAccessException {
		MemberVO memberVO = new MemberVO();
		memberVO = memberDAO.selectMemberById(mem_id);
		return memberVO;
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberDAO.loginById(memberVO);
	}

	
	@Override
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}
	
	 @Override
	public String findId(String mem_name, String phone) {
	    String findId = memberDAO.findId(mem_name, phone);
	    return findId;
	    }
	
	 // 메일 내용을 생성하고 임시 비밀번호로 회원 비밀번호를 변경 
	    @Override
	    public MailDTO createMailAndChangePassword(String email) {
	        String str = getTempPassword();
	        MailDTO dto = new MailDTO();
	        dto.setAddress(email);
	        dto.setTitle("forTicket 임시비밀번호 안내 이메일 입니다.");
	        dto.setMessage("안녕하세요. forTicket 임시비밀번호 안내 관련 이메일 입니다." + " 회원님의 임시 비밀번호는 "
	                + str + " 입니다." + "로그인 후에 비밀번호를 변경을 해주세요");
	        updatePassword(str, email);
	        return dto;
	    }

//	    임시 비밀번호로 업데이트
	    @Override
		public void updatePassword(String str, String email) {
	        String memberPassword = str;
	        String memberVO = memberDAO.findByMemberEmail(email); // MemberVO 객체 가져오기
	        memberDAO.updatePassword(memberVO, memberPassword);; // getId()로 멤버 ID 가져오기
	    }

	    //랜덤함수로 임시비밀번호 구문 만들기
	    @Override
	    public String getTempPassword(){
	        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
	                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

	        String str = "";

	        // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
	        int idx = 0;
	        for (int i = 0; i < 10; i++) {
	            idx = (int) (charSet.length * Math.random());
	            str += charSet[idx];
	        }
	        return str;
	    }
	    // 메일보내기
	    @Override
	    public void mailSend(MailDTO mailDTO) {
	        System.out.println("전송 완료!");
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(mailDTO.getAddress());
	        message.setSubject(mailDTO.getTitle());
	        message.setText(mailDTO.getMessage());
	        message.setFrom("wndals104@naver.com");//보내는 사람 이메일 주소
	        message.setReplyTo("wndals104@naver.com");
	        System.out.println("message"+message);
	        mailSender.send(message);
	    }

	    //비밀번호 변경
	    @Override
	    public void updatePassWord(String mem_id, String pwd) {
	        memberDAO.updatePassword(mem_id, pwd);;
	    }
	    
	    @Override
		public int updateMember(MemberVO memberVO) throws DataAccessException {
			return memberDAO.updateMember(memberVO);
			}
	    
	    @Override
		public int b_updateMember(MemberVO memberVO) throws DataAccessException {
	    	return memberDAO.b_updateMember(memberVO);
		}

		@Override
		public MemberVO m_Edit(HashMap condMap) throws DataAccessException{
			return memberDAO.m_Edit(condMap);
		}
	    
	    @Override
		public Map <String, Object> kakaoConnectionCheck(Map<String, Object> paramMap) {
			return memberDAO.kakaoConnectionCheck(paramMap);
		}
	    
	    public MemberVO kakaoConnectionEmailCheck(Map<String, Object> paramMap) {
			return memberDAO.kakaoConnectionEmailCheck(paramMap);
		}

		@Override
		public int setKakaoConnection(Map<String, Object> paramMap) {
			return memberDAO.setKakaoConnection(paramMap);
		}
		
		public int setKakaoDisConnection(Map<String, Object> paramMap) {
			return memberDAO.setKakaoDisConnection(paramMap);
		}

		@Override
		public Map<String, Object> userKakaoLoginPro(Map<String, Object> paramMap) {
			return memberDAO.kakaoLogin(paramMap);
		}

		@Override
		public Integer userKakaoRegisterPro(Map<String, Object> paramMap) {
			return memberDAO.insert_kakao(paramMap);
		}

}
