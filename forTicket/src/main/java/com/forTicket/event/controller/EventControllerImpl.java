package com.forTicket.event.controller;

import java.io.File;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.event.service.EventService;
import com.forTicket.event.vo.E_imageFileVO;
import com.forTicket.event.vo.EventVO;
import com.forTicket.goods.service.GoodsService;
import com.forTicket.goods.vo.GoodsVO;
import com.forTicket.member.vo.MemberVO;

@Controller("eventController")
public class EventControllerImpl implements EventController {
	private static String EVENT_IMAGE_REPO = "C:\\forTicket\\event";
	@Autowired
	private EventService eventService;
	@Autowired
	private GoodsService goodsService;
	
	//이벤트 목록
	@Override
	@RequestMapping(value = "/event/listEvent.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listEvent(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String viewName = (String) req.getAttribute("viewName");
		List<EventVO> eventList = eventService.listEvents();
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		mav.addObject("member", member);
		mav.addObject("eventList", eventList);
		mav.setViewName(viewName);
		return mav;
	}
	
	//이벤트 목록 (관리자)
	@Override
	@RequestMapping(value = "/event/A_listEvent.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView A_listEvent(@RequestParam Map<String, String> dateMap, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String mem_id = member.getMem_id();
		mav.addObject("member", member);
		
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
		
		ArrayList<EventVO> eventList = (ArrayList) eventService.A_listEvents(condMap);
		int totalEventNum = eventService.totalEventNum();
		for(EventVO eventVO : eventList) {
			String goods_name = goodsService.goodsName(eventVO.getGoods_id());
			int goods_discount = goodsService.goodsDisc(eventVO.getGoods_id());
			eventVO.setGoods_name(goods_name);
			eventVO.setGoods_discount(goods_discount);
		}
		mav.addObject("eventList", eventList);
		mav.addObject("totalEventNum", totalEventNum);
		
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
	
	//이벤트 목록 (사업자)
	@Override
	@RequestMapping(value = "/event/B_listEvent.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView B_listEvent(@RequestParam Map<String, String> dateMap, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String mem_id = member.getMem_id();
		mav.addObject("member", member);
		
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
		ArrayList<EventVO> eventList = (ArrayList) eventService.B_listEvents(condMap);
		int totalEventNum = eventService.totalEventNumById(mem_id);
		for(EventVO eventVO : eventList) {
			String goods_name = goodsService.goodsName(eventVO.getGoods_id());
			int goods_discount = goodsService.goodsDisc(eventVO.getGoods_id());
			eventVO.setGoods_name(goods_name);
			eventVO.setGoods_discount(goods_discount);
		}
		mav.addObject("eventList", eventList);
		mav.addObject("totalEventNum", totalEventNum);
		
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

	//이벤트 상세페이지
	@Override
	@RequestMapping(value= "/event/detailEvent.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView detailEvent(@RequestParam("event_no") int event_no, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("html/text;charset=utf-8");
		String viewName = (String) req.getAttribute("viewName");
		Map event = eventService.eventInfo(event_no);
		EventVO eventVO = (EventVO) event.get("event");
		int goods_id = eventVO.getGoods_id();
		Map goodsMap = goodsService.goodsInfo(goods_id);
		GoodsVO goods = (GoodsVO)goodsMap.get("goodsVO");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		mav.addObject("goods", goods);
		mav.addObject("member", member);
		mav.addObject("eventMap", event);
		return mav;
	}
	
	//이벤트 등록 페이지
	@Override
	@RequestMapping(value = "/event/addEventForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addForm(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		String viewName = (String)req.getAttribute("viewName");
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String mem_id = member.getMem_id();
		List goodsList = goodsService.findGoodsById(mem_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("member", member);
		mav.addObject("goodsList", goodsList);
		return mav;
	}

	//이벤트 등록
	@Override
	@RequestMapping(value= "/event/addEvent.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ResponseEntity addEvent(MultipartHttpServletRequest multipartReq, HttpServletResponse resp)
			throws Exception {
		multipartReq.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		String imageFileName=null;
		
		Map goodsMap = new HashMap();
		Enumeration enu=multipartReq.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartReq.getParameter(name);
			goodsMap.put(name,value);
		}
		
		String g_startDate = (String) goodsMap.get("goods_startDate");
		java.sql.Date goods_startDate = java.sql.Date.valueOf(g_startDate);
		goodsMap.remove("goods_startDate");
		goodsMap.put("goods_startDate", goods_startDate);
		
		String g_endDate = (String) goodsMap.get("goods_endDate");
		java.sql.Date goods_endDate = java.sql.Date.valueOf(g_endDate);
		goodsMap.remove("goods_endDate");
		goodsMap.put("goods_endDate", goods_endDate);
		
		String e_startDate = (String) goodsMap.get("event_startDate");
		java.sql.Date event_startDate = java.sql.Date.valueOf(e_startDate);
		goodsMap.remove("event_startDate");
		goodsMap.put("event_startDate", event_startDate);
		
		String e_endDate = (String) goodsMap.get("event_endDate");
		java.sql.Date event_endDate = java.sql.Date.valueOf(e_endDate);
		goodsMap.remove("event_endDate");
		goodsMap.put("event_endDate", event_endDate);
		
		String e_finalDate = (String) goodsMap.get("event_finalDate");
		if(e_finalDate != null) {
			java.sql.Date event_finalDate = java.sql.Date.valueOf(e_finalDate);
			goodsMap.remove("event_finalDate");
			goodsMap.put("event_finalDate", event_finalDate);
		}
		
		HttpSession session = multipartReq.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getMem_id();
		goodsMap.put("mem_id", reg_id);
		
		List<E_imageFileVO> imageFileList = upload(multipartReq);
		if(imageFileList!= null && imageFileList.size()!=0) {
			for(E_imageFileVO imageFileVO : imageFileList) {
				imageFileVO.setReg_id(reg_id);
			}
			goodsMap.put("imageFileList", imageFileList);
		}
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int event_no = eventService.addEvent(goodsMap);
			goodsService.modDisc(goodsMap);
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(E_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(EVENT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(EVENT_IMAGE_REPO+"\\"+event_no);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message= "<script>";
			message += " alert('이벤트 등록에 성공했습니다.');";
			message +=" location.href='"+multipartReq.getContextPath()+"/event/B_listEvent.do';";
			message +=("</script>");
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(E_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(EVENT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			message= "<script>";
			message += " alert('이벤트 등록에 실패했습니다.');";
			message +=" location.href='"+multipartReq.getContextPath()+"/event/addEventForm.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	//이벤트 삭제
	@Override
	@RequestMapping(value = "/event/removeEvent.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity removeEvent(@RequestParam("event_no") int event_no, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String type = memberVO.getType();
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			eventService.removeEvent(event_no);
			eventService.removeAllEventImage(event_no);
			File destDir = new File(EVENT_IMAGE_REPO+"\\"+event_no);
			FileUtils.deleteDirectory(destDir);
			message = "<script>";
			message += " alert('이벤트가 삭제되었습니다.');";
			if(type.equals("admin")) {
				message += "location.href='"+req.getContextPath()+"/event/A_listEvent.do';";
			} else {
				message += "location.href='"+req.getContextPath()+"/event/B_listEvent.do';";
			}
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('이벤트 삭제에 실패했습니다.');";
			if(type.equals("admin")) {
				message += "location.href='"+req.getContextPath()+"/event/A_listEvent.do';";
			} else {
				message += "location.href='"+req.getContextPath()+"/event/B_listEvent.do';";
			}
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	//이벤트 수정 페이지
	@Override
	@RequestMapping(value = "/event/modEventForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView modForm(@RequestParam("event_no") int event_no, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String viewName = (String)req.getAttribute("viewName");
		Map eventMap = eventService.eventDetail(event_no);
		EventVO eventVO = (EventVO) eventMap.get("event");
		int goods_id = eventVO.getGoods_id();
		Map goodsMap = goodsService.goodsInfo(goods_id);
		GoodsVO goods = (GoodsVO)goodsMap.get("goodsVO");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		mav.addObject("member", member);
		mav.addObject("eventMap", eventMap);
		mav.addObject("goods", goods);
		return mav;
	}

	//이벤트 수정
	@Override
	@RequestMapping(value = "/event/modEvent.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity modEvent(MultipartHttpServletRequest multipartReq, HttpServletResponse resp)
			throws Exception {
		multipartReq.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		Map eventMap=new HashMap();
		Enumeration enu=multipartReq.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartReq.getParameter(name);
			eventMap.put(name,value);
		}
		
		int event_no = Integer.parseInt((String)eventMap.get("event_no"));
		String message = null;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		try {
			eventService.modEvent(eventMap);
			message = "<script>";
			message += " alert('이벤트가 수정되었습니다.');";
			message += "location.href='"+multipartReq.getContextPath()+"/event/B_listEvent.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			message = "<script>";
			message += " alert('이벤트 수정에 실패했습니다.');";
			message += "location.href='"+multipartReq.getContextPath()+"/event/modEventForm.do?event_no="+event_no+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		resEnt =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEnt;
	}
	
	//이벤트 등록상태 수정
	@Override
	@RequestMapping(value="/event/modEventStatus.do" ,method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ResponseEntity modEventStatus(@RequestParam("event_no") int event_no,
			                     @RequestParam("attribute") String attribute,
			                     @RequestParam("value") String value,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		//System.out.println("modifyEventInfo");
		request.setCharacterEncoding("utf-8");
		System.out.println("event_no: "+event_no+", attribute: "+attribute+", value: "+value);
		Map goodsMap=new HashMap();
		goodsMap.put("event_no", event_no);
		goodsMap.put(attribute, value);
		System.out.println("event_status: "+goodsMap.get("event_status"));
		eventService.modEventStatus(goodsMap);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	//이벤트 이미지 추가
	@Override
	@RequestMapping(value="/event/addEventImage.do" ,method={RequestMethod.GET, RequestMethod.POST})
	public void addNewEventImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName=null;
		
		Map goodsMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			goodsMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getMem_id();
		
		List<E_imageFileVO> imageFileList=null;
		int event_no=0;
		try {
			imageFileList =upload(multipartRequest);
			if(imageFileList!= null && imageFileList.size()!=0) {
				for(E_imageFileVO imageFileVO : imageFileList) {
					event_no = Integer.parseInt((String)goodsMap.get("event_no"));
					imageFileVO.setEvent_no(event_no);
					imageFileVO.setReg_id(reg_id);
				}
			    eventService.addEventImage(imageFileList);
				for(E_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(EVENT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(EVENT_IMAGE_REPO+"\\"+event_no);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(E_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(EVENT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			e.printStackTrace();
		}
	}
	
	//이벤트 이미지 수정
	@Override
	@RequestMapping(value="/event/modEventImage.do" ,method={RequestMethod.GET, RequestMethod.POST})
	public void modEventImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName=null;
		
		Map goodsMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			goodsMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getMem_id();
		
		List<E_imageFileVO> imageFileList=null;
		int event_no=0;
		int image_id=0;
		try {
			imageFileList =upload(multipartRequest);
			if(imageFileList!= null && imageFileList.size()!=0) {
				for(E_imageFileVO imageFileVO : imageFileList) {
					event_no = Integer.parseInt((String)goodsMap.get("event_no"));
					image_id = Integer.parseInt((String)goodsMap.get("image_id"));
					String originalFileName = (String)goodsMap.get("originalFileName");
					String fileName = (String)goodsMap.get("fileName");
					File oldFile = new File(EVENT_IMAGE_REPO+"\\"+event_no+"\\"+originalFileName);
					oldFile.delete();
					imageFileVO.setEvent_no(event_no);
					imageFileVO.setImage_id(image_id);
					imageFileVO.setReg_id(reg_id);
					imageFileVO.setFileName(fileName);
				}
				
				eventService.modEventImage(imageFileList);
				for(E_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(EVENT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(EVENT_IMAGE_REPO+"\\"+event_no);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(E_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(EVENT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			e.printStackTrace();
		}		
	}

	//이벤트 이미지 삭제
	@Override
	@RequestMapping(value="/event/removeEventImage.do" ,method={RequestMethod.GET, RequestMethod.POST})
	public void removeEventImage(@RequestParam("event_no") int event_no, @RequestParam("image_id") int image_id, @RequestParam("imageFileName") String imageFileName, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		eventService.removeEventImage(image_id);
		try{
			File srcFile = new File(EVENT_IMAGE_REPO+"\\"+event_no+"\\"+imageFileName);
			srcFile.delete();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="/event/*Form.do", method={RequestMethod.GET, RequestMethod.POST})
	private ModelAndView form(@RequestParam(value="result", required=false) String result, @RequestParam(value="action", required=false) String action, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String) req.getAttribute("viewName");
		HttpSession session = req.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		MemberVO member = (MemberVO) session.getAttribute("member");
		mav.addObject("member", member);
		mav.addObject("result", result);
		mav.setViewName(viewName);
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
	protected List<E_imageFileVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<E_imageFileVO> fileList= new ArrayList<E_imageFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			E_imageFileVO imageFileVO =new E_imageFileVO();
			String fileName = fileNames.next();
			imageFileVO.setFileType(fileName);
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			imageFileVO.setFileName(originalFileName);
			fileList.add(imageFileVO);
			
			File file = new File(EVENT_IMAGE_REPO +"\\"+ fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(! file.exists()){ //��λ� ������ �������� ���� ���
					if(file.getParentFile().mkdirs()){ //��ο� �ش��ϴ� ���丮���� ����
							file.createNewFile(); //���� ���� ����
					}
				}
				mFile.transferTo(new File(EVENT_IMAGE_REPO +"\\"+"temp"+ "\\"+originalFileName)); //�ӽ÷� ����� multipartFile�� ���� ���Ϸ� ����
			}
		}
		return fileList;
	}
	
	@Override
	@RequestMapping(value = "/event/eventApply.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void eventApply(int event_no, String mem_id) throws Exception {
		Map condMap = new HashMap();
		condMap.put("event_no", event_no);
		condMap.put("mem_id", mem_id);
		eventService.eventApply(condMap);
	}
}
