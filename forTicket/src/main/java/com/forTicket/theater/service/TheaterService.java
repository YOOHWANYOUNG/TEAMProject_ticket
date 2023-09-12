package com.forTicket.theater.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.forTicket.theater.vo.TheaterVO;


public interface TheaterService {
	public List listTheaters() throws DataAccessException;
	public TheaterVO theaterInfo(int theater_id) throws DataAccessException;
	public int addTheater(Map theaterMap) throws DataAccessException;
	public int modTheater(Map theaterMap) throws DataAccessException;
	public int removeTheater(int theater_id) throws DataAccessException;
}
