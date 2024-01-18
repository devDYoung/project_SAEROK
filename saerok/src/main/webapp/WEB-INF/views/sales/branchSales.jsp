<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
<!DOCTYPE html>
<html>
<head>
<title>지점별 매출</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- 임시 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">

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

.branch-link {
	color: inherit;
	text-decoration: none;
}

.branch-link:hover {
	text-decoration: underline;
}

.clickable-row:hover {
	background-color: #f5f5f5;
	cursor: pointer;
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">지점별 매출</h1>
		</div>
		<hr class="my-4">

		<form action="${pageContext.request.contextPath}/sales/branch"
			method="get" class="mb-4">
			<div class="form-row justify-content-between align-items-center">
				<div class="col-md-3">
					<div class="input-group mb-2">
						<input type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="지점명 검색">
						<div class="input-group-append">
							<button type="submit" class="btn btn-primary">검색</button>
						</div>
					</div>
				</div>

				<div class="col-auto">
					<select class="form-control mb-2" id="sortOrder" name="sortOrder"
						onchange="this.form.submit()">
						<option value="BRANCH_NO">기본순</option>
						<option value="BRANCH_NAME">이름순</option>
						<option value="TOTAL_SALES_DESC">상위 매출순</option>
						<option value="TOTAL_SALES_ASC">하위 매출순</option>
					</select>
				</div>
			</div>
		</form>

		<!-- 지점별 매출 현황 표시 -->
		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th>지점명</th>
					<th>일간 매출</th>
					<th>월간 매출</th>
					<th>연간 매출</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${branchSales}" var="sale">
					<tr class='clickable-row'
						data-href="${pageContext.request.contextPath}/sales/branch/${sale.branchNo}">
						<td>${sale.branchName}</td>
						<td><fmt:formatNumber value="${sale.dailySales}"
								type="currency" /></td>
						<td><fmt:formatNumber value="${sale.monthlySales}"
								type="currency" /></td>
						<td><fmt:formatNumber value="${sale.annualSales}"
								type="currency" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script>
    document.addEventListener('DOMContentLoaded', () => {
        const rows = document.querySelectorAll('.clickable-row');
        rows.forEach(row => {
            row.addEventListener('click', () => {
                window.location.href = row.dataset.href;
            });
        });

        const urlParams = new URLSearchParams(window.location.search);
        const sortOrder = urlParams.get('sortOrder');
        if (sortOrder) {
            document.getElementById('sortOrder').value = sortOrder;
        } else {
            document.getElementById('sortOrder').value = 'BRANCH_NO'; 
        }
    });
</script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />