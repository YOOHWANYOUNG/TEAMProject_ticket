package com.forTicket.schedule.controller;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ScheduleController {
	public ModelAndView listSchedule(@RequestParam Map<String, String> dateMap, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ModelAndView addScheduleForm(HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ResponseEntity addSchedule(HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ResponseEntity removeSchedule(@RequestParam("s_no") int s_no, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public String getSelectedSchedule(String theater_id, Date s_date) throws Exception;
	
}
