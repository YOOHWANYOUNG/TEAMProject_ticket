package com.forTicket.event.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.event.dao.EventDAO;
import com.forTicket.event.vo.E_imageFileVO;
import com.forTicket.event.vo.EventVO;
import com.forTicket.goods.dao.GoodsDAO;

@Service("eventService")
@Transactional(propagation = Propagation.REQUIRED)
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO eventDAO;
	
	@Autowired
	private GoodsDAO goodsDAO;
	
	@Override
	public List listEvents() throws DataAccessException {
		List eventList = eventDAO.selectAllEventList();
		return eventList;
	}

	@Override
	public List A_listEvents(Map condMap) throws DataAccessException {
		List eventList = eventDAO.selectAdminEventList(condMap);
		return eventList;
	}

	@Override
	public List B_listEvents(Map condMap) throws DataAccessException {
		List eventList = eventDAO.selectBusinessEventList(condMap);
		return eventList;
	}

	@Override
	public Map eventInfo(int event_no) throws DataAccessException {
		Map eventMap = new HashMap();
		EventVO eventVO = eventDAO.selectEventDetail(event_no);
		List imageFileList = eventDAO.selectEventImageFileList(event_no);
		eventMap.put("event", eventVO);
		eventMap.put("imageFileList", imageFileList);
		return eventMap;
	}
	
	@Override
	public Map eventDetail(int event_no) throws DataAccessException {
		Map eventMap = new HashMap();
		EventVO eventVO = eventDAO.selectEventDetail(event_no);
		List imageFileList = eventDAO.selectEventImageFileList_2(event_no);
		eventMap.put("event", eventVO);
		eventMap.put("imageFileList", imageFileList);
		return eventMap;
	}

	@Override
	public int addEvent(Map eventMap) throws DataAccessException {
		eventDAO.insertEvent(eventMap);
		goodsDAO.updateDisc(eventMap);
		int event_no = eventDAO.selectEventNo(eventMap);
		ArrayList<E_imageFileVO> imageFileList = (ArrayList) eventMap.get("imageFileList");
		for(E_imageFileVO imageFileVO : imageFileList) {
			imageFileVO.setEvent_no(event_no);
			eventDAO.insertEventImage(imageFileVO);
		}
		return event_no;
	}

	@Override
	public void modEvent(Map eventMap) throws DataAccessException {
		eventDAO.updateEvent(eventMap);
		goodsDAO.updateDisc(eventMap);
	}

	@Override
	public void modEventStatus(Map eventMap) throws DataAccessException {
		eventDAO.updateEventStatus(eventMap);
	}

	@Override
	public void removeEvent(int event_no) throws DataAccessException {
		eventDAO.deleteEvent(event_no);
	}

	@Override
	public void addEventImage(List imageFileList) throws DataAccessException {
		for(int i=0; i<imageFileList.size();i++) {
			E_imageFileVO imageFileVO = (E_imageFileVO) imageFileList.get(i);
			eventDAO.insertEventImage(imageFileVO);
		}
	}

	@Override
	public void modEventImage(List imageFileList) throws DataAccessException {
		for(int i=0; i<imageFileList.size();i++) {
			E_imageFileVO imageFileVO = (E_imageFileVO) imageFileList.get(i);
			eventDAO.updateEventImage(imageFileVO);
		}
	}

	@Override
	public void removeEventImage(int image_id) throws DataAccessException {
		eventDAO.deleteEventImage(image_id);
	}

	@Override
	public void removeAllEventImage(int event_no) throws DataAccessException {
		eventDAO.deleteAllEventImage(event_no);
	}

	@Override
	public void eventApply(Map condMap) throws DataAccessException {
		eventDAO.insertEventApply(condMap);
	}

	@Override
	public int totalEventNum() throws DataAccessException {
		int totalEventNum = eventDAO.totalEvent();
		return totalEventNum;
	}

	@Override
	public int totalEventNumById(String mem_id) throws DataAccessException {
		int totalEventNum = eventDAO.totalEventById(mem_id);
		return totalEventNum;
	}
	
}
