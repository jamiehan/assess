package com.examstack.portal.service;

import java.util.List;
import java.util.Map;

import com.examstack.common.domain.exam.UserQuestionHistory;
import com.examstack.common.domain.question.QuestionStatistic;

public interface QuestionHistoryService {

	/**
	 * 插入题目历史
	 * @param historyList
	 */
	public void addUserQuestionHist(List<UserQuestionHistory> historyList);
	
	/**
	 * 插入题目历史
	 * @param history
	 */
	public void addUserQuestionHist(UserQuestionHistory ... history);
	
	/**
	 * 获取用户的题目练习历史
	 * @param userId
	 * @param fieldId
	 * @return Map<知识点,List<UserQuestionHistory>>
	 */
	public Map<Integer,List<UserQuestionHistory>> getUserQuestionHist(int userId,int fieldId);
	
	/**
	 * 根据fieldId,pointId分组统计练习历史题目数量
	 * @param fieldId
	 * @param userId
	 * @return
	 */
	public Map<Integer,QuestionStatistic> getQuestionHistStaticByFieldId(int fieldId, int userId);
	
	/**
	 * 根据fieldId,pointId,typeId分组统计练习历史题目数量
	 * @param fieldId
	 * @param userId
	 * @return
	 */
	public Map<Integer,Map<Integer,QuestionStatistic>> getTypeQuestionHistStaticByFieldId(int fieldId, int userId);
}
