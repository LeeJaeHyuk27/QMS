<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Login</title>

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

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
    body {
        background: linear-gradient(135deg, #ececec, #f5f5f5);
        font-family: 'Nunito', sans-serif;
    }

    .card {
        border: none;
        border-radius: 15px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        background-color: #fff;
    }

    .card-title {
        font-weight: 700;
        font-size: 1.8rem;
        color: #5a67d8;
    }

    .form-control {
        border-radius: 10px;
        padding: 15px;
        border: 1px solid #ddd;
        transition: all 0.3s ease;
    }

    .form-control:focus {
        border-color: #5a67d8;
        box-shadow: 0 0 5px rgba(90, 103, 216, 0.5);
    }

    .btn-primary {
        background-color: #5a67d8;
        border: none;
        border-radius: 10px;
        padding: 15px;
        font-weight: 600;
        transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #434aa3;
    }

    .form-check-label {
        font-size: 0.9rem;
        color: #333;
    }

    .back-to-top {
        background-color: #5a67d8;
        color: #fff;
        border-radius: 50%;
        width: 40px;
        height: 40px;
    }

    .invalid-feedback {
        font-size: 0.9rem;
        color: #e3342f;
    }

    .credits {
        margin-top: 20px;
        font-size: 0.9rem;
        color: #aaa;
    }
    #langChoice {
        position: absolute;
        top: 20px;
        right: 20px;
        z-index: 1000;
    }
</style>
</head>

<body>
<main>
    <div class="container">
		<div id="langChoice">
		    <a href="/login?lang=ko"><button type="button">한국어</button></a>
		    <a href="/login?lang=en"><button type="button">English</button></a>
		</div>
        <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        	<div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
                        
                        <div class="card mb-3">

                            <div class="card-body">

                                <div class="pt-4 pb-2">
                                    <h5 class="card-title text-center pb-0 fs-4">QMS</h5>
                                </div>

                                <form id="loginform" class="row g-3 needs-validation" novalidate>
                                    <div class="col-12">
                                        <label for="yourUsername" class="form-label">
                                        	<spring:message code="message.introduction.id"/>
                                        </label>
                                        <div class="input-group has-validation">
                                            <input type="text" id="userId" name="userId" class="form-control" maxlength="20" required>
                                            <div class="invalid-feedback">
                                            	<spring:message code="message.validation.enterId"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="yourPassword" class="form-label">
                                        	<spring:message code="message.introduction.password"/>
                                        </label>
                                        <input type="password" id="userPwd" name="userPwd" class="form-control" maxlength="20" required>
                                        <div class="invalid-feedback">
                                        	<spring:message code="message.validation.enterPassword"/>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                                            <label class="form-check-label" for="rememberMe">
                                            	<spring:message code="message.checkbox.remember"/>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100" type="button" onclick="login();">
                                        	<spring:message code="message.button.login"/>
                                        </button>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-secondary w-100" type="button" onclick="findPwdModal();">
                                        	<spring:message code="message.button.findPassword"/>
                                        </button>
                                    </div>
                                </form>

                            </div>
                        </div>

                        <div class="credits">
                            Designed by <b>이젠아카데미</b>
                        </div>

                    </div>
                </div>
            </div>

        </section>

    </div>
</main><!-- End #main -->
    
<div class="modal fade" id="PwdInfoFind" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><spring:message code="message.button.findPassword" /></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="findPwdForm">
                    <div class="col-12">
                        <label for="findUserId" class="form-label"><spring:message code="message.introduction.id"/></label>
                        <div class="input-group has-validation">
                            <input type="text" id="findUserId" name="userId" class="form-control" maxlength="20" required>
                            <div class="invalid-feedback"><spring:message code="message.validation.enterId"/></div>
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="findUserName" class="form-label"><spring:message code="message.introduction.name"/></label>
                        <input type="text" id="findUserName" name="userName" class="form-control" maxlength="20" required>
                        <div class="invalid-feedback"><spring:message code="message.validation.enterName"/></div>
                    </div>
                    <div class="col-12">
                        <label for="findUserPwd" class="form-label"><spring:message code="message.validation.checkPassword"/></label>
                        <input type="text" id="findUserPwd" name="userPwd" class="form-control" readonly>
                        <div class="invalid-feedback">비밀번호 확인</div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-info" onclick="findPwd();">찾기</button>
            </div>
        </div>
    </div>
</div><!-- End Vertically centered Modal-->


<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/vendor/chart.js/chart.umd.js"></script>
<script src="/assets/vendor/echarts/echarts.min.js"></script>
<script src="/assets/vendor/quill/quill.min.js"></script>
<script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="/assets/js/main.js"></script>
<script src="/assets/js/jquery-3.7.1.js"></script>
<script src="/assets/js/common.js"></script>

<script>

    function login(){
        if($('#userId').val()==''){
            alert("아이디를 입력하세요");
            return;
        }
        if($('#userPwd').val()==''){
            alert("패스워드를 입력하세요");
            return;
        }
        call_server(loginform, "/loginProcess", confirmLogin);
    }

    function confirmLogin(vo){
        if(vo.result){
            location.href="approve/search";
        }else{
            alert(vo.msg);
        }
    }

    function findPwdModal(){
        $('#PwdInfoFind').modal('show');
    }

    function findPwd(){
        if($('#findUserId').val()==''){
            alert("아이디를 입력하세요");
            return;
        }
        if($('#findUserName').val()==''){
            alert("이름을 입력하세요");
            return;
        }
        call_server(findPwdForm, "/findPwd", confirmFindPwd);
    }

    function confirmFindPwd(vo) {
        if (vo && vo.userPwd) {
            $('#findUserPwd').val(vo.userPwd);
        } else {
            alert(vo.msg);
        }
    }


</script>
</body>
</html>
