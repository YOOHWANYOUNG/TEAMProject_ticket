package com.forTicket.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String mem_id;
	private String pwd;
	private String mem_name;
	private String email;
	private String phone;
	private String post;
	private String addr1;
	private String addr2;
	private String b_number;
	private String b_name;
	private String b_phone;
	private String checkbox;
	private String type;
	private String api;
	private String snsid;
	
	
	public String getApi() {
		return api;
	}
	public void setApi(String api) {
		this.api = api;
	}
	public String getSnsid() {
		return snsid;
	}
	public void setSnsid(String snsid) {
		this.snsid = snsid;
	}

	private Date joinDate;
	
	
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPost() {
		return post;
	}
	
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getB_number() {
		return b_number;
	}
	public void setB_number(String b_number) {
		this.b_number = b_number;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getCheckbox() {
		return checkbox;
	}
	public void setCheckbox(String checkbox) {
		this.checkbox = checkbox;
	}
	
	public String getType() {
		return type;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getB_phone() {
		return b_phone;
	}
	public void setB_phone(String b_phone) {
		this.b_phone = b_phone;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "MemberVO [mem_id=" + mem_id + ", pwd=" + pwd + ", mem_name=" + mem_name + ", email=" + email
				+ ", phone=" + phone + ", post=" + post + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", b_number=" + b_number + ", b_name=" + b_name + ", b_phone=" + b_phone + ", checkbox=" + checkbox + ", type=" + type + ", joinDate="
				+ joinDate + "]";
	}
	

	
}
