package com.forTicket.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.dao.DataAccessException;

import com.forTicket.member.vo.MemberVO;

public interface AdminMemberService {
	//관리자 회원 관리
	public ArrayList<MemberVO> a_Profile(HashMap condMap) throws Exception;
	
	//관리자 사업자 관리
	public ArrayList<MemberVO> a_ProfileBus(HashMap condMap) throws Exception;
	
	//회원 삭제
	public int deleteMember(String id) throws DataAccessException;
	
	//회원 수정창 이동, memberVO값 가져오기
	public MemberVO a_Edit(HashMap condMap) throws DataAccessException;
	
	//회원 수정 
	public int a_Update(MemberVO memberVO) throws DataAccessException;
	
	//사업자 수정 
	public int a_UpdateBus(MemberVO memberVO) throws DataAccessException;

	//회원 수 
	public int totalUserNum() throws DataAccessException;
	
	//사업자 수
	public int totalBusNum() throws DataAccessException;
}
