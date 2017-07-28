package com.njgo.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.njgo.dto.CategoryDTO;
import com.njgo.dto.HashtagDTO;
import com.njgo.dto.IngredientsDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.dto.ScrapDTO;
import com.njgo.dto.StepsDTO;
import com.njgo.util.ListInfo;

@Repository
public class RecipeDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="recipeMapper.";
	
	public HashMap<String, Object> view(Integer num) throws Exception{
		RecipeDTO recipeDTO=sqlSession.selectOne(NAMESPACE+"rview", num);
		List<IngredientsDTO> ingredients=sqlSession.selectList(NAMESPACE+"iview", num);
		List<StepsDTO> steps=sqlSession.selectList(NAMESPACE+"sview", num);
		List<HashtagDTO> tags=sqlSession.selectList(NAMESPACE+"tview", num);
		HashMap<String, Object> recipe=new HashMap<String, Object>();
		recipe.put("recipeDTO", recipeDTO);
		recipe.put("ingredients", ingredients);
		recipe.put("steps", steps);
		recipe.put("hashtags", tags);
		return recipe;
	}
	
	public HashMap<String, Object> list(ListInfo listInfo){
		listInfo.setRow(listInfo.getCurPage(), 9);
		Integer totalCount=sqlSession.selectOne(NAMESPACE+"totalcount", listInfo);
		listInfo.makePage(totalCount, 10);
		HashMap<String, Object> listPack=new HashMap<String, Object>();
		listPack.put("listInfo", listInfo);
		listPack.put("listPack", sqlSession.selectList(NAMESPACE+"list", listInfo)); 
		listPack.put("totalCount", totalCount);
		return listPack;
	}
	
	private HashMap<String, Object> search(ListInfo listInfo, List<Integer> result){
		if(result.size()==0){
			result.add(0);
		}
		Integer totalCount=sqlSession.selectOne(NAMESPACE+"searchcount", result);
		listInfo.setRow(listInfo.getCurPage(), 9);
		listInfo.makePage(totalCount, 10);
		HashMap<String, Object> searchresult=new HashMap<String, Object>();
		searchresult.put("collection", result);
		searchresult.put("listInfo", listInfo);
		List<RecipeDTO> rdtoList=sqlSession.selectList(NAMESPACE+"search", searchresult);
		searchresult.put("totalCount", totalCount);
		searchresult.put("listPack", rdtoList);
		List<RecipeDTO> tvList=sqlSession.selectList(NAMESPACE+"tvsearch", searchresult);
		searchresult.put("tvlist", tvList);
		return searchresult;
	}
	
	public HashMap<String, Object> search(ListInfo listInfo){
		List<Integer> result=sqlSession.selectList(NAMESPACE+"hsearch1", listInfo);
		List<Integer> tresult=sqlSession.selectList(NAMESPACE+"rsearch1", listInfo);
		List<Integer> iresult=sqlSession.selectList(NAMESPACE+"isearch1", listInfo);
		result.addAll(tresult);
		result.addAll(iresult);
		return this.search(listInfo, result);
	}
	
	public HashMap<String, Object> catesearch(CategoryDTO category, List<IngredientsDTO> collection, ListInfo listInfo){
		List<Integer> result=sqlSession.selectList(NAMESPACE+"catesearch", category);
		List<Integer> hresult=sqlSession.selectList(NAMESPACE+"hsearch1", listInfo);
		List<Integer> tresult=sqlSession.selectList(NAMESPACE+"rsearch1", listInfo);
		List<Integer> iresult=sqlSession.selectList(NAMESPACE+"isearch1", listInfo);
		List<Integer> ingresult=sqlSession.selectList(NAMESPACE+"ingsearch", collection);
		result.addAll(hresult);
		result.addAll(tresult);
		result.addAll(iresult);
		result.addAll(ingresult);
		return this.search(listInfo, result);
	}
	
	public List<IngredientsDTO> ingList(String find){
		return sqlSession.selectList(NAMESPACE+"inglist", find);
	}
	
	public HashMap<String, Object> isearch(List<IngredientsDTO> collection, ListInfo listInfo){
		List<Integer> result=sqlSession.selectList(NAMESPACE+"ingsearch", collection);
		return this.search(listInfo, result);
	}
	
	public HashMap<String, Object> writersearch(String writer, ListInfo listInfo){
		List<Integer> result=sqlSession.selectList(NAMESPACE+"writersearch", writer);
		return this.search(listInfo, result);
	}
	
	public HashMap<String, Object> scrapsearch(String nickname, ListInfo listInfo){
		List<Integer> result=sqlSession.selectList(NAMESPACE+"scrapsearch", nickname);
		return this.search(listInfo, result);
	}
	
	public int scrapIncrease(ScrapDTO scrapDTO){ //scrapDTO의 닉네임은 session에서 받아오고, RecipeNum은 해당 넘버의 타이틀을 받으면 됨. 정상적으로 돌아갔다면 리턴값은 2
		int result=sqlSession.insert(NAMESPACE+"scrapAdd", scrapDTO);
		result+=sqlSession.update(NAMESPACE+"scrapI", scrapDTO.getRecipenum());
		return result;
	}
	
	public int scrapDecrease(ScrapDTO scrapDTO){ //scrapDTO의 닉네임은 session에서 받아오고, RecipeNum은 해당 넘버의 타이틀을 받으면 됨. 정상적으로 돌아갔다면 리턴값은 2
		int result=sqlSession.delete(NAMESPACE+"scrapSub", scrapDTO);
		result+=sqlSession.update(NAMESPACE+"scrapD", scrapDTO.getRecipenum());
		return result;
	}
}
