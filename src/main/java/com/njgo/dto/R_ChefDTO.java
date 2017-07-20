package com.njgo.dto;

import java.sql.Timestamp;

public class R_ChefDTO{
	
	private String nicname;
	private Timestamp regdate;
	private String rep_pic;
	private int u_count;
	
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp timestamp) {
		this.regdate = timestamp;
	}
	public String getRep_pic() {
		return rep_pic;
	}
	public void setRep_pic(String rep_pic) {
		this.rep_pic = rep_pic;
	}
	public int getU_count() {
		return u_count;
	}
	public void setU_count(int u_count) {
		this.u_count = u_count;
	}
}
