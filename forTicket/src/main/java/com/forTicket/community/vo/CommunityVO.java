package com.forTicket.community.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("communityVO")
public class CommunityVO {
	private int c_No;
	private int order_No;
	private String mem_id;
	private String c_title;
	private String c_content;
	private Date c_date;
	private int star;
	private String imageFileName;
	private String c_reply;
	private Date c_replydate;
	private int goods_id;
			
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getC_No() {
		return c_No;
	}
	public void setC_No(int c_No) {
		this.c_No = c_No;
	}
	
	public int getOrder_No() {
		return order_No;
	}
	public void setOrder_No(int order_No) {
		this.order_No = order_No;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getC_reply() {
		return c_reply;
	}
	public void setC_reply(String c_reply) {
		this.c_reply = c_reply;
	}
	public Date getC_replydate() {
		return c_replydate;
	}
	public void setC_replydate(Date c_replydate) {
		this.c_replydate = c_replydate;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	
}