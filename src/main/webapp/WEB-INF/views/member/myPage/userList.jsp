<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
 <style type="text/css">
 	.myPage_td{
 		width: 130px;
 	}
 	
 </style>
  
</head>

<body>
	<div class="container" style="width: 1140px;margin: 0px">
	          
	  <table class="table table-bordered">
	    <thead>
	      <tr>
	      	<th>No.</th>
	        <th>Email</th>
	        <th>NickName</th>
	        <th>Grade</th>
	        <th>Point</th>
	        <th>경고</th>
	      </tr>
	    </thead>
	    <tbody>
	      <c:forEach items="${userList }" var="list" step="1" varStatus="i">
		      <tr>
		      	<td style="text-align: center;"><strong>${i.count }</strong> </td>
		        <td class="myPage_td" style="width: 300px;"><input style="width: 100%;border: 0px;" type="text" value="${list.email }" readonly="readonly"></td>
		        <td class="myPage_td"><input style="width: 100%;border: 0px;" type="text" value="${list.nickName }" readonly="readonly"></td>
		        <td class="myPage_td"><input style="width: 100%;" type="text" value="${list.grade }"></td>
		        <td class="myPage_td"><input style="width: 100%;" type="text" value="${list.point }"></td>
		        <td class="myPage_td"><input style="width: 100%;" type="text" value="${list.w_count }"></td>
		        <td class=" btn btn-primary" style="text-align: center; "><button>수정</button></td>
		        <td class=" btn btn-warning" style="text-align: center;"><button>경고</button></td>
		        <td class=" btn btn-danger" style="text-align: center;"><button>탈퇴</button></td>
		      </tr>
	      </c:forEach>
	   
	    </tbody>
	  </table>
	</div>
</body>
</html>