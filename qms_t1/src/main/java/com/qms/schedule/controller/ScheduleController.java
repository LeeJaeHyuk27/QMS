package com.qms.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.schedule.vo.ScheduleVO;
import com.qms.schedule.service.ScheduleService;

@Controller
public class ScheduleController {

	@Autowired
	ScheduleService service;
	
	@RequestMapping("/schedule")
	public String schedule() throws Exception{
		return "schedule";
	}
	
	// 일정 조회
	@RequestMapping("/schedule/getScheduleInfo")
	@ResponseBody
	public List<ScheduleVO> getScheduleInfo(@ModelAttribute ScheduleVO vo)throws Exception{
		
		List<ScheduleVO> list = service.selectScheduleInfo(vo);
		
		return list;
	}
	
	// 일정 상세 조회
	@RequestMapping("/schedule/getDtlInfo")
	@ResponseBody
	public List<ScheduleVO> selectDtlInfo(@ModelAttribute ScheduleVO vo)throws Exception{
		
		List<ScheduleVO> list = service.selectDtlInfo(vo);
		
		return list;
	}
	
	// 일정 등록
	@RequestMapping("schedule/insertSchedule")
	@ResponseBody
	public int insertSchedule(@ModelAttribute("ScheduleVO")ScheduleVO vo)throws Exception{
		
		service.deleteSchedule(vo);
		
		service.insertNewScheduleDtl(vo);
		
		return 1;
	}
}
