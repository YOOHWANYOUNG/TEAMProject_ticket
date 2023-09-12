package com.forTicket.goods.vo;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("goodsVO")
public class GoodsVO {
	private int goods_id;
	private String goods_type;
	private String goods_genre;
	private String goods_name;
	private Date goods_startDate;
	private Date goods_endDate;
	private String goods_runningTime;
	private String goods_age;
	private int goods_price;
	private int goods_discount;
	private String goods_info;
	private String goods_notice;
	private String goods_place;
	private Timestamp goods_creDate;
	private String mem_id;
	private String goods_seats;
	private String goods_fileName;
	private double goods_avg;
	

	public double getGoods_avg() {
		return goods_avg;
	}
	public void setGoods_avg(double goods_avg) {
		this.goods_avg = goods_avg;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_type() {
		return goods_type;
	}
	public void setGoods_type(String goods_type) {
		this.goods_type = goods_type;
	}
	public String getGoods_genre() {
		return goods_genre;
	}
	public void setGoods_genre(String goods_genre) {
		this.goods_genre = goods_genre;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public Date getGoods_startDate() {
		return goods_startDate;
	}
	public void setGoods_startDate(Date goods_startDate) {
		this.goods_startDate = goods_startDate;
	}
	public Date getGoods_endDate() {
		return goods_endDate;
	}
	public void setGoods_endDate(Date goods_endDate) {
		this.goods_endDate = goods_endDate;
	}
	public String getGoods_runningTime() {
		return goods_runningTime;
	}
	public void setGoods_runningTime(String goods_runningTime) {
		this.goods_runningTime = goods_runningTime;
	}
	public String getGoods_age() {
		return goods_age;
	}
	public void setGoods_age(String goods_age) {
		this.goods_age = goods_age;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_discount() {
		return goods_discount;
	}
	public void setGoods_discount(int goods_discount) {
		this.goods_discount = goods_discount;
	}
	public String getGoods_info() {
		return goods_info;
	}
	public void setGoods_info(String goods_info) {
		this.goods_info = goods_info;
	}
	public String getGoods_notice() {
		return goods_notice;
	}
	public void setGoods_notice(String goods_notice) {
		this.goods_notice = goods_notice;
	}
	public String getGoods_place() {
		return goods_place;
	}
	public void setGoods_place(String goods_place) {
		this.goods_place = goods_place;
	}
	
	public Timestamp getGoods_creDate() {
		return goods_creDate;
	}
	public void setGoods_creDate(Timestamp goods_creDate) {
		this.goods_creDate = goods_creDate;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getGoods_seats() {
		return goods_seats;
	}
	public void setGoods_seats(String goods_seats) {
		this.goods_seats = goods_seats;
	}
	public String getGoods_fileName() {
		return goods_fileName;
	}
	public void setGoods_fileName(String goods_fileName) {
		this.goods_fileName = goods_fileName;
	}
	
	@Override
	public String toString() {
		return "GoodsVO [goods_id=" + goods_id + ", goods_type=" + goods_type + ", goods_genre=" + goods_genre
				+ ", goods_name=" + goods_name + ", goods_startDate=" + goods_startDate + ", goods_endDate="
				+ goods_endDate + ", goods_runningTime=" + goods_runningTime + ", goods_age=" + goods_age
				+ ", goods_price=" + goods_price + ", goods_discount=" + goods_discount + ", goods_info=" + goods_info
				+ ", goods_notice=" + goods_notice + ", goods_place=" + goods_place + ", goods_creDate=" + goods_creDate
				+ ", mem_id=" + mem_id + ", goods_seats=" + goods_seats + ", goods_fileName=" + goods_fileName +" goods_avg =        "+goods_avg+ "]";
	}
	
	
}
