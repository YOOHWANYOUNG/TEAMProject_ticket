package com.forTicket.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.admin.member.dao.AdminMemberDAO;
import com.forTicket.member.vo.MemberVO;

@Service("adminMemberService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService{

	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	//관리자 회원 관리
	@Override
	public ArrayList<MemberVO> a_Profile(HashMap condMap) throws Exception {
		return adminMemberDAO.a_Profile(condMap);
	}
	
	//관리자 사업자 관리
	@Override
	public ArrayList<MemberVO> a_ProfileBus(HashMap condMap) throws Exception {
		return adminMemberDAO.a_ProfileBus(condMap);
	}
	
	//관리자 회원 삭제	
	@Override
	public int deleteMember(String id) throws DataAccessException {
		
		return adminMemberDAO.deleteMember(id);		
	}
	
	//회원 수정창 이동, memberVO값 가져오기
	public MemberVO a_Edit(HashMap condMap) throws DataAccessException{
		return adminMemberDAO.selectById(condMap);
	}
	
	//회원 수정
	@Override
	public int a_Update(MemberVO memberVO) throws DataAccessException {
		return adminMemberDAO.a_Update(memberVO);
	}
	
	//사업자 수정
	@Override
	public int a_UpdateBus(MemberVO memberVO) throws DataAccessException {
		return adminMemberDAO.a_UpdateBus(memberVO);
		}

	//회원 수
	@Override
	public int totalUserNum() throws DataAccessException {
		return adminMemberDAO.totalUserNum();
	}

	//사업자 수
	@Override
	public int totalBusNum() throws DataAccessException {
		return adminMemberDAO.totalBusNum();
	}

}
