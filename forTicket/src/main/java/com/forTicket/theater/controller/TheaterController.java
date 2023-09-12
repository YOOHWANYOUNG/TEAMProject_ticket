package com.forTicket.theater.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface TheaterController {
	public ModelAndView listTheater(HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ModelAndView detailTheater(@RequestParam("theater_id") int id, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ResponseEntity addTheater(MultipartHttpServletRequest multipartReq, HttpServletResponse resp) throws Exception;
	public ResponseEntity removeTheater(@RequestParam("id") int id, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ModelAndView modForm(@RequestParam("id") int id, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ResponseEntity modTheater(MultipartHttpServletRequest multipartReq, HttpServletResponse resp) throws Exception;
}
