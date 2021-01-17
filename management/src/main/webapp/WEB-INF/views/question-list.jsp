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
request.setAttribute("topMenuId",list[2]);
request.setAttribute("leftMenuId",list[3]);
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>题目管理</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">

		<link href="resources/css/exam.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
		<style>
			.examing-point {
				display: block;
				font-size: 10px;
				margin-top: 5px;
			}
			.question-name-td {
				width: 300px;
			}
			.change-property {
				cursor: pointer;
			}
			.add-tag-btn {
				cursor: pointer;
			}
		</style>
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
							<h1><i class="fa fa-list-ul"></i> 题目管理 </h1>
						</div>
						<div class="page-content">

							<div id="question-filter">

								<dl id="question-filter-field" style="display:none">
									<dt>
										专业题库：
									</dt>
									<dd>
										<c:choose>
											<c:when test="${questionFilter.fieldId == 0 }">
												<span data-id="0" class="label label-info">全部</span>
											</c:when>
											<c:otherwise>
												<span data-id="0">全部</span>
											</c:otherwise>
										</c:choose>
										<c:forEach items="${fieldList}" var="field">
											<c:choose>
												<c:when test="${questionFilter.fieldId == field.fieldId }">
													<span class="label label-info" data-id="${field.fieldId}">${field.fieldName}</span>
												</c:when>
												<c:otherwise>
													<span data-id="${field.fieldId}">${field.fieldName}</span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</dd>
								</dl>
								<dl id="question-filter-knowledge">
									<dt>
										评估领域：
									</dt>
									<dd>
										<c:choose>
											<c:when test="${questionFilter.knowledge == 0 }">
												<span data-id="0" class="label label-info">全部</span>
											</c:when>
											<c:otherwise>
												<span data-id="0">全部</span>
											</c:otherwise>
										</c:choose>
										<c:forEach items="${knowledgeList}" var="knowledge">
											<c:choose>
												<c:when test="${questionFilter.knowledge == knowledge.pointId }">
													<span data-id="${knowledge.pointId}" class="label label-info">${knowledge.pointName}</span>
												</c:when>
												<c:otherwise>
													<span data-id="${knowledge.pointId}">${knowledge.pointName}</span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</dd>
								</dl>

								<dl id="question-filter-qt"  style="display:none">
									<dt>
										题目类型：
									</dt>
									<dd>
										<c:choose>
											<c:when test="${questionFilter.questionType == 0 }">
												<span data-id="0" class="label label-info">全部</span>
											</c:when>
											<c:otherwise>
												<span data-id="0">全部</span>
											</c:otherwise>
										</c:choose>
										<c:forEach items="${questionTypeList}" var="questionType">
											<c:choose>
												<c:when test="${questionFilter.questionType == questionType.id }">
													<span data-id="${questionType.id}" class="label label-info">${questionType.name}</span>
												</c:when>
												<c:otherwise>
													<span data-id="${questionType.id}">${questionType.name}</span>
												</c:otherwise>
											</c:choose>
										</c:forEach>

									</dd>
								</dl>
								<dl id="question-filter-tag" style="display:none">
									<dt>
										标签：
									</dt>
									<dd>
										<c:choose>
											<c:when test="${questionFilter.tag == 0 }">
												<span data-id="0" class="label label-info">全部</span>
											</c:when>
											<c:otherwise>
												<span data-id="0">全部</span>
											</c:otherwise>
										</c:choose>
										<c:forEach items="${tagList}" var="tag">
											<c:choose>
												<c:when test="${questionFilter.tag == tag.tagId }">
													<span data-id="${tag.tagId}" class="label label-info">${tag.tagName}</span>
												</c:when>
												<c:otherwise>
													<span data-id="${tag.tagId}">${tag.tagName}</span>
												</c:otherwise>
											</c:choose>
										</c:forEach>

									</dd>
								</dl>
									<div class="page-link-content" style="float:right;margin-left:30px;">
								<ul class="pagination pagination-sm">
									${pageStr}
								</ul>
							</div>

								<div class="input-group search-form" style="float: left;width: 300px;padding: 10px 0px;">
									<input type="text" class="form-control" placeholder="搜索题目" value="${searchParam }" id="txt-search">
									<span class="input-group-btn">
										<button class="btn btn-sm btn-default" type="button" id="btn-search" data-id="0">
											<i class="fa fa-search"></i>搜索
										</button> </span>
								</div>
							</div>
							<div id="question-list">
								<input id="field-id-hidden" value="${fieldId }" type="hidden">
								<input id="knowledge-hidden" value="${knowledge }" type="hidden">
								<input id="question-type-hidden" value="${questionType }" type="hidden">
								<input id="search-param-hidden" value="${searchParam }" type="hidden">

								<input id="page-switch-hidden" value="question_list" type="hidden">
								<table class="table-striped table">
									<thead>
										<tr>
											<!-- <td></td> -->
											<td>ID</td>
											<td class="question-name-td" style="width:240px">题目名称</td>
									<%--		<td style="width:60px">类型</td>
											<td>专业</td>--%>
											<td>评估领域</td>
											<td>创建人</td>
											<td style="width:90px;">操作</td>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${questionList }" var="items">
											<tr>
												<td style="display:none;">
												<input type="checkbox" value="${items.id }">
												</td><td>${items.id }</td>
												<td>
													<a href="<%=list[1]%>/question/question-preview/${items.id }" target="_blank" title="预览">${items.name }</a>
														<div class="question-tags">
															<span>${items.tags }</span>
															<!-- <span>易错题</span>
															<span>送分题</span> -->
														</div>
													
													</td>

												<%--<td>${items.questionTypeName }</td>
												<td>${items.fieldName }</td>--%>
												<td>${items.pointName }</td>
												<td>${items.creator }</td> 
												<td>
													<c:choose>
														<c:when test="${items.creator == sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
															<a class="change-property btn-sm btn-info"><i class="ace-icon fa fa-pencil bigger-120"></i></a>
															<a class="delete-question-btn btn-sm btn-danger"><i class="ace-icon fa fa-trash-o bigger-120"></i></a>
															
															<!--  <i class="fa fa-pencil change-property"></i>
															 <i class="fa fa-trash-o delete-question-btn"></i> -->
														</c:when>
														<c:otherwise>
															
														</c:otherwise>
													</c:choose>
												
												</td>
											</tr>
										</c:forEach>

									</tbody><tfoot></tfoot>
								</table>
								<!-- 修改题目modal -->
								<div class="modal fade" id="change-property-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
													&times;
												</button>
												<h6 class="modal-title" id="myModalLabel">修改题目</h6>
											</div>
											<div class="modal-body">
												<form id="question-edit-form">
													<span id="add-update-questionid" style="display:none;"></span>
													<span id="question_type_id" style="display:none;"></span>

													<div class="form-line form-question-id" >
														<span class="form-label"><span class="warning-label"></span>题目ID：</span>
														<span id="question_id"></span>
														<span class="form-message"></span>
														<br>
													</div>
													<div class="form-line assess-field" id="assess-field">
														<span class="form-label"><span class="warning-label">*</span>评估领域：</span>
														<select id="assess-field-select" class="df-input-narrow">
															<c:forEach items="${knowledgePointList}" var="item">
																<option value="${item.pointId }">${item.pointName }</option>
															</c:forEach>
														</select><span class="form-message"></span>
													</div>
													<div class="form-line form-question-code" style="display: block;">
														<span class="form-label"><span class="warning-label">*</span>编号：</span>
														<input type="text" class="df-input-narrow"><span class="form-message"></span>
														<br>
													</div>
													<div class="form-line question-content">
														<span class="form-label"><span class="warning-label">*</span>任务目标：</span>
														<textarea class="add-question-ta"></textarea>
														<span class="add-img add-content-img" style="width:100px;">添加图片</span>
														<span class="form-message"></span>
													</div>
													<div class="form-line form-question-opt" style="display: block;">
														<span class="form-label"><span class="warning-label">*</span>评分标准：</span>
														<div class="add-opt-items">
															<span class="add-opt-item"><label class="que-opt-no">A</label>
																<input type="text" class="df-input-narrow form-question-opt-item">
																<span class="add-img add-opt-img">添加图片</span>
															</span>
															<span class="add-opt-item"><label class="que-opt-no">B</label>
																<input type="text" class="df-input-narrow form-question-opt-item">
																<span class="add-img add-opt-img">添加图片</span>
															</span>
															<span class="add-opt-item"><label class="que-opt-no">C</label>
																<input type="text" class="df-input-narrow form-question-opt-item">
																<span class="add-img add-opt-img">添加图片</span> <span><i class="small-icon ques-remove-opt fa fa-minus-square" title="删除此选项"></i></span>
															</span>
															<span class="add-opt-item"><label class="que-opt-no">D</label>
																<input type="text" class="df-input-narrow form-question-opt-item">
																<span class="add-img add-opt-img">添加图片</span> <span><i class="small-icon ques-remove-opt fa fa-minus-square" title="删除此选项"></i></span>
															</span>
														</div>
														<span id="ques-add-opt"><i class="small-icon fa fa-plus-square" title="添加选项"></i></span>
														<br>
														<span class="form-message"></span>
													</div>
													<div class="form-line form-question-name" hidden>
														<span class="form-label"><span class="warning-label"></span>题目名称：</span>
														<span id="question_name"></span>

														<div id="add-opt-items" class="add-opt-items" style="display: none;" >

														</div>
														<span class="form-message"></span>
														<br>
													</div>
													<div class="form-line question-knowledge" hidden>
														<span class="form-label"><span class="warning-label">*</span>评估领域：</span>
														<div>
															<div class="clearfix">
																<div id="aq-course1" style="padding:0px;float:left; width:48%;">
																	<select id="field-select" class="df-input-narrow" size="4" style="width:100%;">
																		<c:forEach items="${fieldList}" var="field">
																			<option value="${field.fieldId}">${field.fieldName} </option>
																		</c:forEach>
																	</select>
																</div>
																<div id="aq-course2" style="padding:0px; float:right;width:48%;">
																	<select id="point-from-select" class="df-input-narrow" size="4" style="width:100%;">
																		q-label-item				</select>
																</div>
															</div>
															
															<div style="text-align:center;margin:10px 0;">
																<button id="add-point-btn" class="btn btn-primary btn-xs">选择评估领域</button>
																<button id="del-point-btn" class="btn btn-danger btn-xs">删除评估领域</button>
																<button id="remove-all-point-btn" class="btn btn-warning btn-xs">清除列表</button>
															</div>
															<div id="kn-selected" style="padding-left:0px;text-align:center;margin-bottom:20px;">
																	<select id="point-to-select" class="df-input-narrow" size="4" style="width:80%;">
																	</select>
																	<p style="font-size:12px;color:#AAA;">您可以从上面选择4个评估领域</p>
															</div>
														</div>
														<span class="form-message"></span>
													</div>
													<div class="form-line question-type" id="question-type" hidden>
														<span class="form-label"><span class="warning-label">*</span>题目类型：</span>
														<select id="question-type-select" class="df-input-narrow" readonly>

															<option value="1">单选题</option>

															<option value="2">多选题</option>

															<option value="3">判断题</option>

															<option value="4">填空题</option>

															<option value="5">简答题</option>

															<option value="6">论述题</option>

															<option value="7">分析题</option>

														</select><span class="form-message"></span>
													</div>

													<%--<div class="form-line form-question-answer1 correct-answer" hidden>
														<span class="form-label"><span class="warning-label">*</span>正确答案：</span>
														<select class="df-input-narrow" id="question_right_answer">
															<option value="A">A</option><option value="B">B</option><option value="C">C</option><option value="D">D</option>
														</select><span class="form-message"></span>
													</div>--%>
													<div class="form-line form-question-answer-muti correct-answer" style="display: none;">
														<span class="form-label"><span class="warning-label">*</span>正确答案：</span>

														<span class="muti-opt-item">
															<input type="checkbox" value="A">
															<label class="que-opt-no">A</label>
															<br>
														</span>
														<span class="muti-opt-item">
															<input type="checkbox" value="B">
															<label class="que-opt-no">B</label>
															<br>
														</span>
														<span class="muti-opt-item">
															<input type="checkbox" value="C">
															<label class="que-opt-no">C</label>
															<br>
														</span>
														<span class="muti-opt-item">
															<input type="checkbox" value="D">
															<label class="que-opt-no">D</label>
															<br>
														</span>
														<span class="form-message">
															<input id="question_right_answer2" readonly>
														</span>
													</div>
													<div class="form-line form-question-answer-boolean correct-answer" style="display: none;">
														<span class="form-label"><span class="warning-label">*</span>正确答案：</span>
														<select id="form-question-answer-boolean-select" class="df-input-narrow">
															<option value="T">正确</option>
															<option value="F">错误</option>
														</select><span class="form-message"></span>
													</div>
													<div class="form-line correct-answer form-question-answer-text" style="display: none;">
														<span class="form-label form-question-answer-more"><span class="warning-label">*</span>参考答案：</span>
														<textarea class="add-question-ta" style="width: 100%;"></textarea>
														<span class="form-message"></span>
														<br>

													</div>
													<div class="form-line form-question-reference" style="display: none;">
														<span class="form-label"><span class="warning-label"></span>来源：</span>
															<input type="text" class="df-input-narrow" style="width: 100%;"><span class="form-message"></span>
														<br>
													</div>
													<div class="form-line form-question-examingpoint" style="display: none;">
														<span class="form-label"><span class="warning-label"></span>考点：</span>
															<input id="question_examingPoint"  type="text" class="df-input-narrow" style="width: 100%;"><span class="form-message"></span>
														<br>
													</div>
													<div class="form-line form-question-keyword" style="display: none;">
														<span class="form-label"><span class="warning-label"></span>关键字：</span>
															<input type="text" class="df-input-narrow" id="question_keyword" style="width: 100%;"><span class="form-message"></span>
														<br>
													</div>
													<div class="form-line form-question-analysis" style="display: none;">
														<span class="form-label"><span class="warning-label"></span>题目解析：</span>
														<textarea id="question_analysis" class="add-question-ta" style="width: 100%;"></textarea><span class="form-message"></span>
														<br>
													</div>
													<div class="form-line exampaper-type" id="aq-tag" hidden>
														<span class="form-label"><span class="warning-label">*</span>标签：</span>
														<select id="tag-from-select" class="df-input-narrow">
															<c:forEach items="${tagList }" var="item">
																<option value="${item.tagId }" data-privatee="${item.privatee }" data-creator="${item.creator}" data-memo="${item.memo }" data-createtime="${item.createTime }">${item.tagName } </option>
															</c:forEach>

														</select><a class="add-tag-btn">添加</a><span class="form-message"></span>

														<div class="q-label-list"></div>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">
													关闭窗口
												</button>
												<button id="update-exampaper-btn" type="button" class="btn btn-primary">
													确定修改
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="page-link-content">
								<ul class="pagination pagination-sm">
									${pageStr}
								</ul>
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

		</footer>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		
		<script type="text/javascript" src="resources/js/question-list.js"></script>
		<script type="text/javascript" src="resources/js/field-2-point.js"></script>

		<script>

			$(function() {

                var answerShowForType =function(typeId,answer){
                    if (1 == typeId) {
                        $(".correct-answer").hide();
                        $(".form-question-opt").show();
                        $(".form-question-answer1").show();
                        copyToAnswer(typeId,answer);
                    } else if (2 == typeId) {
                        $(".correct-answer").hide();
                        $(".form-question-opt").show();
                        $(".form-question-answer-muti").show();
                        copyToAnswer(typeId,answer);
                    } else if (3 == typeId) {
                        $(".correct-answer").hide();
                        $(".form-question-opt").hide();
                        $(".form-question-answer-boolean").show();
                        copyToAnswer(typeId,answer);
                    } else {
                        $(".correct-answer").hide();
                        $(".form-question-opt").hide();
                        $(".form-question-answer-text").show();
                        copyToAnswer(typeId,answer);
                    }
				};

                var choiceListShowForType =function(typeId,choiceList){
                    if (1 == typeId || 2 == typeId  ) {
                        $(".add-opt-items").show();
                        $(".add-opt-items .question-list-item").remove();
                        var choice = $("#add-opt-items");
                        $.each(choiceList, function(key, element){
                            var html="  <li class=\"question-list-item\">"
                                +"      <span class=\"add-opt-item\">"
								 +"      <label class=\"que-opt-no\">" + key + "</label>"
                                +"      <span class=\"que-opt-no\">" + element + "</span>"
                                +"      <span class=\"add-img add-opt-img\"></span>"
                                +"      </span>"
                                +"      </li>";
                            choice.append(html);

                        });
                    }

                };


                var copyToAnswer = function (typeId,answer) {
                    if (1 == typeId) {
                        $("#question_right_answer").val(answer);
                    } else if (2 == typeId) {
                        var checkboxs = $(".form-question-answer-muti input");
                        for (var i = 0; i < checkboxs.length; i++) {
                            if(answer.indexOf(checkboxs[i].value) != -1){
                                checkboxs[i].checked=true;
                            }
                        }
                    }else if (3 == typeId){
                        $("#form-question-answer-boolean-select").val(answer);
					}else{

                        $(".form-question-answer-text textarea").val(answer);
					}
                };

				$(".change-property").click(function() {
					$("#point-to-select option").remove();
					$("#change-property-modal").modal({
						backdrop : true,
						keyboard : true
					});
					var paper_id = $(this).parent().parent().find(":checkbox").val();
					$("#add-update-questionid").text(paper_id);
					$.ajax({
						headers : {
							'Accept' : 'application/json',
							'Content-Type' : 'application/json'
						},
						type : "GET",
						url : "secure/question/question-detail/" + paper_id,
						success : function(message, tst, jqXHR) {
							if (!util.checkSessionOut(jqXHR))
								return false;
							if (message.result == "success") {

								//将message.object里面的内容写到 div（class=q-label-list）里面
								var innerHtml = "";
								$.each(message.object.tagList, function(index, element) {
									innerHtml += "<span class=\"label label-info q-label-item\" data-privatee=" + element.privatee + " data-creator=" + element.creator + " data-memo=" + element.memo + " data-id=" + element.tagId + ">" + element.tagName + "  <i class=\"fa fa-times\"></i>	</span>";
								});
								$(".q-label-list").html(innerHtml);
								var point = $("#point-to-select");
								$.each(message.object.knowledgePoint, function(index, element){
									var html = "<option value=\"" + element.pointId + "\">" + element.fieldName + " > " + element.pointName + "</option>";
									point.append(html);
								});
                                $(".form-question-code input").val(message.object.code);
                                $(".question-content textarea").val(message.object.name);
                                // $(".form-question-code input").val(message.object.code);

                                var add_opt_items = $(".add-opt-item");

                                for (var i = 0; i < add_opt_items.length; i++) {
                                    var add_opt_item = $(add_opt_items[i]);
                                    /*//选项标签
                                    var opt_img = add_opt_item.find(".display-opt-img");
                                    if (opt_img.length > 0) {
                                        // imageMap[add_opt_item.children(".que-opt-no").text()] = opt_img.data("url");
                                        imageMap[add_opt_item.children(".que-opt-no").text()] = opt_img.data("url");
                                    }*/
                                    // choiceMap[add_opt_item.children(".que-opt-no").text()] = add_opt_item.children("input").val();
                                    add_opt_item.children("input").val(message.object.questionContent.choiceList[add_opt_item.children(".que-opt-no").text()]);
                                }


								$(".form-question-analysis textarea").val(message.object.analysis);
								$(".form-question-reference input").val(message.object.referenceName);
								$(".form-question-examingpoint input").val(message.object.examingPoint);
								$(".form-question-keyword input").val(message.object.keyword);
								$("#question_right_answer").val(message.object.answer);
								$("#question_right_answer2").val(message.object.answer);
								$("#question_name").text(message.object.name);
								$("#question_id").text(message.object.id);
                                $("#question_type_id").text(message.object.question_type_id);

								//选择题型
								// $("#point-from-select").val(message.object.question_type_id);
                                var all_options = document.getElementById("question-type-select").options;
                                all_options[message.object.question_type_id-1].selected = true;
                                $("#question_keyword").val(message.object.keyword);
                                $("#question_analysis").val(message.object.analysis);
                                $("#question_examingPoint").val(message.object.examingPoint);
                                if(message.object.question_type_id==1 || message.object.question_type_id==2)
                                if(message.object.questionContent!=null && message.object.questionContent.choiceList!=null){
                                    //重构选择题
                                    choiceListShowForType(message.object.question_type_id,message.object.questionContent.choiceList);
								}

                                //显示答案类型
                                answerShowForType(message.object.question_type_id,message.object.answer);
							} else {
								util.error("获取标签失败请稍后尝试:" + message.result);
							}

						},
						error : function(jqXHR, textStatus) {
							util.error("操作失败请稍后尝试");
						}
					});
				});

				$(".add-tag-btn").click(function() {
					var label_ids = $(".q-label-item");
					var flag = 0;
					label_ids.each(function() {
						if ($(this).data("id") == $("#tag-from-select").val())
							flag = 1;
					});
					if (flag == 0) {
						var selected = $("#tag-from-select").find("option:selected");

						$(".q-label-list").append("<span class=\"label label-info q-label-item\" data-privatee=" + selected.data("privatee") + " data-creator=" + selected.data("creator") + " data-memo=" + selected.data("memo") + " data-id=" + $("#tag-from-select").val() + " data-createTime=" + selected.data("createTime") + ">" + $("#tag-from-select :selected").text() + "  <i class=\"fa fa-times\"></i>	</span>");
					} else {
						util.error("不能重复添加");
					}
				});


				$(".q-label-list").on("click", ".fa", function() {
					$(this).parent().remove();
				});

				
				$(".delete-question-btn").click(function(){
					if(confirm("确定要删除吗？删除后无法恢复")){
						jQuery.ajax({
							headers : {
								'Accept' : 'application/json',
								'Content-Type' : 'application/json'
							},
							type : "GET",
							url : 'secure/question/delete-question/' + $(this).parent().parent().find(":checkbox").val(),
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
