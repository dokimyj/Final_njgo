<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form action="" name="frm" id="frm">
	<input type="hidden" name="pNumList" id="pNumList">
	<input type="hidden" name="pAmountList" id="pAmountList">
	<input type="hidden" name="memberid" value="soyoung">
</form>
<table class="cart_sts">
	<tr class="sts_top" height="50px;">
		<td width="5%"><div class="check_btn on chkbox_all">
				<input type="checkbox" class="chk_all" checked="checked"
					style="display: none;">
			</div></td>
		<td width="60%">상품정보</td>
		<td width="20%">상품금액</td>
		<td width="15%">배송비</td>
	</tr>
	
	<c:forEach items="${proList}" var="pdto" varStatus="i">
		<tr class="sts_one">
			<td class="one_chk">
				<div class="check_btn on chkbox_one">
					<input type="checkbox" class="chk_one" checked="checked"
						style="display: none;" autocomplete="off" data-cartid="${cartList[i.index].cartid}"
						data-pronum="${pdto.pronum}">
				</div>
			</td>
			<td class="one_info">
				<div class="pro_info">
					<img src="../../resources/upload/${pdto.f_mainimg}">
					<div class="pro_name">${pdto.name}</div>
					<div class="pro_cnt">
						<div class="bt_cnt">
							<button type="button" class="cnt_minus"></button>
							<input type="text" class="ip_quantity"
								value="${cartList[i.index].amount}">
							<button type="button" class="cnt_plus"></button>
						</div>
					</div>
				</div>
			</td>
			<td class="one_price"><input type="hidden" class="ip_price"
				value="${pdto.price}">
				<div class="pro_price">
					<span><fmt:formatNumber
							value="${pdto.price*cartList[i.index].amount}"
							groupingUsed="true" /></span>원
				</div></td>
			<td class="one_delivery">
				<div class="pro_delivery">
					<c:if test="${pdto.price*cartList[i.index].amount >= 30000}">
						<div class="del_price" style="display: none;">
							<span>3,000</span>원
						</div>
						<div class="del_free">무료배송</div>
					</c:if>
					<c:if test="${pdto.price*cartList[i.index].amount < 30000}">
						<div class="del_price">
							<span>3,000</span>원
						</div>
						<div class="del_free" style="display: none;">무료배송</div>
					</c:if>

				</div>
			</td>
		</tr>
	</c:forEach>
	<c:if test="${proList eq null}">
		<tr class="sts_one none">
			<td colspan="4">장바구니에 담긴 상품이 없습니다.</td>
		</tr>
	</c:if>



	<tr>
		<td><div class="check_btn on chkbox_all">
				<input type="checkbox" class="chk_sel" checked="checked"
					style="display: none;">
			</div></td>
		<td colspan="3" class="cart_message">
			<div class="chk_del">선택상품 삭제</div>
			<p class="guide_txt">카트에 담긴 상품은 최대 5일까지 보관되며 매진될 경우 자동으로 삭제됩니다.</p>
		</td>
	</tr>

</table>


<script type="text/javascript">
	total_price($(".chk_one:checked"));
	var length = '${fn:length(proList)}';
	var proList = '${proList}';
	if(proList == null)		lenth = 0;
	$("._cart_cnt").html(length);

	/*********************checkbox 제어********************/
	$(".check_btn").click(function() {
		chk_control($(this));
		if($(this).find("input").hasClass("chk_all") || $(this).find("input").hasClass("chk_sel")){		
			//전체 선택/해제
			if($(this).hasClass("on")){
				$(".check_btn").addClass("on").find("input").attr("checked","checked");
			}else{
				$(".check_btn").removeClass("on").find("input").removeAttr("checked");
			}
		}
		
		//일부 선택
		if($(".chk_one").length == $(".chk_one:checked").length){
			$(".chkbox_all").addClass("on").find("input").attr("checked","checked");
		}else if($(".chk_one").length > $(".chk_one:checked").length){
			$(".chkbox_all").removeClass("on").find("input").removeAttr("checked");
		}
		
		//체크박스 선택시 가격 변화
		total_price($(".chk_one:checked"));
		
	});
	
	function chk_control(chkBox) {
		if(chkBox.hasClass("on")){
			chkBox.removeClass("on");
			chkBox.find("input").removeAttr("checked");
		}else{
			chkBox.addClass("on");
			chkBox.find("input").attr("checked", "checked");
		}	
	}
	
	
	/********************* 상품 갯수  ********************/
	$(".cnt_minus, .cnt_plus").click(function() {
		var cnt = $(this).siblings("input");
		var cntVal = cnt.val()*1;
			if($(this).hasClass("cnt_minus")){
				if(cntVal > 1)	cntVal -= 1;
			}else{
				if(cntVal < 10) cntVal += 1;
			}
		cnt.val(cntVal);
		cnt.attr("value", cntVal);
		
		//한개 가격 변동
		change_price(cnt);
	});
	
	/********** input textbox로 직접 수량 변경 시  ************/
	$(".ip_quantity").keyup(function() {
		change_price($(this));
	});
	
	function change_price(inputThis) {
		var cntVal = inputThis.val()*1;
		var priOne = inputThis.parents(".one_info").siblings(".one_price").find("input").val()*1;
		var totalPrice = cntVal*priOne;
		
		inputThis.parents(".one_info").siblings(".one_price").find("span").text(Number(totalPrice).toLocaleString('en'));
		
		if(totalPrice >= 30000){
			inputThis.parents(".one_info").siblings(".one_delivery").find(".del_price").hide();
			inputThis.parents(".one_info").siblings(".one_delivery").find(".del_free").show();
		}else{
			inputThis.parents(".one_info").siblings(".one_delivery").find(".del_price").show();
			inputThis.parents(".one_info").siblings(".one_delivery").find(".del_free").hide();
		}
		
		total_price($(".chk_one:checked"));
	}
	
	function total_price(checkedList) {
		var totalPrice = 0;
		var totalDel = 0;
		checkedList.each(function() {
			totalPrice += $(this).parents(".one_chk").siblings(".one_price").find("span").html().replace(",", "")*1;
		});
		$("._buy_amount").html(Number(totalPrice).toLocaleString('en')+" ");
		if(totalPrice >= 30000 || totalPrice == 0){
			totalDel = 0;
			$("._delivery_amount").html("0 ");
		}else{
			totalDel = 3000;
			$("._delivery_amount").html("3,000 ");
		}
		
		var total = totalPrice + totalDel;
	 	$("._total_amount").html(Number(total).toLocaleString('en')+" ");
	}
	
	
	$(".chk_del").click(function() {
		var list = new Array();
		var chk_box = $(".chk_one:checked");
		var memberid= 'soyoung';
		var i = 0;
		chk_box.each(function() {
			list[i] = $(this).attr("data-cartid");
			i++;
		});
		$.ajax({
			url: "cartNMDelete",
			type: "POST",
			data:{
				list: list,
				memberid: memberid
			},
			success: function(data) {
				$(".cart_sts_wrap").html(data);
			}
		});
	});
	
	
	/******************** 결제창 이동 *********************/
	$(".bt_submit").click(function() {
		var pNumList = new Array();
		var pAmountList = new Array();
		var chk_box = $(".chk_one:checked");
		var memberid= 'soyoung';
		var i = 0;
		chk_box.each(function() {
			pNumList[i] = $(this).attr("data-pronum");			
			pAmountList[i] = $(this).parents(".one_chk").siblings(".one_info").find(".ip_quantity").val();			
			i++;
		});
		if(i == 0){
			alert("선택된 상품이 없습니다.");
		}else{
			if(memberid == ''){
				//로그인창 trigger
				
			}else{
				frm.pNumList.value = pNumList;
				frm.pAmountList.value = pAmountList;
				frm.method = "POST";
				frm.action = "../pay/payView";
				frm.submit();
			}			
		}

		
		//location.href="productPay";
	});

</script>