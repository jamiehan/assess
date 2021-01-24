package com.examstack.management.controller.page.teacher;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.examstack.common.domain.exam.AnswerSheet;
import com.examstack.common.domain.exam.AnswerSheetItem;
import com.examstack.common.domain.exam.Exam;
import com.examstack.common.domain.exam.ExamHistory;
import com.examstack.common.domain.exam.ExamPaper;
import com.examstack.common.domain.exam.Message;
import com.examstack.common.domain.question.Question;
import com.examstack.common.domain.question.QuestionQueryResult;
import com.examstack.common.domain.user.Group;
import com.examstack.common.domain.user.User;
import com.examstack.common.util.Page;
import com.examstack.common.util.PagingUtil;
import com.examstack.common.util.QuestionAdapter;
import com.examstack.management.security.UserInfo;
import com.examstack.management.service.ExamPaperService;
import com.examstack.management.service.ExamService;
import com.examstack.management.service.QuestionService;
import com.examstack.management.service.UserService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class ExamPageTeacher {

	@Autowired
	private UserService userService;
	@Autowired
	private ExamPaperService examPaperService;
	@Autowired
	private ExamService examService;
	
	@Autowired
	private QuestionService questionService;
	
	/**
	 * 考试管理
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/exam-list", method = RequestMethod.GET)
	private String examListPage(Model model, HttpServletRequest request, @RequestParam(value="page",required=false,defaultValue="1") int page) {
		
		Page<Exam> pageModel = new Page<Exam>();
		pageModel.setPageNo(page);
		pageModel.setPageSize(8);
		List<Exam> examList = examService.getExamList(pageModel,1,2);
		String pageStr = PagingUtil.getPagelink(page, pageModel.getTotalPage(), "", "teacher/exam/exam-list");

		model.addAttribute("examList", examList);
		model.addAttribute("pageStr", pageStr);
		return "exam-list";
	}
	
	/**
	 * 模拟考试列表
	 * @param model
	 * @param request
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/model-test-list", method = RequestMethod.GET)
	private String modelTestListPage(Model model, HttpServletRequest request, @RequestParam(value="page",required=false,defaultValue="1") int page) {
		
		Page<Exam> pageModel = new Page<Exam>();
		pageModel.setPageNo(page);
		pageModel.setPageSize(10);
		List<Exam> examList = examService.getExamList(pageModel,3);
		String pageStr = PagingUtil.getPageBtnlink(page,
				pageModel.getTotalPage());
		model.addAttribute("examList", examList);
		model.addAttribute("pageStr", pageStr);
		return "model-test-list";
	}

	/**
	 * 发布考试
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/exam-add", method = RequestMethod.GET)
	private String examAddPage(Model model, HttpServletRequest request) {
		
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext()
			    .getAuthentication()
			    .getPrincipal();
		List<Group> groupList = userService.getGroupListByUserId(userInfo.getUserid(), null);
		List<ExamPaper> examPaperList = examPaperService.getEnabledExamPaperList(userInfo.getUsername(), null);
		Page<User> pageUser = new Page<>();
		pageUser.setPageNo(1);
		pageUser.setPageSize(1);
		List<User> userList = userService.getUserListByRoleId(userInfo.getRoleMap().get("ROLE_STUDENT").getRoleId(), pageUser);
		model.addAttribute("groupList", groupList);
		model.addAttribute("examPaperList", examPaperList);
		model.addAttribute("userList", userList);
		return "exam-add";
	}
	
	/**
	 * 发布考试
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/model-test-add", method = RequestMethod.GET)
	private String modelTestAddPage(Model model, HttpServletRequest request) {
		
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext()
			    .getAuthentication()
			    .getPrincipal();
		List<ExamPaper> examPaperList = examPaperService.getEnabledExamPaperList(userInfo.getUsername(), null);
		
		model.addAttribute("examPaperList", examPaperList);
		return "model-test-add";
	}

	/**
	 * 学员名单
	 * 
	 * @param model
	 * @param request
	 * @param examId
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/exam-student-list/{examId}", method = RequestMethod.GET)
	private String examStudentListPage(Model model, HttpServletRequest request, @PathVariable int examId,@RequestParam(value="searchStr",required=false,defaultValue="") String searchStr,@RequestParam(value="order",required=false,defaultValue="") String order,@RequestParam(value="limit",required=false,defaultValue="0") int limit, @RequestParam(value="page",required=false,defaultValue="1") int page) {
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext()
			    .getAuthentication()
			    .getPrincipal();
		Page<ExamHistory> pageModel = new Page<ExamHistory>();
		pageModel.setPageNo(page);
		pageModel.setPageSize(10);
		if("".equals(searchStr))
			searchStr = null;
		if("".equals(order) || (!"desc".equals(order) && !"asc".equals(order)))
			order = null;
		List<ExamHistory> histList = examService.getUserExamHistListByExamId(examId, searchStr, order, limit, pageModel);
		String pageStr = PagingUtil.getPageBtnlink(page,
				pageModel.getTotalPage());
		List<Group> groupList = userService.getGroupListByUserId(userInfo.getUserid(), null);
		model.addAttribute("groupList", groupList);
		model.addAttribute("histList", histList);
		model.addAttribute("pageStr", pageStr);
		model.addAttribute("examId", examId);
		model.addAttribute("limit", limit);
		model.addAttribute("order", order);
		model.addAttribute("searchStr", searchStr);
		return "user-exam-list";
	}
	
	/**
	 * 学员试卷
	 * @param model
	 * @param request
	 * @param examhistoryId
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/student-answer-sheet/{histId}", method = RequestMethod.GET)
	private String studentAnswerSheetPage(Model model, HttpServletRequest request, @PathVariable int histId) {
		
		ExamHistory history = examService.getUserExamHistListByHistId(histId);
		int examPaperId = history.getExamPaperId();
		
		String strUrl = "http://" + request.getServerName() // 服务器地址
				+ ":" + request.getServerPort() + "/";
		
		ExamPaper examPaper = examPaperService.getExamPaperById(examPaperId);
		StringBuilder sb = new StringBuilder();
		if(examPaper.getContent() != null && !examPaper.getContent().equals("")){
			Gson gson = new Gson();
			String content = examPaper.getContent();
			List<QuestionQueryResult> questionList = gson.fromJson(content, new TypeToken<List<QuestionQueryResult>>(){}.getType());
			
			for(QuestionQueryResult question : questionList){
				QuestionAdapter adapter = new QuestionAdapter(question,strUrl);
				sb.append(adapter.getStringFromXML());
			}
		}
		
		model.addAttribute("htmlStr", sb);
		model.addAttribute("exampaperid", examPaperId);
		model.addAttribute("examHistoryId", history.getHistId());
		model.addAttribute("exampapername", examPaper.getName());
		model.addAttribute("examId", history.getExamId());
		return "student-answer-sheet";
	}
	
	/**
	 * 人工阅卷
	 * @param model
	 * @param request
	 * @param examhistoryId
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/mark-exampaper/{examhistoryId}", method = RequestMethod.GET)
	private String markExampaperPage(Model model, HttpServletRequest request, @PathVariable int examhistoryId) {
		
		ExamHistory history = examService.getUserExamHistListByHistId(examhistoryId);
		int examPaperId = history.getExamPaperId();
		
		String strUrl = "http://" + request.getServerName() // 服务器地址
				+ ":" + request.getServerPort() + "/";
		
		ExamPaper examPaper = examPaperService.getExamPaperById(examPaperId);
		StringBuilder sb = new StringBuilder();
		if(examPaper.getContent() != null && !examPaper.getContent().equals("")){
			Gson gson = new Gson();
			String content = examPaper.getContent();
			List<QuestionQueryResult> questionList = gson.fromJson(content, new TypeToken<List<QuestionQueryResult>>(){}.getType());
			
			for(QuestionQueryResult question : questionList){
				QuestionAdapter adapter = new QuestionAdapter(question,strUrl);
				sb.append(adapter.getStringFromXML());
			}
		}
		
		model.addAttribute("htmlStr", sb);
		model.addAttribute("exampaperid", examPaperId);
		model.addAttribute("examHistoryId", history.getHistId());
		model.addAttribute("exampapername", examPaper.getName());
		model.addAttribute("examId", history.getExamId());
		return "exampaper-mark";
	}

    /**
     * 开始评估
     * @param model
     * @param request
     * @param examId
     * @return
     */
    @RequestMapping(value = "/teacher/exam/start-assess/{examId}", method = RequestMethod.GET)
    private String assessPage(Model model, HttpServletRequest request, @PathVariable int examId) {

		Page<ExamHistory> pageModel = new Page<ExamHistory>();
		pageModel.setPageNo(1);
		pageModel.setPageSize(1);
        List<ExamHistory> history = examService.getUserExamHistListByExamId(examId,null,null,0,pageModel);
		if( history == null || history.size() == 0 ) {
			return null;
		}
        int examPaperId = history.get(0).getExamPaperId();
		String strUrl = "http://" + request.getServerName() // 服务器地址
                + ":" + request.getServerPort() + "/";

        ExamPaper examPaper = examPaperService.getExamPaperById(examPaperId);
        StringBuilder sb = new StringBuilder();
        if(examPaper.getContent() != null && !examPaper.getContent().equals("")){
            Gson gson = new Gson();
            String content = examPaper.getContent();
            List<QuestionQueryResult> questionList = gson.fromJson(content, new TypeToken<List<QuestionQueryResult>>(){}.getType());

            for(QuestionQueryResult question : questionList){
                QuestionAdapter adapter = new QuestionAdapter(question,strUrl);
                sb.append(adapter.getStringFromXML());
            }
        }

        model.addAttribute("htmlStr", sb);
        model.addAttribute("examPaperId", examPaperId);
        model.addAttribute("examHistoryId", history.get(0).getHistId());
        model.addAttribute("examPaperName", examPaper.getName());
        model.addAttribute("examId", history.get(0).getExamId());
		model.addAttribute("userName", history.get(0).getUserName());
		model.addAttribute("userId", history.get(0).getUserId());
        return "assess-content";
    }

	/**
	 * 继续评估
	 * @param model
	 * @param request
	 * @param examId
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/continue-assess/{examId}", method = RequestMethod.GET)
	private String continueAssessPage(Model model, HttpServletRequest request, @PathVariable int examId) {

		Page<ExamHistory> pageModel = new Page<ExamHistory>();
		pageModel.setPageNo(1);
		pageModel.setPageSize(1);
		List<ExamHistory> history = examService.getUserExamHistListByExamId(examId,null,null,0,pageModel);
		if( history == null || history.size() == 0 ) {
			return null;
		}
		int examPaperId = history.get(0).getExamPaperId();
		String strUrl = "http://" + request.getServerName() // 服务器地址
				+ ":" + request.getServerPort() + "/";

		ExamPaper examPaper = examPaperService.getExamPaperById(examPaperId);
		StringBuilder sb = new StringBuilder();
		if(examPaper.getContent() != null && !examPaper.getContent().equals("")){
			Gson gson = new Gson();
			String content = examPaper.getContent();
			List<QuestionQueryResult> questionList = gson.fromJson(content, new TypeToken<List<QuestionQueryResult>>(){}.getType());

			for(QuestionQueryResult question : questionList){
				QuestionAdapter adapter = new QuestionAdapter(question,strUrl);
				sb.append(adapter.getStringFromXML());
			}
		}

		model.addAttribute("htmlStr", sb);
		model.addAttribute("examPaperId", examPaperId);
		model.addAttribute("examHistoryId", history.get(0).getHistId());
		model.addAttribute("examPaperName", examPaper.getName());
		model.addAttribute("examId", history.get(0).getExamId());
		model.addAttribute("userName", history.get(0).getUserName());
		model.addAttribute("userId", history.get(0).getUserId());
		return "assess-content";
	}

	/**
	 * 保存评估
	 */
	@RequestMapping(value = "/teacher/exam/saveassess", method = RequestMethod.POST)
	public @ResponseBody Message saveAssess(@RequestBody AnswerSheet answerSheet){

		List<AnswerSheetItem> itemList = answerSheet.getAnswerSheetItems();

		//评估状态（0：未开始，1：评估中，2：已完成，3：已生成康复计划）
		int approved = 1;

		Gson gson = new Gson();
		//更新评估历史表
		examService.updateUserExamHist(answerSheet, gson.toJson(answerSheet),approved);
		//更新评估表状态
		examService.changeExamStatus(answerSheet.getExamId(), approved);

		//TODO 保存到答题卡表


		//TODO 保存到答题卡明细表

		return new Message();
	}

	/**
	 * 提交评估
	 */
	@RequestMapping(value = "/teacher/exam/assesscommit", method = RequestMethod.POST)
	public @ResponseBody Message submitAssess(@RequestBody AnswerSheet answerSheet){
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
//		AnswerSheet answerSheet = answerSheet;
//		int examHistoryId = exam_history_id;
//				data.exam_history_id = exam_history_id;
//		data.as = answerSheet;
		List<AnswerSheetItem> itemList = answerSheet.getAnswerSheetItems();

		////评估状态（0：未开始，1：评估中，2：已完成，3：已生成康复计划）
		int approved = 2;
//		for(AnswerSheetItem item : itemList){
//			if(item.getQuestionTypeId() != 1 && item.getQuestionTypeId() != 2 && item.getQuestionTypeId() != 3){
//				approved = 2;
//				break;
//			}
//		}
		Gson gson = new Gson();
		//更新评估历史表
		examService.updateUserExamHist(answerSheet, gson.toJson(answerSheet),approved);
		//更新评估表状态
		examService.changeExamStatus(answerSheet.getExamId(), approved);

		// 获取考试历史
		ExamHistory examHistory = examService.getUserExamHistListByHistId(answerSheet.getExamHistroyId());
		
		// 获取学生
		List<User> users = userService.getUserListByUserId(examHistory.getUserId());
		User student = users.get(0);

		Exam exam = examService.getExamById(answerSheet.getExamId());
		//评估类型（1：评估 2：康复计划）
		if( exam.getExamType() == 1 ) {
			//评估轮次+1
			int times = student.getTimes();
			student.setTimes( times + 1 );
			//更新评估轮次
			userService.updateUser(student,null);
		}
		
		// 获取答题卡
		AnswerSheet dbAnswerSheet = null;
		if (exam.getExamType() == 2) { // 康复计划，获取本轮次的评估答题卡
			dbAnswerSheet = examService.getAnswerSheetByStudentIdAndTimes(student.getUserId(), student.getTimes());
		} else if (exam.getExamType() == 1){ // 评估
			dbAnswerSheet = examService.getAnswerSheetByExamHistoryId(examHistory.getHistId());
		}
		
		if (dbAnswerSheet != null) {
			answerSheet.setAnswerSheetId(dbAnswerSheet.getAnswerSheetId());
//			examService.updateAnswerSheet(answerSheet);
		} else {
			answerSheet.setCreatorId(userInfo.getUserid());
			answerSheet.setCreatorName(userInfo.getTrueName());
			
			answerSheet.setTimes(student.getTimes());
			
			answerSheet.setCreateTime(new Date());
			
			examService.addAnswerSheet(answerSheet);
		}
		
		// 保存到答题卡明细表
		List<AnswerSheetItem> dbItemList = null;
		Map<Integer, AnswerSheetItem> itemIdMap = null;
		if (dbAnswerSheet != null) {
			dbItemList = examService.getAnswerSheetItemListByAnswerSheetId(dbAnswerSheet.getAnswerSheetId());
			itemIdMap = new HashMap<Integer, AnswerSheetItem>();
			
			for (AnswerSheetItem item : dbItemList) {
				itemIdMap.put(item.getQuestionId(), item);
			}
		}
		
		Question question = null;
		AnswerSheetItem dbItem = null;
		for (AnswerSheetItem item : itemList) {
			switch (item.getAnswer()) {
			case "A":
				item.setScore(1);
				break;
			case "B":
				item.setScore(2);
				break;
			case "C":
				item.setScore(3);
				break;
			case "D":
				item.setScore(4);
				break;
			default:
				item.setScore(0);
				break;
			}
			
			if (dbAnswerSheet != null) {
				// 成绩只能增不能降
				dbItem = itemIdMap.get(item.getQuestionId());
				if (item.getScore() > dbItem.getScore()) {
					item.setAnswerSheetItemId(dbItem.getAnswerSheetItemId());
					examService.updateAnswerSheetItem(item);
				}
			} else {
				item.setStudentId(student.getUserId());
				
				item.setTimes(student.getTimes());
				
				item.setAnswerSheetId(answerSheet.getAnswerSheetId());
				
				// questioncode and knowledgepoint code
				question = questionService.getQuestionByQuestionId(item.getQuestionId());
				item.setQuestionCode(question.getCode());
				item.setKnowlegePointCode(question.getCode().substring(0,1));
				
				examService.addAnswerSheetItem(item);
			}
		}

		return new Message();
	}
}
