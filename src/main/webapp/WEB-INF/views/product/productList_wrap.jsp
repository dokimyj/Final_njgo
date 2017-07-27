<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
				<div class="sort_wrap">
					<div>
						<span class="sort_left">총 <em>${totalCount}건</em>의 제품이 있습니다.</span>
						<span class="sort_right">
							<c:if test="${rowMaker.cate_major eq ''}">
								전체 상품
							</c:if>
							<c:if test="${rowMaker.cate_major ne ''}">
								<c:if test="${rowMaker.cate_minor ne ''}">								
									${rowMaker.cate_major} - ${rowMaker.cate_minor}
								</c:if>
								<c:if test="${rowMaker.cate_minor eq ''}">								
									${rowMaker.cate_major}
								</c:if>
								
							</c:if>
							
						</span>
					</div>
				</div>
				
				<div class="pro_list">
					<c:forEach items="${productList}" var="dto">
						
						<div class="pro_one" data-num="${dto.pronum}">
							<img class="pro_one_img" alt="" src="../resources/upload/${dto.f_mainimg}">
							<div class="pro_one_intro">
								<div class="pro_name">${dto.name}</div>
								<p class="pro_price">
									<span class="price_title">판매가</span>
									<span class="price"><fmt:formatNumber value="${dto.price}" groupingUsed="true"/></span>
									<span class="price_one">원</span>
								</p>
							</div>
							<div class="pro_hover">
								장바구니 바로담기
							</div>
						</div>
					</c:forEach>					
				</div>
				
				
				
			<script type="text/javascript">
				/*********** 상품 한 개 클릭(View 페이지 이동) **********/
				$(".pro_one_img, .pro_name").click(function() {
					var pronum = $(this).parents(".pro_one").attr("data-num");
					location.href="productView?pronum="+pronum;
				});
			
			</script>