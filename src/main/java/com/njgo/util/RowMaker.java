package com.njgo.util;

public class RowMaker {
	private int startRow;
	private int lastRow;
	private String kind;
	private String search;
	private String cate_major;
	private String cate_minor;
	
	public String getCate_major() {
		
		return cate_major;
	}
	public void setCate_major(String cate_major) {
		if(cate_major == "" || cate_major == null) {
			cate_major = "";
		}
		this.cate_major = cate_major;
	}
	public String getCate_minor() {
		return cate_minor;
	}
	public void setCate_minor(String cate_minor) {
		if(cate_minor == "" || cate_minor == null) {
			cate_minor = "";
		}
		this.cate_minor = cate_minor;
	}
	public void setRow(int curPage, int perPage) {
		startRow = (curPage - 1) * perPage + 1;
		lastRow = curPage * perPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		if(kind == "" || kind == null) {
			kind = "title";
		}
		
		this.kind = kind;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		if(search == null){
			search = "%%";
		}else {
			search = "%" + search + "%";
		}
		
		this.search = search;
	}	
}