<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>거래처조회</title>
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

<style>
#addr {
	width: 800px;
}
</style>

<%@ include file="../layout/menu.jsp"%>

<main id="main" class="main">

	<section class="section">
		<div class="row">
			<div class="col-lg-16">

				<div class="card">
					<div class="card-body" style="padding-top: 20px;">
						<!-- General Form Elements -->
						<form id="searchform">
							<input type='hidden' id='currentPage' name='currentPage' value=1>
							<table class="table table-borderless">
								<tr>
									<td style="text-align: right;" colspan="2">
										<label for="regDtFrom" class="col-form-label">등록일</label>
									</td>
									<td>
									<input type="date" class="form-control" id="regDtFrom" name="regDtFrom"></td>
									<td style="text-align: center;">~</td>
									<td>
										<input type="date" class="form-control" id="regDtTo" name="regDtTo">
									</td>
									<td style="text-align: right;" colspan="2">
										<label for="compName" class="col-form-label">거래처명</label></td>
									<td>
									<input type="text" class="form-control" id="compName" name="compName"></td>
									<td style="text-align: right;" colspan="2">
										<label for="compType" class="col-form-label">거래처 유형</label>
									</td>
									<td>
										<select class="form-control" id="compType" name="compType">
											<option value="">선택하세요</option>
											<option value="S">공급사</option>
											<option value="C">고객사</option>
										</select>
									</td>
									<td colspan="3" style="text-align: left;">
										<button type="button" class="btn btn-info" onclick="partnerSearch();">조회</button>
										<button type="button" class="btn btn-info" onclick="displayModal(0);">신규</button>
										<button type="button" class="btn btn-success" id="downloadBtn">엑셀 다운로드</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<!-- Table with hoverable rows -->
						<table class="table table-hover" id="partnerTable">
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">거래처코드</th>
									<th scope="col">거래처명</th>
									<th scope="col">거래처유형</th>
									<th scope="col">대표자명</th>
									<th scope="col">연락처</th>
									<th scope="col">이메일</th>
									<th scope="col">담당자명</th>
									<th scope="col">담당자연락처</th>
									<th scope="col">등록일</th>
									<th scope="col">거래여부</th>
									<th scope="col">삭제여부</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<!-- End Table with hoverable rows -->
						<nav aria-label="Page navigation example">
							<ul class="pagination" id="partenerPaging">

							</ul>
						</nav>
						<!-- End Pagination with icons -->

					</div>
				</div>
			</div>
		</div>
	</section>
</main>
<%@ include file="../layout/footer.jsp"%>


<!-- End Vertically centered Modal-->



<script src="/assets/js/paging.js"></script>
<script src="/assets/js/jquery-3.7.1.js"></script>
<script src="/assets/js/common.js"></script>


<script>
	function partnerSearch(pno) {
		if (pno == undefined) {
			$('#currentPage').val(1);
		} else {
			$('#currentPage').val(pno);
		}
		call_server(searchform, '/company/searchlist', getPartnerlist);

	}

	function getPartnerlist(vo) {
		list = vo.partnerlist;
		$('#partnerTable > tbody').empty();
		for (var i = 0; i < list.length; i++) {
			str = "<tr onclick=\"displayModal('" + list[i].compCd
					+ "');\" style=\"cursor:pointer;\">";
			str += "<th scope=\"row\">"
					+ ((Number(vo.currentPage) - 1) * vo.countPerPage + (i + 1))
					+ "</th>";
			str += "<td>" + list[i].compCd + "</td>";
			str += "<td>" + list[i].compName + "</td>";
			str += "<td>" + list[i].compType + "</td>";
			str += "<td>" + list[i].compCeo + "</td>";
			str += "<td>" + list[i].phone + "</td>";
			str += "<td>" + list[i].email + "</td>";
			str += "<td>" + list[i].mgrName + "</td>";
			str += "<td>" + list[i].mgrPhone + "</td>";
			str += "<td>" + list[i].regDt + "</td>";
			str += "<td>" + list[i].tradeYn + "</td>";
			str += "<td>" + list[i].delYn + "</td>";
			str += "</tr>";
			$('#partnerTable').append(str);
		}
		setPaging(partenerPaging, vo.startPage, vo.endPage, 'partnerSearch');

	}

	function displayModal(cd) {//0이면 신규버튼으로 여는 모달 그 외에는 상품디테일모달
		if (cd != 0) {
			$("#UpdSaveBtn").show();
			$("#newSaveBtn").hide();
			$("#mcomCd").val(cd);
			call_server(dataform, '/company/getPartnerDtldata',
					getPartnerDtldata);
			$("#mcomCd").prop("readonly", true);
		} else {
			$("#newSaveBtn").show();
			$("#UpdSaveBtn").hide();
			$("#mcomCd").prop("readonly", false);
			$('#ItemSelectTable > tbody').empty();
		}
		checkCd = [];
		window.open('/test_comp/popup','popup',"width=1198, height=800");
	}
	
	
	function getPartnerDtldata(vo) {
	
		$("#mcompCd").val(vo.compCd);
		$("#mcompName").val(vo.compName);
		$("#mcompType").val(vo.compType);
		$("#mtradeYn").val(vo.tradeYn);
		$("#mbizNo").val(vo.bizNo);
		$("#mcompCeo").val(vo.compCeo);
		$("#mphone").val(vo.phone);
		$("#memail").val(vo.email);
		$("#maddr").val(vo.addr);
		$("#mmgrName").val(vo.mgrName);
		$("#mmgrPosition").val(vo.mgrPosition);
		$("#mmgrPhone").val(vo.mgrPhone);
		
		list = vo.itemlist;
		$('#ItemSelectTable > tbody').empty();
		
		if(list!=null){
			for(var i = 0; i < list.length; i++){
				setRowData(list[i]);
		    }
		}
		
	}

	function savePartner(no) {
		var valid = true;

		$('#dataform input[type="text"], #dataform select').each(function() {
			var value = $(this).val().trim();
			if (!value) {
				valid = false;
				return false;
			}
		});

		if (valid) {
			call_server(dataform, '/company/saveOrUpdatePartner', complete);
		} else {
			alert("모든 필드를 입력해주세요.");
		}
	}

	function complete(vo) {
		alert(vo.msg);
		$('#partnerinfo').modal('hide');
		 //checkCd = [];
	}

	$(document).ready(function() {
		$('#downloadBtn').click(function() {
			excelDownload( searchform, '/company/excelDownload', 'partner_data.xlsx');
		});
	});

	
	function addItem(obj, idx) {
		itemRow = idx;
		var url = "/item/bom01pop1";
		var name = "거래 품목정보";
		var option = "width = 900, height = 500, top = 100, left = 200"
		window.open(url, name, option);
	}
	
	function addButton() {
		 setRowData(null);
	}
	
	var itemRow = 0; 
	
	function setRowData(vo){ // 모달 조회 공통쿼리
		if(vo!=null){
			checkCd.push(vo);
		}
		if(vo==null){
			vo = new Object();
			vo.itemCd='';
			vo.itemName='';
			vo.boxType='';
			vo.boxQty = '';
			vo.weight='';
			vo.unitPrice='';
			vo.location='';
		}else{
			
			}
		  var rowCount = $('#ItemSelectTable > tbody > tr').length + 1;
		    var str = "<tr>";
		    str += "<th scope=\"row\">" + rowCount + "</th>";
		    str += "<td style=\"position: relative;\"><input type=\"text\" class=\"form-control\" id=\"itemCd" + rowCount + "\" name=\"itemlist["+itemRow+"].itemCd\" value='"+vo.itemCd+"' style=\"width: 100px;\" readonly>";
		    str += "<i class=\"ri-search-2-line\" style=\"position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;\" onclick=\"addItem(this, " + rowCount + ")\"></i></td>";
		    str += "<td><input type=\"text\" class=\"form-control\" id=\"itemName" + rowCount + "\"  name=\"itemlist["+itemRow+"].itemName\" value='"+vo.itemName+"' style=\"width: 100px;\" readonly></td>";
		    str += "<td><input type=\"text\" class=\"form-control\" id=\"boxType" + rowCount + "\"  name=\"itemlist["+itemRow+"].boxType\" value='"+vo.boxType+"' style=\"width: 100px;\" readonly></td>";
		    str += "<td><input type=\"text\" class=\"form-control\" id=\"boxQty" + rowCount + "\"  name=\"itemlist["+itemRow+"].boxQty\" value='"+vo.boxQty+"' style=\"width: 100px;\" readonly></td>";
		    str += "<td><input type=\"text\" class=\"form-control\" id=\"weight" + rowCount + "\"  name=\"itemlist["+itemRow+"].weight\" value='"+vo.weight+"' style=\"width: 100px;\" readonly></td>";
		    str += "<td><input type=\"text\" class=\"form-control\" id=\"unitPrice" + rowCount + "\"  name=\"itemlist["+itemRow+"].unitPrice\" value='"+vo.unitPrice+"' style=\"width: 100px;\" readonly></td>";
		    str += "<td><input type=\"text\" class=\"form-control\" id=\"location" + rowCount + "\"  name=\"itemlist["+itemRow+"].location\" value='"+vo.location+"' style=\"width: 100px;\" readonly></td>";
		    str += "<td><button type=\"button\" class=\"btn btn-danger delete-btn\">삭제</button></td>"; // 삭제 버튼 추가
		    str += "</tr>";
		    $('#ItemSelectTable > tbody').append(str);
		    itemRow++;			    
	 }
	
	$(document).on('click', '#ItemSelectTable .delete-btn', function() {
	    var row = $(this).closest('tr');
	    var index = row.index();
	    row.remove(); // 행 삭제
		
	    checkCd.splice(index, 1);
	    
	    // 행 번호 재조정
	    $('#ItemSelectTable tbody tr').each(function(i) {
	        $(this).find('th').text(i + 1);
	    });
	});
	
	var checkCd = [];
	function receiveItemData(item) {
		for (var i = 0; i < checkCd.length; i++) {
	    	if (checkCd[i].itemCd == item.itemCd) {
	            alert("이미 선택된 품목입니다.");
	            return;
	        }
	    }
	    
	    $('#itemCd'+itemRow).val(item.itemCd);
	    $('#itemName'+itemRow).val(item.itemName);
	    $('#boxType'+itemRow).val(item.boxType);
	    $('#boxQty'+itemRow).val(item.boxQty);
	    $('#weight'+itemRow).val(item.weight);
	    $('#unitPrice'+itemRow).val(item.unitPrice);
	    $('#location'+itemRow).val(item.location);

	    
	    checkCd.push(item);
		
	}


	
	
    
</script>