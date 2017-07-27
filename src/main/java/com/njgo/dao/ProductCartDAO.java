package com.njgo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.ProductCartDTO;

@Repository
public class ProductCartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "ProductCartMapper.";
	
	public List<ProductCartDTO> cartList(String memberid){
		return sqlSession.selectList(NAMESPACE + "cartList", memberid);
	}
	
	public int cartInsert(ProductCartDTO cartDTO){
		return sqlSession.insert(NAMESPACE + "cartInsert", cartDTO);
	}
	
	public int cartIsEquals(ProductCartDTO cartDTO){
		return sqlSession.selectOne(NAMESPACE + "cartIsEquals", cartDTO);
	}
	
	public int cartUpdateEquals(ProductCartDTO cartDTO){
		return sqlSession.update(NAMESPACE + "cartUpdateEquals", cartDTO);
	}
	
	public int cartDeleteOne(List<Integer> cartList){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", cartList);
		return sqlSession.delete(NAMESPACE + "cartDeleteOne", map);
	}
}
