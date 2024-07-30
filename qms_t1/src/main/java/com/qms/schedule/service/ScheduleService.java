package com.qms.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.schedule.vo.ScheduleVO;
import com.qms.schedule.dao.ScheduleDao;

@Service
public class ScheduleService {

	@Autowired
	ScheduleDao dao;
	
	// 일정 조회
	public List<ScheduleVO> selectScheduleInfo(ScheduleVO vo)throws Exception{
		return dao.selectScheduleInfo(vo);
	}
	
	// 일정 상세 조회
	public List<ScheduleVO> selectDtlInfo(ScheduleVO vo)throws Exception{
		
		return dao.selectDtlInfo(vo);
	}

	// 일정 등록
	public int deleteSchedule(ScheduleVO vo)throws Exception{
		
		return dao.deleteSchedule(vo);
	}
	public int insertNewScheduleDtl(ScheduleVO vo)throws Exception{
		
		return dao.insertNewScheduleDtl(vo);
	}
}
