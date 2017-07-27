package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.ProductDAO;
import com.njgo.dto.ProductDTO;
import com.njgo.util.RowMaker;

@Service
public class ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	public List<ProductDTO> productList(RowMaker rowMaker) throws Exception{
		return productDAO.productList(rowMaker);
	}
	
	public ProductDTO productView(int pronum) throws Exception{
		return productDAO.productView(pronum);
	}
	
	public int productWrite(ProductDTO productDTO) throws Exception{
		return productDAO.productWrite(productDTO);
	}
	
	public int productUpdate(ProductDTO productDTO) throws Exception{
		return productDAO.productUpdate(productDTO);
	}
	
	public int productCount(RowMaker rowMaker) throws Exception{
		return productDAO.productCount(rowMaker);
	}
}
