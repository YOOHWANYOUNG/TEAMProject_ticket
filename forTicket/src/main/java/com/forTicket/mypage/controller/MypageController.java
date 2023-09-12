
package com.forTicket.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.order.vo.OrderVO;

public interface MypageController {
	//예매내역페이지
	public ModelAndView myreservation(@RequestParam("mem_id") String mem_id, @RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//사업자상품 예매내역페이지
	public ModelAndView b_myreservation(@RequestParam("mem_id") String mem_id, @RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
}

