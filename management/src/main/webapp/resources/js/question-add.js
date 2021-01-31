$(function() {
	question_add.initial();

});

question_add = {
	initial : function initial() {
		this.bindAddPoint();
		this.bindChangeQuestionType();
		this.bindAddOpt();
		this.bindRemoveOpt();
		this.bindSubmit();
	},

	bindChangeQuestionType : function changeQuestionType() {
		$("#question-type select").change(function() {
			if (1 == $(this).val()) {
				$(".correct-answer").hide();
				$(".form-question-opt").show();
				$(".form-question-answer1").show();
				copyToAnswer();
			} else if (2 == $(this).val()) {
				$(".correct-answer").hide();
				$(".form-question-opt").show();
				$(".form-question-answer-muti").show();
				copyToAnswer();
			} else if (3 == $(this).val()) {
				$(".correct-answer").hide();
				$(".form-question-opt").hide();
				$(".form-question-answer-boolean").show();
			} else {
				$(".correct-answer").hide();
				$(".form-question-opt").hide();
				$(".form-question-answer-text").show();
			}

		});
	},

	bindSubmit : function bindSubmit() {
		$("#question-add-form").submit(function() {
            console.log("bindSubmit");
			var verify_result = question_add.verifyInput();
			console.log("verify_result===" + verify_result);
			if (verify_result) {
				var question_entity = question_add.composeEntity();
				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					type : "POST",
					url : "secure/question/question-add",
					data : JSON.stringify(question_entity),
					success : function(message, tst, jqXHR) {
						if (!util.checkSessionOut(jqXHR))
							return false;
						if (message.result == "success") {
							util.success("添加成功", function() {
								document.location.href = document.getElementsByTagName('base')[0].href + util.getCurrentRole() + '/question/question-list';
								question_add.clearContent();

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

			return false;
		});
	},
	
	
	clearContent : function clearContent(){
		$(".add-question-ta").val("");
		$(".display-opt-img").remove();
		$(".display-content-img").remove();
		$(".form-question-reference input").val("");
		$(".form-question-examingpoint input").val("");
		$(".form-question-keyword input").val("");
		$(".form-question-analysis input").val("");
		$(".form-question-opt-item").val("");
		
		$("body").scrollTop(0);
	},

	/**
	 * 检查输入合法性
	 */
	verifyInput : function verifyInput() {
		$(".form-message").empty();
		$(".has-error").removeClass("has-error");
		var question_type = 1;//$("#question-type select").val();
		var result = true;
		result = result && question_add.checkAssessField();//question_add.checkKnowledge();
		if (1 == question_type) {
			var r_checkCode = question_add.checkCode();
			var r_checkContent = question_add.checkContent();
			var r_checkOpt = question_add.checkOpt();
			var r_checkSort = question_add.checkSort();
			result = result && r_checkCode && r_checkContent && r_checkOpt && r_checkSort;
		} else if (2 == question_type) {
			var r_checkContent = question_add.checkContent();
			var r_checkOpt = question_add.checkOpt();
			var r_checkAnswerMuti = question_add.checkAnswerMuti();
			result = result && r_checkContent && r_checkOpt && r_checkAnswerMuti;
		} else if (3 == question_type) {
			var r_checkContent = question_add.checkContent();
			result = result && r_checkContent;
		} else {
			var r_checkContent = question_add.checkContent();
			var r_checkAnswerText = question_add.checkAnswerText();
			result = result && r_checkContent && r_checkAnswerText;
		}
		/*var r_checkAnalysis = question_add.checkAnalysis();
		var r_checkReference = question_add.checkReference();
		var r_checkExamingPoint = question_add.checkExamingPoint();
		var r_checkKeyword = question_add.checkKeyword();

		result = result && r_checkAnalysis && r_checkReference && r_checkExamingPoint && r_checkKeyword;*/

		return result;
	},

    checkAssessField : function checkAssessField() {
        var result = true;

        if ($("#assess-field-select option").length == 0) {
            $(".assess-field .form-message").text("请选择评估领域");
            $("#assess-field-select").addClass("has-error");
            result = false;
        }

        return result;

    },

	checkKnowledge : function checkKnowledge() {
		var result = true;

		if ($("#point-to-select option").length == 0) {
			$(".question-knowledge .form-message").text("该题目至少对应一个知识点");
			$("#point-to-select").addClass("has-error");
			result = false;
		} else if ($("#point-to-select option").length > 4) {
			$(".question-knowledge .form-message").text("知识点数量不应该超过4个");
			$("#point-to-select").addClass("has-error");
			result = false;
		}

		return result;

	},

    /**
     *检查编号
     */
    checkCode : function checkCode() {
        var content = $(".form-question-code input").val();
        if (content == "") {
            $(".form-question-code .form-message").text("请输入编号");
            $(".form-question-code input").focus();
            $(".form-question-code input").addClass("has-error");
            return false;
        } else if (content.length > 500) {
            $(".form-question-code .form-message").text("内容过长，请保持在500个字符以内");
            $(".form-question-code input").focus();
            $(".form-question-code input").addClass("has-error");
            return false;
        } else {
            return true;
        }
    },
    /**
     *检查排序
     */
    checkSort : function checkSort() {
        var sort = $(".form-question-sort input").val();
        if (sort == "") {
            $(".form-question-sort .form-message").text("请输入排序序号");
            $(".form-question-sort input").focus();
            $(".form-question-sort input").addClass("has-error");
            return false;
        } else {
            return true;
        }
    },

	/**
	 *检查题目内容
	 */
	checkContent : function checkContent() {
		var content = $(".question-content textarea").val();
		if (content == "") {
			$(".question-content .form-message").text("请输入题目内容");
			$(".question-content textarea").focus();
			$(".question-content textarea").addClass("has-error");
			return false;
		} else if (content.length > 500) {
			$(".question-content .form-message").text("内容过长，请保持在500个字符以内");
			$(".question-content textarea").focus();
			$(".question-content textarea").addClass("has-error");
			return false;
		} else {
			return true;
		}
	},

	/**
	 *检查选项内容
	 */
	checkOpt : function checkOpt() {
		var question_opt_items = $(".form-question-opt-item");
		var result = true;
		for (var i = 0; i < question_opt_items.length; i++) {
			var item_value = question_opt_items[i].value;
			if (item_value == "") {
				$(".form-question-opt .form-message").text("请输入选项内容");
				$(question_opt_items[i]).focus();
				$(question_opt_items[i]).addClass("has-error");
				result = false;
				break;
			} else if (item_value.length > 100) {
				$(".form-question-opt .form-message").text("选项内容请保持在100个字符以内");
				$(question_opt_items[i]).focus();
				$(question_opt_items[i]).addClass("has-error");
				result = false;
				break;
			}
		}
		return result;
	},

	/**
	 *检查多选题选项选择情况
	 */
	checkAnswerMuti : function checkAnswerMuti() {
		var muti_answer_opts = $(".form-question-answer-muti input[type=checkbox]");
		for (var i = 0; i < muti_answer_opts.length; i++) {
			if (muti_answer_opts[i].checked == true) {
				return true;
			}
		}
		var messagebox = $(".form-question-answer-muti .form-message");
		messagebox.text("请至少选择一个选项");
		messagebox.height(messagebox.height() + 1);
		messagebox.height(messagebox.height() - 1);
		return false;

	},

	/**
	 *检查参考答案选择情况
	 */
	checkAnswerText : function checkAnswerText() {
		var content = $(".form-question-answer-text textarea").val();
		if (content == "") {
			$(".form-question-answer-text .form-message").text("请输入参考答案");
			return false;
		} else if (content.length > 500) {
			$(".form-question-answer-text .form-message").text("内容过长，请保持在500个字符以内");
			return false;
		} else {
			return true;
		}
	},

	checkReference : function checkReference() {
		var content = $(".form-question-reference input").val();
		if (content.length > 50) {
			$(".form-question-reference input").focus();
			$(".form-question-reference input").addClass("has-error");
			$(".form-question-reference .form-message").text("内容过长，请保持在50个字符以内");
			return false;
		} else
			return true;
	},
	
	checkExamingPoint : function checkExamingPoint() {
		var content = $(".form-question-examingpoint input").val();
		if (content.length > 50) {
			$(".form-question-examingpoint input").focus();
			$(".form-question-examingpoint input").addClass("has-error");
			$(".form-question-examingpoint .form-message").text("内容过长，请保持在50个字符以内");
			return false;
		} else
			return true;
	},
	checkKeyword : function checkKeyword() {
		var content = $(".form-question-keyword input").val();
		if (content.length > 50) {
			$(".form-question-keyword input").focus();
			$(".form-question-keyword input").addClass("has-error");
			$(".form-question-keyword .form-message").text("内容过长，请保持在50个字符以内");
			return false;
		} else
			return true;
	},

	checkAnalysis : function checkAnalysis() {
		var content = $(".form-question-analysis textarea").val();
		if (content.length > 500) {
			$(".form-question-analysis textarea").focus();
			$(".form-question-analysis textarea").addClass("has-error");
			$(".form-question-analysis .form-message").text("内容过长，请保持在500个字符以内");
			return false;
		} else
			return true;
	},

	/**
	 *添加一个选项
	 */

	bindAddOpt : function bindAddOpt() {

		$("#ques-add-opt").click(function() {
			var optlength = $(".form-question-opt .add-opt-item").length;
			if (optlength > 5) {
				$(".form-question-opt .form-message").text("选项不能超过6个");
				return false;
			}
			var text = "<span class=\"add-opt-item\"><label class=\"que-opt-no\">" + String.fromCharCode(65 + optlength) + "</label><input type=\"text\" class=\"df-input-narrow form-question-opt-item\"/> <span class=\"add-img add-opt-img\">添加图片</span> <span><i class=\"small-icon ques-remove-opt fa fa-minus-square\" title=\"删除此选项\"></i></span> </span>";
			$(".add-opt-items").append(text);
			question_add.copyToAnswer();
		});
	},

	/**
	 *删除一个选项
	 */
	bindRemoveOpt : function bindRemoveOpt() {
		$(".form-question-opt").on("click", ".ques-remove-opt", function() {
			$(this).parent().parent().remove();
			question_add.rearrange();
			question_add.copyToAnswer();

		});

	},

	/**
	 *选项重新排序
	 */
	rearrange : function rearrange() {
		var opts = $(".form-question-opt .que-opt-no");
		opts.each(function(index) {
			$(this).text(String.fromCharCode(65 + index));
		});
	},

	/**
	 *
	 */
	bindAddPoint : function bindAddPoint() {
		$("#add-point-btn").click(function() {
			var field = $("#field-select > option:selected");
			var point = $("#point-from-select > option:selected");
			if (field.length == 0 || point.length == 0) {
				util.error("请选择需要添加的知识点");
				return false;
			}

			var html = "<option value=\"" + point.attr("value") + "\">" + field.text() + " > " + point.text() + "</option>";
			var p = point.attr("value");
			if (!question_add.checkPointDuplicate(p)) {
				util.error("不能重复添加");
				return false;
			}

			$("#point-to-select").append(html);
			return false;
		});

		$("#del-point-btn").click(function() {
			$("#point-to-select > option:selected").remove();
			return false;
		});

		$("#remove-all-point-btn").click(function() {
			$("#point-to-select").empty();
			return false;
		});
	},

	checkPointDuplicate : function checkPointDuplicate(p) {
		var points = $("#point-to-select option");
		for (var i = 0; i < points.length; i++) {
			var point = $(points[i]).attr("value");
			if (point == p)
				return false;
		}

		return true;
	},

	copyToAnswer : function copyToAnswer() {
		var questionType = $("#question-type select");
		var optlength = $(".form-question-opt-item").length;
		if (1 == questionType.val()) {
			$(".form-question-answer1 select").empty();
			for (var i = 0; i < optlength; i++) {
				$(".form-question-answer1 select").append("<option value=\"" + String.fromCharCode(65 + i) + "\">" + String.fromCharCode(65 + i) + "</option>");
			}

		} else if (2 == questionType.val()) {
			$(".form-question-answer-muti .muti-opt-item").remove();
			for (var i = 0; i < optlength; i++) {
				$(".form-question-answer-muti .form-message").before("<span class=\"muti-opt-item\"><input type=\"checkbox\" value=\"" + String.fromCharCode(65 + i) + "\"/><label class=\"que-opt-no\">" + String.fromCharCode(65 + i) + "</label><br /></span>");
			}
		}
	},

	composeEntity : function composeEntity() {
		// alert("composeEntity....")
        var question_entity = new Object();
        question_entity.question_type_id = 1;//$("#question-type select").val();

		if (1 == question_entity.question_type_id) {
			question_entity.answer = $(".form-question-answer1 select").val();
		} else if (2 == question_entity.question_type_id) {
			var checkboxs = $(".form-question-answer-muti input:checked");
			var tmp_v = "";
			for (var i = 0; i < checkboxs.length; i++) {
				tmp_v = tmp_v + checkboxs[i].value;
			}
			question_entity.answer = tmp_v;

		} else if (3 == question_entity.question_type_id) {
			question_entity.answer = $(".form-question-answer-boolean select").val();
		} else {
			question_entity.answer = $(".form-question-answer-text textarea").val();
		}

        //获取知识点
        var pointList = new Array();
/*        var pointOpts = $("#point-to-select option");
        for (var i = 0; i < pointOpts.length; i++) {
            pointList.push($(pointOpts[i]).attr("value"));
        }*/
		pointList.push($(".assess-field select").val());
		console.log("$(\".assess-field select\").val()===" + $(".assess-field select").val());
        question_entity.pointList = pointList;
		question_entity.questionContent = question_add.composeContent();
        question_entity.name = $(".question-content textarea").val();
		question_entity.analysis = $(".form-question-analysis textarea").val();
		question_entity.referenceName = $(".form-question-reference input").val();
		question_entity.examingPoint = $(".form-question-examingpoint input").val();
		question_entity.keyword = $(".form-question-keyword input").val();
        question_entity.code = $(".form-question-code input").val();
        // alert($(".form-question-sort input").val());
        question_entity.sort = $(".form-question-sort input").val();
		// alert(question_entity)
		return question_entity;
	},

	composeContent : function composeContent() {
		
		var question_type_id = $(".question-type select").val();
		var content = new Object();
		var content_img = $(".display-content-img");
		var content_img_string = content_img.data("url");
		content.title = $(".question-content textarea").val();
		var choiceMap = {};
		var imageMap = {};
		var pointList = new Array();
		
		$("point-to-select option").each(function(){
			pointList.push($(this).val());
		});
		if (content_img.length > 0) {
			content.titleImg = content_img_string;
		}
		if (1 == question_type_id) {
			var add_opt_items = $(".add-opt-item");

			for (var i = 0; i < add_opt_items.length; i++) {
				var add_opt_item = $(add_opt_items[i]);
				//选项标签
				var opt_img = add_opt_item.find(".display-opt-img");
				if (opt_img.length > 0) {
					imageMap[add_opt_item.children(".que-opt-no").text()] = opt_img.data("url");
				}
				choiceMap[add_opt_item.children(".que-opt-no").text()] = add_opt_item.children("input").val();
			}
			
		} else if (2 == question_type_id) {
			var add_opt_items = $(".add-opt-item");

			for (var i = 0; i < add_opt_items.length; i++) {
				var add_opt_item = $(add_opt_items[i]);
				//选项标签
				var opt_img = add_opt_item.find(".display-opt-img");
				if (opt_img.length > 0) {
					imageMap[add_opt_item.children(".que-opt-no").text()] = opt_img.data("url");
				}
				choiceMap[add_opt_item.children(".que-opt-no").text()] = add_opt_item.children("input").val();
			}
		}
		content.choiceImgList = imageMap;
		content.choiceList = choiceMap;
		
		return content;
	}
};

