<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<title>Order Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">

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
	background-color: #6C7AE0;
	color: white;
}

.custom-table thead th {
	font-weight: normal;
}

.custom-table tbody tr:nth-child(even) {
	background-color: #F8F6FF;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-center mb-4 mt-3"> 
   <h1 class="h3 mb-0 text-gray-800">발주 품목</h1> 
</div>
		<hr class="my-4">

		<table class="table custom-table text-center">
			<thead>
				<tr>
					<th>품목 번호</th>
					<th>품목 이름</th>
					<th>카테고리</th>
					<th>가격</th>
					<th>수량</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderDetails}" var="detail">
					<tr>
						<td>${detail.itemId}</td>
						<td>${detail.itemName}</td>
						<td>${detail.itemCategory}</td>
						<td><fmt:formatNumber value="${detail.itemPrice}"
								type="currency" /></td>
						<td>${detail.quantity}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
