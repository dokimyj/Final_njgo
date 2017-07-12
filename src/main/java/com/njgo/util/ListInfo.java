package com.njgo.util;

public class ListInfo {
	private Integer curPage;
	private Integer perPage;
	public Integer getPerPage() {
		if(perPage==null){
			perPage=10;
		}
		return perPage;
	}
	public void setPerPage(Integer perPage) {
		this.perPage = perPage;
	}
	public Integer getCurPage() {
		if(curPage==null){
			curPage=1;
		}
		return curPage;
	}
	public void setCurPage(Integer curPage) {
		this.curPage = curPage;	
	}
	private String search;
	private String find;
	private int startRow;
	private int lastRow;
	public int getStartRow() {
		return startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public void setRow(int curPage, int perPage){
		startRow=(this.getCurPage()-1)*this.getPerPage()+1; //curPage가 null일 수 있기 때문에 이 페이지의 curPage를 가져오도록 this.getCurPage()로.
		lastRow=this.getCurPage()*this.getPerPage();
	}
	private int curBlock;
	private int totalBlock;
	private int startNum;
	private int lastNum;
	
	public int getCurBlock() {
		return curBlock;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public int getStartNum() {
		return startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	
	public void makePage(int totalCount, int perBlock){
		int totalPage=(totalCount-1)/this.getPerPage()+1;
		totalBlock=(totalPage-1)/perBlock+1;
		curBlock=(this.getCurPage()-1)/perBlock+1;
		startNum=(curBlock-1)*perBlock+1;
		lastNum=curBlock*perBlock;
		if(curBlock==totalBlock){
			lastNum=totalPage;
		}
	}

	public String getSearch() {
		if(search==null){
			search="title";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getFind() {
		if(find==null){
			find="%%";
		}
		return find;
	}
	public void setFind(String find) {
		this.find = find;
	}
	
}