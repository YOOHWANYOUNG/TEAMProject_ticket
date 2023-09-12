package com.forTicket.schedule.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.goods.dao.GoodsDAO;
import com.forTicket.goods.vo.GoodsVO;
import com.forTicket.schedule.dao.ScheduleDAO;
import com.forTicket.schedule.vo.ScheduleVO;
import com.forTicket.theater.dao.TheaterDAO;
import com.google.gson.Gson;

@Service("scheduleService")
@Transactional(propagation = Propagation.REQUIRED)
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleDAO scheduleDAO;
	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private TheaterDAO theaterDAO;
	
	@Override
	public String getSelectedSchedule(Map scMap) throws DataAccessException {
		ArrayList<ScheduleVO> idAndDate = scheduleDAO.selectSchedule(scMap);
		Gson gson = new Gson();
		String idAndDate_json = gson.toJson(idAndDate);
		return idAndDate_json;
	}
	
	@Override
	public String getSelectedSchedule_order(Map scMap) throws DataAccessException {
		ArrayList<ScheduleVO> idAndDate = scheduleDAO.selectSchedule_order(scMap);
		Gson gson = new Gson();
		String idAndDate_json = gson.toJson(idAndDate);
		return idAndDate_json;
	}

	@Override
	public ArrayList listSchedule(Map param) throws DataAccessException {
		ArrayList scheduleList = scheduleDAO.selectScheduleByGoods(param);
		return scheduleList;
	}

	@Override
	public ArrayList listAdmin(Map param) throws DataAccessException {
		ArrayList scheduleList = scheduleDAO.selectAllSchedule(param);
		return scheduleList;
	}

	@Override
	public void addSchedule(Map scMap) throws DataAccessException {
		scheduleDAO.insertSchedule(scMap);
	}

	@Override
	public void removeSchedule(int s_no) throws DataAccessException {
		scheduleDAO.deleteSchedule(s_no);
	}

	@Override
	public int totalScheduleNum() throws DataAccessException {
		int totalSchedule = scheduleDAO.totalSchedule();
		return totalSchedule;
	}

	@Override
	public int totalScheduleNumById(String mem_id) throws DataAccessException {
		int totalSchedule = scheduleDAO.totalScheduleById(mem_id);
		return totalSchedule;
	}

	
}
