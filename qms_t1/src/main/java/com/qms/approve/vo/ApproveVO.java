package com.qms.approve.vo;

import java.util.List;

import com.qms.table.vo.approve.AprvLineVO;
import com.qms.table.vo.common.ComCodeVO;

import lombok.Data;

@Data
public class ApproveVO extends ComCodeVO {

	
	private String userId;
	private String userName;
	private String deptName;	//부서
	private String comName;		//직급
	private String comGrpCd;	//직위코드 ( 공통코드 : US01 )
	private String positionCd;	//직위코드 ( 공통코드 : US01 )
	
	private List<ComCodeVO> typelist;
    private List<ComCodeVO> yearlist;
    private List<ComCodeVO> classlist;
    private List<ComCodeVO> statuslist;
    
    private List<AprvLineVO> aprvlinelist;
    
    
}
