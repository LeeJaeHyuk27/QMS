package com.qms.schedule.vo;

import java.util.List;

import com.qms.table.vo.common.BaseVO;

import lombok.Data;

@Data
public class ScheduleVO extends BaseVO{

	private String userId;
	private String scheduleSeq;
	private String scheduleContent;
	private String scheduleStatus;
	private String startDt;
	private String endDt;
	
	// 조건 추가
	private String scheduleDt;
	private String startDtHour;
	private String startDtMin;
	private String endDtHour;
	private String endDtMin;
	private List<ScheduleVO> scheduleList;
}
