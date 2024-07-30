
package com.qms.pdf.util;

import java.io.FileOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;
import com.qms.pdf.vo.PdfVo;

public class PdfUtil {

public String getHtml(String code)  {
	
	   String return_html = "";
	
	   switch(code) {
	
	   case "pdf":
	     return_html = "<html>" +
	   "<body>" +
	   "<h1>pdf</h1>"+
	   "<p>이미지테스트합니다."+
	   "<img src='http:/localhost:8080/images/test.png'/>"+
	   "</body>"+
	   "</html>";
	   break;		
	
	
	
	   }
	return return_html;
	
}

public void createPdf(PdfVo PdfVo) {
	
	Document document = new Document(PageSize, 30, 30, 30, 30);
	
	try {
		PdfWriter pdfWriter = PdfWriter.getInstance(document, new FileOutputStream(PdfVo.getPdfFilePath()+PdfVo.getPdfFileName()));
		
		
	}
	
}

}