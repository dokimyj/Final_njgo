package com.njgo.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private String email;
	private String kakaoID;
	private String pw;
	private String nickName;
	private String grade;
	private int point;
	private String info;
	private String myPhoto;
	private String address;
	private String name;
	private String phone;
	private int w_count;
	private Timestamp joint_date;
	private String joinCode;
	private String login_mode;
	private String sns_photo;
	
	
	public String getSns_photo() {
		return sns_photo;
	}
	public void setSns_photo(String sns_photo) {
		this.sns_photo = sns_photo;
	}
	public String getLogin_mode() {
		return login_mode;
	}
	public void setLogin_mode(String login_mode) {
		this.login_mode = login_mode;
	}
	public String getJoinCode() {
		return joinCode;
	}
	public void setJoinCode(String joinCode) {
		this.joinCode = joinCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getKakaoID() {
		return kakaoID;
	}
	public void setKakaoID(String kakaoID) {
		this.kakaoID = kakaoID;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getMyPhoto() {
		return myPhoto;
	}
	public void setMyPhoto(String myPhoto) {
		this.myPhoto = myPhoto;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getW_count() {
		return w_count;
	}
	public void setW_count(int w_count) {
		this.w_count = w_count;
	}
	public Timestamp getJoint_date() {
		return joint_date;
	}
	public void setJoint_date(Timestamp joint_date) {
		this.joint_date = joint_date;
	}
	
	
	
	
	
}
