package com.njgo.finalProject;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;

import com.njgo.dao.RecipeDAO;
import com.njgo.util.ListInfo;

public class SqlConTest extends Abstract4Test {

	@Inject
	private RecipeDAO rdao;
	@Test
	public void test() throws Exception{	
		ListInfo listInfo=new ListInfo();
		Assert.assertNotNull(rdao.search(listInfo));
	}
	
}
