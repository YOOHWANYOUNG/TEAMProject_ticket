package com.forTicket.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.forTicket.order.vo.OrderVO;

public interface OrderService {
	//예매 추가
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception;
	
	//예매상세페이지
	public OrderVO ticketDetail(int order_No) throws Exception;
	
	//환불성공
	public void refundSuccess(int order_No) throws DataAccessException;
}