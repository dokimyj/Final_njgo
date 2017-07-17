<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp" />
<link rel="stylesheet" href="../resources/css/common/basic.css">
<link rel="stylesheet" href="../resources/css/wdh/boardWrite.css">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
	<c:import url="../tmp/header.jsp" />
	<!-- section  -->
	<section class="main_section">
		
      <div class="container">
	
         <form id="frm" action="${pageContext.request.contextPath}/notice/noticeWrite" method="post" enctype="multipart/form-data">
            <input type="hidden" name="writer" value="${param.id}"><!-- 이부분, 생각이 필요함 -->
            <div class="form-group">
               <label for="title" style="font-weight: bolder; vertical-align: middle; font-size: 14px;">제목</label>
               <input type="text" name="title" class="form-control" id="title" style=" display: inline; width: 87.5%; margin-left: 10px;" placeholder="게시글 제목을 입력하세요.">
            </div>

            <div class="form-group" style="margin-bottom: 12px;">
               <textarea class="form-control" rows="5" id="contents" name="contents" style="width: 778px; height:430px; margin-left: 200px;"></textarea>
            </div>
            
            <div class="form-group attach" style="display: none; position: relative;">
               <span style="font-size: 12px; font-weight: bolder; position: absolute; top: 4px;">첨부파일</span>
               <div class="file_list">
                  <ul>
                  </ul>
               </div>
            </div>
            <div id="file_input" style="display: none;"></div>
            <div class="form-group" style="text-align: center; padding-top: 15px; margin-right:60px;">
               <button type="button" id="write" style="padding: 2px 4px; width: 100px;"><i class="fa fa-check" aria-hidden="true" style="font-size: 12px !important;"></i><span style="font-size: 12px; font-weight: bolder;">확인</span></button>
            </div>
         </form>
      </div>
	</section>
	<c:import url="../tmp/footer.jsp" />
</body>
</html>