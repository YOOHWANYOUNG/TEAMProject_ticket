package com.forTicket.schedule.controller;

import java.io.File;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.goods.service.GoodsService;
import com.forTicket.member.vo.MemberVO;
import com.forTicket.schedule.service.ScheduleService;
import com.forTicket.schedule.vo.ScheduleVO;
import com.forTicket.theater.service.TheaterService;

@Controller("scheduleController")
public class ScheduleControllerImpl implements ScheduleController {
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private GoodsService goodsService;

	
	@Override
	@RequestMapping(value={"/schedule/listSchedule.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listSchedule(@RequestParam Map<String, String> dateMap, HttpServletRequest req, HttpServletResponse response) throws Exception {
		req.setCharacterEncoding("utf-8");
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		mav.addObject("member", memberVO);
		
		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		
		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");
		String search_type = dateMap.get("search_type");
		String search_word = dateMap.get("search_word");
		String beginDate=null,endDate=null;
		String mem_id = memberVO.getMem_id();
		
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
		
		ArrayList<ScheduleVO> scheduleList = null;

		int totalScheduleNum;
		
		String type = (String)session.getAttribute("type");
		if(type.equals("B")) {
			scheduleList = scheduleService.listSchedule(condMap);
			totalScheduleNum = scheduleService.totalScheduleNumById(mem_id);
			System.out.println(totalScheduleNum);
			for(int i=0; i<scheduleList.size(); i++) {
				ScheduleVO schedule = scheduleList.get(i);
				String s_dateTime = schedule.getS_dateTime();
				String[] dateAndTime = s_dateTime.split(" ");
	            if (dateAndTime.length == 2) {
	                String s_date = dateAndTime[0];
	                String s_time = dateAndTime[1];
	                schedule.setS_date(s_date);
	                schedule.setS_time(s_time);
	            }
			}
		} else {
			scheduleList = scheduleService.listAdmin(condMap);
			totalScheduleNum = scheduleService.totalScheduleNum();
			for(int i=0; i<scheduleList.size(); i++) {
				ScheduleVO schedule = scheduleList.get(i);
				String s_dateTime = schedule.getS_dateTime();
				String[] dateAndTime = s_dateTime.split(" ");
	            if (dateAndTime.length == 2) {
	                String s_date = dateAndTime[0];
	                String s_time = dateAndTime[1];
	                schedule.setS_date(s_date);
	                schedule.setS_time(s_time);
	            }
			}
		}
		mav.addObject("scheduleList", scheduleList);
		mav.addObject("totalScheduleNum", totalScheduleNum);
		
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
		
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/schedule/addScheduleForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addScheduleForm(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		List goodsList = goodsService.listGoods();
		List theaterList = theaterService.listTheaters();
		mav.addObject("goodsList", goodsList);
		mav.addObject("theaterList", theaterList);
		mav.addObject("member", member);
		return mav;
	}

	@Override
	@RequestMapping(value = "/schedule/addSchedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity addSchedule(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		Map scMap = new HashMap();
		Enumeration enu=req.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=req.getParameter(name);
			scMap.put(name,value);
		}
		String s_dates = (String)scMap.get("s_date");
		String s_time = (String)scMap.get("s_time");
		String s_date = s_dates+" "+s_time;
		System.out.println(s_date);
		scMap.remove("s_time");
		scMap.remove("s_date");
		scMap.put("s_date", s_date);
		
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getMem_id();
		scMap.put("reg_id", reg_id);
		
		System.out.println(reg_id+" /schedule/addScheduleForm.do/schedule/addScheduleForm.do");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			scheduleService.addSchedule(scMap);
			message= "<script>";
			message += " alert('스케줄 등록에 성공했습니다.');";
			message +=" location.href='"+req.getContextPath()+"/schedule/listSchedule.do';";
			message +=("</script>");
		}catch(Exception e) {
			message= "<script>";
			message += " alert('스케줄 등록에 실패했습니다.');";
			message +=" location.href='"+req.getContextPath()+"/schedule/addScheduleForm.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	

	@Override
	@RequestMapping(value = "/schedule/removeSchedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity removeSchedule(@RequestParam("s_no") int s_no, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			scheduleService.removeSchedule(s_no);
			message = "<script>";
			message += " alert('스케줄이 삭제되었습니다.');";
			message += "location.href='"+req.getContextPath()+"/schedule/listSchedule.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('스케줄 삭제에 실패했습니다.');";
			message += "location.href='"+req.getContextPath()+"/schedule/listSchedule.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/schedule/getSelectedSchedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getSelectedSchedule(String theater_id, Date s_date) throws Exception {
		Map condMap = new HashMap();
		condMap.put("theater_id", theater_id);
		condMap.put("s_date", s_date);
		String selectThAndDate = scheduleService.getSelectedSchedule(condMap);
		System.out.println(selectThAndDate);
		return selectThAndDate;
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
