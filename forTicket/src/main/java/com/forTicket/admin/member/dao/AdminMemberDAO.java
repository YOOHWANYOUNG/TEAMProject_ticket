package com.forTicket.admin.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.member.vo.MemberVO;

@Mapper
@Repository("adminMemberDAO")
public interface AdminMemberDAO {
	//관리자 회원관리
	public ArrayList<MemberVO> a_Profile(HashMap condMap) throws DataAccessException;

	//관리자 사업자관리
	public ArrayList<MemberVO> a_ProfileBus(HashMap condMap) throws DataAccessException;
	
	//관리자 회원 삭제
	public int deleteMember(String id) throws DataAccessException;
	
	//수정창 이동시 id가져오기
	public MemberVO selectById(HashMap condMap)  throws DataAccessException;

	//회원 수정
	public int a_Update(MemberVO memberVO) throws DataAccessException;
	
	//사업자 수정
	public int a_UpdateBus(MemberVO memberVO) throws DataAccessException;
	
	//회원 수
	public int totalUserNum() throws DataAccessException;

	//사업자 수
	public int totalBusNum() throws DataAccessException;
}
