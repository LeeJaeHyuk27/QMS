package com.qms.for_test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.for_test.dao.CompDao;
import com.qms.for_test.vo.CompVO;
import com.qms.item.vo.ItemVO;@Service
public class CompService {

	@Autowired
	CompDao dao;
	
	public int selectTotalPartnerCount(CompVO vo) throws Exception{
		return dao.selectTotalPartnerCount(vo);
	}
	
	public List<CompVO> selectPartnerList(CompVO vo) throws Exception{
		return dao.selectPartnerList(vo);
	}
	
	//모달
	
	public CompVO selectPartnerDtldata(CompVO vo) throws Exception{
		return dao.selectPartnerDtldata(vo);
	}
	
	public List<ItemVO> selectPartnerItemList(CompVO vo) throws Exception {
		return dao.selectPartnerItemList(vo);
	} 
	
	public int deletePartnerItem(CompVO vo) throws Exception{
		return dao.deletePartnerItem(vo);
	}

	public int insertPartnerItem(CompVO vo) throws Exception{
		return dao.insertPartnerItem(vo);
	}
	
	public int InsertOrSelectPartnerdata(CompVO vo) throws Exception{
		return dao.InsertOrSelectPartnerdata(vo);
	}
	
}
