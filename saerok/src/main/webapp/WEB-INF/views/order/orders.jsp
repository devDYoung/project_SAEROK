<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />

<title>발주 목록</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- 임시 폰트 -->
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
	background-color: #6C7AE0;
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

.custom-table tbody tr {
	cursor: pointer;
	transition: background 0.3s;
}

.custom-table tbody tr:hover {
	background: #C9C9C9;
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


	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">발주 목록</h1>
		</div>
		<hr class="my-4">

		<table class="table custom-table text-center" id="ordersTable">
			<thead>
				<tr>
					<th scope="col">발주 번호</th>
					<th scope="col">발주 날짜</th>
					<th scope="col">지점 이름</th>
					<th scope="col">발주 수량</th>
					<th scope="col">발주 금액</th>
					<th scope="col">상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orders}" var="order">
					<tr>
						<td class="order-id">${order.orderId}</td>
						<td><fmt:formatDate value="${order.orderDate}"
								pattern="yyyy년 MM월 dd일" /></td>
						<td>${order.branchName}</td>
						<td>${order.totalQuantity}</td>
						<td><fmt:formatNumber value="${order.totalAmount}"
								type="currency" /></td>
						<td class="order-status">${order.orderStatus}</td>
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
	
	$(document).ready(function() {
	    $('#ordersTable').DataTable({
	        "paging": true,
	        "lengthChange": false, // 행 고정
	        "pageLength": 10,      // 10개 행 고정
	        "searching": false,    // 검색 기능
	        "ordering": false,
	        "info": true,
	        "autoWidth": false,
	        "language": {
	            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Korean.json"
	        }
	    });
	});

	
	document.addEventListener('DOMContentLoaded', () => {
		 const rows = document.querySelectorAll('.custom-table tbody tr');
		    
		    rows.forEach(row => {
		        // 상태 셀에 따라 클래스 추가
		        const statusCell = row.querySelector('.order-status');
		        if (statusCell) {
		            const status = statusCell.textContent.trim();
		            switch (status) {
		                case '대기중':
		                    statusCell.classList.add('status-pending');
		                    break;
		                case '승인':
		                    statusCell.classList.add('status-approved');
		                    break;
		                case '반려':
		                    statusCell.classList.add('status-rejected');
		                    break;
		            }
		        }

		        // 클릭 이벤트 리스너 추가
		        row.addEventListener('click', () => {
		            const orderId = row.querySelector('.order-id').textContent;

		            const width = 800;
		            const height = 600;
		            const left = (window.screen.width / 2) - (width / 2);
		            const top = (window.screen.height / 2) - (height / 2);

		            window.open('${path}/orders/' + orderId, '_blank', 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left);
		        });
		    });
		});

</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>