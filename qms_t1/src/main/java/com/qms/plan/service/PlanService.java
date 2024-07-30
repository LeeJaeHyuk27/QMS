package com.qms.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.plan.dao.PlanDao;
import com.qms.plan.vo.PlanInfoVO;
import com.qms.plan.vo.ProductVO;
import com.qms.receive.vo.PartnerVO;
import com.qms.table.vo.system.PartnerInfoVO;

@Service
public class PlanService {
	@Autowired
	PlanDao dao;
	
	public List<PartnerInfoVO> selectPartnerInfo(PlanInfoVO vo)throws Exception{
		return dao.selectPartnerInfo(vo);
	}

	// 계획리스트 조회
	public List<PlanInfoVO> selectPlanList(PlanInfoVO vo)throws Exception{
		return dao.selectPlanList(vo);
	}
	
	// 생산 계획 저장 프로세스
	public int deletePlan(PlanInfoVO vo)throws Exception{
		return dao.deletePlan(vo);
	}
	public int insertPlan(PlanInfoVO vo)throws Exception{
		return dao.insertPlan(vo);
	}
	
	// 생산 실적 조회
	public List<ProductVO>selectProductInfo(ProductVO vo)throws Exception{
		return dao.selectProductInfo(vo);
	}
	// 소요자제 조회
	public List<PlanInfoVO> selectPlanQtyList(PlanInfoVO vo)throws Exception{
		return dao.selectPlanQtyList(vo);
	}
		
	// bom 자재 조회
	public List<PlanInfoVO> selectPlanQtyBomList(PlanInfoVO vo)throws Exception{
		return dao.selectPlanQtyBomList(vo);
	}
		
	// 소요자제 조회
	public List<PlanInfoVO> selectPlanQtyListExcel(PlanInfoVO vo)throws Exception{
		return dao.selectPlanQtyListExcel(vo);
	}
			
	// bom 자재 조회
	public List<PlanInfoVO> selectPlanQtyBomListExcel(PlanInfoVO vo)throws Exception{
		return dao.selectPlanQtyBomListExcel(vo);
	}
	
	// 생산품목정보 리스트
	public List<ProductVO> selectModalInfo(ProductVO vo)throws Exception{
		return dao.selectModalInfo(vo);
	}
	
	// 생산자 리스트
	public List<ProductVO> selectAllUser(ProductVO vo)throws Exception{
		return dao.selectAllUser(vo);
	}
	
	// 생산 실적 저장 프로세스
	public int deleteItem(ProductVO vo)throws Exception{
		return dao.deleteItem(vo);
	}
	public int insertItem(ProductVO vo)throws Exception{
		return dao.insertItem(vo);
	}
}
