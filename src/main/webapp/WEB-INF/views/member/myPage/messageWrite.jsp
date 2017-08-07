<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="message_container">
		
		<div class="form-group" style="padding: 30px;">
			<label class="control-label" style="padding: 0px;margin-top:5px;float: left; width: 60px;" >제목:</label>
    		  <div class="col-xs-10">
    		  	<!-- 제목 -->  
    		    <input type="text" class="form-control col-xs-2" name="title" id="title" style="width: 100%;"  placeholder="제목" >
    		  </div>
    		  <br><br><br>
			 <label class="control-label " style="padding: 0px;margin-top:5px;float: left;"  >받는사람:</label>
    		  <div class="col-xs-10">     
    		  	<!-- 받는사람 -->     
    		  	<c:if test="${category eq 'general' || category eq'reportList' }">
    		  		 <input type="text" class="form-control col-xs-2" name="get_nickName" id="get_nickName" style="width: 100%;" value="${nickName }" readonly="readonly" >
    		  	</c:if>
    		  	<c:if test="${category eq 'report' }">
    		  		 <input type="text" class="form-control col-xs-2" name="get_nickName" id="get_nickName" style="width: 100%;" value="운영자" readonly="readonly" >
    		  	</c:if> 
    		  
    		  </div>
			<br><br><br>
	  		<textarea class="form-control" name="contents" id="contents" rows="8" id="comment"></textarea>
	  		<input type="hidden" id="category" value="${category }">
  			<button class="btn btn-success"  id="message_send" style="margin-top: 10px;margin-bottom:10px; float: right;width: 120px;"> 보내기 </button>
		</div>
	
	</div>
</body>
</html>