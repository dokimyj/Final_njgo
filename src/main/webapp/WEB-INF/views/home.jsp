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
</head>
<body>
	<c:import url="./tmp/header.jsp" />
	<!-- section  -->
		<section class="main_section">
			<a href="./ranking/rankingPage">ranking</a>
			<a href="./planner/plannerPage">planner</a>
			<a href="./ranking/rankingtest">rankingtest</a>
		</section>
	<c:import url="./tmp/footer.jsp" />
</body>
</html>