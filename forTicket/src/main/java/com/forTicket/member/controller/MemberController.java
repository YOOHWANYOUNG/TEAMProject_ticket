package com.forTicket.member.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.forTicket.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView insertMember(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView insertbusiness(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView findIdResult(String mem_name, String phone, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateMember(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView b_updateMember(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView m_Edit(@RequestParam("mem_id") String mem_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map<String, Object> kakaoLoginPro(@RequestParam Map<String, Object> paramMap, HttpSession session) throws SQLException, Exception;
	public ModelAndView b_Edit(@RequestParam("mem_id") String mem_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
}