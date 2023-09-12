package com.forTicket.event.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.forTicket.event.vo.EventVO;
import com.forTicket.event.vo.E_imageFileVO;

public interface EventService {
	public List listEvents() throws DataAccessException;
	public List A_listEvents(Map condMap) throws DataAccessException;
	public List B_listEvents(Map condMap) throws DataAccessException;
	public Map eventInfo(int event_no) throws DataAccessException;
	public Map eventDetail(int event_no) throws DataAccessException;
	public int addEvent(Map eventMap) throws DataAccessException;
	public void modEvent(Map eventMap) throws DataAccessException;
	public void modEventStatus(Map eventMap) throws DataAccessException;
	public void removeEvent(int event_no) throws DataAccessException;
	public void addEventImage(List imageFileList) throws DataAccessException;
	public void modEventImage(List imageFileList) throws DataAccessException;
	public void removeEventImage(int image_id) throws DataAccessException;
	public void removeAllEventImage(int goods_id) throws DataAccessException;
	public void eventApply(Map condMap) throws DataAccessException;
	public int totalEventNum() throws DataAccessException;
	public int totalEventNumById(String mem_id) throws DataAccessException;
}
