package com.forTicket.center.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("centerVO")
public class CenterVO {
	private int center_No;
	private int type_No;
	private String mem_id;
	private String center_Type;
	private String center_Title;
	private String center_Detail;
	private Date center_creDate;
	private Date center_update;
	
	public int getType_No() {
		return type_No;
	}
	public void setType_No(int type_No) {
		this.type_No = type_No;
	}
	public int getCenter_No() {
		return center_No;
	}
	public void setCenter_No(int center_No) {
		this.center_No = center_No;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getCenter_Type() {
		return center_Type;
	}
	public void setCenter_Type(String center_Type) {
		this.center_Type = center_Type;
	}
	public String getCenter_Title() {
		return center_Title;
	}
	public void setCenter_Title(String center_Title) {
		this.center_Title = center_Title;
	}
	public String getCenter_Detail() {
		return center_Detail;
	}
	public void setCenter_Detail(String center_Detail) {
		this.center_Detail = center_Detail;
	}
	public Date getCenter_creDate() {
		return center_creDate;
	}
	public void setCenter_creDate(Date center_creDate) {
		this.center_creDate = center_creDate;
	}
	public Date getCenter_update() {
		return center_update;
	}
	public void setCenter_update(Date center_update) {
		this.center_update = center_update;
	}
	
	@Override
	public String toString() {
		return "CenterVO [center_No=" + center_No + ", mem_id=" + mem_id + ", center_Type=" + center_Type
				+ ", center_Title=" + center_Title + ", center_Detail=" + center_Detail + ", center_creDate="
				+ center_creDate + ", center_update=" + center_update + "]";
	}
	
}
