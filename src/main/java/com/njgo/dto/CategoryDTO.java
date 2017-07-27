package com.njgo.dto;

public class CategoryDTO {
	private int recipenum;
	private String c_kind;
	private String c_situation;
	private String c_procedure;
	private String c_ingredient;
	
	public int getRecipenum() {
		return recipenum;
	}
	public void setRecipenum(int recipenum) {
		this.recipenum = recipenum;
	}
	public String getC_kind() {
		if(c_kind.equals("전체")||c_kind==null){
			c_kind="%%";
		}
		return c_kind;
	}
	public void setC_kind(String c_kind) {
		this.c_kind = c_kind;
	}
	public String getC_situation() {
		if(c_situation.equals("전체")||c_situation==null){
			c_situation="%%";
		}
		return c_situation;
	}
	public void setC_situation(String c_situation) {
		this.c_situation = c_situation;
	}
	public String getC_procedure() {
		if(c_procedure.equals("전체")||c_procedure==null){
			c_procedure="%%";
		}
		return c_procedure;
	}
	public void setC_procedure(String c_procedure) {
		this.c_procedure = c_procedure;
	}
	public String getC_ingredient() {
		if(c_ingredient.equals("전체")||c_ingredient==null){
			c_ingredient="%%";
		}
		return c_ingredient;
	}
	public void setC_ingredient(String c_ingredient) {
		this.c_ingredient = c_ingredient;
	}
	
	
}
