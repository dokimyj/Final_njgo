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
 		border: 0px;"
 	}
 	.user{
 		border: 0px;
 		width: 100%;
 	}
 </style>
  
</head>

<body>
	<div class="container" style="width: 1140px;margin: 0px">
	  <input type="hidden"  id="user_curPage" value="${curPage }"> 
	  <input type="hidden"  id="type" value="${type }"> 
	  <div id="qick_mode" style="margin-bottom: 10px;" >
	  	<input type="button" style="width: 100px;" class="btn btn-success" value="경고순" onclick="warning_view()">
	  	<input type="button" style="width: 100px;" class="btn btn-success" value="등급순" onclick="grade_view()">	
	  </div>
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
	  		<c:if test="${search ne 'search' }">
	  		
		      <c:forEach items="${userList }" var="list" step="1"  varStatus="i">
		      	
			      	   <tr>
				      	<td style="text-align: center;"><strong>${listInfo.startRow-1 + i.count }</strong> </td>
				     		
					        <td class="myPage_td" style="width: 300px;"><input class="user" id="user_email${i.count }" type="text" value="${list.email }" readonly="readonly"></td>
					        <td class="myPage_td"><input class="user" id="user_nickName${i.count }"  type="text" value="${list.nickName }" readonly="readonly"></td>
					        <td class="myPage_td"><input class="user${i.count }" id="user_grade${i.count }" style="border: 0px;"  type="number" value="${list.grade }" readonly="readonly"></td>
					        <td class="myPage_td"><input class="user${i.count }" id="user_point${i.count }" style="border: 0px;"  type="text" value="${list.point }" readonly="readonly"></td>
					        <td class="myPage_td"><input class="user${i.count }" id="user_warn${i.count }" style="border: 0px;"  type="number" value="${list.w_count }" readonly="readonly"></td>
				          <c:if test="${myPage.grade > 2 }"> 
				     		   <td id="correct_td${i.count }" style="text-align: center; "><input type="button" class=" btn btn-primary" id="correct_user${i.count }" onclick="correct_user('${i.count }')" value="수정"></td>
				        	</c:if>
				    	    <td style="text-align: center;"><input type="button" class=" btn btn-warning" id="warn_user${i.count }"  onclick="warning_user('${i.count }')" value="경고"></td>
				          	<c:if test="${myPage.grade > 2 }"> 
				        		<td style="text-align: center;"><input type="button" class=" btn btn-danger" id="delete_user${i.count }"  onclick="delete_user('${i.count }')" value="탈퇴"></td>
				      		</c:if>
				      </tr>
		      
			   
		      </c:forEach>
	   		</c:if>
	   		
	   		<c:if test="${search eq 'search' }">
	  		
		      <c:forEach items="${searchUser }" var="list" step="1" varStatus="i">
			      <tr>
			      	<td style="text-align: center;"><strong>${i.count }</strong> </td>
			     		
				        <td class="myPage_td" style="width: 300px;"><input class="user" id="user_email${i.count }" type="text" value="${list.email }" readonly="readonly"></td>
				        <td class="myPage_td"><input class="user" id="user_nickName${i.count }"  type="text" value="${list.nickName }" readonly="readonly"></td>
				        <td class="myPage_td"><input class="user${i.count }" id="user_grade${i.count }" style="border: 0px;"  type="text" value="${list.grade }" readonly="readonly"></td>
				        <td class="myPage_td"><input class="user${i.count }" id="user_point${i.count }" style="border: 0px;"  type="text" value="${list.point }" readonly="readonly"></td>
				        <td class="myPage_td"><input class="user${i.count }" id="user_warn${i.count }" style="border: 0px;"  type="text" value="${list.w_count }" readonly="readonly"></td>
			       
			        <td id="correct_td${i.count }" style="text-align: center; "><input type="button" class=" btn btn-primary" id="correct_user${i.count }" onclick="correct_user('${i.count }')" value="수정"></td>
				        <td style="text-align: center;"><input type="button" class=" btn btn-warning" id="warn_user${i.count }"  onclick="warning_user('${i.count }')" value="경고"></td>
			        <c:if test="${myPage.grade > 2 }"> 
				        <td style="text-align: center;"><input type="button" class=" btn btn-danger" id="delete_user${i.count }"  onclick="delete_user('${i.count }')" value="탈퇴"></td>
			        </c:if>
			      </tr>
		      </c:forEach>
	   		</c:if>
	   	
	    </tbody>
	  </table>
	  <!-- ============================================ Search ================================== -->
	  <div class="user_search">
				
						<div style="text-align: center;">
							<input style="width: 250px; display: inline-block;" class="form-control search" id="userSearch" type="text" placeholder="닉네임을 입력해주세요.">
							<a style="width: 200px;height: 36px;" role="button" class="btn btn-success search" id="userSearchBtn" onclick="userSearch()">
								 <span class="glyphicon glyphicon-search"></span> <span>검색 </span> 
							</a>
						</div>
		</div>
		<!-- ============================================== 페이징 ====================================  -->
		<div class="pageing" style="text-align: center;">
			  <ul class="pagination" > 
			  <c:if test="${listInfo.curBlock > 1 }">
					<li><a role="button" onclick="userList(1)">&lt&lt</a></li>
					<li><a role="button" onclick="userList(${listInfo.startNum-1})">이전</a></li>
			  </c:if>
					<c:forEach begin="${listInfo.startNum }" step="1" end="${listInfo.lastNum }" var="i" >
					    <li id="curPage${i}"><a role="button" onclick="userList(${i})">${i }</a></li>
					</c:forEach>
			  <c:if test="${listInfo.curBlock < listInfo.totalBlock }">
				    <li><a role="button" onclick="userList(${listInfo.lastNum+1})">다음</a></li>
				    <li><a role="button" onclick="userList(${listInfo.lastNum})">&gt&gt</a></li>
			  </c:if>
			  </ul>
		</div>
		
		
	</div>
</body>
<script type="text/javascript">
	if("${message}"!=""){
		alert("${message}");
	}
	$("#curPage${curPage}").addClass("active");

</script>


</html>