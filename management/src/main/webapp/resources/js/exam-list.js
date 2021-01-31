$(function(){
	exams.initial();
});
var exams = {
		initial : function initial(){
			this.bindApprove();
			this.bindDisapprove();
			this.bindDelete();
			this.bindAddUser();
			this.bindStartAssess();
			this.bindContinueAssess();
			this.bindGeneratePlan();

		},
		bindApprove : function bindApprove(){
			$(".approved-btn").click(function(){
				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					type : "GET",
					url : util.getCurrentRole() + "/exam/mark-exam/" + $(this).data("id") + "/1",
					success : function(message, tst, jqXHR) {
						if (!util.checkSessionOut(jqXHR))
							return false;
						if (message.result == "success") {
							util.success("操作成功!", function(){
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
		},
		bindAddUser : function bindAddUser(){
			$("#link-user-btn").click(function(){

				var data = $("#name-add-link").val();
				jQuery.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					type : "POST",
					url : util.getCurrentRole() + "/exam/add-exam-user/" + $("#link-user-btn").data("id"),
					data : data,
					success : function(message, tst, jqXHR) {
						if (message.result == "success") {
							util.success("添加成功！", function() {
								//window.location.reload();

							});
						} else {
							alert(message.result);
						}
					},
					error : function(jqXHR, textStatus) {
						util.error("操作失败请稍后尝试");
					}
				});
				return false;
			});
		},
		bindDisapprove : function bindDisapprove(){
			$(".disapproved-btn").click(function(){

				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					type : "GET",
					url : util.getCurrentRole() + "/exam/mark-exam/" + $(this).data("id") + "/2",
					success : function(message, tst, jqXHR) {
						if (!util.checkSessionOut(jqXHR))
							return false;
						if (message.result == "success") {
							util.success("操作成功!", function(){
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
		},
		
		bindDelete : function bindDelete(){
			$(".delete-btn").click(function(){

				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					type : "GET",
					url : util.getCurrentRole() + "/exam/delete-exam/" + $(this).data("id"),
					success : function(message, tst, jqXHR) {
						if (!util.checkSessionOut(jqXHR))
							return false;
						if (message.result == "success") {
							util.success("操作成功!", function(){
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
		},
		bindStartAssess : function bindStartAssess(){
			$(".start-assess-btn").click(function(){
                window.location.href = util.getCurrentRole() + "/exam/start-assess/" + $(this).data("id");
				/*$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					type : "GET",
					url : util.getCurrentRole() + "/exam/start-assess/" + $(this).data("id"),
					success : function(message, tst, jqXHR) {
						window.location.href= util.getCurrentRole() + "/exam/assess-content";

						/!*if (!util.checkSessionOut(jqXHR))
							return false;
						if (message.result == "success") {
							util.success("操作成功!", function(){
								window.location.href=message.result;
							});
						} else {
							util.error("操作失败请稍后尝试:" + message.result);
						}*!/

					},
					error : function(jqXHR, textStatus) {
						util.error("操作失败请稍后尝试");
					}
				});
*/
				return false;



			});
		},
		bindContinueAssess : function bindContinueAssess(){
			$(".continue-assess-btn").click(function(){
				window.location.href = util.getCurrentRole() + "/exam/continue-assess/" + $(this).data("id");
				return false;
			});
		},
		bindGeneratePlan : function bindGeneratePlan(){
			$(".generate-plan-btn").click(function(){
				
				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					type : "POST",
					url : util.getCurrentRole() + "/trainingplan-add/" + $(this).data("id"),
					success : function(message, tst, jqXHR) {
						if (!util.checkSessionOut(jqXHR))
							return false;
						if (message.result == "success") {
							util.success("操作成功!", function(){
								window.location.href = util.getCurrentRole() + "/exampaper/exampaper-list/0";
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
		}
}