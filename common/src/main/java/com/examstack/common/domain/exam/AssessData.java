package com.examstack.common.domain.exam;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 评估报告数据，一个领域一个评估数据，一个领域生成一个图表
 */
public class AssessData implements Serializable {

	private static final long serialVersionUID = -5790712209735388346L;

	private Map<String, Object> tooltip;
	
//	private Map<String, List<String>> legend;
	
	private Map<String, String> title;
	
	private Map<String, Object> grid;
	
	private Map<String, Object> xAxis;
	
	private Map<String, Object> yAxis;
	
	private List<Map<String, Object>> series;
	
	public AssessData() {
		// tooltip
		tooltip = new HashMap<String, Object>();
		tooltip.put("trigger", "none");
		
		Map<String, String> axisPointer = new HashMap<String, String>();
		axisPointer.put("type", "shadow");
		
		tooltip.put("axisPointer", axisPointer);
		
		//  legend
//		legend = new HashMap<String, List<String>>();
//		legend.put("data", new ArrayList<String>());
		
		// grid
		grid = new HashMap<String, Object>();
		grid.put("left", "3%");
		grid.put("right", "4%");
		grid.put("bottom", "15%");
		grid.put("containLabel", Boolean.TRUE);
		
		// xAxis
		xAxis = new HashMap<String, Object>();
		xAxis.put("type", "value");
		xAxis.put("max", 4);
		
		// yAxis
		yAxis = new HashMap<String, Object>();
		yAxis.put("type", "category");
		
		// series
		series = new ArrayList<Map<String, Object>>();
	}
	
	// add title data
	public void addTitleData(String pointCode, String pointName) {
		title = new HashMap<String, String>();
		
		title.put("text", pointCode + " " + pointName);
		title.put("bottom", "bottom");
		title.put("left", "center");
	}
	
	// add all data
//	public void addData(List<String> legendData, List<String> yAxisData, List<Integer> serieData) {
////		this.addLegendData(legendData);
////		this.addYAxisData(yAxisData);
//		this.addSeriesData(serieData);
//	}
	
	// add legend data
//	public void addLegendData(int times) {
////		List<String> data = new ArrayList<String>();
////		for (int i = 1; i <= times; i++) {
////			data.add("第" + i + "次评估");
////		}
////		
////		legend.get("data").add("第" + times + "次评估");
//	}
	
	public Map<String, String> getTitle() {
		return title;
	}



	public void setTitle(Map<String, String> title) {
		this.title = title;
	}



	// add yAxis data
	public void addYAxisData(String knowlegePointCode, int questionNum) {
		List<String> yAxisData = new ArrayList<String>();
		for (int i = 1; i <= questionNum; i++) {
			yAxisData.add(knowlegePointCode + i);
		}
		
		yAxis.put("data", yAxisData);
	}
	
	// add series
	public void addSeriesData(List<Integer> data, int times) {
		Map<String, Object> serie = new HashMap<String, Object>();
		serie.put("type", "bar");
		serie.put("stack", "总量");
		serie.put("data", data);
		serie.put("name", "第" + times + "次评估");
		
		series.add(serie);
	}

	public Map<String, Object> getTooltip() {
		return tooltip;
	}

	public void setTooltip(Map<String, Object> tooltip) {
		this.tooltip = tooltip;
	}

//	public Map<String, List<String>> getLegend() {
//		return legend;
//	}
//
//	public void setLegend(Map<String, List<String>> legend) {
//		this.legend = legend;
//	}

	public Map<String, Object> getGrid() {
		return grid;
	}

	public void setGrid(Map<String, Object> grid) {
		this.grid = grid;
	}

	public Map<String, Object> getxAxis() {
		return xAxis;
	}

	public void setxAxis(Map<String, Object> xAxis) {
		this.xAxis = xAxis;
	}

	public Map<String, Object> getyAxis() {
		return yAxis;
	}

	public void setyAxis(Map<String, Object> yAxis) {
		this.yAxis = yAxis;
	}

	public List<Map<String, Object>> getSeries() {
		return series;
	}

	public void setSeries(List<Map<String, Object>> series) {
		this.series = series;
	}
	
}
