<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/common/reset.css">
<c:import url="../tmp/Bootstrap.jsp"/>
<link rel="stylesheet" href="../resources/css/common/basic.css">
<style type="text/css">
/* body {
    font-family: 'Lato','Arial';
} */
.planner-menu {
    list-style-type: none;
    padding-top: 0.5em;
    padding-bottom: 0.8em;
    padding-left: 14px;
}
ul, ol {
    margin-top: 0;
    margin-bottom: 8.5px;
}
/***************planner pull-left***********************/
.pull-left {
    float: left !important;
}
.btn {
  	display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    user-select: none;
}
.btn-default {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
}
.btn-xs, .btn-group-xs > .btn {
    padding: 1px 5px;
    font-size: 11px;
    line-height: 1.5;
    border-radius: 3px;
}
.planner-menu a {
    color: #e05050;
}
a {
    text-decoration: none;
    background-color: transparent;
}
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
}
.fa-angle-left:before {
    content: "\f104";
}
.fa-angle-right:before {
    content: "\f105";
}
.fa-calendar:before {
    content: "\f073";
}
*:before, *:after {
    box-sizing: border-box;
}
/***************planner pull-right***********************/
.pull-right {
    float: right !important;
}
#saving-message {
    display: none;
}
.unsaved-changes {
    background: #fffeef url(/assets/images/icons/error.png) no-repeat 2px center;
    border: 1px solid #fdfc8d;
    padding: 4px;
    padding-left: 23px;
    margin-right: 5px;
    margin-top: 5px;
    display: none;
}
button, html input[type="button"], input[type="reset"], input[type="submit"] {
    -webkit-appearance: button;
    cursor: pointer;
}
.btn-primary {
    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
}
/**********************************planner main-header************************************************/
.container{
	width: 100%;
	margin-right: auto;
    margin-left: auto;
}
.container:before, .container:after,.row:before, .row:after{
	content: " ";
    display: table;
}
.row {
    margin-left: -15px;
    margin-right: -15px;
}
.col-xs-12 {
    width: 100%;
}
.col-xs-12, .col-xs-2,.col-xs-10{
    float: left;
	position: relative;
    min-height: 1px;
    padding-left: 15px;
    padding-right: 15px;
}
#lPanel {
    max-width: 300px;
    height: 600px;
}
.col-xs-2 {
    width: 16.66666667%;
}
#accordion {
    height: 100%;
}
.ui-widget {
    font-family: Arial,Helvetica,sans-serif;
    font-size: 1em;
}
.ui-helper-reset {
    margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    line-height: 1.3;
    text-decoration: none;
    /* font-size: 100%; */
    list-style: none;
}
#accordion h3 {
    font-size: 16px;
    padding-left: 25px;
    font-weight: bold;
    line-height: 32px;
}
.ui-accordion .ui-accordion-header {
    margin-top: 0px;
}
.ui-accordion .ui-accordion-header {
    display: block;
    cursor: pointer;
    position: relative;
    margin: 2px 0 0 0;
    padding: .5em .5em .5em .7em;
    min-height: 0;
    font-size: 100%;
}
.ui-state-active, .ui-widget-content .ui-state-active {
    color: #000;
}
.ui-state-active, .ui-widget-content .ui-state-active {
    border: 1px dotted #aaaaaa;
}
.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active {
    background: #ffffff;
    background-image: none;
    /* border: 2px solid #be0000;
    color: #be0000; */
}
.ui-corner-all, .ui-corner-top, .ui-corner-right, .ui-corner-tr {
    border-top-right-radius: 3px;
}
.ui-corner-all, .ui-corner-top, .ui-corner-left, .ui-corner-tl {
    border-top-left-radius: 3px;
}
.ui-accordion .ui-accordion-header .ui-accordion-header-icon {
    position: absolute;
    left: .5em;
    top: 50%;
    margin-top: -8px;
}
.ui-state-active .ui-icon {
    background-image: url(images/ui-icons_ffffff_256x240.png);
}
.ui-icon-triangle-1-s {
    background-position: -64px -16px;
}
.ui-icon {
    width: 16px;
    height: 16px;
}
.ui-icon {
    display: block;
    text-indent: -99999px;
    overflow: hidden;
    background-repeat: no-repeat;
}
#accordion .ui-accordion-content {
    padding: 5px 5px 0px 5px;
}
.ui-accordion .ui-accordion-content {
    padding: 1em 2.2em;
    border-top: 0;
    overflow: auto;
}
.ui-widget-content {
    border: 1px solid #ddd;
    background: #fff;
    color: #333;
}
.lbl-tiny {
    font-size: 8pt;
    margin-left: 5px;
}
label {
    display: inline-block;
    max-width: 100%;
    margin-bottom: 5px;
    font-weight: bold;
}
.lbl-tiny > input[type="radio"] {
    position: relative;
    left: -4px;
    top: 3px;
}
input[type="radio"], input[type="checkbox"] {
    margin: 4px 0 0;
    /* margin-top: 1px \9; */
    line-height: normal;
}
input[type="checkbox"], input[type="radio"] {
    box-sizing: border-box;
    padding: 0;
}
.ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button {
    font-family: Arial,Helvetica,sans-serif;
    font-size: 1em;
}
button, input, optgroup, select, textarea {
    color: inherit;
    font: inherit;
    /* margin: 0; */
}
.tt-hint {
    color: #999;
}
.typeahead, .tt-query, .tt-hint {
    height: 34px;
    padding: 6px 6px 6px 6px;
    font-size: 14px;
    line-height: 1.4em;
    border: 2px solid #ccc;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    outline: none;
}
pre {
    display: block;
    padding: 8px;
    margin: 0 0 8.5px;
    font-size: 11px;
    line-height: 1.42857143;
    word-break: break-all;
    word-wrap: break-word;
    color: #333333;
    background-color: #f5f5f5;
    border: 1px solid #ccc;
    border-radius: 4px;
}
pre {
    overflow: auto;
}
.recipePick3 .tt-menu {
    margin-top: 0px;
    padding: 0px 0px 0px 0px;
    border: none;
    box-shadow: none;
    width: 140px;
}
.tt-menu {
    /* width: 422px; */
    margin: 4px 0px 0px 0px;
    padding: 8px 0;
    background-color: #fff;
    border: 1px solid #ccc;
    border: 1px solid rgba(0, 0, 0, 0.2);
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;
    border-radius: 8px;
    -webkit-box-shadow: 0 5px 10px rgba(0,0,0,.2);
    -moz-box-shadow: 0 5px 10px rgba(0,0,0,.2);
    box-shadow: 0 5px 10px rgba(0,0,0,.2);
}
.ui-accordion .ui-accordion-header .ui-accordion-header-icon {
    position: absolute;
    left: .5em;
    top: 50%;
    margin-top: -8px;
}
.ui-state-default .ui-icon {
    background-image: url(images/ui-icons_777777_256x240.png);
}
.ui-icon-triangle-1-e {
    background-position: -32px -16px;
}
/*******************************planner main-right*************************************/
.col-xs-10 {
    width: 83.33333333%;
}
.meal-planner-calendar {
   /*  overflow: visible; */
    vertical-align: top;
    background-color: #fff;
    width: 100%;
 	height: 50%;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
.weekrow {
    margin: 0px;
    clear: both;
}
.meal-planner-calendar td {
    border-top: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-left: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
.weekrow td {
    width: 180px;
}
.dayHeader {
    max-width: 180px;
    font-family: Arial;
    background-color: #fff;
    color: #444;
    font-weight: bold;
    /* height: 18px; */
    padding-left: .5em;
    padding-right: .5em;
    font-size: 1em;
    height: 29px;
    overflow: auto;
    vertical-align: middle;
    /* width: 13.5%; */
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
.dayBoxPast, .dayBoxDisabled {
    /* color: #dedede; */
    /* background: #eee; */
    /* opacity: 0.5; */
} 
 TABLE TD {
   /*  color: #333333;
    font-size: 14px; */
    line-height: 1.42857;
} 
 td, th {
    padding: 0;
} 
 .dayHeader .dayTitle {
    font-size: 16px;
    color: #444;
    background-color: #fff;
    position: relative;
    z-index: 0;
    top: 0px;
    right: 0px;
    float: right;
    padding-right: 4px;
} 
tr{
	margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    font-size: 100%;
    vertical-align: baseline;
    background: transparent;
}


</style>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../tmp/header.jsp" />
	<!-- section  -->
		<section class="main_section">
		<h1 style="font-weight: 900; margin-left: 27px; padding-top: 18px; padding-bottom: 5px;">planner</h1>
			<div class="wrapper">
    <div>
    <ol class="planner-menu">
        <li class="pull-left navCommand">
            <div id="cal-nav">
                <span class="btn btn-default btn-xs btnstateless" style="float: left;position:relative;top:4px;">
                    <a href="/plan?startDay=7%2f7%2f2017"><i class="fa fa-angle-left"></i></a>
                </span>
                <span style="float: left; ">
                    <span style="float: left; margin-left: 1em; font-weight: bold;">2017년 7월</span>
                </span>
                <span class="btn btn-xs btn-default btnstateless" style="float: left; margin-left: 1em;position:relative;top:4px;">
                    <a href="/plan?startDay=7%2f21%2f2017"><i class="fa fa-angle-right"></i></a>
                </span>
            </div>

        </li>
        <li class="pull-left">
            <span style="margin-left:1em;"><a href="javascript:void(0);" onclick="gotoDate();"><i class="fa fa-calendar"></i></a> </span>
        </li>

        <li class="pull-right navCommand">
            <span id="saving-message">Saving</span><span class="unsaved-changes">unsaved changes</span>
            <input id="mealplan-save" type="button" style="margin:0px 20px 0px 10px;" class="btn btn-xs btn-warning" data-loading-text="saving..." value="Save">
        </li>
        
    </ol>

    </div>
   <!--------------------------------------------------------------------------------------------------------------------------------------------------  -->
   <div class="container" style="padding: 0px 0px 0px 0px; max-width: 100%;">


<div class="row" style="margin-top: 0.8em;">
    <div class="col-xs-12">
        <div id="lPanel" class="col-xs-2" style="padding-right: 2px;">
            <div id="accordion" class="ui-accordion ui-widget ui-helper-reset" role="tablist">
                <h3 rel="find" class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-header-active ui-state-active ui-corner-top ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-0" aria-controls="ui-accordion-accordion-panel-0" aria-selected="true" tabindex="0"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>Find Recipe</h3>
                <div style="text-align: center; display: block; height: 300px; overflow: auto;" class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" id="ui-accordion-accordion-panel-0" aria-labelledby="ui-accordion-accordion-header-0" role="tabpanel" aria-expanded="true" aria-hidden="false">
                    <div class="recipePick3">
                        <div id="theControl">
                        	<div id="filterDiv" style="clear:both;">
                        		<label id="myRecipesRB" class="lbl-tiny">
                        			<input type="radio" name="filter" checked="" value="mine">내 레시피</label>
                        				<label class="lbl-tiny" style="margin-left:20px;">
                        					<input type="radio" name="filter" value="all">전체</label>
                        	</div>
                        </div>
                        	<span class="twitter-typeahead" style="position: relative; display: inline-block;">
                        		<input class="rPicker typeahead rPickerTB tt-hint" style="overflow: visible; max-width: 200px; font-size: 14px; position: absolute; top: 0px; left: 0px; border-color: transparent; box-shadow: none; opacity: 1; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(255, 255, 255);" type="text" readonly="" autocomplete="off" spellcheck="false" tabindex="-1" dir="ltr">
                        		<input class="rPicker typeahead rPickerTB tt-input" style="overflow: visible; max-width: 200px; font-size: 14px; position: relative; vertical-align: top; background-color: transparent;" type="text" id="rPicker" placeholder="Title" autocomplete="off" spellcheck="false" dir="auto">
                        		<pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: Lato, Arial; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre>
                        		<div class="tt-menu" style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none;">
                        			<div class="tt-dataset tt-dataset-best-recipes"></div></div></span>
                        				<div class="rPickerWait" style="display:none;font-size:x-small;color:#111;margin-top:0.8em;">searching...</div>
                    </div>
                </div>
                 <!--------------------------------------------------------------------------------------------------------------------------------------------------  -->
                <h3 pcat="byCourse" class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-1" aria-controls="ui-accordion-accordion-panel-1" aria-selected="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>My Recipes</h3>
                <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-1" aria-labelledby="ui-accordion-accordion-header-1" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none; height: 451px; overflow: auto;">
                    <div class="resultList" id="byCourseDiv"></div>
                </div>
                
              
               
            </div>
        </div>
        <div id="calendarTarget" class="col-xs-10" style="padding-left: 0px;">
            <table class="meal-planner-calendar" style="height: 300px; overflow: visible; z-index: 0;">




                    <tbody style="overflow: visible;">
                        <tr class="weekrow" style="height: 50px;">
                                <td id="dayHeader2017-07-09" class="dayHeader dayBoxPast disabled dayBoxDisabled">
                                    Sunday
                                    <span class="dayTitle">
                                            9
                                    </span>
                                </td>
                                <td id="dayHeader2017-07-10" class="dayHeader dayBoxPast disabled dayBoxDisabled">
                                    Monday
                                    <span class="dayTitle">
                                            10
                                    </span>
                                </td>
                                <td id="dayHeader2017-07-11" class="dayHeader dayBoxPast disabled dayBoxDisabled">
                                    Tuesday
                                    <span class="dayTitle">
                                            11
                                    </span>
                                </td>
                                <td id="dayHeader2017-07-12" class="dayHeader dayBoxPast disabled dayBoxDisabled">
                                    Wednesday
                                    <span class="dayTitle">
                                            12
                                    </span>
                                </td>
                                <td id="dayHeader2017-07-13" class="dayHeader dayBoxPast disabled dayBoxDisabled">
                                    Thursday
                                    <span class="dayTitle">
                                            13
                                    </span>
                                </td>
                                <td id="dayHeader2017-07-14" class="dayHeader today-header">
                                    Friday
                                    <span class="dayTitle">
                                            14
                                    </span>
                                </td>
                                <td id="dayHeader2017-07-15" class="dayHeader">
                                    Saturday
                                    <span class="dayTitle">
                                            15
                                    </span>
                                </td>
                        </tr>

                        <tr class="weekrow" style="margin: 0px; clear: left; overflow: visible;">

                                        <td id="dayBox2017-07-09" rel="2017-07-09" class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-09" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li><li class="recipecard" rel="A65527A5-3DA7-6B01-E4C1-7E07925ABBFF" data-mealno="1" data-servings="1"><span class="recipecard-image"><img src="https://photos.bigoven.com/recipe/hero/apple-and-gouda-quesadillas-6936d8.jpg?h=36&amp;w=36"></span><span class="recipetitle" rel="1349877">Apple and Gouda Quesadillas</span></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                            </ul>


                                        </td>
                                        <td id="dayBox2017-07-10" rel="2017-07-10" class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-10" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                            </ul>


                                        </td>
                                        <td id="dayBox2017-07-11" rel="2017-07-11" class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-11" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                            </ul>


                                        </td>
                                        <td id="dayBox2017-07-12" rel="2017-07-12" class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-12" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                            </ul>


                                        </td>
                                        <td id="dayBox2017-07-13" rel="2017-07-13" class="dayBox dayBoxPast disabled dayBoxDisabled" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-13" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="min-width: 16px; float: right; display: none;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="min-width: 16px; float: right; display: none;"></li>
                                            </ul>


                                        </td>
                                        <td id="dayBox2017-07-14" rel="2017-07-14" class="dayBox" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-14" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="min-width: 16px; float: right; display: none;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                            </ul>


                                        </td>
                                        <td id="dayBox2017-07-15" rel="2017-07-15" class="dayBox" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-15" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="min-width: 16px; float: right; display: none;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="min-width: 16px; float: right; display: none;"></li>
                                            </ul>


                                        </td>

                        </tr>
                    </tbody>
                    
                    <!-------------------------------------------------------------------------------------------------------------------------------------->
                    
                    <!-- <tbody style="overflow: visible;">
                        <tr class="weekrow">
                                <td id="dayHeader2017-07-16" class="dayHeader">
                                    Sunday
                                    <span class="dayTitle">
                                            16
                                    </span>
                                </td>
                                <td id="dayHeader2017-07-17" class="dayHeader">
                                    Monday
                                    <span class="dayTitle">
                                            17
                                    </span>
                                </td>
                                <td id="dayHeader2017-07-18" class="dayHeader">
                                    Tuesday
                                    <span class="dayTitle">
                                            18
                                    </span>
                                </td>
                                <td id="dayHeader2017-07-19" class="dayHeader">
                                    Wednesday
                                    <span class="dayTitle">
                                            19
                                    </span>
                                </td>
                                <td id="dayHeader2017-07-20" class="dayHeader">
                                    Thursday
                                    <span class="dayTitle">
                                            20
                                    </span>
                                </td>
                                <td id="dayHeader2017-07-21" class="dayHeader">
                                    Friday
                                    <span class="dayTitle">
                                            21
                                    </span>
                                </td>
                                <td id="dayHeader2017-07-22" class="dayHeader">
                                    Saturday
                                    <span class="dayTitle">
                                            22
                                    </span>
                                </td>
                        </tr>

                        <tr class="weekrow" style="margin: 0px; clear: left; overflow: visible;">

                                        <td id="dayBox2017-07-16" rel="2017-07-16" class="dayBox" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-16" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="min-width: 16px; float: right; display: none;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="min-width: 16px; float: right; display: none;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="min-width: 16px; float: right; display: none;"></li>
                                            </ul>


                                        </td>
                                        <td id="dayBox2017-07-17" rel="2017-07-17" class="dayBox" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-17" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                            </ul>


                                        </td>
                                        <td id="dayBox2017-07-18" rel="2017-07-18" class="dayBox" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-18" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                            </ul>


                                        </td>
                                        <td id="dayBox2017-07-19" rel="2017-07-19" class="dayBox" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-19" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                            </ul>


                                        </td>
                                        <td id="dayBox2017-07-20" rel="2017-07-20" class="dayBox" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-20" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                            </ul>


                                        </td>
                                        <td id="dayBox2017-07-21" rel="2017-07-21" class="dayBox" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-21" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                            </ul>


                                        </td>
                                        <td id="dayBox2017-07-22" rel="2017-07-22" class="dayBox" style="overflow: visible; height: 270px;">


                                            <ul rel="2017-07-22" class="dayBoxList ui-sortable" data-mealno="1">
                                                <li class="dt" rel="meal_1" data-mealno="1"><i class="fa fa-circle breakfastDot"></i> Breakfast <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px;float: right;"></li>
                                                <li class="dt" rel="meal_3" data-mealno="3"><i class="fa fa-circle lunchDot"></i> Lunch <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                                <li class="dt" rel="meal_5" data-mealno="5"><i class="fa fa-circle dinnerDot"></i> Dinner <img src="/assets/images/icons/icon-note.gif" class="noteBtn" style="display: none; min-width: 16px; float: right;"></li>
                                            </ul>


                                        </td>

                        </tr>
                    </tbody> -->
		
            </table>
        </div>
    </div>
</div>

    </div>
</div>
		</section>
	<c:import url="../tmp/footer.jsp" />
</body>
</html>