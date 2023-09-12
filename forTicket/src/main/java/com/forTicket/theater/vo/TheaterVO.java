package com.forTicket.theater.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("theaterVO")
public class TheaterVO {
	private int theater_id;
	private String theater_name;
	private String theater_detail;
	private String theater_address;
	private String theater_image;
	private Date theater_creDate;
	private String theater_cat;
	private int theater_seats;
	private String theater_lat;
	private String theater_long;
	
	public int getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getTheater_detail() {
		return theater_detail;
	}
	public void setTheater_detail(String theater_detail) {
		this.theater_detail = theater_detail;
	}
	public String getTheater_address() {
		return theater_address;
	}
	public void setTheater_address(String theater_address) {
		this.theater_address = theater_address;
	}
	public String getTheater_image() {
		return theater_image;
	}
	public void setTheater_image(String theater_image) {
		this.theater_image = theater_image;
	}
	public Date getTheater_creDate() {
		return theater_creDate;
	}
	public void setTheater_creDate(Date theater_creDate) {
		this.theater_creDate = theater_creDate;
	}
	public String getTheater_cat() {
		return theater_cat;
	}
	public void setTheater_cat(String theater_cat) {
		this.theater_cat = theater_cat;
	}
	public int getTheater_seats() {
		return theater_seats;
	}
	public void setTheater_seats(int theater_seats) {
		this.theater_seats = theater_seats;
	}
	public String getTheater_lat() {
		return theater_lat;
	}
	public void setTheater_lat(String theater_lat) {
		this.theater_lat = theater_lat;
	}
	public String getTheater_long() {
		return theater_long;
	}
	public void setTheater_long(String theater_long) {
		this.theater_long = theater_long;
	}
	
	
}
