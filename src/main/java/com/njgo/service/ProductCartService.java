package com.njgo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njgo.dao.ProductCartDAO;
import com.njgo.dto.ProductCartDTO;

@Service
public class ProductCartService {
	@Autowired
	private ProductCartDAO productCartDAO;
	
	public int cartInsert(ProductCartDTO cartDTO){
		return productCartDAO.cartInsert(cartDTO);
	}
	
	public List<ProductCartDTO> cartList(String memberid){
		return productCartDAO.cartList(memberid);
	}
	
	public int cartIsEquals(ProductCartDTO cartDTO){
		return productCartDAO.cartIsEquals(cartDTO);
	}
	
	public int cartUpdateEquals(ProductCartDTO cartDTO){
		return productCartDAO.cartUpdateEquals(cartDTO);
	}
	
	public int cartDeleteOne(List<Integer> cartList){
		return productCartDAO.cartDeleteOne(cartList);
	}
}
