<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" class=""><!--[endif]--><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta name="keywords" content="">
<title>냉장GO</title>
<meta property="kakao:title" content="냉장GO">
<meta property="kakao:description" content="">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/kdy/member/sample.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/kdy/member/sample2.css">

</head>
<body>
<script>


function doSubmit()
{
    if(!$('#id_user').val())
    {
        $('#idMsg').show();
        $('#id_user').focus();
        return false;
    }
    if(!$('#tx_passwd').val())
    {
        $('#pwMsg').show();
        $('#tx_passwd').focus();
        return false;
    }
    return true;
}

</script>

<div class="container_etc" style="width:460px;">
  <h2>로그인</h2>
  <div class="panel-body">
    <form name="form_login" id="formLogin" method="post" action="" autocomplete="off" onsubmit="return doSubmit()">
    <input type="hidden" name="q_mode" value="check">
    <input type="hidden" name="q_path" value="">
      <div class="form-group">
        <input type="text" name="id_user" class="form-control" id="id_user" placeholder="아이디">
        <span id="idMsg" style="display:none;color:#FF0000;">아이디를 입력해주세요.</span>
      </div>
      <div class="form-group">
        <input type="password" name="tx_passwd" class="form-control" id="tx_passwd" placeholder="비밀번호">
        <span id="pwMsg" style="display:none;color:#FF0000;">비밀번호를 입력해주세요.</span>
      </div>
      <button type="submit" class="btn-primary btn-lg btn-block" style="
    margin-left: 0px;
">로그인</button>
      <div class="checkbox">
        <label>
          <input type="checkbox" name="login_perma" value="1"><span class="guide_txt">로그인 상태 유지</span>
        </label>
      </div>
    </form>
    <p class="help-block">개인정보 보호를 위해 개인 PC에서만 사용하세요.</p>
    <div class="etc_line"></div>
    <div class="join_btn">
        <a href="/user/join.html">회원가입</a><span class="space_line">|</span>
        <a href="/user/find_passwd.html">비밀번호 찾기</a><span class="space_line">|</span>
        
    </div>
    
    <button type="button" onclick="loginWithKakao()" class="btn btn-primary btn-lg btn-block join_k"><span>카카오톡으로 로그인</span></button>
    
  </div>
</div>





</body></html>