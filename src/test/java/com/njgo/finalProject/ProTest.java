package com.njgo.finalProject;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.njgo.dao.ProductCartDAO;
import com.njgo.dao.ProductDAO;
import com.njgo.dto.ProductCartDTO;
import com.njgo.dto.ProductDTO;
import com.njgo.service.ProductService;
import com.njgo.util.MakePage;
import com.njgo.util.PageMaker;
import com.njgo.util.RowMaker;

public class ProTest extends Abstract4Test{
	@Autowired
	private ProductCartDAO cartDAO;
	//private ProductService productService;
	
	@Test
	public void test() throws Exception{
		/*ProductDTO productDTO = new ProductDTO();
		productDTO.setName("스팸 마일드 200g");
		productDTO.setPrice(3680);
		productDTO.setAmount(20);
		productDTO.setProcode("30100003");
		productDTO.setCate_major("가공식품");
		productDTO.setCate_minor("반찬류");
		productDTO.setContents("돼지고기92.44%(수입산,국산),정제수,정제소금(국산),비타민C,백설탕,아질산나트륨(발색제),카라기난,혼합제제(산도조절제)");
		productDTO.setF_mainimg("30100001.jpg");
		productDTO.setO_mainimg("30100001.jpg");
		productDTO.setF_detailimg("30100001.jpg");
		productDTO.setO_detailimg("30100001.jpg");
		int result = productService.productWrite(productDTO);*/
		
		/*PageMaker pageMaker = new PageMaker(16, 1);
		RowMaker rowMaker = pageMaker.getRowMaker("가공식품", "반찬류", null);
		int totalCount = productService.productCount(rowMaker);
		MakePage makePage = pageMaker.getMakePage(totalCount);
		List<ProductDTO> list = productService.productList(rowMaker);
		assertEquals(3, totalCount);*/
		
		/*List<Integer> cartList = new ArrayList<Integer>();
		cartList.add(5);
		cartList.add(6);
		cartDAO.cartDeleteOne(cartList);*/
		
		List<ProductCartDTO> list = new ArrayList<ProductCartDTO>();
		list = cartDAO.cartList("sss");
		assertEquals(0, list.size());
	}

}
