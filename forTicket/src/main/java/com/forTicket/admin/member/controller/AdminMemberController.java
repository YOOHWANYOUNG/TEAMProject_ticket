package com.forTicket.admin.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.forTicket.member.vo.MemberVO;

public interface AdminMemberController {
	//관리자 회원관리
	public ModelAndView a_Profile(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;

	//관리자 사업자관리
	public ModelAndView a_ProfileBus(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;

	//회원 삭제
	public ResponseEntity deleteMember(@RequestParam("mem_id") String mem_id, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//사업자 삭제
	public ResponseEntity deleteBus(@RequestParam("mem_id") String b_name, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
		
	//회원 수정이동 페이지 이동, memberVO값 가져오기
	public ModelAndView a_Edit(@RequestParam("mem_id") String mem_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//사업자 수정이동 페이지 이동, memberVO값 가져오기
	public ModelAndView a_EditBus(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//회원 수정
	public ResponseEntity a_Update(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//사업자 수정
	public ResponseEntity a_UpdateBus(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
