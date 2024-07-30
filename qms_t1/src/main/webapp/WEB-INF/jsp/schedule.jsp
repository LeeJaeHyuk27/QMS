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
<style>

.table thead th {
	text-align: center;
}

#planTable td {
   width: 50px;
   height: 150px;
   border: 1px solid #ccc; /* 선택사항: 테두리를 추가하여 셀을 더 잘 보이게 함 */
   text-align: left; /* 선택사항: 셀의 텍스트를 가운데 정렬 */
   cursor: pointer; /* 커서가 포인터 모양으로 변경되도록 설정 */
}

#planTable td:hover {
    background-color: #f0f0f0; /* 선택사항: 커서를 올렸을 때 배경색 변경 */
}

.statusRed {
	color: red;
	font-size: 14px;
}

.statusBlue {
	color: blue;
	font-size: 14px;
}

#scheduleDtModal {
	width: 200px;
}

#plus{
    width: 30px; /* 버튼 너비 */
    height: 30px; /* 버튼 높이 */
    border: 2px solid #4CAF50; /* 버튼 테두리 */
    background-color: #4CAF50; /* 버튼 배경색 */
    color: white; /* 텍스트 색상 */
    font-size: 16px; /* 폰트 크기 */
    border-radius: 5px; /* 테두리 반경 */
    cursor: pointer; /* 커서 모양 */
    float: right;
}
#header {
	margin-bottom: 10px;
}
</style>
</head>

<body>

	
  <%@ include file="layout/menu.jsp" %>	
  

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
               <div>
               <form id="searchform">
               	<input type='hidden' id='scheduleDt' name ="scheduleDt">
               	<table class="col-lg-12" >
              	 <tr>
              		<td rowspan="2">
		              <div class="row mb-4">
		                 <label for="inputText" class="col-sm-3 col-form-label">년월</label>
		                 <div class="col-sm-1">
							<select id="dtYY" name="dtYY">
							<option value=''>== 년 ==</option>
							<option value="2024">2024</option>
							<option value="2023">2023</option>
							<option value="2022">2022</option>
							</select>
						</div>
						<div class="col-sm-1">
							<select id="dtMM" name="dtMM">
							<option value=''>== 월 ==</option>
							<option value="1">1월</option>
							<option value="2">2월</option>
							<option value="3">3월</option>
							<option value="4">4월</option>
							<option value="5">5월</option>
							<option value="6">6월</option>
							<option value="7">7월</option>
							<option value="8">8월</option>
							<option value="9">9월</option>
							<option value="10">10월</option>
							<option value="11">11월</option>
							<option value="12">12월</option>
							</select>
						</div>
		               </div>		
              		</td>
              		<td>
              			<button type="button" class="btn btn-info" onclick = 'scheduleSearch();'>조회</button>
              		</td>
              	 </tr>
               	</table>
               	</form>
               </div>
               <table class="table table-hover" id="planTable" >
                  <colgroup>
		            <col style="width: 14.2857%;">
		            <col style="width: 14.2857%;">
		            <col style="width: 14.2857%;">
		            <col style="width: 14.2857%;">
		            <col style="width: 14.2857%;">
		            <col style="width: 14.2857%;">
		            <col style="width: 14.2857%;">
		          </colgroup>
				  <thead>
					<tr id="thead">
						<th scope="col">일</th>
						<th scope="col">월</th>
						<th scope="col">화</th>
						<th scope="col">수</th>
						<th scope="col">목</th>
						<th scope="col">금</th>
						<th scope="col">토</th>
				    </tr>
				  </thead>
				  <tbody id="tbody">
				  </tbody>
				</table>
              </div><!-- End Default Tabs -->
            </div>
          </div>
        </div>
    </section>
	<!-- SCHEDULE 모달 시작 -->
      <div class="modal fade" id="scheduleModal" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header" >
             <h5 class="modal-title" style="text-align:center; width:100%">일정상세</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <form id="scheduelModalForm">
           <table id="header" style="width:100%; height:100%;">
			<tr>
               <th scope="col">일자</th>
               <td><input type="date" id="scheduleDtModal" name="scheduleDt"></td>
               <td style="text-align:right;">
               		<button type="button" class="btn btn-primary" onclick="search();">조회</button>
               		<button type="button" class="btn btn-primary" onclick="commit();">저장</button>
               </td>
            </tr>
           </table>
           <table class="table table-hover">
             <thead>
               <tr>
                 <td>상세일정</td>
                 <td colspan="4"><button type="button" id="plus" onclick="addBtn();">+</button></td>
               </tr>
               <tr>
                 <th scope="col">시작일시</th>
                 <th scope="col">종료일시</th>
                 <th scope="col">일정</th>
                 <th scope="col">상태</th>
                 <th scope="col">삭제</th>
               </tr>
             </thead>
             
             <tbody id="modaltbody">
             </tbody>
           </table>
           </form>
           </div>
         </div>
       </div>
      </div>
     <!-- SCHEDULE 모달 끝 -->

  </main><!-- End #main -->
  <form id="hiddenform">
  	<input type='hidden' id=''>
  </form>
 
<script>

	//조회 조건을 현재 년월로 설정
	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth();
	$(function(){
		$("#dtYY").val(year);
		$("#dtMM").val(month+1);
	})
	
	function scheduleSearch(){
		$("#tbody").empty();
		// 선택한 년, 월의 첫 번째 날짜를 세팅
		var date = new Date($("#dtYY").val(), $("#dtMM").val()-1, 1);
		days = [];
		
		// 다음 달의 첫 번째 날짜를 세팅
		var nextMonth = new Date($("#dtYY").val(), $("#dtMM").val(), 1);
		
		// 선택한 월의 첫 번째 날짜부터 다음 달 첫 번째 날짜까지 배열에 추가, +1 반복
		while(date < nextMonth){
			days.push(date.getDate());
			date.setDate(date.getDate() + 1);
		}
		var str = "<tr>";
		for(var i = 1; i <= days.length; i++){
			if(i % 7 == 0){
				str += "<td id=\'"+"0"+$("#dtMM").val()+("0"+i).slice(-2)+"\' onclick=\"scheduleModal('"+("0"+i).slice(-2)+"');\">"+i+"</td>";
				str += "</tr>";
			}else{
				str += "<td id=\'"+"0"+$("#dtMM").val()+("0"+i).slice(-2)+"\' onclick=\"scheduleModal('"+("0"+i).slice(-2)+"');\">"+i+"</td>";
			}
		}
		$("#tbody").append(str);
		$("#scheduleDt").val((""+date.getFullYear()).slice(2)+"/"+("0"+date.getMonth()).slice(-2));
		call_server(searchform, "/schedule/getScheduleInfo", getScheduleInfo)
	}
	
	function getScheduleInfo(list){
		for(var i = 0; i < list.length; i++){
			if(list[i].scheduleStatus == '01'){
		 		for(var j = list[i].startDt; j <= list[i].endDt; j++){
		 			$("#"+("0"+j).slice(-4)+"").append("<br></br>");
		 			$("#"+("0"+j).slice(-4)+"").append("<span class='statusRed'>"+list[i].scheduleContent+"</span>");
		 		}
		 	}else{
		 		for(var j = list[i].startDt; j <= list[i].endDt; j++){
		 			$("#"+("0"+j).slice(-4)+"").append("<br></br>");
		 			$("#"+("0"+j).slice(-4)+"").append("<span class='statusBlue'>"+list[i].scheduleContent+"</span>");
		 		}
		 	}
		}
	}
	
	// 모달
	function scheduleModal(dt){
		$('#scheduelModalForm')[0].reset();
		$("#scheduleDtModal").val(("20"+$("#scheduleDt").val()+"-"+dt).replace("/", "-"));
		$("#modaltbody").empty();
		call_server(scheduelModalForm, "/schedule/getDtlInfo", getDtlInfo)
	}
	
	// 모달 조회
	function search(){
		call_server(scheduelModalForm, "/schedule/getDtlInfo", getDtlInfo)
	}
	
	// 모달 상세정보
	var cnt=0;
	function getDtlInfo(list){
		$('#modaltbody').empty();
		cnt = 0;
		for(var i = 0; i < list.length; i++){
			str = "<tr>";
			// startDt
			str += "<td>";
			str += "<input type=\"date\" name=\"scheduleList["+i+"].startDt\" value='"+list[i].startDt+"'>";
			str += "<input type=\"hidden\" name=\"scheduleList["+i+"].scheduleSeq\" value='"+list[i].scheduleSeq+"'>";
			str += "<select id=\"startDtHour"+i+"\" name=\"scheduleList["+i+"].startDtHour\">";
			str += "<option value='00'>== 선택 ==</option><option value='09'>09</option><option value='10'>10</option>";
			str += "<option value='11'>11</option><option value='12'>12</option><option value='13'>13</option>";
			str += "<option value='14'>14</option><option value='15'>15</option><option value='16'>16</option>";
			str += "<option value='17'>17</option><option value='18'>18</option>";
			str += "</select>";
			str += "<select id=\"startDtMin"+i+"\" name=\"scheduleList["+i+"].startDtMin\">";
			str += "<option value=''>== 선택 ==</option><option value='00'>00</option><option value='10'>10</option>";
			str += "<option value='20'>20</option><option value='30'>30</option><option value='40'>40</option>";
			str += "<option value='50'>50</option>";
			str += "</select>";
			str += "</td>";
			// endDt
			str += "<td>";
			str += "<input type=\"date\" name=\"scheduleList["+i+"].endDt\" value='"+list[i].endDt+"'>";
			str += "<select id=\"endDtHour"+i+"\" name=\"scheduleList["+i+"].endDtHour\">";
			str += "<option value='00'>== 선택 ==</option><option value='09'>09</option><option value='10'>10</option>";
			str += "<option value='11'>11</option><option value='12'>12</option><option value='13'>13</option>";
			str += "<option value='14'>14</option><option value='15'>15</option><option value='16'>16</option>";
			str += "<option value='17'>17</option><option value='18'>18</option>";
			str += "</select>";
			str += "<select id=\"endDtMin"+i+"\" name=\"scheduleList["+i+"].endDtMin\">";
			str += "<option value=''>== 선택 ==</option><option value=\"00\">00</option><option value='10'>10</option>";
			str += "<option value='20'>20</option><option value='30'>30</option><option value='40'>40</option>";
			str += "<option value='50'>50</option>";
			str += "</select>";
			str += "</td>";
			// 일정
			str += "<td><input type=\"text\" name=\"scheduleList["+i+"].scheduleContent\" value='"+list[i].scheduleContent+"'></td>";
			str += "<td>";
			str += "</select>";
			str += "<select id=\"scheduleStatus"+i+"\" name=\"scheduleList["+i+"].scheduleStatus\">";
			str += "<option value=''>== 선택 ==</option><option value='01'>완료</option><option value='02'>미완료</option>";
			str += "</select>";
			str += "</td>";
			str += "<td><button type=\"button\" class=\"btn btn-secondary\" onclick=\"delTr(this);\">삭제</button></td>";
			str += "</tr>";
			$('#modaltbody').append(str);
			$('#scheduleStatus'+i).val(list[i].scheduleStatus);
			$('#startDtHour'+i).val(list[i].startDtHour);
			$('#startDtMin'+i).val(list[i].startDtMin);
			$('#endDtHour'+i).val(list[i].endDtHour);
			$('#endDtMin'+i).val(list[i].endDtMin);
			cnt++;
		}
		$('#scheduleModal').modal('show');
	}
	
	// +버튼
	function addBtn(){
        var str =  "<tr>";
        str += "<td>";
		str += "<input type=\"date\" name=\"scheduleList["+cnt+"].startDt\">";
		str += "<input type=\"hidden\" name=\"scheduleList["+cnt+"].scheduleSeq\">";
		str += "<select name=\"scheduleList["+cnt+"].startDtHour\">";
		str += "<option value=''>== 선택 ==</option><option value='09'>09</option><option value='10'>10</option>";
		str += "<option value='11'>11</option><option value='12'>12</option><option value='13'>13</option>";
		str += "<option value='14'>14</option><option value='15'>15</option><option value='16'>16</option>";
		str += "<option value='17'>17</option><option value='18'>18</option>";
		str += "</select>";
		str += "<select name=\"scheduleList["+cnt+"].startDtMin\">";
		str += "<option value=''>== 선택 ==</option><option value='00'>00</option><option value='10'>10</option>";
		str += "<option value='20'>20</option><option value='30'>30</option><option value='40'>40</option>";
		str += "<option value='50'>50</option>";
		str += "</select>";
		str += "</td>";
		// endDt
		str += "<td>";
		str += "<input type=\"date\" name=\"scheduleList["+cnt+"].endDt\">";
		str += "<select name=\"scheduleList["+cnt+"].endDtHour\">";
		str += "<option value=''>== 선택 ==</option><option value='09'>09</option><option value='10'>10</option>";
		str += "<option value='11'>11</option><option value='12'>12</option><option value='13'>13</option>";
		str += "<option value='14'>14</option><option value='15'>15</option><option value='16'>16</option>";
		str += "<option value='17'>17</option><option value='18'>18</option>";
		str += "</select>";
		str += "<select name=\"scheduleList["+cnt+"].endDtMin\">";
		str += "<option value=''>== 선택 ==</option><option value='00'>00</option><option value='10'>10</option>";
		str += "<option value='20'>20</option><option value='30'>30</option><option value='40'>40</option>";
		str += "<option value='50'>50</option>";
		str += "</select>";
		str += "</td>";
		// 일정
		str += "<td><input type=\"text\" name=\"scheduleList["+cnt+"].scheduleContent\"></td>";
		str += "<td>";
		str += "</select>";
		str += "<select id=\"scheduleStatus"+cnt+"\" name=\"scheduleList["+cnt+"].scheduleStatus\">";
		str += "<option value=''>== 선택 ==</option><option value='01'>완료</option><option value='02'>미완료</option>";
		str += "</select>";
		str += "</td>";
        str += "<td><button type=\"button\" class=\"btn btn-secondary\" onclick=\"delTr(this);\">삭제</button></td>";
        str += "</tr>";
        $('#modaltbody').append(str);
        cnt++;
    }
	
	// 리스트 삭제
	function delTr(obj){
    	$(obj).closest("tr").remove();
	}
	
	// 저장
	function commit(){
		call_server(scheduelModalForm, "/schedule/insertSchedule", insertSchedule)
	}
	function insertSchedule(cnt){
		if(cnt>0){
			alert("등록완료");
			$('#scheduleModal').modal('hide');
			search();
		}else{
			alert("등록실패");
		}
	}
</script>
<script src="/assets/js/paging.js"></script>
  <%@ include file="layout/footer.jsp" %>
  
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