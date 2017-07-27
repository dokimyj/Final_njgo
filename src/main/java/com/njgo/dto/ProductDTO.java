package com.njgo.dto;

public class ProductDTO {
	private Integer pronum;
	private String name;
	private int price;
	private int amount;
	private String procode;
	private String cate_major;
	private String cate_minor;
	private String contents;
	private String f_mainimg;
	private String o_mainimg;
	private String f_detailimg;
	private String o_detailimg;
	
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getPronum() {
		return pronum;
	}
	public void setPronum(int pronum) {
		this.pronum = pronum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getProcode() {
		return procode;
	}
	public void setProcode(String procode) {
		this.procode = procode;
	}
	public String getCate_major() {
		return cate_major;
	}
	public void setCate_major(String cate_major) {
		this.cate_major = cate_major;
	}
	public String getCate_minor() {
		return cate_minor;
	}
	public void setCate_minor(String cate_minor) {
		this.cate_minor = cate_minor;
	}
	public String getF_mainimg() {
		return f_mainimg;
	}
	public void setF_mainimg(String f_mainimg) {
		this.f_mainimg = f_mainimg;
	}
	public String getO_mainimg() {
		return o_mainimg;
	}
	public void setO_mainimg(String o_mainimg) {
		this.o_mainimg = o_mainimg;
	}
	public String getF_detailimg() {
		return f_detailimg;
	}
	public void setF_detailimg(String f_detailimg) {
		this.f_detailimg = f_detailimg;
	}
	public String getO_detailimg() {
		return o_detailimg;
	}
	public void setO_detailimg(String o_detailimg) {
		this.o_detailimg = o_detailimg;
	}
	
}
