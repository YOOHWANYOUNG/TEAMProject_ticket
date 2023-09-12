package com.forTicket.schedule.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.schedule.vo.ScheduleVO;

@Mapper
@Repository("scheduleDAO")
public interface ScheduleDAO {
	public ArrayList<ScheduleVO> selectSchedule(Map scMap) throws DataAccessException;
	public ArrayList<ScheduleVO> selectSchedule_order(Map scMap) throws DataAccessException;
	public ArrayList<ScheduleVO> selectScheduleByGoods(Map param) throws DataAccessException;
	public ArrayList<ScheduleVO> selectAllSchedule(Map param) throws DataAccessException;
	public void insertSchedule(Map scMap) throws DataAccessException;
	public void deleteSchedule(int s_no) throws DataAccessException;
	public void newOrder(@Param("s_no") int s_no, @Param("seats") int seats) throws DataAccessException;
	public void cancelOrder(@Param("s_no") int s_no, @Param("seats") int seats) throws DataAccessException;
	public int totalSchedule() throws DataAccessException;
	public int totalScheduleById(String mem_id) throws DataAccessException;
}
