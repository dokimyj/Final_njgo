<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/common/reset.css">
<c:import url="./tmp/Bootstrap.jsp" />
<link rel="stylesheet" href="./resources/css/common/basic.css">
<title>Insert title here</title>
<style type="text/css">
a{
	color: #888;
	font-size: 16px;
}
.homepage-category-row {
	border-bottom: 2px solid #eee;
	padding: 30px 0px 50px 0px;
	margin : 0 auto;
	max-width: 1600px;
	margin: 0 auto;
	/* background-color: #eee; */
}
/* .col-lg-3{
	background-color: white;
} */
.homepage-category-img {
	max-width: 200px;
	border-radius: 100px;
	padding: 5px;
}
.ranking1{
	/* margin-left: 170px; */
}
@media (min-width: 1200px)
.col-lg-3 {
    width: 25%;
}
@media (min-width: 1200px)
.col-lg-3{
    float: left;
}
.col-md-3{
	position: relative;
    min-height: 1px;
    padding-right: 30px;
    padding-left: 100px;
}
.homepage-category-hero{
	margin-left: 27px;
	margin-bottom: 20px;
}
.container-fluid2, .container-fluid3{
	margin-left: 141px;
}
.h-20 {
    clear: both;
    height: 20px;
    margin: 0;
    font-size: 0;
    overflow: hidden;
}
</style>
</head>
<body>
	<c:import url="./tmp/header.jsp" />
	<!-- section  -->
	<section class="main_section">
		<h2 style="font-weight: 900; display: inline-block; margin-left: 20px">이달의 랭킹</h2>
		<c:import url="./ranking/yyyy.jsp" />
		
		<!-------------------------------------------set1 시작---------------------------------------------------------->
		<div class="container-fluid homepage-category-row" style="margin-left: 20px">
			<div>
				<h4 style=" font-weight: 700; margin-bottom: 40px;display: inline-block;">이달의 레시피(조회순)</h4>
				<a href="/ranking/rankingList.jsp" id="rRank_link" style="text-decoration: none; margin-left: 10px; font-size: 13px;">랭킹 더보기></a>
				<img style="margin-left: 227px;" src="http://img.tygem.com/images/06/ranking/icon_top3.gif">
			</div>
			<!-------------------------------------------------------------------------------------------------->
			<div class="col-lg-3 container-fluid1 ">
				<img src="http://img.tygem.com/images/06/ranking/icon_rank1_1.gif">
				<div class="homepage-category-hero">
					<a href="/recipes"> <img class="homepage-category-img" src="https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/easy-chicken-teriyaki-4.jpg">
					</a>
					<div class="homepage-category-icon">
						<i class="ss-star homepage-category-pika" style="padding-right: 0px; position: relative; top: -2px; left: 1px;"></i>
					</div>
				</div>
				<h4 class="homepage-category-header" style="font-weight: 700; font-size: 16px; text-align: center;">요리명 : <a href="#" style="text-decoration: none; font-weight: 700">오빠가 만든 닭</a></h4>
				<p class="homepage-category-subtext" style="text-align: center; font-weight: 700;"> 조회수 : 32,000번 </p>
			</div>
			<!-------------------------------------------------------------------------------------------------->
			
			<!-------------------------------------------------------------------------------------------------->
			<div class="col-lg-3 container-fluid2">
				<img src="http://img.tygem.com/images/06/ranking/icon_rank2_1.gif">
				<div class="homepage-category-hero">
					<a href="/recipes"> <img class="homepage-category-img" src="https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/easy-chicken-teriyaki-4.jpg">
					</a>
					<div class="homepage-category-icon">
						<i class="ss-star homepage-category-pika" style="padding-right: 0px; position: relative; top: -2px; left: 1px;"></i>
					</div>
				</div>
				<h4 class="homepage-category-header" style="font-weight: 700; font-size: 16px; text-align: center;">요리명 : <a href="#" style="text-decoration: none; font-weight: 700">오빠가 만든 닭</a></h4>
				<p class="homepage-category-subtext" style="text-align: center; font-weight: 700;"> 조회수 : 32,000번 </p>
			</div>
			<!-------------------------------------------------------------------------------------------------->
			
			<!-------------------------------------------------------------------------------------------------->
			<div class="col-lg-3 container-fluid3 ">
				<img src="http://img.tygem.com/images/06/ranking/icon_rank3_1.gif">
				<div class="homepage-category-hero">
					<a href="/recipes"> <img class="homepage-category-img" src="https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/easy-chicken-teriyaki-4.jpg">
					</a>
					<div class="homepage-category-icon">
						<i class="ss-star homepage-category-pika" style="padding-right: 0px; position: relative; top: -2px; left: 1px;"></i>
					</div>
				</div>
				<h4 class="homepage-category-header" style="font-weight: 700; font-size: 16px; text-align: center;">요리명 : <a href="#" style="text-decoration: none; font-weight: 700">오빠가 만든 닭</a></h4>
				<p class="homepage-category-subtext" style="text-align: center; font-weight: 700;"> 조회수 : 32,000번 </p>
			</div>
		</div>
			<!-------------------------------------------set1 끝------------------------------------------------------->
			<div class="h-20"></div>
			
		<!-------------------------------------------set2 시작---------------------------------------------------------->
		<div class="container-fluid homepage-category-row" style="margin-left: 20px">
			<div>
				<h4 style=" font-weight: 700; margin-bottom: 40px; display: inline-block;">이달의 레시피(퍼가기순)</h4>
				<a href="/ranking/rankingList.jsp" id="rRank_link" style="text-decoration: none; margin-left: 10px; font-size: 13px;">랭킹 더보기></a>
				<img style="margin-left: 208px;" src="http://img.tygem.com/images/06/ranking/icon_top3.gif">
			</div>
			<!-------------------------------------------------------------------------------------------------->
			<div class="col-lg-3 container-fluid1 ">
				<img src="http://img.tygem.com/images/06/ranking/icon_rank1_1.gif">
				<div class="homepage-category-hero">
					<a href="/recipes"> <img class="homepage-category-img" src="https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/easy-chicken-teriyaki-4.jpg">
					</a>
					<div class="homepage-category-icon">
						<i class="ss-star homepage-category-pika" style="padding-right: 0px; position: relative; top: -2px; left: 1px;"></i>
					</div>
				</div>
				<h4 class="homepage-category-header" style="font-weight: 700; font-size: 16px; text-align: center;">요리명 : <a href="#" style="text-decoration: none; font-weight: 700">오빠가 만든 닭</a></h4>
				<p class="homepage-category-subtext" style="text-align: center; font-weight: 700;"> 퍼간수 : 32,000번 </p>
			</div>
			<!-------------------------------------------------------------------------------------------------->
			
			<!-------------------------------------------------------------------------------------------------->
			<div class="col-lg-3 container-fluid2">
				<img src="http://img.tygem.com/images/06/ranking/icon_rank2_1.gif">
				<div class="homepage-category-hero">
					<a href="/recipes"> <img class="homepage-category-img" src="https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/easy-chicken-teriyaki-4.jpg">
					</a>
					<div class="homepage-category-icon">
						<i class="ss-star homepage-category-pika" style="padding-right: 0px; position: relative; top: -2px; left: 1px;"></i>
					</div>
				</div>
				<h4 class="homepage-category-header" style="font-weight: 700; font-size: 16px; text-align: center;">요리명 : <a href="#" style="text-decoration: none; font-weight: 700">오빠가 만든 닭</a></h4>
				<p class="homepage-category-subtext" style="text-align: center; font-weight: 700;"> 퍼간수 : 32,000번 </p>
			</div>
			<!-------------------------------------------------------------------------------------------------->
			
			<!-------------------------------------------------------------------------------------------------->
			<div class="col-lg-3 container-fluid3 ">
				<img src="http://img.tygem.com/images/06/ranking/icon_rank3_1.gif">
				<div class="homepage-category-hero">
					<a href="/recipes"> <img class="homepage-category-img" src="https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/easy-chicken-teriyaki-4.jpg">
					</a>
					<div class="homepage-category-icon">
						<i class="ss-star homepage-category-pika" style="padding-right: 0px; position: relative; top: -2px; left: 1px;"></i>
					</div>
				</div>
				<h4 class="homepage-category-header" style="font-weight: 700; font-size: 16px; text-align: center;">요리명 : <a href="#" style="text-decoration: none; font-weight: 700">오빠가 만든 닭</a></h4>
				<p class="homepage-category-subtext" style="text-align: center; font-weight: 700;"> 퍼간수 : 32,000번 </p>
			</div>
		</div>
			<!-------------------------------------------set2 끝------------------------------------------------------->
			
			<!-------------------------------------------set3 시작---------------------------------------------------------->
		<div class="container-fluid homepage-category-row" style="margin-left: 20px">
			<div>
				<h4 style=" font-weight: 700; margin-bottom: 40px; display: inline-block;">이달의 셰프</h4>
				<a href="/ranking/rankingList.jsp" id="rRank_link" style="text-decoration: none; margin-left: 10px; font-size: 13px;">랭킹 더보기></a>
				<img style="margin-left: 310px;" src="http://img.tygem.com/images/06/ranking/icon_top3.gif">
			</div>
			<!-------------------------------------------------------------------------------------------------->
			<div class="col-lg-3 container-fluid1 ">
				<img src="http://img.tygem.com/images/06/ranking/icon_rank1_1.gif">
				<div class="homepage-category-hero">
					<a href="/recipes"> <img class="homepage-category-img" src="https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/easy-chicken-teriyaki-4.jpg">
					</a>
					<div class="homepage-category-icon">
						<i class="ss-star homepage-category-pika" style="padding-right: 0px; position: relative; top: -2px; left: 1px;"></i>
					</div>
				</div>
				<h4 class="homepage-category-header" style="font-weight: 700; font-size: 16px; text-align: center;">셰프명 : <a href="#" style="text-decoration: none; font-weight: 700">이연복</a></h4>
				<p class="homepage-category-subtext" style="text-align: center; font-weight: 700;"> 업로드 레시피수 : 33번 </p>
			</div>
			<!-------------------------------------------------------------------------------------------------->
			
			<!-------------------------------------------------------------------------------------------------->
			<div class="col-lg-3 container-fluid2">
				<img src="http://img.tygem.com/images/06/ranking/icon_rank2_1.gif">
				<div class="homepage-category-hero">
					<a href="/recipes"> <img class="homepage-category-img" src="https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/easy-chicken-teriyaki-4.jpg">
					</a>
					<div class="homepage-category-icon">
						<i class="ss-star homepage-category-pika" style="padding-right: 0px; position: relative; top: -2px; left: 1px;"></i>
					</div>
				</div>
				<h4 class="homepage-category-header" style="font-weight: 700; font-size: 16px; text-align: center;">셰프명 : <a href="#" style="text-decoration: none; font-weight: 700">레이먼킴</a></h4>
				<p class="homepage-category-subtext" style="text-align: center; font-weight: 700;"> 업로드 레시피수 : 32번 </p>
			</div>
			<!-------------------------------------------------------------------------------------------------->
			
			<!-------------------------------------------------------------------------------------------------->
			<div class="col-lg-3 container-fluid3 ">
				<img src="http://img.tygem.com/images/06/ranking/icon_rank3_1.gif">
				<div class="homepage-category-hero">
					<a href="/recipes"> <img class="homepage-category-img" src="https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/easy-chicken-teriyaki-4.jpg">
					</a>
					<div class="homepage-category-icon">
						<i class="ss-star homepage-category-pika" style="padding-right: 0px; position: relative; top: -2px; left: 1px;"></i>
					</div>
				</div>
				<h4 class="homepage-category-header" style="font-weight: 700; font-size: 16px; text-align: center;">셰프명 : <a href="#" style="text-decoration: none; font-weight: 700">최소영조장</a></h4>
				<p class="homepage-category-subtext" style="text-align: center; font-weight: 700;"> 업로드 레시피수 : 31번 </p>
			</div>
		</div>
			<!-------------------------------------------set3 끝------------------------------------------------------->
	</section>
	<c:import url="./tmp/footer.jsp" />
</body>
</html>