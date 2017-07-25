<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/common/reset.css">
<c:import url="./tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="./resources/css/common/basic.css">
</head>
<body>
	<c:import url="./tmp/header.jsp"/>
	
	<section class="main_section">
	<!-- 냉장고 재료 검색파트 -->
	<article class="fridge">
		<div id=selections>
		<input type=text list="ings" autocomplete="off" placeholder="재료명을 쓰고 Enter를 누르세요" onkeydown="ingsearch(this)" id="ingkeyword">
  			<datalist id="ings">
  			</datalist>
  		</div>
  		<div id=ing_search style="background-image:url('./resources/images/kdk/reisougou.jpg')">
  		</div>
  		<input type="button" id="isearch_btn" class="btn btn-warning" value="이 재료로 추천받기">
	</article>
	<!-- 날씨추천 파트 -->
		<!-- 사용자의 태그를 우선으로 정렬예정 -->
	<!-- 인기(HIT순) 정렬 파트 -->
		<!-- listInfo에 3개를 넣어서 보여주기 -->
	</section>
	<c:import url="./tmp/footer.jsp"/>
</body>
<script>
function recipe(){
	$.ajax({
		url:"./recipe/recipeList",
		type:"GET",
		success:function(data){
			$('.main_section').html(data.trim());
		}
	});
}
function search(find){
    if(event.keyCode == 13){
    	$.ajax({
    		url:"./recipe/search",
    		type:"GET",
    		data:{
    			find:find.value
    		},
    		success:function(data){
    			$('.main_section').html(data.trim());
    		}
    	});
	}
}
function ingsearch(find){
	$.ajax({
		url:"./recipe/inglist",
		type:"GET",
		data:{
			find:find.value
		},
		success:function(data){
			$('#ings').html(data.trim());
		}
	});
	if(event.keyCode == 13){
		$('#selections').append('<input type="button" id="ing_btn" class="btn btn-warning" value="추가">');
	}
}
$('#selections').on("click", "#ing_btn", (function(){
	var ings=$('#ingkeyword').val();
	$('#ing_search').append('<span class="btn btn-warning ings" title="'+ings+'">'+ings+'<strong class="badge ing" style="cursor:pointer">X</strong></span>');
	$('#ingkeyword').val('');
	$('#selections>input[button]').remove();
	)
});
$('#ing_search').on("click", ".ings", function(){
	$(this).remove();
});
$('#isearch_btn').click(function(){
	jQuery.ajaxSettings.traditional = true;
	var ar=new Array();
	var x=document.getElementsByClassName('ings');
	for(i=0;i<x.length;i++){
		ar.push(x[i].title);
	}
	if($('#ing_search').html()!=''){
		$.ajax({
			url:"./recipe/isearch",
			data:{
				ingredients:ar
			},
			success:function(data){
				$('.main_section').html(data.trim());
				for(i=0;i<ar.length;i++){
					$('.main_section').append('<input type=hidden name=ing value='+ar[i]+'>');
					//나중에 레시피를 클릭했을 때 해당 재료들을 넘기기 위함, 컨트롤러 view에서 string배열로 받아 그대로 전달 예정.
				}
			}
		});
	}else{
		alert('재료를 선택하신 후 검색해 주세요!');
	}
});
</script>
</html>