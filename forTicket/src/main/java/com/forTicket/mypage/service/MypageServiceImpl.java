package com.forTicket.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.mypage.dao.MypageDAO;
import com.forTicket.order.vo.OrderVO;

@Service("mypageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageDAO mypageDAO;
	
	//예매내역 페이지이동
	@Override
	public ArrayList<OrderVO> myReservation(HashMap condMap) throws Exception {
		return mypageDAO.myReservation(condMap);
	}
	
	//사업자 상품 예매내역페이지
	@Override
	public ArrayList<OrderVO> b_myReservation(HashMap condMap) throws Exception {
		return mypageDAO.b_myReservation(condMap);
	}

	@Override
	public int totalResNum(String mem_id) throws DataAccessException {
		return mypageDAO.totalResNum(mem_id);
	}

	@Override
	public int totalBResNum(String mem_id) throws DataAccessException {
		return mypageDAO.totalBResNum(mem_id);
	}
	
}

