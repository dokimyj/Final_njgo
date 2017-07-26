<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="recipeView" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"><!-- 요리의 title --></h4>
			</div>
			<div class="modal-body">
				model.addAttribute("recipe", recipeService.view(num).get("recipeDTO"));
		model.addAttribute("ingredients", recipeService.view(num).get("ingredients"));
		model.addAttribute("steps", recipeService.view(num).get("steps"));
		model.addAttribute("hashtags", recipeService.view(num).get("hashtags"));
		model.addAttribute("curIng", curIng);
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>