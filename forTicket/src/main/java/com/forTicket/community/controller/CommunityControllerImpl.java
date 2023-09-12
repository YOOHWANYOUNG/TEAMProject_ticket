package com.forTicket.community.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.center.vo.QuestionVO;
import com.forTicket.community.service.CommunityService;
import com.forTicket.community.vo.CommunityVO;
import com.forTicket.member.vo.MemberVO;
import com.forTicket.order.vo.OrderVO;

@Controller("communityController")
public class CommunityControllerImpl implements CommunityController{
	private static final String COMMUNITY_IMAGE_REPO = "C:\\forTicket\\community";
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private CommunityVO communityVO;
	
	@Autowired
	private OrderVO orderVO;
	
	@Autowired
	private MemberVO memberVO;
	
	//회원 커뮤페이지 이동
	@Override
	@RequestMapping(value="/community/u_Commu.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView u_Commu(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (section == null) {
			section = "1";
		}
		condMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}

		condMap.put("pageNum", pageNum);

		ArrayList<CommunityVO> u_commulist = communityService.u_commulist(condMap);
		int totalCommNum = communityService.totalCommNum();

		mav.addObject("totalCommNum", totalCommNum);
		mav.addObject("u_commulist", u_commulist);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);

		return mav;
	}
	
	//리뷰쓰기화면 이동	
    @Override
    @RequestMapping(value= "/community/review.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView review(@ModelAttribute("order_No") int order_No, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String viewName = (String) request.getAttribute("viewName");
    	
    	orderVO = communityService.review(order_No);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName(viewName);
		mav.addObject("review", orderVO);
		
		return mav;
	}

	//리뷰추가
    @Override
	@RequestMapping(value="/community/add_review.do", method={RequestMethod.GET,RequestMethod.POST})
	public ResponseEntity add_review(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{

		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");

		Map<String, Object> reviewMap = new HashMap<String, Object>();

		Enumeration enu = multipartRequest.getParameterNames();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);

			System.out.println("name: " + name + "	" + "value" + value);

			reviewMap.put(name, value);
		}
		
		String imageFileName = upload(multipartRequest);

		reviewMap.put("imageFileName", imageFileName);
				
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			int c_No = communityService.add_review(reviewMap);
			
			System.out.println("c_No"+ c_No);
		
			if (imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(COMMUNITY_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(COMMUNITY_IMAGE_REPO + "\\" + c_No);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			
			message = "<script>";
			message += " alert('글을 작성했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/community/u_Commu.do';";
			message += "</script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			File srcFile = new File(COMMUNITY_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();
			
			message = "<script>";
			message += " alert('오류가 생겼습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/community/u_Commu.do';";
			message += "</script>";

			e.printStackTrace();
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}

		return resEnt;
	}
	
	//리뷰 답변페이지	
	@Override
	@RequestMapping(value="/community/reply.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView reply(int c_No, HttpServletRequest request, HttpServletResponse resp) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView();
		
		communityVO.setC_No(c_No);
		
		CommunityVO community = communityService.c_No(c_No);
		
		mav.addObject("reply",community);
		mav.setViewName(viewName);

		return mav;
	}
	
	//1:1 답변 추가
	@Override
	@RequestMapping(value = "/community/update_reply.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity update_reply(CommunityVO communityVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");

		String message;

		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		int result = 0;
		
		try {
			result = communityService.update_reply(communityVO);
			message = "<script>";
			message += " alert('답글을 추가했습니다.');";
			message += " location.href='" + request.getContextPath() + "/community/u_Commu.do"
					+ "';";
			message += "</script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 생겼습니다.');";
			message += " location.href='" + request.getContextPath() + "/community/u_Commu.do"
					+ "';";
			message += "</script>";

			e.printStackTrace();
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
		
	//리뷰 글 삭제
	@Override
	@RequestMapping(value = "/community/delete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity delete(int c_No, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");

		String message;

		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		try {
			communityService.delete(c_No);
			File destDir = new File(COMMUNITY_IMAGE_REPO + "\\" + c_No);
			FileUtils.deleteDirectory(destDir);
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/community/u_Commu.do"
					+ "';";
			message += "</script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 생겼습니다.');";
			message += " location.href='" + request.getContextPath() + "/community/u_Commu.do"
					+ "';";
			message += "</script>";

			e.printStackTrace();
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();

			MultipartFile mFile = multipartRequest.getFile(fileName);

			imageFileName = mFile.getOriginalFilename();

			File file = new File(COMMUNITY_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);

			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(COMMUNITY_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName));
				}
			}
		} // while
		return imageFileName;
	}// upload
	
}
