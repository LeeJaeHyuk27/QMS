package com.qms.for_test.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.qms.for_test.vo.CompVO;
import com.qms.item.vo.ItemVO;


@MapperScan(basePackages="com.qms.for_test.dao")
public interface CompDao {
	
	public int selectTotalPartnerCount(CompVO vo) throws Exception;
	
	public List<CompVO> selectPartnerList(CompVO vo) throws Exception;
	
	
	//모달
	
	public CompVO selectPartnerDtldata(CompVO vo) throws Exception;
	
	public List<ItemVO> selectPartnerItemList(CompVO vo) throws Exception; 
	
	public int deletePartnerItem(CompVO vo) throws Exception;
	
	public int insertPartnerItem(CompVO vo) throws Exception;
	
	public int InsertOrSelectPartnerdata(CompVO vo) throws Exception;
}
	