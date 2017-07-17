<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../resources/css/common/basic.css">
<style type="text/css">
	body {
		background-color: #eeeeee;
	}
	.recipeInfo{ 
		width: 100%;
		height: 500px;
		background-color: lavender;
		border: 1px solid #f8f8f8;
	}
	.titlePart{ 
		padding: 14px 18px;
		font-size: 20px;
		font-weight: bold;
		background-color: #f8f8f8;
		border-bottom: 1px solid #e6e7e8;
	}
	.contentPart {
		background-color: white;
		width: 100%;
		height: 500px;
		padding: 30px 40px;
		font-size: large;
	}
</style>
</head>
<body>
	<c:import url="../tmp/header.jsp"/>
	
	<section class="main_section">
		<div class="recipeInfo">
			<div class="titlePart">
				레시피 등록
			</div>
			<div class="contentPart">
				레시피 제목
				<input type="text">
			</div>
		</div>
	
	</section>
	
	<c:import url="../tmp/footer.jsp"/>
</body>
</html>