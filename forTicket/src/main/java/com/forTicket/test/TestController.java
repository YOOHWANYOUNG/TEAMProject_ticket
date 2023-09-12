package com.forTicket.test;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("testController")
public class TestController {
	
	@RequestMapping(value = "/example/theaterAPITest.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listTheater(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String) req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/example/listEvent.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listEvent(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String) req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
}
