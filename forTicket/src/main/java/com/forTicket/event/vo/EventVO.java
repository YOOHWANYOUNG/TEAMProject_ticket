package com.forTicket.event.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("eventVO")
public class EventVO {
	private int event_no;
	private String event_name;
	private Date event_startDate;
	private Date event_endDate;
	private String event_type;
	private String event_detail;
	private String event_status;
	private String mem_id;
	private Date event_finalDate;
	private Date event_creDate;
	private int goods_id;
	private String goods_name;
	private int goods_discount;
	private String event_fileName;
	
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public Date getEvent_startDate() {
		return event_startDate;
	}
	public void setEvent_startDate(Date event_startDate) {
		this.event_startDate = event_startDate;
	}
	public Date getEvent_endDate() {
		return event_endDate;
	}
	public void setEvent_endDate(Date event_endDate) {
		this.event_endDate = event_endDate;
	}
	public String getEvent_type() {
		return event_type;
	}
	public void setEvent_type(String event_type) {
		this.event_type = event_type;
	}
	public String getEvent_detail() {
		return event_detail;
	}
	public void setEvent_detail(String event_detail) {
		this.event_detail = event_detail;
	}
	public String getEvent_status() {
		return event_status;
	}
	public void setEvent_status(String event_status) {
		this.event_status = event_status;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getEvent_finalDate() {
		return event_finalDate;
	}
	public void setEvent_finalDate(Date event_finalDate) {
		this.event_finalDate = event_finalDate;
	}
	public Date getEvent_creDate() {
		return event_creDate;
	}
	public void setEvent_creDate(Date event_creDate) {
		this.event_creDate = event_creDate;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getGoods_discount() {
		return goods_discount;
	}
	public void setGoods_discount(int goods_discount) {
		this.goods_discount = goods_discount;
	}
	public String getEvent_fileName() {
		return event_fileName;
	}
	public void setEvent_fileName(String event_fileName) {
		this.event_fileName = event_fileName;
	}
	
	
}
