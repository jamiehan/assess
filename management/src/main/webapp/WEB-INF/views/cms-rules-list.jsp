<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	request.setAttribute("leftMenuId","cms-rules-list");
%>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>资料库管理</title>
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="keywords" content="">
	<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
	<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
	<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="resources/css/style.css" rel="stylesheet">

	<link href="resources/css/exam.css" rel="stylesheet">
	<link href="resources/chart/morris.css" rel="stylesheet">
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

<div>
	<!-- Slider (Flex Slider) -->

	<div class="container" style="min-height:500px;">

		<div class="row">
			<div class="col-xs-2" id="left-menu">
				<c:import url="/common-page/left-menu?topMenuId=${topMenuId}&leftMenuId=${leftMenuId}" charEncoding="UTF-8" />
			</div>
			<div class="col-xs-10" id="right-content">
				<div class="page-header">
					<h1><i class="fa fa-bar-chart-o"></i>资料库</h1>
				</div>
				<div class="page-content">
					<div id="dep-list">
						<div class="form-line page-content">
							<span class="form-label">资料类型：</span>
							<%--<select id="cat_id">--%>
							<%--<option id="16">规章制度</option>--%>
							<%--<option id="17">对外培训一</option>--%>
							<%--</select>--%>
							<select id="cat_id">
								<option value="">全部</option>
								<c:forEach items="${catList }" var="item">
									<option value="${item.id }" ${catId == item.id?'selected':''}>${item.catName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="table-controller">
							<div class="btn-group table-controller-item" style="float:left">

									<i class="fa fa-plus-square"></i>
									<a href="<%=basePath%>admin/rules/rules_add">添加资料</a>
									<%--<i class="fa fa-plus-square"></i>--%>
									<%--<a href="<%=basePath%>admin/rules/rules_cat_add">添加资料库分类</a>--%>

							</div>
						</div>
						<table class="table-striped table">
							<thead>
							<tr>
								<td>ID</td>
								<td>资料分类</td>
								<td>资料名称</td>
								<td>添加人</td>
								<td>操作</td>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${cmsRulesList }" var="items">
								<tr><td style="display:none;">
									<input type="checkbox" value="${items.id }">
								</td>
									<td>${items.id }</td>
									<td>${items.catName }</td>
									<td>
										<a href="<%=list[1]%>/rules/cms-rules-show/${items.id }" target="_blank" title="预  览">${items.title }</a>

									</td>
									<td>${items.creator}</td>

									<%--<td>${items.creator }</td>--%>
									<%--<td><fmt:formatDate pattern="yyyy-MM-dd"--%>
														<%--value="${items.createTime}" /></td>--%>
									<td>
										<c:choose>
											<c:when test="${items.creator == sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
												<a class="change-property btn-sm btn-info" href="<%=basePath%>admin/rules/rules_update/${items.id}"><i class="ace-icon fa fa-pencil bigger-120" id="${items.id}"></i></a>
												<a class="delete-rule-btn btn-sm btn-danger" id="${items.id}"><i class="ace-icon fa fa-trash-o bigger-120"></i></a>


											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>

									</td>
								</tr>
							</c:forEach>

							</tbody><tfoot></tfoot>
						</table>
					</div>
					<div id="page-link-content">
						<ul class="pagination pagination-sm">${pageStr}</ul>
					</div>

				</div>
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
	<div class="modal fade" id="add-dep-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h6 class="modal-title" id="myModalLabel">添加部门</h6>
				</div>
				<div class="modal-body">
					<form id="dep-add-form" style="margin-top:40px;"  action="admin/common/dep-add">
						<div class="form-line form-dep-name" style="display: block;">
							<span class="form-label"><span class="warning-label">*</span>名称：</span>
							<input type="text" class="df-input-narrow" id="name">
							<span class="form-message"></span>
							<br>
						</div>
						<div class="form-line form-dep-desc" style="display: block;">
							<span class="form-label"><span class="warning-label">*</span>描述：</span>
							<input type="text" class="df-input-narrow" id="memo">
							<span class="form-message"></span>
							<br>
						</div>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						关闭窗口
					</button>
					<button id="add-dep-btn" type="button" class="btn btn-primary">
						确定添加
					</button>
				</div>
			</div>
		</div>
	</div>
</footer>

<!-- Slider Ends -->

<!-- Javascript files -->
<!-- jQuery -->
<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
<!-- Bootstrap JS -->
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/all.js"></script>
<script type="text/javascript" src="resources/js/dep-list.js"></script>
<script type="text/javascript" src="resources/js/add-dep.js"></script>
<script>
    $(function() {
        $("#add-dep-modal-btn2").click(function() {
            $("#add-dep-modal").modal({
                backdrop : true,
                keyboard : true
            });

        });

        $("#cat_id").change(function() {
            var catId = $("#cat_id").val();
			window.location.href = "<%=request.getContextPath()%>/admin/cms/cms-rules-list?catId=" + catId;
        });

        $(".delete-rule-btn").click(function(){

            var paper_id = $(this).attr("id");
            if(confirm("确定要删除吗？删除后无法恢复")){
                jQuery.ajax({
                    headers : {
                        'Accept' : 'application/json',
                        'Content-Type' : 'application/json'
                    },
                    type : "GET",
                    url : '/admin/cms/delete-cmsRules/' + paper_id,
                    success : function(message, tst, jqXHR) {
                        if (!util.checkSessionOut(jqXHR))
                            return false;
                        if (message.result == "success") {
                            util.success("删除成功！", function() {

                                window.location.reload();
                            });
                        } else {
                            util.error("操作失败请稍后尝试");
                        }
                    },
                    error : function(jqXHR, textStatus) {
                        util.error("操作失败请稍后尝试");
                    }
                });

            }
        });
    });
</script>
</body>
</html>