package com.qms.pdf.vo;

import lombok.Data;

@Data
public class PdfVo {
	
	private String PdfCode;                  // pdf종류가 여러개일때 html을 구분하기위 한코드
	private String PdfFilePath;              // pdf파일이 저장되는 경로
	private String PdfFileName;              // pdf파일 이름
	
}
