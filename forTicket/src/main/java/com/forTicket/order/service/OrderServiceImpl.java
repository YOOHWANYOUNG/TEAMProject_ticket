package com.forTicket.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.order.dao.OrderDAO;
import com.forTicket.order.vo.OrderVO;
import com.forTicket.schedule.dao.ScheduleDAO;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	//예매추가
	@Override
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception {
		orderDAO.insertNewOrder(myOrderList);
		for(int i=0; i<myOrderList.size(); i++) {
			OrderVO orderVO=(OrderVO)myOrderList.get(i);
			int s_no = orderVO.getS_no();
			int seats = orderVO.getTotalQuantity();
			scheduleDAO.newOrder(s_no, seats);
		}
	}

	//예매상세
	@Override
	public OrderVO ticketDetail(int order_No) throws Exception {
		OrderVO order = orderDAO.ticketDetail(order_No);
		return order;
	}

	//환불 성공
	@Override
	public void refundSuccess(int order_No) throws DataAccessException {
		OrderVO order = orderDAO.ticketDetail(order_No);
		int s_no = order.getS_no();
		int seats = order.getTotalQuantity();
		scheduleDAO.cancelOrder(s_no, seats);
		orderDAO.refundSuccess(order_No);
	}
	
}