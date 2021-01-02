<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.examstack.common.domain.rules.CmsCat" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- <%@taglib uri="spring.tld" prefix="spring"%> --%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String servletPath = (String)request.getAttribute("javax.servlet.forward.servlet_path");
	String[] list = servletPath.split("\\/");
	request.setAttribute("role",list[1]);
	//	request.setAttribute("topMenuId",list[2]);
//	request.setAttribute("leftMenuId",list[3]);

	request.setAttribute("topMenuId","common");
	request.setAttribute("leftMenuId","cms-cat-list");
	CmsCat cat = (CmsCat)request.getAttribute("cmsCat");
%>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>题目管理</title>
	<meta name="keywords" content="">
	<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
	<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
	<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="resources/css/style.css" rel="stylesheet">

	<link href="resources/css/question-add.css" rel="stylesheet">
	<link href="resources/chart/morris.css" rel="stylesheet">
	<link href="resources/css/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.uploadify-button-text{
			text-decoration: underline;
		}

		span.add-img{
			text-decoration: underline;
			cursor:pointer;
		}

		span.add-img:hover{
			text-decoration: underline;
		}

		.swfupload {
			z-index: 10000 !important;
		}

		.add-content-img{
			display:block;
		}

		.diaplay-img{
			margin-right:5px;
		}

		.diaplay-img:hover{
			text-decoration: underline;

		}
	</style>



	<script type="text/javascript" src="resources/js/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="resources/js/ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" src="resources/js/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>

</head>
<body>
<header>
	<span style="display:none;" id="rule-role-val"><%=list[1]%></span>
	<div class="container">
		<div class="row">
			<c:import url="./common/title.jsp"></c:import>
			<!-- <div class="col-xs-5">
                <div class="logo">
                    <h1><a href="#">网站管理系统</a></h1>
                    <div class="hmeta">
                        专注互联网在线考试解决方案
                    </div>
                </div>
            </div> -->
			<div class="col-xs-7" id="login-info">
				<c:choose>
					<c:when test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
						<div id="login-info-user">

							<a href="user-detail/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" id="system-info-account" target="_blank">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</a>
							<span>|</span>
							<a href="j_spring_security_logout"><i class="fa fa-sign-out"></i> 退出</a>
						</div>
					</c:when>
					<c:otherwise>
						<a class="btn btn-primary" href="user-register">用户注册</a>
						<a class="btn btn-success" href="user-login-page">登录</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</header>
<!-- Navigation bar starts -->

<div class="navbar bs-docs-nav" role="banner">
	<div class="container">
		<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
			<c:import url="/common-page/top-menu?topMenuId=${topMenuId}&leftMenuId=${leftMenuId}" charEncoding="UTF-8" />
		</nav>
	</div>
</div>

<!-- Navigation bar ends -->

<!-- Slider starts -->

<div class="container" style="min-height:500px;">

	<div class="row">
		<div class="col-xs-2" id="left-menu">
			<c:import url="/common-page/left-menu?topMenuId=${topMenuId}&leftMenuId=${leftMenuId}" charEncoding="UTF-8" />
		</div>

		<div class="col-xs-10" id="right-content">
			<div class="page-header">
				<h1><i class="fa fa-bar-chart-o"></i> 修改分类 </h1>
			</div>

			<!-- Slider (Flex Slider) -->
			<div class="form-line add-update-examname  page-content">
				<span class="form-label"><span class="warning-label">*</span>分类名称：</span>
				<input id="catName" type="text" class="df-input-narrow">
				<span class="form-message"></span>
				<button id="submit">提交</button>
			</div>

		</div>
	</div>
</div>

<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="copy">
					<p>
						育涵科技 Copyright © <a href="." target="_blank">主页</a>
						| <a href="#" target="_blank">关于我们</a> | <a
							href="#" target="_blank">FAQ</a> | <a
							href="#" target="_blank">联系我们</a>
					</p>
				</div>
			</div>
		</div>

	</div>

</footer>

<!-- Slider Ends -->
<script type="text/javascript">

	var id = <%= cat.getId()  %>
	var catName = "<%= cat.getCatName() %>";

    $("#catName").val(catName);


	$("#submit").click(function(){
		var catName = $("#catName").val();
		if(!catName){
			alert('请填写分类名称!');
		}else {
			var jsonObj = {"catName": catName};

			$.ajax({
				cache: true,
				type: "POST",
				url: "<%=request.getContextPath()%>/admin/rules/cmsCat_update_up/" + id ,
				data: JSON.stringify(jsonObj),
				dataType: "json",
				contentType: "application/json;charset=UTF-8",//指定消息请求类型
				async: false,
				error: function (request) {
					alert("Connection error");
				},
				success: function (result) {
					if("success" == result.result) {
						alert("提交成功");
					}else{
						alert("提交失败");
					}
				}
			});
		}
	});
</script>


</body>
</html>