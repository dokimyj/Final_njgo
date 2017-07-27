package com.njgo.dto;

public class ProductCartDTO {
	private int cartid;
	private int pronum;
	private String memberid;
	private int amount;
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	public int getPronum() {
		return pronum;
	}
	public void setPronum(int pronum) {
		this.pronum = pronum;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
