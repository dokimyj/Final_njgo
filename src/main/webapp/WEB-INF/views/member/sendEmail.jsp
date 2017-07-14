<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body>

	<form action="${path}" method="post" id="form">
		<input type="hidden" name="joinCode" value="${joinCode }" >
		<input type="hidden" name="email" value="${email}" >
	</form>

</body>
	<script type="text/javascript">
		$("#form").submit();
	</script>
</html>