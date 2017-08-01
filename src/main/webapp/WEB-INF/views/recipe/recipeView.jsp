<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="recipeView" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
				<input type=button style='background-image: url("../resources/images/kdk/btn_top-62b456f2a56a031d3b40e64137fe8aa9.png")' id=topbtn>
			</div>
		</div>
	</div>
<script>
	$('#topbtn').click(function(){
		$('#recipeView').scrollTop(0);
	});
</script>
</div>