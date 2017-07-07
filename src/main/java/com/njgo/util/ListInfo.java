package com.njgo.util;

public class ListInfo {
	private Integer curPage;
	private Integer perPage;
<<<<<<< HEAD

	//row
	private String search;
	private String find;
	private int startRow;
	private int lastRow;

	//page
	private int totalBlock;
	private int curBlock;
	private int startNum;
	private int lastNum;


	//page
	public void makePage(int totalCount){
		//1. totalCount
		//2. totalPage
		int totalPage=0;
		int perBlock=5;
		if(totalCount%this.getPerPage()==0){
			totalPage=totalCount/this.getPerPage();
		}else {
			totalPage=totalCount/this.getPerPage()+1;
		}
		//3. totalBlock
		if(totalPage%perBlock==0){
			this.totalBlock=totalPage/perBlock;
		}else {
			this.totalBlock=totalPage/perBlock+1;
		}
		//4. curBlock
		if(this.getCurPage()%perBlock==0){
			this.curBlock=this.getCurPage()/perBlock;
		}else {
			this.curBlock=this.getCurPage()/perBlock+1;
		}
		//5. startNum, lastNum
		this.startNum=(this.curBlock-1)*perBlock+1;
		this.lastNum=this.curBlock*perBlock;
		if(this.curBlock==this.totalBlock){
			this.lastNum=totalPage;
		}
	}





	public int getTotalBlock() {
		return totalBlock;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public int getStartNum() {
		return startNum;
	}


	public int getLastNum() {
		return lastNum;
	}





	//makeRow
	public void makeRow(){
		startRow=(this.getCurPage()-1)*this.getPerPage()+1;
		lastRow=this.getCurPage()*this.getPerPage();
	}


	public int getStartRow() {
		return startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
=======
>>>>>>> master
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
<<<<<<< HEAD
		this.curPage = curPage;
	}
	public String getSearch() {
=======
		this.curPage = curPage;	
	}
	private String search;
	private String find;
	private int firstRow;
	private int lastRow;
	public int getFirstRow() {
		return firstRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public void setRow(int curPage, int perPage){
		firstRow=(this.getCurPage()-1)*this.getPerPage()+1; //curPage가 null일 수 있기 때문에 이 페이지의 curPage를 가져오도록 this.getCurPage()로.
		lastRow=this.getCurPage()*this.getPerPage();
	}
	private int curBlock;
	private int totalBlock;
	private int firstNum;
	private int lastNum;
	
	public int getCurBlock() {
		return curBlock;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public int getFirstNum() {
		return firstNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	
	public void makePage(int totalCount, int perBlock){
		int totalPage=(totalCount-1)/this.getPerPage()+1;
		totalBlock=(totalPage-1)/perBlock+1;
		curBlock=(this.getCurPage()-1)/perBlock+1;
		firstNum=(curBlock-1)*perBlock+1;
		lastNum=curBlock*perBlock;
		if(curBlock==totalBlock){
			lastNum=totalPage;
		}
	}

	public String getSearch() {
		if(search==null){
			search="title";
		}
>>>>>>> master
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getFind() {
<<<<<<< HEAD
=======
		if(find==null){
			find="%%";
		}
>>>>>>> master
		return find;
	}
	public void setFind(String find) {
		this.find = find;
	}
<<<<<<< HEAD

=======
	
>>>>>>> master
}
