package com.forTicket.member.vo;

import org.springframework.stereotype.Component;

@Component("mailDTO")
public class MailDTO {
    private String address;
    public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	private String title;
    private String message;
}
