<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<title>세부 발주 목록</title>
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

.button-group {
	display: flex;
	justify-content: flex-end;
	margin-top: 15px;
}

.button-group form {
	margin-left: 10px;
}

.custom-btn {
	padding: 5px 20px;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.3s ease;
	color: white;
}

.btn-approve {
	background-color: #65B741; /* 승인 버튼 색상 */
}

.btn-reject {
	background-color: #E36414; /* 반려 버튼 색상 */
}

.custom-btn:hover {
	opacity: 0.8; /* 호버 시 투명도 조정 */
}

.button-group {
	display: flex;
	justify-content: flex-end;
	margin-top: 15px;
}

.button-group form {
	margin-left: 10px;
}

.total-amount-container {
	text-align: right; 

	padding: 10px 30px 10px 20px;
	background-color: #F8F6FF; 
	border-radius: 5px; 
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
}

.total-amount-label {
	font-weight: bold; /* 라벨 볼드체 */
	color: #343a40; /* 글자색 */
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div
			class="d-sm-flex align-items-center justify-content-center mb-4 mt-3">
			<h1 class="h3 mb-0 text-gray-800">발주 품목</h1>
		</div>
		<hr class="my-4">

		<table class="table custom-table text-center">
			<thead>
				<tr>
					<th>품목 번호</th>
					<th>품목 이름</th>
					<th>카테고리</th>
					<th>단가</th>
					<th>수량</th>
					<th>가격</th>
					<!-- 새로운 컬럼 추가 -->
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
						<td><fmt:formatNumber value="${detail.totalPrice}"
								type="currency" /></td>
						<!-- 새로운 컬럼 표시 -->
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 총 발주 금액 계산 및 표시 -->
		<c:set var="totalOrderAmount" value="0" />
		<c:forEach items="${orderDetails}" var="detail">
			<c:set var="totalOrderAmount"
				value="${totalOrderAmount + detail.totalPrice}" />
		</c:forEach>

		<div class="total-amount-container">
			<span class="total-amount-label">발주 금액 : </span>
			<fmt:formatNumber value="${totalOrderAmount}" type="currency" />
		</div>

		<c:if test="${orderStatus == '대기중'}">
			<div class="button-group">
				<form id="rejectForm"
					action="${pageContext.request.contextPath}/orders/${orderId}/reject"
					method="post">
					<input type="submit" value="반려" class="custom-btn btn-reject" />
				</form>
				<form id="approveForm"
					action="${pageContext.request.contextPath}/orders/${orderId}/approve"
					method="post">
					<input type="submit" value="승인" class="custom-btn btn-approve" />
				</form>
			</div>
		</c:if>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>
    document.getElementById('approveForm').addEventListener('submit', function(event) {
        event.preventDefault();
        if (confirm('해당 발주목록을 승인 하시겠습니까?')) {
            var formData = new FormData(this);
            fetch(this.action, {
                method: 'POST',
                body: formData
            }).then(response => {
                if (response.ok) {
                    alert('발주 목록이 승인되었습니다.');
                    window.opener.location.reload();
                    window.close(); 
                } else {
                    alert('오류가 발생했습니다.');
                }
            });
        }
    });

    document.getElementById('rejectForm').addEventListener('submit', function(event) {
        event.preventDefault();
        if (confirm('해당 발주목록을 반려 하시겠습니까?')) {
            var formData = new FormData(this);
            fetch(this.action, {
                method: 'POST',
                body: formData
            }).then(response => {
                if (response.ok) {
                    alert('발주 목록이 반려되었습니다.');
                    window.opener.location.reload(); 
                    window.close();
                } else {
                    alert('오류가 발생했습니다.');
                }
            });
        }
    });
</script>
</body>
</html>
