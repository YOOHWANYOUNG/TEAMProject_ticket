package com.forTicket.mypage.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.member.vo.MemberVO;
import com.forTicket.mypage.service.MypageService;
import com.forTicket.order.vo.OrderVO;

@Controller("mypageController")
public class MypageControllerImpl implements MypageController{
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private OrderVO orderVO;
	
	//마이페이지 예매내역 이동
	@RequestMapping(value= "/member/myreservation.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView myreservation(@RequestParam("mem_id") String mem_id, @RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		
		HttpSession session=request.getSession();
		session=request.getSession();
				
		session.setAttribute("side_menu", "mem_mode"); //마이페이지 사이드 메뉴로 설정한다.
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
				
		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");
		String search_type = dateMap.get("search_type");
		String search_word = dateMap.get("search_word");
		String beginDate=null,endDate=null;
		
		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate=tempDate[0];
		endDate=tempDate[1];
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);
		
		
		HashMap<String,Object> condMap=new HashMap<String,Object>();
		if(section== null) {
			section = "1";
		}
		condMap.put("section",section);
		if(pageNum== null) {
			pageNum = "1";
		}
		condMap.put("pageNum",pageNum);
		condMap.put("beginDate",beginDate);
		condMap.put("endDate", endDate);
		condMap.put("search_type",search_type);
		condMap.put("search_word", search_word);
		condMap.put("mem_id", mem_id);
		
		ArrayList<OrderVO> reservation_list=mypageService.myReservation(condMap);
		int totalResNum = mypageService.totalResNum(mem_id);
		
		mav.addObject("totalResNum", totalResNum);
		mav.addObject("reservation_list", reservation_list);
		
		String beginDate1[]=beginDate.split("-");
		String endDate2[]=endDate.split("-");
		
		mav.addObject("beginYear",beginDate1[0]);
		mav.addObject("beginMonth",beginDate1[1]);
		mav.addObject("beginDay",beginDate1[2]);

		mav.addObject("endYear",endDate2[0]);
		mav.addObject("endMonth",endDate2[1]);
		mav.addObject("endDay",endDate2[2]);
		
		mav.addObject("search_type",search_type);
		mav.addObject("search_word",search_word);

		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		
		return mav;
	}
	
	//마이페이지 예매내역 이동
		@RequestMapping(value= "/member/b_myreservation.do", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView b_myreservation(@RequestParam("mem_id") String mem_id, @RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception {
			
			HttpSession session=request.getSession();
			session=request.getSession();
					
			session.setAttribute("side_menu", "bus_mode"); //마이페이지 사이드 메뉴로 설정한다.
			
			String viewName=(String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);

			String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
					
			String section = dateMap.get("section");
			String pageNum = dateMap.get("pageNum");
			String search_type = dateMap.get("search_type");
			String search_word = dateMap.get("search_word");
			String beginDate=null,endDate=null;
			
			String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
			beginDate=tempDate[0];
			endDate=tempDate[1];
			dateMap.put("beginDate", beginDate);
			dateMap.put("endDate", endDate);
			
			
			HashMap<String,Object> condMap=new HashMap<String,Object>();
			if(section== null) {
				section = "1";
			}
			condMap.put("section",section);
			if(pageNum== null) {
				pageNum = "1";
			}
			condMap.put("pageNum",pageNum);
			condMap.put("beginDate",beginDate);
			condMap.put("endDate", endDate);
			condMap.put("search_type",search_type);
			condMap.put("search_word", search_word);
			condMap.put("mem_id", mem_id);
			
			ArrayList<OrderVO> reservation_list=mypageService.b_myReservation(condMap);
			int totalBResNum = mypageService.totalBResNum(mem_id);
			
			mav.addObject("totalBResNum", totalBResNum);
			mav.addObject("reservation_list", reservation_list);
			
			String beginDate1[]=beginDate.split("-");
			String endDate2[]=endDate.split("-");
			
			mav.addObject("beginYear",beginDate1[0]);
			mav.addObject("beginMonth",beginDate1[1]);
			mav.addObject("beginDay",beginDate1[2]);

			mav.addObject("endYear",endDate2[0]);
			mav.addObject("endMonth",endDate2[1]);
			mav.addObject("endDay",endDate2[2]);
			
			mav.addObject("search_type",search_type);
			mav.addObject("search_word",search_word);

			mav.addObject("section", section);
			mav.addObject("pageNum", pageNum);
			
			return mav;
		}
	
	protected String calcSearchPeriod(String fixedSearchPeriod){
		String beginDate=null;
		String endDate=null;
		String endYear=null;
		String endMonth=null;
		String endDay=null;
		String beginYear=null;
		String beginMonth=null;
		String beginDay=null;
		DecimalFormat df = new DecimalFormat("00");
		Calendar cal=Calendar.getInstance();
		
		endYear   = Integer.toString(cal.get(Calendar.YEAR));
		endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
		endDay   = df.format(cal.get(Calendar.DATE));
		endDate = endYear +"-"+ endMonth +"-"+endDay;
		
		if(fixedSearchPeriod == null) {
			cal.add(cal.MONTH,-4);
		}else if(fixedSearchPeriod.equals("one_week")) {
			cal.add(Calendar.DAY_OF_YEAR, -7);
		}else if(fixedSearchPeriod.equals("two_week")) {
			cal.add(Calendar.DAY_OF_YEAR, -14);
		}else if(fixedSearchPeriod.equals("one_month")) {
			cal.add(cal.MONTH,-1);
		}else if(fixedSearchPeriod.equals("two_month")) {
			cal.add(cal.MONTH,-2);
		}else if(fixedSearchPeriod.equals("three_month")) {
			cal.add(cal.MONTH,-3);
		}else if(fixedSearchPeriod.equals("four_month")) {
			cal.add(cal.MONTH,-4);
		}
		
		beginYear   = Integer.toString(cal.get(Calendar.YEAR));
		beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
		beginDay   = df.format(cal.get(Calendar.DATE));
		beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
		
		return beginDate+","+endDate;
	}

}

