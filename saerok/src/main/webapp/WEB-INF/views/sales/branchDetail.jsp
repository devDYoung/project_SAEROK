<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>

<!DOCTYPE html>
<html>
<head>
<title>지점 상세 매출</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<!-- 임시 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

<style>
.container-fluid {
	font-family: 'Noto Sans KR', sans-serif;
}
.narrow-column {
	width: 10%;
}

.wide-column {
	width: 35%;
}

.shadow-box {
	box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .15);
	border-radius: .25rem;
	border: none;
	margin-bottom: 1rem;
}

.sales-info {
	padding: 1rem;
}

.sales-info h3 {
	margin-bottom: .5rem;
}

.sales-info p {
	margin-bottom: .25rem;
	font-size: 1.2rem;
}

.sales-box-container {
	display: flex;
	flex-wrap: wrap;
	gap: 1rem;
	margin-bottom: 2rem;
}

.sales-box {
	flex: 1;
	min-width: calc(33.333% - 1rem);
	text-align: center;
}

.table-responsive {
	margin-bottom: 1rem;
}
</style>
</head>
<body>


	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">새록
				${branchDetailSales.branchName}</h1>
		</div>
		<hr class="my-4">

		<div class="row">



			<div class="col-lg-4 mb-4">

				<div class="card text-white shadow"
					style="background: linear-gradient(to right, #17a2b8, #158FA3);">

					<div class="card-body">
						<h5 class="card-title">일간 매출</h5>
						<hr class="my-4"
							style="border-top: 1px solid rgba(255, 255, 255, .2);">
						<h6 class="mb-0 text-white-100 pl-1">
							<fmt:formatNumber value="${branchDetailSales.dailySales}"
								type="currency" />
						</h6>
					</div>
				</div>
			</div>

			<div class="col-lg-4 mb-4">
				<div class="card text-white shadow"
					style="background: linear-gradient(to right, #218838, #0d6e3f);">

					<div class="card-body">
						<h5 class="card-title">월간 매출</h5>
						<hr class="my-4"
							style="border-top: 1px solid rgba(255, 255, 255, .2);">
						<h6 class="mb-0 text-white-100 pl-1">
							<fmt:formatNumber value="${branchDetailSales.monthlySales}"
								type="currency" />
						</h6>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card text-white shadow"
					style="background: linear-gradient(to right, #1e3c72, #2a5298);">
					<div class="card-body">
						<h5 class="card-title">연간 매출</h5>
						<hr class="my-4"
							style="border-top: 1px solid rgba(255, 255, 255, .2);">
						<h6 class="mb-0 text-white-100 pl-1">
							<fmt:formatNumber value="${branchDetailSales.annualSales}"
								type="currency" />
						</h6>
					</div>
				</div>
			</div>


		</div>



		<div class="row justify-content-center">
			<div class="col-xl-12">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<c:forEach items="${currentMonthSalesByDay}" var="sale"
							varStatus="status">
							<c:if test="${status.first}">
								<h6 class="m-0 font-weight-bold text-primary">${sale.currentMonth}
									매출</h6>
							</c:if>
						</c:forEach>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<c:forEach items="${currentMonthSalesByDay}" var="sale"
								varStatus="status">
								<c:if test="${status.first}">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead class="thead-light">
											<tr>
												<th class="narrow-column text-center">일자</th>
												<th class="wide-column text-center">매출</th>
											</tr>
										</thead>
										<tbody>
											</c:if>
											<tr>
												<td class="text-center">${sale.currentMonth}${sale.salesDay}일</td>
												<td class="text-center"><fmt:formatNumber
														value="${sale.totalSales}" type="number" pattern="#,##0원" />
												</td>
											</tr>
											<c:if test="${status.last}">
										</tbody>
									</table>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Include Bootstrap and other scripts -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
