<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Components / Tabs - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/assets/css/style.css" rel="stylesheet">

  <!-- Template Main JS File -->
  <script src="/assets/js/main.js"></script>
  <script src="/assets/js/common.js"></script>
  <script src="/assets/js/jquery-3.7.1.js"></script>
  <!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Mar 17 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	
  <%@ include file="../layout/menu.jsp" %>	
  

  <main id="main" class="main">

	<div class="pagetitle">
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html"><spring:message code="message.aprv02.home"/></a></li>
          <li class="breadcrumb-item"><spring:message code="message.menu.electricAprv"/></li>
          <li class="breadcrumb-item active"><spring:message code="message.menu.aprvSearch"/></li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h2 class="card-title"></h2>

              <!-- Default Tabs -->
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true" data-index="0">
                  	<spring:message code="message.aprv02.aprving"/>
                  </button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false"data-index="1">
                  	<spring:message code="message.aprv02.aprved"/>
                  </button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false"data-index="2">
                  	<spring:message code="message.aprv02.myAprv"/>
                  </button>
                </li>
              </ul>
              <form id="dataform">
              <input type="hidden" id="searchType" name="searchType" value="0">
              <input type="hidden" id="currentPage" name="currentPage">
              <div class="tab-content pt-2" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                  <table class="table table-hover">
                    <thead>
                  	  <tr>
                    	<th scope="col">No</th>
                    	<th scope="col"><spring:message code="message.aprv02.documentType"/></th>
                    	<th scope="col"><spring:message code="message.aprv02.title"/></th>
                    	<th scope="col"><spring:message code="message.aprv02.department"/></th>
                    	<th scope="col"><spring:message code="message.aprv02.writer"/></th>
                    	<th scope="col"><spring:message code="message.aprv02.regDate"/></th>
                  	  </tr>
                    </thead>
                	<tbody id="approving-tbody">
                	</tbody>
                  </table>
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                  <table class="table table-hover">
                    <thead>
                  	  <tr>
                    	<th scope="col">No</th>
                    	<th scope="col"><spring:message code="message.aprv02.documentType"/></th>
                    	<th scope="col"><spring:message code="message.aprv02.title"/></th>
                    	<th scope="col"><spring:message code="message.aprv02.department"/></th>
                    	<th scope="col"><spring:message code="message.aprv02.writer"/></th>
                    	<th scope="col"><spring:message code="message.aprv02.regDate"/></th>
                  	  </tr>
                    </thead>
                	<tbody id="approved-tbody">
                	</tbody>
                  </table>
                </div>
                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                  <table class="table table-hover">
                    <thead>
                  	  <tr>
                    	<th scope="col">No</th>
                    	<th scope="col"><spring:message code="message.aprv02.documentType"/></th>
                    	<th scope="col"><spring:message code="message.aprv02.title"/></th>
                    	<th scope="col"><spring:message code="message.aprv02.department"/></th>
                    	<th scope="col"><spring:message code="message.aprv02.writer"/></th>
                    	<th scope="col"><spring:message code="message.aprv02.regDate"/></th>
                  	  </tr>
                    </thead>
                	<tbody id="my-tbody">
                	</tbody>
                  </table>
                </div>
              </div><!-- End Default Tabs -->
			 </form>
            </div>
          </div>
        </div>
      </div>
    </section>
    <nav aria-label="Page navigation example">
      <ul class="pagination" id="aprvPaging">
      </ul>
    </nav>

  </main><!-- End #main -->
  <form id="hiddenform">
  	<input type='hidden' id='docNo' name='docNo'>
  </form>
 
<script>
	//기안서 조회
	$(function() {
		aprvSearch(1);
		$('.nav-link').on('click', function() {
			$('#searchType').val($(this).data('index'));
	   		call_server(dataform, "/approve/approveList", approveList);
	  	});
	});
	
	function aprvSearch(no){
		$('#currentPage').val(no);
		call_server(dataform, "/approve/approveList", approveList);
	}
	
	function approveList(vo){
		list = vo.aprvList;
		$('#approving-tbody').empty();
		$('#approved-tbody').empty();
		$('#my-tbody').empty();
		for(var i = 0; i < list.length; i++){
			str = "<tr onclick=\"aprvDetail('"+list[i].docNo+"');\" style=\"cursor:pointer;\">";
			str += "<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";
			str += "<td>"+list[i].comName+"</td>";
			str += "<td>"+list[i].title+"</td>";
			str += "<td>"+list[i].deptName+"</td>";
			str += "<td>"+list[i].userName+"</td>";
			str += "<td>"+list[i].regDt+"</td>";
			str += "</tr>";
			if($('#searchType').val()=='0'){
                $('#approving-tbody').append(str);
            }else if($('#searchType').val()=='1'){
            	$('#approved-tbody').append(str);
            }else if($('#searchType').val()=='2'){
                $('#my-tbody').append(str);
            }
		}
		setPaging(aprvPaging, vo.startPage, vo.endPage, 'aprvSearch');
		
	}
	
	// 기안서 상세보기
	function aprvDetail(no){
		var popup = window.open("/approve/approveDtl?docNo="+no, "상세보기", "width=1200, height=800");
	}
	

</script>
<script src="/assets/js/paging.js"></script>
  <%@ include file="../layout/footer.jsp" %>
  
  <!-- Vendor JS Files -->
  <script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="/assets/vendor/echarts/echarts.min.js"></script>
  <script src="/assets/vendor/quill/quill.min.js"></script>
  <script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="/assets/vendor/php-email-form/validate.js"></script>

  

</body>

</html>