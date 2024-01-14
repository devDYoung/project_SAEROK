<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />
<!DOCTYPE html>
<html>
<head>
<title>Inventory List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<style>
.container-fluid {
	font-family: 'Noto Sans KR', sans-serif;
}

.custom-table {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
}

.custom-table thead {
	background-color: #3887BE;
	color: white;
}

.custom-table thead th {
	font-weight: normal;
}

.custom-table tbody tr:nth-child(even) {
	background-color: #F8F6FF;
}

.custom-table th:nth-child(1) {
	width: 10%;
}

.custom-table th:nth-child(2) {
	width: 25%;
}

.custom-table th:nth-child(3) {
	width: 20%;
}

.custom-table th:nth-child(4) {
	width: 10%;
}

.custom-table th:nth-child(5) {
	width: 20%;
}

.custom-table th:nth-child(6) {
	width: 15%;
}


.dataTables_wrapper {
	text-align: center;
}

.dataTables_wrapper .dataTables_paginate .paginate_button {
	padding: 0.5em 1em;
	color: #6C7AE0 !important;
	border: 1px solid #6C7AE0;
	border-radius: 4px;
	margin-left: 3px;
	cursor: pointer;
}

.dataTables_wrapper .dataTables_paginate .paginate_button.current,
	.dataTables_wrapper .dataTables_paginate .paginate_button.current:hover
	{
	color: white !important;
	background-color: #6C7AE0;
	border-color: #6C7AE0;
}

.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
	background-color: #f2f2f2;
	border-color: #6C7AE0;
}

.dataTables_wrapper .dataTables_info {
	text-align: center;
	padding: 0.5em 0;
	font-size: 0.9em;
	color: #6C7AE0;
	margin-bottom: 10px;
}

.status-pending {
	color: #D2691E
}

.status-approved {
	color: #008000;
}

.status-rejected {
	color: #FF0000;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-2">
			<h1 class="h3 mb-0 text-gray-800">재고 목록</h1>
		</div>
		<hr class="my-4">
		<table class="table custom-table" id="inventoryTable">
			<thead>
				<tr>
					<th>품목 번호</th>
					<th>카테고리</th>
					<th>품목 이름</th>
					<th>재고</th>
					<th>안전 재고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${inventoryList}" var="inventory">
					<tr>
						<td>${inventory.itemId}</td>
						<td>${inventory.itemCategory}</td>
						<td>${inventory.itemName}</td>
						<td>${inventory.stock}</td>
						<td>${inventory.bufferStock}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$('#inventoryTable')
									.DataTable(
											{
												"paging" : true,
												"lengthChange" : false,
												"searching" : false,
												"ordering" : false,
												"info" : true,
												"autoWidth" : false,
												"language" : {
													"url" : "//cdn.datatables.net/plug-ins/1.10.20/i18n/Korean.json"
												}
											});
						});
	</script>
</body>
</html>
