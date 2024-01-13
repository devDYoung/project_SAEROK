<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>아토 - Login</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-12 col-md-5">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-1"></div>
                            <div class="col-lg-10"> <!-- Adjusted column size -->
                                <div class="p-5">
                                    <div class="text-center">
                                        <img src="${pageContext.request.contextPath }/resources/img/ato100px.png"  alt="아토 logo">
                                        <br><br>
                                        <p>아토에 오신 것을 환영합니다!</p>
                                    </div>
                                    <% %>
                                    <!-- 로그인 form -->
                                    <form action="${path}/loginPage" method="post" id="login-form">
                                        <div class="form-group">
                                            <input type="text" name="empNo" id="no"
                                                class="form-control form-control-user" placeholder="사원번호 입력">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="empPw" id="pw"
                                                class="form-control form-control-user" placeholder="비밀번호">
                                        </div>
                                        <!-- 아이디 저장여부 실행안됨-->
                                        <div class="form-group" style="font-size: 13px;">
                                            <div>
                                                <input type="checkbox" id="remember-id" name="remember-id"><label
                                                    for="remember-id">자동로그인</label>
                                            </div>
                                        </div>
                                        <button type="button"
                                            class="btn btn-primary btn-user btn-block"
                                            onclick="fn_login();">Log in</button>
                                        <hr>
                                        <!-- <div class="text-center">
                                            <a class="small" href="forgot-password.html">비밀번호 찾기</a>
                                        </div> -->
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	</body>
    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script>
        //로그인 실행 script
         function fn_login() {
        console.log($("#no").val());
        if ($("#no").val() != "" && $("#pw").val() != "") {
            $("#login-form").submit(); // 폼을 직접 제출하도록 수정
        }
    }
    </script>

<div id=pageBar>${pageBar}</div> 
