<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />

<!DOCTYPE html>
<html>
<head>
<title>매출 현황</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
</head>
<body>

	<style>
.container-fluid {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">매출 현황</h1>
		</div>
		<hr class="my-4">

		<div class="row">
			<!-- 일간 매출 카드 -->
			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-s font-weight-bold text-primary text-uppercase mb-2">
									일간 매출</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<fmt:formatNumber value="${todaySales}" type="currency" />
								</div>
							</div>
							<div class="col-auto">
								<i class="bi bi-calendar3-event fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 월간 매출 카드 -->
			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-s font-weight-bold text-success text-uppercase mb-2">
									월간 매출</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<fmt:formatNumber value="${monthSales}"
										type="currency" />
								</div>
							</div>
							<div class="col-auto">
								<i class="bi bi-calendar3 fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 연간 매출 카드 -->
			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-info shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-s font-weight-bold text-info text-uppercase mb-2">
									연간 매출</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<fmt:formatNumber value="${yearSales}"
										type="currency" />
								</div>
							</div>
							<div class="col-auto">
								<i class="bi bi-calendar3-fill fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script src="vendor/jquery/jquery.min.js"></script>

	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<script src="js/sb-admin-2.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />