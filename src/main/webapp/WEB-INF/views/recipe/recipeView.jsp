<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>N.J.GO</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../resources/css/common/basic.css">
<style>
	.top_section{
		text-align:center;
		margin:0 auto;
		border-bottom: 1px solid grey;
	}
	.top_section>p{
		max-width:640px;
		max-height:480px;
		overflow:hidden;
		text-align:center;
		margin:0 auto;
	}
	.ing_section{
		border-top: 1px solid grey;
		border-bottom: 1px solid grey;
	}
	.scrapbtn-claim>button{
		cursor: pointer; 
		width:145px; 
		height:35px; 
		font-size:smaller; 
		border-radius:35px; 
		border-color:#ffcc00; 
		background-color:white;
		background-position:20% center; 
		background-repeat:no-repeat; 
	}
	.step_section{
		padding:5%;
	}
	.step_section>strong{
		font-size:5.5em;
		background-color:#ffcc00;
		border-radius:50%;
	}
	.step_section>span{
		font-size:3em;
	}
</style>
</head>
<body>
	<c:import url="../tmp/header.jsp"/>
	
	<section class="main_section">
		<article class=top_section>
			<p>
				<img src="../resources/upload/${view.recipeDTO.rep_pic }">
				<span><!-- 작성자의 프로필 사진을 넣어라 --></span>
			</p>
			<br>
				<h5>${view.recipeDTO.writer }</h5>
				<h1>${view.recipeDTO.title }</h1>
				<h3>${view.recipeDTO.foodname }</h3>
			<br>
				<p><img src="../resources/images/kdk/icon_marks1.png"><i>${view.recipeDTO.r_intro }</i><img src="../resources/images/kdk/icon_marks2.png"></p>
			<br>
			<div class=amount-hit-scrap>
				<span><img src='../resources/images/kdk/icon_man.png'>&nbsp;${view.recipeDTO.amount }인분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<span><img src='../resources/images/kdk/icon-157349_640.png'>&nbsp;${view.recipeDTO.elapsedtime }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<span><img src='../resources/images/kdk/eyes_viewicon.png'>&nbsp;${view.recipeDTO.hit }</span>
			<hr>
			</div>
			<div class=scrapbtn-claim>
				<button><img src='../resources/images/kdk/blackheart.png'>&nbsp;스크랩&nbsp;${view.recipeDTO.scrap }</button>
				<button>신고하기</button>
			</div>
			<br>
		</article>
		<article class=ing_section>
			<c:forEach items="${view.ing_kind }" var="ingk">
				<h2>${ingk }</h2>
				<c:forEach items="${view.ing_cont }" var="ingc">
					${ingc }<br>
				</c:forEach>
			</c:forEach>
		</article>
		<article class=step_section>
			<c:forEach items="${view.steps }" var="step">
				<strong>${step.step+1 }</strong>&nbsp;&nbsp;&nbsp;<span>${step.explain }</span>
				<br>
				<img src="../resources/upload/${step.fname }"><br>
			</c:forEach>
		</article>
	</section>
	<c:import url="../tmp/footer.jsp"/>
</body>
<c:import url="ingSearch.jsp"></c:import>
<script>
	function search(find){
	    if(event.keyCode == 13){
	    	location.href="search?find="+find.value
		}
	}
	function ingsearch(find){
		$.ajax({
			url:"inglist",
			type:"GET",
			data:{
				find:find.value
			},
			success:function(data){
				$('.ings').html(data.trim());
			}
		});
	}
	$('.ing_btn').click(function(){
		var ings=$('.ingkeyword').val();
		$('.ing_search').append('<span class="btn btn-warning ingx" style="margin: 0 1% 1% 0" title="'+ings+'">'+ings+'<strong class="badge ing" style="cursor:pointer">X</strong></span>');
		$('.ingkeyword').val('');
	});
	$('.ing_search').on("click", ".ingx", function(){
		$(this).remove();
	});
	$('.isearch_btn').click(function(){
		var url="isearch?curPage=1";
		var x=document.getElementsByClassName('ingx');
		for(i=0;i<x.length;i++){
			url+="&ingredients="+x[i].title;
		}
		if($('.ing_search').html()!=''){
			location.href=url;
		}else{
			alert('재료를 선택하신 후 검색해 주세요!');
		}
	});
</script>
</html>