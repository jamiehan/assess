$(function() {
	var height = this.body.clientHeight;

	$(parent.document.getElementById("user-list-iframe")).css("height", height);

	$(".r-update-btn").click(function() {
		$(parent.document.getElementById("update-user-modal")).modal({
			backdrop : true,
			keyboard : true
		});
		var depId = $(this).data("depid");
		$("#user-update-form #id-update", parent.document).val($(this).parent().parent().find(".r-id").text().trim());
		$("#user-update-form #name-update", parent.document).val($(this).parent().parent().find(".r-name").text().trim());
		$("#user-update-form #truename-update", parent.document).val($(this).parent().parent().find(".r-truename").text().trim());
		$("#user-update-form #national-id-update", parent.document).val($(this).parent().parent().find(".r-national-id").text().trim());
		$("#user-update-form #phone-update", parent.document).val($(this).parent().parent().find(".r-phone").text().trim());
		$("#user-update-form #email-update", parent.document).val($(this).parent().parent().find(".r-email").text().trim());
		$("#user-update-form #company-update", parent.document).val($(this).parent().parent().find(".r-company").text().trim());
		$("#user-update-form #dept-update", parent.document).val($(this).parent().parent().find(".r-dept").text().trim());
		
		$("#user-update-form #department-input-select-u option[value='-1']", parent.document).attr("selected", "selected"); 
		$("#user-update-form #department-input-select-u", parent.document).children("option").each(function(){
			if($(this).val() == depId){
				$(this).attr("selected","selected");
			}
		});
        var groupId = $(this).data("groupId");
        $("#user-update-form #teacher-group-modify option[value='-1']", parent.document).attr("selected", "selected");
        $("#user-update-form #teacher-group-modify", parent.document).children("option").each(function(){
            if($(this).val() == groupId){
                $(this).attr("selected","selected");
            }
        });

	});
	
	$(".r-assessreport-btn").click(function() {
		$.ajax({
			headers : {
				'Accept' : 'application/json',
				'Content-Type' : 'application/json'
			},
			type : "GET",
			url : "teacher/exam/" + $(this).parent().parent().find(".r-id").text().trim() + "/assessdatas",
			success : function(message, tst, jqXHR) {
				$(parent.document.getElementById("assess-report")).modal({
					backdrop : true,
					keyboard : true
				});
				
				// 清空
				$("#assess-info-table", parent.document).empty();
				
				// 设置表头
				$("#assess-info-table", parent.document).append("<tr><td>儿童姓名：</td><td id='assess-info-name' colspan='2'></td><td></td></tr>")
				$("#assess-info-table", parent.document).append("<tr><td>评估日期</td><td>评估者</td><td>评估颜色</td></tr>")
				
				// 设置基本信息
				$("#assess-info-name", parent.document).html(message.studentName)
				
				assessHistories = message.assessHistories
				for (var i = 0; i < assessHistories.length; i++) {
					$("#assess-info-table", parent.document).append("<tr>" +
							"<td>" + assessHistories[i].time + "</td>" +
							"<td>" + assessHistories[i].teacher + "</td>" +
							"<td bgcolor='" + assessHistories[i].color + "'></td>" +
					"</tr>")
				}
				
				// 生成图表
				assessDatas = message.assessDatas
				lineNum = 0
				for (var i = 0; i < assessDatas.length; i++) {
					// 生成新行
					if (i % 4 == 0) {
						lineNum = lineNum + 1
						$("#assess-report-chart-table", parent.document).append("<tr id='assess-report-chart-box-" + lineNum + "'></tr>")
					}
					
					height = assessDatas[i].yAxis.data.length * 40
					
					$("#assess-report-chart-box-" + lineNum, parent.document).append("<td><div id='assessreport-chart-" + i + "' style='width: 300px; height: " + height + "px; display: inline'></div</td>>")
					
					var myChart = echarts.init(parent.document.getElementById('assessreport-chart-' + i));

			        // 指定图表的配置项和数据
					var option = assessDatas[i];

			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option);
				}

			},
			error : function(jqXHR, textStatus) {
				util.error("操作失败请稍后尝试");
			}
		});

	});
	
	$(".r-reset-pwd-btn").click(function() {
		$(parent.document.getElementById("reset-pwd-modal")).modal({
			backdrop : true,
			keyboard : true
		});
		$("#reset-pwd-form #username-reset", parent.document).val($(this).parent().parent().find(".r-name").text().trim());
	});

	$(".disable-btn").click(function() {

		$.ajax({
			headers : {
				'Accept' : 'application/json',
				'Content-Type' : 'application/json'
			},
			type : "GET",
			url : "secure/change-user-status-" + $(this).data("id") + "-" + $(this).data("status"),
			success : function(message, tst, jqXHR) {
				if (!util.checkSessionOut(jqXHR))
					return false;
				if (message.result == "success") {
					util.success("操作成功", function() {
						window.location.reload();
					});
				} else {
					util.error("操作失败请稍后尝试:" + message.result);
				}

			},
			error : function(jqXHR, textStatus) {
				util.error("操作失败请稍后尝试");
			}
		});

		return false;
	});
	
	var selectGroupId = $(".user-group-nav .active", parent.document).data("id");
	if(selectGroupId==0){
		$("#link-user-modal-btn").hide();
	}
	
	$("#add-user-modal-btn").click(function() {
		$(parent.document.getElementById("add-user-modal")).modal({
			backdrop : true,
			keyboard : true
		});

		var selectGroupId = $(".user-group-nav .active", parent.document).data("id");
		var selectGroupName = $(".user-group-nav .active", parent.document).text().trim();

		$("#user-add-form #group-add", parent.document).val(selectGroupName);
		$("#user-add-form #group-add", parent.document).data("id", selectGroupId);
		$("#user-add-form #group-add-id", parent.document).val(selectGroupId);
	});
    $("#import-user-modal-btn").click(function() {
        $(parent.document.getElementById("import-user-modal")).modal({
            backdrop : true,
            keyboard : true
        });
    });
	$("#link-user-modal-btn").click(function() {
		$(parent.document.getElementById("link-user-modal")).modal({
			backdrop : true,
			keyboard : true
		});
		var selectGroupId = $(".user-group-nav .active", parent.document).data("id");
		var selectGroupName = $(".user-group-nav .active", parent.document).text().trim();

		$("#link-user-form #group-add-link", parent.document).val(selectGroupName);
		$("#link-user-form #group-add-link", parent.document).data("id", selectGroupId);
		$("#add-user-btn", parent.document).data("group", selectGroupId);
	});

	$(".link-user-r-btn").click(function() {
		$(parent.document.getElementById("link-user-modal-r")).modal({
			backdrop : true,
			keyboard : true
		});
		var userId = $(this).parent().parent().find(".r-id").text().trim();
		$("#link-user-form-r #name-add-link-r", parent.document).val(userId);
		/*var selectGroupId = $(".user-group-nav .active",parent.document).data("id");
		 var selectGroupName = $(".user-group-nav .active",parent.document).text();

		 $("#link-user-form #group-add-link",parent.document).val(selectGroupName);
		 $("#link-user-form #group-add-link",parent.document).data("id", selectGroupId);
		 $("#add-user-btn",parent.document).data("group", selectGroupId);*/
	});
}); 