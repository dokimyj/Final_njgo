<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>http://www.01code.com[ 정규표현식을 이용한 비밀번호 체크 ]</title>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<link rel=stylesheet href="http://www.01code.com/ydhtml/01code.css" type=text/css>
<script language="JavaScript">

function IsPassword(strUID, strPwd)
{
 var regExprMust, regExprNot;
 regExprMust = new RegExp( ".{6,12}" ); // 6~12자리 사이어야 함.
 regExprNot = new RegExp( "^" + strUID + "$|^" + strUID + "1234$|^1234$|^1111$" ); //1234,ID1234,1111등의 password는 안됨.
 return (!regExprMust.test( strPwd ) || regExprNot.test( strPwd )) ? false : true
}
function ValidCheck(strUID, strPwd)
{
 if(!IsPassword(document.allForm.uid.value, document.allForm.pwd.value)){
  alert( "비밀번호 체크사항:\n\n1. 6~12자리 사이어야 합니다.\n\n2. 1234, ID1234,1111등의 비밀번호는 사용하실 수 없습니다." );
  document.allForm.pwd.focus();
  return false;
 }else{
  alert("체크 완료");
  return true;
 }
}
//
</script>
</head>
<body>
<h4>[ 정규표현식을 이용한 비밀번호 체크 ]</h4>
<form method=post name="allForm">
 아이디: TEST<input type=hidden name="uid" value="TEST"><br>
 비밀번호 <input type=text name="pwd" value="" size=20 maxlength=20>
 <input type=button name="check" value="체크" onClick="ValidCheck()">
</form>
</body>
</html>
