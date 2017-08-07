package com.njgo.dto;

import java.security.Timestamp;
import java.sql.Date;

public class MessageDTO {
	
	private int m_num;
	private String title;
	private String contents;
	private String send_nickName;
	private String get_nickName;
	private Date send_time;
	private String category;
	private int status ;
	
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getSend_nickName() {
		return send_nickName;
	}
	public void setSend_nickName(String send_nickName) {
		this.send_nickName = send_nickName;
	}
	public String getGet_nickName() {
		return get_nickName;
	}
	public void setGet_nickName(String get_nickName) {
		this.get_nickName = get_nickName;
	}
	public Date getSend_time() {
		return send_time;
	}
	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	

}
