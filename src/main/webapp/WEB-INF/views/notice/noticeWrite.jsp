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
<title>Insert title here</title>
<style type="text/css">

.container {
	width: 80% !important;
	padding: 0px 6px !important;
}

#title {
	border-color: #b5b5b5;
	border-radius: 0px;
	width: 100%;
	height: 26px;
	font-size: 13px;
	margin-left: 23px;
}

.file_list {
	width: auto;
	margin-left: 60px;
	padding: 0;
	border: 1px solid #DFDFDF;
	font-size: 12px;
}

.file_list>ul>li {
	position: relative;
	margin: 0px;
	padding: 6px 0px 3px 23px;
	background: url(../images/ico_file2.gif) 7px 7px no-repeat;
	font-weight: 700;
}

.file_list>ul>li>span {
	position: absolute;
	right: 5px;
	top: 6px;
	font-size: 9px;
	color: rgb(61, 61, 61);
	vertical-align: middle;
}
</style>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		//전역변수선언
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "contents",
			sSkinURI : "../resources/SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});

		//전송버튼 클릭이벤트
		$("#write").click(
				function() {
					//id가 smarteditor인 textarea에 에디터에서 대입
					editor_object.getById["contents"].exec(
							"UPDATE_CONTENTS_FIELD", []);

					// 이부분에 에디터 validation 검증

					//폼 submit
					$("#frm").submit();
				});

		$('iframe').on("load", function() {
			var file = $(this).contents().find('.file');
			var iframe = $(this).contents().find('iframe');

			file.click(function() {

				inputfile();

			});
		});

		$('#frm').submit(
				function() {
					var title = $('#title').val();
					var contents = $('#contents').val();

					if (title == '') {
						alert('제목을 입력하세요.');
						$('#title').focus();
						return false;
					} else if (contents == "" || contents == null
							|| contents == '&nbsp;'
							|| contents == '<p>&nbsp;</p>') {
						alert('내용을 입력하세요.');
						editor_object.getById["contents"].exec("FOCUS");
						return false;
					}
				});
	});
</script>
<style type="text/css">
.rFile {
	color: red;
}
</style>
</head>
<body>
	<c:import url="../tmp/header.jsp" />
	<!-- section  -->
	<section class="main_section">
		
      <div class="container">
	
         <form id="frm" action="./${param.board}Write.${param.board}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="writer" value="${param.id}">
            <div class="form-group">
               <label for="title" style="font-weight: bolder; vertical-align: middle; font-size: 14px;">제목</label>
               <input type="text" name="title" class="form-control" id="title" style=" display: inline; width: 80%; margin-left: 10px;" placeholder="게시글 제목을 입력하세요.">
            </div>

            <div class="form-group" style="margin-bottom: 12px;">
               <textarea class="form-control" rows="5" id="contents" name="contents" style="width: 60%; height:500px;"></textarea>
            </div>
            
            <div class="form-group attach" style="display: none; position: relative;">
               <span style="font-size: 12px; font-weight: bolder; position: absolute; top: 4px;">첨부파일</span>
               <div class="file_list">
                  <ul>
                  </ul>
               </div>
            </div>
            <div id="file_input" style="display: none;"></div>
            <div class="form-group" style="text-align: center; padding-top: 15px;">
               <button type="button" id="write" style="padding: 2px 4px; width: 100px;"><i class="fa fa-check" aria-hidden="true" style="font-size: 12px !important;"></i><span style="font-size: 12px; font-weight: bolder;">확인</span></button>
            </div>
         </form>
      </div>
	</section>
	<c:import url="../tmp/footer.jsp" />
	
	<script type="text/javascript">
      
      var count = 0;
      
      var fi = $('#file_input');
      
      function inputfile(){
         count++;
         fi.append('<input id="upload'+count+'" name="upload'+count+'" type="file" style="display: none;">');
         var id = 'upload' + count;
         var selector = "#"+id;
         $(selector).click(function(){
            document.body.onfocus = check;
         });
         window.focus();
         $(selector).click();
      }
      
      function check(){
         setTimeout(function(){
            if($("#upload"+count).prop("files").length == 0){
               $("#upload"+count).remove();
               count--;
               
            }else{
               var name = $("#upload"+count).prop("files")[0].name;
               var size = $("#upload"+count).prop("files")[0].size;
               size = calc(size);
               $('.attach > .file_list > ul').append('<li id="list'+count+'">'+name+'<span>'+size+'<img class="delete" src="../images/btn_file_delete.gif" title="'+count+'" style="vertical-align: bottom;"></span></li>');
               
               if(count > 0 && $('.attach').css('display') == 'none')
                  $('.attach').css('display', 'block');
            }
         }, 100);
         document.body.onfocus = null;
      }
      
      function calc(size){
         if(size < 1024)
            size = size + "B";
         else if(size > 1024 && size < 1048576){
            size = size / 1024;
            size = size.toFixed(2);
            size += "KB";
         } else if(size > 1048576 && size < 1073741824){
            size = size / 1048576;
            size = size.toFixed(2);
            size += "MB";
         } else{
            size = size / 1073741824;
            size = size.toFixed(2);
            size += "GB";
         }
         return size;
      }
      
      $(function(){
         $('body').on('click', '.delete', function(){
            var list = '#list' + this.getAttribute('title');
            var upload = '#upload' + this.getAttribute('title');
            $(list).remove();
            $(upload).remove();
            count--;
            if(count == 0 && $('.attach').css('display') == 'block')
               $('.attach').css('display', 'none');
         });
      });
      
   </script>
</body>
</html>