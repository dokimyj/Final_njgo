<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 냉장Go</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/basic.css">
</head>
<script>
function doSend()
{
    if(!$("#id_email").val())
    {
        $("#seMsg").show();
        $("#id_email").focus();
    
        return ;
    }
 

    $.ajax({
        type: "POST",
        url: "find_password",
        data:{ email : $("#id_email").val()},
        success: function(code) {
           var result = code.trim();
            if(result == 'SUCCESS')
            {
                alert('비밀번호 재설정 안내 메일을 발송했습니다. 메일을 확인해 주세요.');
                location.href = '../';
            }
            else if(result == 'SNS_USER')
            {
                alert('회원님은 SNS(facebook,카카오톡)로 가입하셨습니다. SNS로 로그인이 가능하십니다.');
                location.href = '../';
            }
            else
            {
                var msg = '오류가 발생했습니다. 잠시후 다시 시도해 주세요.';
                if(result == 'NOT_EXIST') msg = '등록되지 않은 메일주소입니다. 다시 확인해 주세요.';
         
                $("#seMsg").show();
                $("#seMsg").html(msg);
                return ;
            }
        }
    });

}
</script>
<body>
	<c:import url="../tmp/header.jsp"/>

	<section class="main_section">
			<div class="container_etc" style="width:460px;">
		  <h2 style="font-size: 2em;">비밀번호 찾기</h2>
		  <div class="panel-body">
		    <input type="text" class="form-control" style="margin-bottom:35px;" id="id_email" placeholder="이메일">
		    <div class="etc_line"></div>
		    <span id="seMsg" style="display:none;color:#FF0000;">회원가입시 등록한 이메일 주소를 입력해주세요.</span>
		    <button type="button" onclick="doSend()" class="btn btn-primary btn-block btn-lg">안내 메일 발송</button>
		    <p class="help-block">* 비밀번호 재설정 안내를 회원 가입시 입력했던 메일로 발송합니다.</p>
		  </div>
		</div>
	</section>
	
	<c:import url="../tmp/footer.jsp"/>
</body>
</html>