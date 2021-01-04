package com.examstack.common.domain.exam;

import java.io.Serializable;
import java.util.Date;

/**
 * 答题项
 */
public class AnswerSheetItem implements Serializable {
	
	private static final long serialVersionUID = -4390783597629780267L;
	
	private int answerSheetItemId;
	private int answerSheetId;
	
	private float point;
	private int questionTypeId;
	private String answer;
	private int questionId;
	private int questionCode;
	private String comment;
	private boolean right;
	
	// add for assess
	private int studentId;
	private int teacherId;
	private Date assessTime;
	private int knowlege_point_id;
	private String knowlege_point_code;
	private Date createTime;
	private int creatorId;
	private Date modifyTime;
	private int modifierId;
	
	public int getAnswerSheetItemId() {
		return answerSheetItemId;
	}

	public void setAnswerSheetItemId(int answerSheetItemId) {
		this.answerSheetItemId = answerSheetItemId;
	}

	public int getAnswerSheetId() {
		return answerSheetId;
	}

	public void setAnswerSheetId(int answerSheetId) {
		this.answerSheetId = answerSheetId;
	}

	public boolean isRight() {
		return right;
	}

	public void setRight(boolean right) {
		this.right = right;
	}

	public float getPoint() {
		return point;
	}

	public void setPoint(float point) {
		this.point = point;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getQuestionTypeId() {
		return questionTypeId;
	}

	public void setQuestionTypeId(int questionTypeId) {
		this.questionTypeId = questionTypeId;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public Date getAssessTime() {
		return assessTime;
	}

	public void setAssessTime(Date assessTime) {
		this.assessTime = assessTime;
	}

	public int getQuestionCode() {
		return questionCode;
	}

	public void setQuestionCode(int questionCode) {
		this.questionCode = questionCode;
	}

	public int getKnowlege_point_id() {
		return knowlege_point_id;
	}

	public void setKnowlege_point_id(int knowlege_point_id) {
		this.knowlege_point_id = knowlege_point_id;
	}

	public String getKnowlege_point_code() {
		return knowlege_point_code;
	}

	public void setKnowlege_point_code(String knowlege_point_code) {
		this.knowlege_point_code = knowlege_point_code;
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
