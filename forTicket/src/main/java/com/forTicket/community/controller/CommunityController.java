package com.forTicket.community.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.center.vo.QuestionVO;
import com.forTicket.community.vo.CommunityVO;

public interface CommunityController {
	
	//회원 커뮤니티페이지
	public ModelAndView u_Commu(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//리뷰쓰기창 이동 
	public ModelAndView review(@ModelAttribute("order_No") int order_No, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//리뷰 추가
	public ResponseEntity add_review(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	//리뷰 답변페이지
	public ModelAndView reply(@RequestParam("c_No") int c_No, HttpServletRequest req,HttpServletResponse resp) throws Exception;

	//리뷰 답변 추가
	public ResponseEntity update_reply(@ModelAttribute("info") CommunityVO communityVO, HttpServletRequest request, HttpServletResponse response) throws Exception; 
	
	//리뷰 글 삭제
	public ResponseEntity delete(@RequestParam("c_No") int c_No, HttpServletRequest request, HttpServletResponse response) throws Exception; 
}
