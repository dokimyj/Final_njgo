package com.njgo.dto;

public class IngredientsDTO {
	private int recipenum;
	private String name;
	private String amount;
	
	public int getRecipenum() {
		return recipenum;
	}
	public void setRecipenum(int recipenum) {
		this.recipenum = recipenum;
	}
	public String getName() {
		if(name==null){
			name="%%";
		}
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
}
