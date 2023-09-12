package com.forTicket.admin.member.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.forTicket.admin.member.service.AdminMemberService;
import com.forTicket.member.vo.MemberVO;

@Controller("adminMemberController")
public class AdminMemberControllerImpl implements AdminMemberController {
	
	@Autowired
	private MemberVO memberVO;
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	//관리자 회원관리
	@Override
	@RequestMapping(value="/member/a_Profile.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView a_Profile(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		
		HttpSession session=request.getSession();
		session=request.getSession();
				
		session.setAttribute("side_menu", "admin_mode"); //마이페이지 사이드 메뉴로 설정한다. //마이페이지 사이드 메뉴로 설정한다.
		
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
		
		ArrayList<MemberVO> member_list=adminMemberService.a_Profile(condMap);
		int totalUserNum = adminMemberService.totalUserNum();
		
		mav.addObject("totalUserNum", totalUserNum);
		mav.addObject("member_list", member_list);
		
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
	
	//관리자 사업자관리
	@Override
	@RequestMapping(value="/member/a_ProfileBus.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView a_ProfileBus(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception {
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
		
		ArrayList<MemberVO> member_list=adminMemberService.a_ProfileBus(condMap);
		int totalBusNum = adminMemberService.totalBusNum();
		
		mav.addObject("totalBusNum", totalBusNum);
		mav.addObject("member_list", member_list);
		
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
	
	//회원 삭제
	@Override
	@RequestMapping(value="/admin/deleteMember.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity deleteMember(String mem_id, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try{
			adminMemberService.deleteMember(mem_id);
			message = "<script>";
			message += " alert('삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/member/a_Profile.do?mem_id=" + mem_id
					+ "';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			message = "<script>";
			message += " alert('오류가 생겼습니다.');";
			message += " location.href='" + request.getContextPath() + "/member/a_Profile.do?mem_id=" + mem_id
					+ "';";
			message += "</script>";
			
			e.printStackTrace();
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	//사업자 삭제
	@Override
	@RequestMapping(value="/admin/deleteBus.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity deleteBus(String mem_id, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try{
			adminMemberService.deleteMember(mem_id);
			message = "<script>";
			message += " alert('삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/member/a_ProfileBus.do?mem_id=" + mem_id
					+ "';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			message = "<script>";
			message += " alert('오류가 생겼습니다.');";
			message += " location.href='" + request.getContextPath() + "/member/a_ProfileBus.do?mem_id=" + mem_id
					+ "';";
			message += "</script>";
			
			e.printStackTrace();
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	//회원 수정창 이동, memberVO값 가져오기
	@Override
	@RequestMapping(value="/member/a_Edit.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView a_Edit(@RequestParam("mem_id") String mem_id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO member = new MemberVO();
		
		request.setCharacterEncoding("utf-8");

		String viewName = (String)request.getAttribute("viewName");
		
		HashMap<String,String> condMap=new HashMap<String,String>();
		ModelAndView mav = new ModelAndView();

		condMap.put("mem_id", mem_id);

		member = adminMemberService.a_Edit(condMap);
		
		mav.addObject("taget", member);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//사업자 수정창 이동, memberVO값 가져오기
	@Override
	@RequestMapping(value="/member/a_EditBus.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView a_EditBus(@RequestParam("mem_id") String mem_id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		MemberVO member = new MemberVO();
		
		request.setCharacterEncoding("utf-8");

		String viewName = (String)request.getAttribute("viewName");
		
		HashMap<String,String> condMap = new HashMap<String,String>();
		
		ModelAndView mav = new ModelAndView();

		condMap.put("mem_id", mem_id);

		member = adminMemberService.a_Edit(condMap);
		
		mav.addObject("taget", member);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//회원 수정	
	@Override
	@RequestMapping(value="/admin/a_Update.do", method={RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity a_Update(MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		int result = 0;
		
		try{						
			result = adminMemberService.a_Update(member);
			message = "<script>";
			message += " alert('수정했습니다.');";
			message += " location.href='" + request.getContextPath() + "/member/a_Profile.do?';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			message = "<script>";
			message += " alert('오류가 생겼습니다.');";
			message += " location.href='" + request.getContextPath() + "/member/a_Profile.do?';";
			message += "</script>";
			
			e.printStackTrace();
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	//사업자 수정	
	@Override
	@RequestMapping(value="/admin/a_UpdateBus.do", method={RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity a_UpdateBus(MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		int result = 0;
		
		try{						
			result = adminMemberService.a_UpdateBus(member);
			message = "<script>";
			message += " alert('수정했습니다.');";
			message += " location.href='" + request.getContextPath() + "/member/a_ProfileBus.do';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			message = "<script>";
			message += " alert('오류가 생겼습니다.');";
			message += " location.href='" + request.getContextPath() + "/member/a_ProfileBus.do';";
			message += "</script>";
			
			e.printStackTrace();
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	public String calcSearchPeriod(String fixedSearchPeriod){
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
