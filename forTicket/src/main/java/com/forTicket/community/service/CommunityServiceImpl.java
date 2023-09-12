package com.forTicket.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.center.vo.QuestionVO;
import com.forTicket.community.dao.CommunityDAO;
import com.forTicket.community.vo.CommunityVO;
import com.forTicket.order.vo.OrderVO;

@Service("communityService")
@Transactional(propagation = Propagation.REQUIRED)
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDAO communityDAO;
	
	@Override
	public ArrayList<CommunityVO> u_commulist(HashMap condMap) throws Exception {
		ArrayList<CommunityVO> u_commulist = communityDAO.u_commulist(condMap);
		return u_commulist;
	}
	
	//리뷰페이지
	@Override
	public OrderVO review(int order_No) throws Exception {
		OrderVO order = communityDAO.review(order_No);
		return order;
	}
	
	//review 글 추가
	@Override
	public int add_review(Map commuMap) throws DataAccessException {
		int maxReview = communityDAO.selectReviewNO();
		
		commuMap.put("c_No", maxReview);
		
		communityDAO.add_review(commuMap);
		
		return maxReview;
	}
	
	//답변페이지 이동
	@Override
	public CommunityVO c_No(int c_No) throws DataAccessException {
		CommunityVO num = new CommunityVO();
		num = communityDAO.c_No(c_No);
		return num;
	}
	
	//답변 추가
	@Override
	public int update_reply(CommunityVO communityVO) throws Exception {
		return communityDAO.update_reply(communityVO);
	}
	
	//리뷰 삭제
	@Override
	public void delete(int c_No) throws Exception {
		communityDAO.delete(c_No);		
	}

	@Override
	public int totalCommNum() throws DataAccessException {
		return communityDAO.totalCommNum();
	}
	
}
