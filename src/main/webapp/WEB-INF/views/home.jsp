<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta name="keywords" content="">
<title>TEST 냉장GO</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<c:import url="./tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/basic.css">

</head>
<body>
<c:import url="./tmp/header.jsp"/>

	<section class="main_section">
		
	</section>
	
	<c:import url="./tmp/footer.jsp"/>
</body>
	<script>

	if("${message}"!=""){
		alert("${message}");
	}
	
	if(("${memberDTO.grade}" <1) && ("${memberDTO}"!="")){
		alert("이메일 인증을 안한상태입니다. 가입하신 이메일을 확인해주세요.")
	}

	</script>
</html>

