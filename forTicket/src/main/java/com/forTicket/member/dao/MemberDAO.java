package com.forTicket.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.member.vo.MemberVO;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
    public int insertMember(MemberVO memberVO) throws DataAccessException;
    public int insertbusiness(MemberVO memberVO) throws DataAccessException;
    public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
    public MemberVO selectMemberById(String mem_id) throws DataAccessException;
    public String selectOverlappedID(String id) throws DataAccessException;
    public String findId(@Param("mem_name") String mem_name, @Param("phone") String phone) throws DataAccessException;
    public String findByMemberEmail(String email) throws DataAccessException; // 이 부분을 추가해야 합니다.
    public void updatePassword(@Param("mem_id") String mem_id, @Param("pwd") String pwd) throws DataAccessException; // 이 부분도 추가해야 합니다
    public int updateMember(MemberVO memberVO) throws DataAccessException;
    public int b_updateMember(MemberVO memberVO) throws DataAccessException;
    public MemberVO m_Edit(HashMap condMap)  throws DataAccessException;  
    public int insert_kakao(Map<String, Object> paramMap) throws DataAccessException;
	public Map<String, Object> kakaoLogin(Map<String, Object> paramMap)throws DataAccessException;
	public Map<String, Object> kakaoConnectionCheck(Map<String, Object> paramMap)throws DataAccessException;
	public int setKakaoConnection(Map<String, Object> paramMap)throws DataAccessException;	
	public MemberVO kakaoConnectionEmailCheck(Map<String, Object> paramMap);
	public int setKakaoDisConnection(Map<String, Object> paramMap);

}
