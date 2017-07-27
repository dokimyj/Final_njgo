package com.njgo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.njgo.dto.ProductDTO;
import com.njgo.dto.ProductOrderDTO;
import com.njgo.service.ProductService;

@Controller
@RequestMapping(value = "/product/pay/**")
public class ProductPayController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "payView")
	public String payView(@RequestParam(value="pNumList", required=true) List<String> pNumList, 
			@RequestParam(value="pAmountList", required=true) List<String> pAmountList, String memberid, Model model) throws Exception{
		System.out.println("payView process");
		System.out.println("memberid: " + memberid);
		
		List<ProductDTO> proList = new ArrayList<ProductDTO>();
		for(int i=0; i<pNumList.size(); i++){
			System.out.println("pronum: " + pNumList.get(i) + ", amount: " + pAmountList.get(i));
			ProductDTO productDTO = new ProductDTO();
			productDTO = productService.productView(Integer.parseInt(pNumList.get(i)));
			proList.add(productDTO);
		}
		System.out.println(proList.size());
		
		model.addAttribute("proList", proList).addAttribute("pAmountList", pAmountList);
		return "product/pay/productPay";
	}
	
	@RequestMapping(value = "payProcess")
	public String payProcess(){
		return "product/pay/productPayProcess";
	}
	
	@RequestMapping(value = "paySuccess", method = RequestMethod.POST )
	public void paySuccess(){
		
	}
	
	
	@RequestMapping(value = "payOrderInsert", method = RequestMethod.POST )
	public String payOrderInsert(ProductOrderDTO orderDTO, String o_admsg, String uPoint){
		System.out.println("id: " + orderDTO.getMemberid());
		System.out.println("name: " + orderDTO.getO_name());
		System.out.println("phone: " + orderDTO.getO_phone());
		System.out.println("orderlist: " + orderDTO.getOrderlist());
		System.out.println("totPrice: " + orderDTO.getTotprice());
		System.out.println("o_msg: " + o_admsg);
		System.out.println("uPoint: " + uPoint);
		
		return "redirect:/product/productList";
	}
}
