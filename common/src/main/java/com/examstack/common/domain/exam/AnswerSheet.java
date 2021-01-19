package com.examstack.common.domain.exam;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 答案卡
 */
public class AnswerSheet implements Serializable {
	
	private static final long serialVersionUID = -6266186986931499355L;
	
	private int answerSheetId;
	private int examHistroyId;
	private int examId;
	private int examPaperId;
	private int duration;
	private List<AnswerSheetItem> answerSheetItems;
	private float pointMax;
	private float pointRaw ;
	private Date startTime;
	
	// add for assess
	private int userId; // 学生ID
	private int times; // 评估轮次
	private int sumScore;
	private Date createTime;
	private int creatorId;
	private String creatorName;
	private Date modifyTime;
	private int modifierId;

	public int getAnswerSheetId() {
		return answerSheetId;
	}

	public void setAnswerSheetId(int answerSheetId) {
		this.answerSheetId = answerSheetId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public int getExamHistroyId() {
		return examHistroyId;
	}

	public void setExamHistroyId(int examHistroyId) {
		this.examHistroyId = examHistroyId;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public int getExamPaperId() {
		return examPaperId;
	}

	public void setExamPaperId(int examPaperId) {
		this.examPaperId = examPaperId;
	}



	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public List<AnswerSheetItem> getAnswerSheetItems() {
		return answerSheetItems;
	}

	public void setAnswerSheetItems(List<AnswerSheetItem> answerSheetItems) {
		this.answerSheetItems = answerSheetItems;
	}

	public float getPointMax() {
		return pointMax;
	}

	public void setPointMax(float pointMax) {
		this.pointMax = pointMax;
	}

	public float getPointRaw() {
		return pointRaw;
	}

	public void setPointRaw(float pointRaw) {
		this.pointRaw = pointRaw;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public int getSumScore() {
		return sumScore;
	}

	public void setSumScore(int sumScore) {
		this.sumScore = sumScore;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}

	public String getCreatorName() {
		return creatorName;
	}

	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public int getModifierId() {
		return modifierId;
	}

	public void setModifierId(int modifierId) {
		this.modifierId = modifierId;
	}
	
	

}
