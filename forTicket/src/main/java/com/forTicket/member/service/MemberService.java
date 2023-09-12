package com.forTicket.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.forTicket.member.vo.MailDTO;
import com.forTicket.member.vo.MemberVO;

public interface MemberService {
    public int insertMember(MemberVO memberVO) throws DataAccessException ;
    public int insertbusiness(MemberVO memberVO) throws DataAccessException ;
    public MemberVO modMember(String mem_id) throws DataAccessException;
    public MemberVO login(MemberVO memberVO) throws Exception;
    public String overlapped(String id) throws Exception;
    public String findId(String mem_name, String phone) throws Exception;
    //비밀먼호 이메일
    public MailDTO createMailAndChangePassword(String email) throws DataAccessException;
    public void updatePassword(String str, String email) throws DataAccessException;
    public String getTempPassword() throws DataAccessException;
    public void mailSend(MailDTO mailDTO) throws DataAccessException;
    public void updatePassWord(String mem_id, String pwd) throws DataAccessException;
    public int updateMember(MemberVO memberVO) throws DataAccessException;
    public int b_updateMember(MemberVO memberVO) throws DataAccessException;
    public MemberVO m_Edit(HashMap condMap) throws DataAccessException;
    public Map<String, Object> kakaoConnectionCheck(Map<String, Object> paramMap);
    public MemberVO kakaoConnectionEmailCheck(Map<String, Object> paramMap);
	public int setKakaoConnection(Map<String, Object> paramMap);
	public int setKakaoDisConnection(Map<String, Object> paramMap);
	public Map<String, Object> userKakaoLoginPro(Map<String, Object> paramMap);
	public Integer userKakaoRegisterPro(Map<String, Object> paramMap);

}
