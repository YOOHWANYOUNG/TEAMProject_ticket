package com.forTicket.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.forTicket.center.vo.QuestionVO;
import com.forTicket.community.vo.CommunityVO;
import com.forTicket.order.vo.OrderVO;

public interface CommunityService {

	//회원 커뮤니티 목록 u_commulist
	public ArrayList<CommunityVO> u_commulist(HashMap condMap) throws Exception;
	
	//리뷰 페이지 이동
    public OrderVO review(int order_No) throws Exception;
	
	//리뷰 글 추가
	public int add_review(Map commuMap) throws DataAccessException;
	
	//답글 페이지 이동
	public CommunityVO c_No(int c_No) throws DataAccessException;
	
	//답변 추가
	public int update_reply(CommunityVO communityVO) throws Exception;
	
	//리뷰 삭제
	public void delete(int c_No) throws Exception;
	
	public int totalCommNum() throws DataAccessException;
}
