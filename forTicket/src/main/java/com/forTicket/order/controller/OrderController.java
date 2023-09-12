package com.forTicket.order.controller;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.order.vo.OrderVO;

public interface OrderController {
	public ModelAndView order_seat(@RequestParam("goods_id")int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ModelAndView order_seatNone(@RequestParam("goods_id")int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	//결제화면
	public ModelAndView ticketReservation(@ModelAttribute("orderVO") OrderVO orderVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	//결제완료화면
	public ModelAndView reservationSuccess(@RequestParam Map<String, String> receiverMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
	//결제 상세페이지
	public ModelAndView ticketDetail(@ModelAttribute("order_No") int order_No,HttpServletRequest request, HttpServletResponse response) throws Exception;
	//환불 페이지
	public ModelAndView ticketRefund(@ModelAttribute("order_No") int order_No,HttpServletRequest request, HttpServletResponse response) throws Exception;
	//환불 완료페이지
	public ModelAndView refundSuccess(@RequestParam("order_No") int order_No, @RequestParam("mem_id") String mem_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	//결제 상세페이지(사업자)
	public ModelAndView b_ticketDetail(@ModelAttribute("order_No") int order_No,HttpServletRequest request, HttpServletResponse response) throws Exception;
	//환불 완료페이지(사업자)
	public ModelAndView b_refundSuccess(@RequestParam("order_No") int order_No, @RequestParam("mem_id") String mem_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
		
	public String getSelectedSchedule(String theater_id, Date s_date) throws Exception;
}
