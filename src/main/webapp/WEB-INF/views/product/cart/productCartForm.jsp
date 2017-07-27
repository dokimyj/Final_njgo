<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="cart_view_layer">
	<div class="inner">
		<p class="txt">
			<strong>선택하신 상품을 카트에 담았습니다.</strong>
		</p>
		<div class="CartInBtn">
			<a class="btn_shopping" style="cursor: pointer">쇼핑 계속하기</a> <a
				href="cart/productCart" class="btn_cart_view">카트보기</a>
		</div>
		<a class="btn_clse" style="cursor: pointer">X</a> <span
			class="arr_btm"></span>
	</div>
</div>

<script type="text/javascript"> 
	$(".btn_clse, .btn_shopping").click(function() {
		$(".cart_view_layer").css("display", "none");
		
	});
</script>