<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 인증</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/basic.css">

</head>
<body>
	<c:import url="../tmp/header.jsp"/>
		<section class="main_section">
		  <div class="container_etc" style="width:660px; text-align:center;">
		    <div class="j_title"><p><img src="${pageContext.request.contextPath }/resources/images/kdy/member/img_join.png"></p>회원가입이  진행중 입니다.</div>
		    <div class="j_cont"><span>${email}</span>으로 <br>회원가입 인증 메일이 발송되었습니다. <br>메일을 지금 확인해 주세요.</div>
		  <div class="j_cont2">메일이 도착하지 않는다면 '스팸메일함'을 확인해 보세요.<br>이메일 인증이 안된 아이디는 24시간 이후 자동삭제 처리가 됩니다. [<span id="mailDiv"><a role="button" onclick="sendAuthMail()">인증메일 다시보내기</a></span>]</div>
		</div>
		
		
		</section>
	 <c:import url="../tmp/footer.jsp"/>
</body>
	<script type="text/javascript">
		function sendAuthMail() {
			alert("이메일을 다시 보냈습니다. !!!");	
			$.ajax({
				type : "POST",
				url : "sendEmail",
				data : {
					email : "${email}",
					joinCode : "${joinCode}"
				},
				success : function(data) {
					
					}		
				});
		}
			
	</script>
</html>