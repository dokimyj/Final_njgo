package com.njgo.dto;

import java.sql.Date;

public class RankingDTO{
	
	private String foodname;
	private Date MM;
	private int hit;
	private int scrap;
	
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public Date getMM() {
		return MM;
	}
	public void setMM(Date mM) {
		MM = mM;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getScrap() {
		return scrap;
	}
	public void setScrap(int scrap) {
		this.scrap = scrap;
	}
}
