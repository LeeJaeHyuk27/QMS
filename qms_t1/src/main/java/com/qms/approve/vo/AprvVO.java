package com.qms.approve.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.qms.table.vo.approve.AprvFileVO;
import com.qms.table.vo.approve.AprvInfoVO;
import com.qms.table.vo.approve.AprvLineVO;
import com.qms.table.vo.common.ComCodeVO;

import lombok.Data;

@Data
public class AprvVO extends AprvInfoVO {
	
	//private String docNo;		 //문서번호
	//private String userId;		 //사용자ID
	//private String docType;		 //문서유형 ( 공통코드 : AP01 )
	//private String preserveYear; //보존년한 ( 공통코드 : AP02 )
	//private String docClass;	 //문서종류 ( 공통코드 : AP03 )
	//private String docStatus;	 //문서상태 ( 공통코드 : AP04 )
	//private String title;		 //제목
	//private String content;		 //내용
	private String comName;		 //코드명
	private String userName;	//사용자명
	private String deptCd;		//부서코드
	private String positionCd;	//직위코드 ( 공통코드 : US01 )
	private String userPwd;		//패스워드
	private String phone;		//전화번호
	private String email;		//이메일
	private String leaveDt;		//퇴사일
	private String leaveYn;		//퇴사여부
	private String deptName;
	private String upDeptCd;
	private String delYn;
	private String regDt;
	private String opinion;
	private String aprvStatus;
	
	private List<AprvLineVO> linelist;
	private List<AprvFileVO> filelist;
	
	private String searchType;
	private String aprvType;
	
	
	private String comGrpCd;	//직위코드 ( 공통코드 : US01 )

	private List<ComCodeVO> typelist;
    private List<ComCodeVO> yearlist;
    private List<ComCodeVO> classlist;
    private List<ComCodeVO> statuslist;
    
    @JsonIgnore
    private List<MultipartFile> atcfilelist;
    
    @JsonIgnore
    private MultipartFile filePathFile;	//업로드 파일
    
	
}
