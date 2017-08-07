<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	
<div class="container">
  <h2>${messageList_title }</h2>
   <input type="hidden" id="message_category" value="${category }">
  <table class="table">
    <thead>
      <tr>
        <th>No.</th>
        <th>
        	<c:if test="${category eq 'send' }">
        		받는사람
        	</c:if>
        	<c:if test="${category eq 'general' || category eq 'report' }">
        		보낸사람
        	</c:if>
        </th>
        <th>제목</th>
        <th>날짜</th>
      </tr>
    </thead>
    <tbody>
	    <c:forEach items="${m_List }" var="list" step="1"  varStatus="i">
		      <tr>
		        <td><strong>${listInfo.startRow-1 + i.count }</strong></td>
		        <td>${list.send_nickName }</td>
		        <td><a role="button" onclick="messageView('${list.m_num}')">
		        <c:if test="${list.status == 0 }"><strong> ${list.title }</strong> </c:if>
		      	<c:if test="${list.status == 1 }"><span style="color: #777;">${list.title }</span> </c:if>
		        
		        </a></td>
		        <td>${list.send_time }</td>
		      </tr>
    	
    	</c:forEach>
     
    </tbody>
  </table>
  
  <!-- ============================================== 페이징 ====================================  -->
		<div class="pageing" style="text-align: center;">
			  <ul class="pagination" > 
			  <c:if test="${listInfo.curBlock > 1 }">
					<li><a role="button"  onclick="messageList(1)">&lt&lt</a></li>
					<li><a role="button" onclick="messageList(${listInfo.startNum-1})">이전</a></li>
			  </c:if>
					<c:forEach begin="${listInfo.startNum }" step="1" end="${listInfo.lastNum }" var="i" >
					    <li id="curPage${i}"><a role="button" onclick="messageList(${i})">${i }</a></li>
					</c:forEach>
			  <c:if test="${listInfo.curBlock < listInfo.totalBlock }">
				    <li><a role="button" onclick="messageList(${listInfo.lastNum+1})">다음</a></li>
				    <li><a role="button" onclick="messageList(${listInfo.lastNum})">&gt&gt</a></li>
			  </c:if>
			  </ul>
		</div>
  
  
</div>
</body>
<script type="text/javascript">
	$("#curPage${curPage}").addClass("active");

</script>
</html>