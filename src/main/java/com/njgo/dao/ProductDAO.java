package com.njgo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.ProductDTO;
import com.njgo.util.RowMaker;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "ProductMapper.";
	
	public List<ProductDTO> productList(RowMaker rowMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE + "proList", rowMaker);
	}
	
	public ProductDTO productView(int pronum) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "proView", pronum);
	}
	
	public int productWrite(ProductDTO productDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"proWrite", productDTO);
	}
	
	public int productUpdate(ProductDTO productDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "proUpdate", productDTO);
	}
	
	public void productDelete() throws Exception{
		
	}
	public int productCount(RowMaker rowMaker) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "proCount", rowMaker);
	}
}
