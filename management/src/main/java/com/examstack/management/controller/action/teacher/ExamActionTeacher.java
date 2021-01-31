package com.examstack.management.controller.action.teacher;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.examstack.common.domain.exam.*;
import com.examstack.common.util.StringUtil;
import com.examstack.management.service.ExamPaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.examstack.common.domain.question.KnowledgePoint;
import com.examstack.common.domain.user.User;
import com.examstack.management.security.UserInfo;
import com.examstack.management.service.ExamService;
import com.examstack.management.service.QuestionService;
import com.examstack.management.service.UserService;
import com.google.gson.Gson;

@Controller
public class ExamActionTeacher {
	@Autowired
	private ExamService examService;
	
	@Autowired
	private org.springframework.amqp.core.AmqpTemplate qmqpTemplate;

	@Autowired
	private UserService userService;

	@Autowired
	private ExamPaperService examPaperService;
	
	@Autowired
	private QuestionService questionService;
	
	private DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * 添加考试
	 * @param exam
	 * @return
	 */
	@RequestMapping(value = "teacher/exam/add-exam", method = RequestMethod.POST)
	public @ResponseBody Message addExam(@RequestBody Exam exam) {

		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Message msg = new Message();
		try {
			exam.setCreator(userInfo.getUserid());
			exam.setCreatorId(userInfo.getUsername());
			exam.setApproved(0);
			examService.addExam(exam);

			ExamHistory examHistory = new ExamHistory();
			examHistory.setUserId(exam.getUserId());
			examHistory.setExamId(exam.getExamId());
			examHistory.setExamPaperId(exam.getExamPaperId());
			Date now = new Date();
			examHistory.setCreateTime(now);
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
			String seriNo = sdf.format(now) + StringUtil.format(exam.getUserId(), 3) + StringUtil.format(exam.getExamId(), 3);
			examHistory.setSeriNo(seriNo);
			examHistory.setApproved(0);
			ExamPaper examPaper = examPaperService.getExamPaperById(exam.getExamPaperId());
			examHistory.setContent(examPaper.getContent());
			examHistory.setDuration(examPaper.getDuration());

			//生成考试历史
			examService.addUserExamHist(examHistory);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg.setResult(e.getClass().getName());
		}
		return msg;
	}
	
	/**
	 * 将用户添加到考试中
	 * @param userNameStr
	 * @param examId
	 * @return
	 */
	@RequestMapping(value = "teacher/exam/add-exam-user/{examId}", method = RequestMethod.POST)
	public @ResponseBody Message addExamUser(@RequestBody String userNameStr,@PathVariable("examId") int examId) {

		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		userNameStr = userNameStr.replace("\"", "");
		Message msg = new Message();
		try {
			
			examService.addExamUser(examId, userNameStr, userInfo.getRoleMap());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg.setResult(e.getClass().getName());
		}
		return msg;
	}
	
	/**
	 * 将用户组中的用户添加到考试中
	 * @param groupIdList
	 * @param examId
	 * @return
	 */
	@RequestMapping(value = "teacher/exam/add-exam-group/{examId}", method = RequestMethod.POST)
	public @ResponseBody Message addExamGroup(@RequestBody List<Integer> groupIdList,@PathVariable("examId") int examId) {

		Message msg = new Message();
		try {
			examService.addGroupUser2Exam(groupIdList, examId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg.setResult(e.getClass().getName());
		}
		return msg;
	}
	
	/**
	 * 添加模拟考试
	 * @param exam
	 * @return
	 */
	@RequestMapping(value = "teacher/exam/add-model-test", method = RequestMethod.POST)
	public @ResponseBody Message addModelTest(@RequestBody Exam exam) {

		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Message msg = new Message();
		try {
			Calendar c = Calendar.getInstance();
			c.add(Calendar.YEAR, 10);
			exam.setCreator(userInfo.getUserid());
			exam.setApproved(1);
			exam.setEffTime(new Date());
			exam.setExpTime(c.getTime());
			examService.addExam(exam);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg.setResult(e.getClass().getName());
		}
		return msg;
	}

	/**
	 * 删除考试
	 * @param examId
	 * @return
	 */
	@RequestMapping(value = "teacher/exam/delete-exam/{examId}", method = RequestMethod.GET)
	public @ResponseBody Message deleteExam(@PathVariable("examId") int examId){
		
		Message msg = new Message();
		try {
			examService.deleteExamById(examId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg.setResult(e.getMessage());
		}
		return msg;
	}
	
	/**
	 * 改变考试的审核状态
	 * @param examId
	 * @param mark
	 * @return
	 */
	@RequestMapping(value = "teacher/exam/mark-exam/{examId}/{mark}", method = RequestMethod.GET)
	public @ResponseBody Message markExam(@PathVariable("examId") int examId,@PathVariable("mark") int mark){
		
		Message msg = new Message();
		try {
			examService.changeExamStatus(examId, mark);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg.setResult(e.getMessage());
		}
		return msg;
	}
	
	/**
	 * 改变用户考试申请的审核状态
	 * @param histId
	 * @param mark
	 * @return
	 */
	@RequestMapping(value = "teacher/exam/mark-hist/{histId}/{mark}", method = RequestMethod.GET)
	public @ResponseBody Message markUserExamHist(@PathVariable("histId") int histId,@PathVariable("mark") int mark){
		
		Message msg = new Message();
		try {
			examService.changeUserExamHistStatus(histId, mark);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg.setResult(e.getMessage());
		}
		return msg;
	}
	
	@RequestMapping(value = "teacher/exam/delete-hist/{histId}", method = RequestMethod.GET)
	public @ResponseBody Message deleteUserExamHist(@PathVariable("histId") int histId){
		
		Message msg = new Message();
		try {
			examService.deleteUserExamHist(histId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg.setResult(e.getMessage());
		}
		return msg;
	}

	/**
	 * 获取答题卡
	 * @param histId
	 * @return
	 */
	@RequestMapping(value = "teacher/exam/get-answersheet/{histId}", method = RequestMethod.GET)
	public @ResponseBody AnswerSheet getAnswerSheet(@PathVariable("histId") int histId){
		ExamHistory history = examService.getUserExamHistListByHistId(histId);
		Gson gson = new Gson();
		AnswerSheet answerSheet = gson.fromJson(history.getAnswerSheet(), AnswerSheet.class);
		return answerSheet;
	}
	
	/**
	 * 阅卷
	 * @param answerSheet
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/answersheet", method = RequestMethod.POST)
	public @ResponseBody Message submitAnswerSheet(@RequestBody AnswerSheet answerSheet){
		Gson gson = new Gson();
		float score = 0f;
		for(AnswerSheetItem item : answerSheet.getAnswerSheetItems()){
			score += item.getPoint();
			//TO-DO:模拟考试是否要记录主观题的历史？
		}
		answerSheet.setPointRaw(score);
		examService.updateUserExamHist(answerSheet, gson.toJson(answerSheet),3);
		return new Message();
	}
	
	/**
	 * 创建答题卡
	 * 
	 * add for assess
	 */
	@RequestMapping(value = "/teacher/exam/answersheet-add", method = RequestMethod.POST)
	public @ResponseBody Message addAnswerSheet_assess(AnswerSheet answerSheet) {

		Message message = new Message();
		
		examService.addAnswerSheet(answerSheet);
		
		return message;
	}
	
	/**
	 * 更新答题卡
	 * 
	 * @param answerSheet
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/answersheet-update", method = RequestMethod.POST)
	public @ResponseBody Message updateAnswerSheet_assess(AnswerSheet answerSheet) {

		Message message = new Message();
		
		examService.updateAnswerSheet(answerSheet);
		
		return message;
	}
	
	/**
	 * 获取答题卡
	 * 
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/answersheet-get/{answerSheetId}", method = RequestMethod.GET)
	public @ResponseBody AnswerSheet getAnswerSheet_assess(@PathVariable("answerSheetId") int answerSheetId) {

//		Message message = new Message();
		
		AnswerSheet answerSheet = examService.getAnswerSheetById(answerSheetId);
		
		return answerSheet;
	}
	
	/**
	 * 查询一个学生的所有答题卡
	 * 
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/answersheet-list/{studentId}", method = RequestMethod.GET)
	public @ResponseBody List<AnswerSheet> listAnswerSheet_assess(@PathVariable("studentId") int studentId) {

//		Message message = new Message();
		
		List<AnswerSheet> answerSheetList = examService.getAnswerSheetListByStudentId(studentId);
		
		return answerSheetList;
	}
	
	/**
	 * 创建答题项
	 * @param answerSheetItem
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/answersheetitem-add", method = RequestMethod.POST)
	public @ResponseBody Message addAnswerSheetItem(@RequestBody AnswerSheetItem answerSheetItem) {

		Message message = new Message();
		
		examService.addAnswerSheetItem(answerSheetItem);
		
		return message;
	}
	
	/**
	 * 更新答题项
	 * @param answerSheetItem
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/answersheetitem-update", method = RequestMethod.POST)
	public @ResponseBody Message updateAnswerSheetItem(@RequestBody AnswerSheetItem answerSheetItem) {

		Message message = new Message();
		
		examService.updateAnswerSheetItem(answerSheetItem);
		
		return message;
	}
	
	/**
	 * 获取答题项
	 * @param answerSheetItem
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/answersheetitem-get/{answerSheetItemId}", method = RequestMethod.GET)
	public @ResponseBody AnswerSheetItem getAnswerSheetItem_assess(@PathVariable("answerSheetItemId") int answerSheetItemId) {

//		Message message = new Message();
		
		AnswerSheetItem AnswerSheetItem = examService.getAnswerSheetItemById(answerSheetItemId);
		
		return AnswerSheetItem;
	}
	
	/**
	 * 查询一个答题卡的所有答题项
	 * 
	 * @param answerSheetItem
	 * @return
	 */
	@RequestMapping(value = "/teacher/exam/answersheetitem-list/{answerSheetId}", method = RequestMethod.GET)
	public @ResponseBody List<AnswerSheetItem> listAnswerSheetItem_assess(@PathVariable("answerSheetId") int answerSheetId) {

//		Message message = new Message();
		
		List<AnswerSheetItem> answerSheetItemList = examService.getAnswerSheetItemListByAnswerSheetId(answerSheetId);
		
		return answerSheetItemList;
	}
	
	/**
	 * 生成评估报告
	 * 
	 */
	@RequestMapping(value = "/teacher/exam/{studentId}/assessreport", method = RequestMethod.GET)
	public String createAssessReport(@PathVariable("studentId") int studentId) {
		// 
		// TODO 生成图形数据
//		List<AnswerSheet> answerSheetList = examService.getAnswerSheetListByStudentId(studentId);
		
		// TODO 跳转到评估报告页面
//		return answerSheetList;
		
		return "assess-report";
	}
	
	/**
	 * 查询一个学生所有的答题卡, 生成评估报告需要的图形数据
	 * 
	 */
	@RequestMapping(value ={"/admin/exam/{studentId}/assessdatas", "/teacher/exam/{studentId}/assessdatas"}, method = RequestMethod.GET)
	public @ResponseBody AssessReportData getAssessData(@PathVariable("studentId") int studentId) {
		AssessReportData assessReportData = new AssessReportData();
		
		// 获取学生信息
		List<User> studentList = userService.getUserListByUserId(studentId);
		User student = studentList.get(0);
		
		assessReportData.setStudentName(student.getUserName());
		
		// 获取学生的评估历史记录
		List<AnswerSheet> answerSheetList = examService.getAnswerSheetListByStudentId(studentId);
		
		List<Map<String, String>> assessHistories = new ArrayList<Map<String, String>>();
		Map<String, String> assessHistory = null;
		
		// TODO 使用数据库数据
		for (AnswerSheet answerSheet : answerSheetList) {
			assessHistory = new HashMap<String, String>();
			assessHistory.put("time", df1.format(answerSheet.getCreateTime()));
			assessHistory.put("teacher", answerSheet.getCreatorName());
			assessHistory.put("color", AssessData.timeColor.get(answerSheet.getTimes()));
			
			assessHistories.add(assessHistory);
		}
		assessReportData.setAssessHistories(assessHistories);
		
		// 评估数据
		List<AssessData> assessDatas = new ArrayList<AssessData>();
		
		// 1. 获取一个学生当前的评估轮次
		int times = student.getTimes();
		
		// 2. 获取所有的评估领域
		List<KnowledgePoint> knowledgePoints = questionService.getKnowledgePointList();
		int pointId;
		String pointCode;

		AssessData assessData = null;
		
		for (KnowledgePoint knowledgePoint : knowledgePoints) {
			pointId = knowledgePoint.getPointId();
			pointCode = knowledgePoint.getPointCode();
			
			// 一个领域的图形数据
			assessData = new AssessData();
			
			// 设置图形title
			assessData.addTitleData(pointCode, knowledgePoint.getPointName());
						
			// 2. 获取指定领域的题目总数
			int questionNum = questionService.getQuestionNumByKnowlegePointId(pointId);
			if (questionNum == 0) {
				continue;
			}
			
			// 生成图形数据的yAxis
			assessData.addYAxisData(pointCode, questionNum);
			
			// 3. 获取指定领域每一轮的评估成绩
			Map<String, Integer> currentScore = new HashMap<String, Integer>();
			List<AnswerSheetItem> answerSheetItems = null;
			List<Integer> score = null;
			Map<String, Integer> tempScore = null;
			for (int i = 1; i <= times; i++) {
				// 根据学生ID和评估轮次获取学生成绩
				answerSheetItems = examService.getAnswerSheetItemListByStudentIdAndTimes(studentId, i, pointCode);
				
				tempScore = new HashMap<String, Integer>();
				for (AnswerSheetItem answerSheetItem : answerSheetItems) {
					if (currentScore.get(answerSheetItem.getQuestionCode()) != null) {
//						score.add(currentScore.get(answerSheetItem.getQuestionCode()));
						
						tempScore.put(answerSheetItem.getQuestionCode(), (answerSheetItem.getScore() - currentScore.get(answerSheetItem.getQuestionCode())));
					} else {
//						score.add(answerSheetItem.getScore());
						tempScore.put(answerSheetItem.getQuestionCode(), answerSheetItem.getScore());
					}
					
					currentScore.put(answerSheetItem.getQuestionCode(), answerSheetItem.getScore());
				}
				
				score = new ArrayList<Integer>();
				for (int k = 1; k < questionNum + 1; k++) {
					score.add(tempScore.get(pointCode + k));
				}
				
				assessData.addSeriesData(score, i);
				
				// 生成图形数据的legend
//				assessData.addLegendData(i);
			}
			
			assessDatas.add(assessData);
		}
		
		assessReportData.setAssessDatas(assessDatas);
		
		// 返回评估报告需要的图形数据
		return assessReportData;
//		return "assess-report";
	}
}

