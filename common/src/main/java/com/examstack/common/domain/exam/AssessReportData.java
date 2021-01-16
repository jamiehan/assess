package com.examstack.common.domain.exam;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 评估报告数据
 */
public class AssessReportData implements Serializable {

	private static final long serialVersionUID = -5790712209735388346L;

	private String studentName;
	
	private List<Map<String, String>> assessHistories;
	
	private List<AssessData> assessDatas;

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}


	public List<Map<String, String>> getAssessHistories() {
		return assessHistories;
	}

	public void setAssessHistories(List<Map<String, String>> assessHistories) {
		this.assessHistories = assessHistories;
	}

	public List<AssessData> getAssessDatas() {
		return assessDatas;
	}

	public void setAssessDatas(List<AssessData> assessDatas) {
		this.assessDatas = assessDatas;
	}
	
	
}
