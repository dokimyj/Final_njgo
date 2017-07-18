<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/basic.css">
<script type="text/javascript">
	if("${memberDTO}"==""){
		alert("로그인 해주세요.");
		location.href="login";
		
	}
</script>
</head>
<body>
	<c:import url="../tmp/header.jsp"/>

	<section class="main_section">
		<div class="container_etc" style="width:460px;">
		  <h2>비밀번호 확인</h2>
		  <div class="panel-body">
		    <form name="form_check" id="chkEdit" method="post" action="info_check" onsubmit="return doSubmit()">
		    <input type="hidden" name="q_mode" value="check">
		        <input type="text" name="email" class="form-control" style="margin-bottom:15px;" value="${memberDTO.email }" readonly="readonly">
		        <input type="password" name="pw" class="form-control" style="margin-bottom:15px;" id="pw" placeholder="비밀번호">
		        <span id="pwMsg" style="display:none;color:#FF0000;">비밀번호를 입력해주세요.</span>
		      <div class="etc_line"></div>
		      <button type="submit" class="btn btn-primary btn-block btn-lg">확 인</button>
		    </form>
		    <p class="help-block">안전한 사용을 위해 비밀번호를 한번 더 입력해 주세요.</p>
		  </div>
		</div>	
	</section>
	
	<c:import url="../tmp/footer.jsp"/>
</body>
<script type="text/javascript">
	
	function doSubmit()
	{
	    if(!$("#pw").val())
	    {
	        $("#pwMsg").show();
	        $("#pw").focus();
	        return false;
	    }
	
	    return true;
	}
</script>

</html>