package com.qms.schedule.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qms.schedule.vo.ScheduleVO;

@Repository
public interface ScheduleDao {

	// 일정 조회
	public List<ScheduleVO> selectScheduleInfo(ScheduleVO vo)throws Exception;
	
	// 일정 상세 조회
	public List<ScheduleVO> selectDtlInfo(ScheduleVO vo)throws Exception;

	// 일정 등록
	public int deleteSchedule(ScheduleVO vo)throws Exception;
	public int insertNewScheduleDtl(ScheduleVO vo)throws Exception;
}
