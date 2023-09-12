package com.forTicket.order.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.goods.service.GoodsService;
import com.forTicket.goods.vo.GoodsVO;
import com.forTicket.member.vo.MemberVO;
import com.forTicket.order.service.OrderService;
import com.forTicket.order.vo.OrderVO;
import com.forTicket.schedule.service.ScheduleService;
import com.forTicket.theater.dao.TheaterDAO;
import com.forTicket.theater.service.TheaterService;
import com.forTicket.theater.vo.TheaterVO;


@Controller("orderController")
public class OrderControllerImpl implements OrderController{
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private TheaterDAO theaterDAO;
	
	@Autowired
	private OrderVO orderVO;
	
	@Autowired
	private OrderService orderService;
	
	//예매 페이지-좌석선택(날짜선택 등)
	@Override
	@RequestMapping(value={"/order/order_seat.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView order_seat(@RequestParam("goods_id")int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session=req.getSession();
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	

	//예매 페이지-좌석 미선택(날짜선택 등)
	@Override
	@RequestMapping(value={"/order/order_seatNone.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView order_seatNone(@RequestParam("goods_id")int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session=req.getSession();
		
		String viewName = (String)req.getAttribute("viewName");
		
		Map goodsMap = goodsService.goodsInfo(goods_id);
		GoodsVO goodsVO = (GoodsVO) goodsMap.get("goodsVO");
		String theater_name = goodsVO.getGoods_place();
		int theater_id = theaterDAO.selectIdFromName(theater_name);
		TheaterVO theaterVO = theaterDAO.selectTheaterInfo(theater_id);
		
		System.out.println("order_seatNone - goodsMap: "+goodsMap);
		System.out.println("order_seatNone - theaterVO: "+theaterVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("goodsMap", goodsMap);
		mav.addObject("theater", theaterVO);
		return mav;
	}
	
	//결제화면
	@Override
	@RequestMapping(value= "/order/ticketReservation.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView ticketReservation(@ModelAttribute("orderVO") OrderVO _orderVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		session=request.getSession();
		
		Boolean isLogOn=(Boolean)session.getAttribute("isLogOn");
		String action=(String)session.getAttribute("action");
		//로그인 여부 체크
		//이전에 로그인 상태인 경우는 주문과정 진행
		//로그아웃 상태인 경우 로그인 화면으로 이동
		if(isLogOn==null || isLogOn==false){
			session.setAttribute("orderInfo", _orderVO);
			session.setAttribute("action", "/order/ticketReservation.do");
			return new ModelAndView("redirect:/member/loginForm.do");
		}else{
			 if(action!=null && action.equals("/order/ticketReservation.do")){
				orderVO=(OrderVO)session.getAttribute("orderInfo");
				session.removeAttribute("action");
			 }else {
				 orderVO=_orderVO;
			 }
		 }
				
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List myOrderList=new ArrayList<OrderVO>();
		myOrderList.add(orderVO);
		
		MemberVO memberInfo=(MemberVO)session.getAttribute("member");

		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("orderer", memberInfo);
		return mav;
	}
	
	//예약완료
	@Override
	@RequestMapping(value= "/order/reservationSuccess.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView reservationSuccess(@RequestParam Map<String, String> receiverMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session=request.getSession();
		MemberVO memberVO=(MemberVO)session.getAttribute("orderer");
		
		String mem_id=memberVO.getMem_id();
		String orderer_name=memberVO.getMem_name();
		String orderer_hp = memberVO.getPhone();
		List<OrderVO> myOrderList=(List<OrderVO>)session.getAttribute("myOrderList");

		for(int i=0; i<myOrderList.size();i++){
			OrderVO orderVO=(OrderVO)myOrderList.get(i);
								
			String goodsPriceString = receiverMap.get("goods_price"); // 전달된 가격 문자열
			String goodsIdString = receiverMap.get("goods_id"); // 전달된 goods_id 문자열
			String totalQuantityString = receiverMap.get("totalQuantity"); // 전달된 goods_id 문자열
			String totalPriceeString = receiverMap.get("totalPrice"); // 전달된 goods_id 문자열
			String s_noString = receiverMap.get("s_no"); // 전달된 goods_id 문자열

			int goods_id = Integer.parseInt(goodsIdString);
			int goodsPrice = Integer.parseInt(goodsPriceString); // 문자열을 int로 변환
			int totalQuantity = Integer.parseInt(totalQuantityString); // 문자열을 int로 변환
			int totalPrice = Integer.parseInt(totalPriceeString); // 문자열을 int로 변환
			int s_no = Integer.parseInt(s_noString); // 문자열을 int로 변환
			
			
			String orderDate = receiverMap.get("orderDate");
			String goods_Time = receiverMap.get("goods_Time");
			String goods_Date = orderDate +" "+ goods_Time;
			
			
			orderVO.setS_no(s_no);
			orderVO.setGoods_id(goods_id);
			orderVO.setGoods_name(receiverMap.get("goods_name"));
			orderVO.setMem_id(mem_id);
			orderVO.setOrderName(orderer_name);
			orderVO.setOrder_No();
			orderVO.setReceiver_name(receiverMap.get("receiver_name"));
			orderVO.setOrderPhone(receiverMap.get("orderPhone"));
			orderVO.setGoods_place(receiverMap.get("goods_place"));
			
			orderVO.setGoods_Date(goods_Date);
			
			orderVO.setGoods_price(goodsPrice); // 변환된 가격을 객체에 설정
			orderVO.setTotalQuantity(totalQuantity); 
			orderVO.setTotalPrice(totalPrice); 
			orderVO.setGoods_Time(receiverMap.get("goods_Time"));
			orderVO.setOrderEmail(receiverMap.get("orderEmail"));
			orderVO.setOrderPay(receiverMap.get("orderPay"));
			orderVO.setOrderStatus("예매완료");
			
			myOrderList.set(i, orderVO); ///각 orderVO에 주문자 정보를 세팅한 후 다시 myOrderList에 저장한다.
		}//end for
		orderService.addNewOrder(myOrderList);
		mav.addObject("myOrderInfo",receiverMap);//OrderVO로 주문결과 페이지에  주문자 정보를 표시한다.
		mav.addObject("myOrderList", myOrderList);
		return mav;
	}
	
	//예매상세
	@Override
	@RequestMapping(value= "/order/ticketDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView ticketDetail(@ModelAttribute("order_No") int order_No, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		
		orderVO = orderService.ticketDetail(order_No);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("detail", orderVO);
					
		return mav;
	}
	
	//환불 신청 화면
	@Override
	@RequestMapping(value= "/order/ticketrefund.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView ticketRefund(@ModelAttribute("order_No") int order_No,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		
		orderVO = orderService.ticketDetail(order_No);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("refund", orderVO);
					
		return mav;
	}
	
	//환불 완료 페이지
	@Override
	@RequestMapping(value= "/order/refundSuccess.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView refundSuccess(@RequestParam("order_No") int order_No, @RequestParam("mem_id") String mem_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");

		orderService.refundSuccess(order_No);
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/myreservation.do?mem_id="+mem_id);
					
		return mav;
	}
	
	//예매상세페이지(사업자)	
	@Override
	@RequestMapping(value= "/order/b_ticketDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView b_ticketDetail(int order_No, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		
		orderVO = orderService.ticketDetail(order_No);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("detail", orderVO);
					
		return mav;
	}
	
	//환불 완료 페이지(사업자)
	@Override
	@RequestMapping(value= "/order/b_refundSuccess.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView b_refundSuccess(@RequestParam("order_No") int order_No, @RequestParam("mem_id") String mem_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");

		orderService.refundSuccess(order_No);
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/b_myreservation.do?mem_id="+mem_id);
					
		return mav;
	}
	

	@Override
	@RequestMapping(value = "/order/getSelectedSchedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getSelectedSchedule(String theater_id, Date s_date) throws Exception {
		Map condMap = new HashMap();
		condMap.put("theater_id", theater_id);
		condMap.put("s_date", s_date);
		System.out.println(s_date);
		String selectThAndDate = scheduleService.getSelectedSchedule_order(condMap);
		System.out.println(selectThAndDate);
		return selectThAndDate;
	}

}