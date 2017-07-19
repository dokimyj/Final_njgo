package com.njgo.dto;
import java.sql.Timestamp;

public class MemberDTO{
	
	private String email;
	private String kakaoid;
	private String pw;
	private String nicname;
	private String grade;
	private int point;
	private String info;
	private String myphoto;
	private String address;
	private String name;
	private String phone;
	private String w_count;
	private Timestamp join_date;
	private String joincode;
	private int u_count;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getKakaoid() {
		return kakaoid;
	}
	public void setKakaoid(String kakaoid) {
		this.kakaoid = kakaoid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
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
	public String getMyphoto() {
		return myphoto;
	}
	public void setMyphoto(String myphoto) {
		this.myphoto = myphoto;
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
	public String getW_count() {
		return w_count;
	}
	public void setW_count(String w_count) {
		this.w_count = w_count;
	}
	public Timestamp getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}
	public String getJoincode() {
		return joincode;
	}
	public void setJoincode(String joincode) {
		this.joincode = joincode;
	}
	public int getU_count() {
		return u_count;
	}
	public void setU_count(int u_count) {
		this.u_count = u_count;
	}
	
}
