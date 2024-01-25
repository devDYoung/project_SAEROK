<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>    

<head>
<meta charset="utf-8">

<title>접근불가</title>

<!-- Custom fonts for this template-->
<link href="${path}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${path}/resources/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">
	<br>
	<!-- 404 Error Text -->
	
	<div class="text-center">
		<div class="error mx-auto" data-text="404">404</div>
		<p class="lead text-gray-800 mb-5">권한이 없습니다.</p>
		<p class="text-gray-500 mb-0">페이지에 대한 권한이 없어 접근이 불가합니다.</p>
		<a href="index.html">&larr; 메인화면으로 돌아가기</a>
	</div>


	<!-- Bootstrap core JavaScript-->

	<script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>



	<!-- Custom scripts for all pages-->
	<script src="${path}/resources/js/sb-admin-2.min.js"></script>

</body>