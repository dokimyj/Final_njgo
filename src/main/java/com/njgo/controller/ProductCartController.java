package com.njgo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.ProductCartDTO;
import com.njgo.dto.ProductDTO;
import com.njgo.service.ProductCartService;
import com.njgo.service.ProductService;
import com.njgo.util.CookieUtils;

@Controller
@RequestMapping(value = "/product/cart/**")
public class ProductCartController {
	
	@Autowired
	private ProductCartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "productCart")
	public void productCart() throws Exception{
	}
	
	@RequestMapping(value = "cartNMInsert")
	public String cartNMInsert(ProductCartDTO cartDTO, HttpServletRequest request, HttpServletResponse response) throws Exception{		
		CookieUtils cu = new CookieUtils();
		if(cu.isExist("cartId", request)){
			//쿠키에 장바구니가 있을 때
			String cartVal = cu.getValue("cartId", request);
			cartDTO.setMemberid(cartVal);				//멤버아이디에 쿠키값 넣기
			if(cartService.cartIsEquals(cartDTO)>0){
				//동일한 상품이 장바구니에 있을 때, 수량 변경
				cartService.cartUpdateEquals(cartDTO);
			}else{
				cartService.cartInsert(cartDTO);
				
			}
		}else{
			//쿠키에 장바구니가 없을 때 (쿠키 생성)
			String randomVal = RandomStringUtils.randomAlphanumeric(8);
			cu.createNewCookie("cartId", randomVal, 1, request, response);
			cartDTO.setMemberid(randomVal);
			cartService.cartInsert(cartDTO);
		}
		return "product/cart/productCartForm";
		
	}
	
	@RequestMapping(value = "cartMInsert")
	public String cartMInsert(ProductCartDTO cartDTO, HttpServletRequest request, HttpServletResponse response) throws Exception{		
		if(cartService.cartIsEquals(cartDTO)>0){
			//동일한 상품이 장바구니에 있을 때, 수량 변경
			cartService.cartUpdateEquals(cartDTO);
		}else{
			cartService.cartInsert(cartDTO);			
		}
		return "product/cart/productCartForm";
	}
	@RequestMapping(value = "cartNMList")
	public String cartNMList(String memberid, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		CookieUtils cu = new CookieUtils();
		List<ProductCartDTO> cartMList = null;
		List<ProductCartDTO> cartList = new ArrayList<ProductCartDTO>();
		List<ProductDTO> proList = new ArrayList<ProductDTO>();
		
		
		//쿠키에 있는 장바구니 불러오기
		if(cu.isExist("cartId", request)){
			//쿠키에 장바구니가 있을 때
			String cartVal = cu.getValue("cartId", request);
			cartList = cartService.cartList(cartVal);
			if(cartList.size()==0)	cartList = null;
		}
		
		//멤버 아이디로 저장된 장바구니 불러오기
		if(!memberid.equals("") || memberid != null){
			//회원 장바구니
			cartMList = new ArrayList<ProductCartDTO>();
			cartMList = cartService.cartList(memberid);
			if(cartMList.size()==0)	cartMList = null;
		}
		
		if(cartList != null){
			if(cartMList != null){
				for(ProductCartDTO cartDTO: cartMList){
					int i=0;
					for(ProductCartDTO dto: cartList){
						if(cartDTO.getPronum() == dto.getPronum())	i++;
					}
					if(i == 0) cartList.add(cartDTO);
				}
			}
			for(ProductCartDTO cartDTO: cartList){
				//장바구니 리스트에 대한 상품정보 불러오기
				proList.add(productService.productView(cartDTO.getPronum()));
			}	
		}else{
			if(cartMList != null){
				cartList = cartMList;
				for(ProductCartDTO cartDTO: cartList){
					//장바구니 리스트에 대한 상품정보 불러오기
					proList.add(productService.productView(cartDTO.getPronum()));
				}	
			}else{
				proList = null;
			}
		}		
		model.addAttribute("cartList", cartList);
		model.addAttribute("proList", proList);
		
		return "product/cart/productCartInner";
	}
	
	@RequestMapping(value = "cartNMDelete")
	public String cartNMDelete(String memberid, @RequestParam(value="list[]", required=true) List<String> list , HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println(memberid);
		List<Integer> cartList = new ArrayList<Integer>();
		for(String s: list){
			cartList.add(Integer.parseInt(s));
		}
		cartService.cartDeleteOne(cartList);
		return "redirect:/product/cart/cartNMList?memberid="+memberid;
	}
}
