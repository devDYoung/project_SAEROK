<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지점 조회</title>
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
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">지점 조회</h1>
		</div>
		<hr class="my-4">
		<section class="d-flex justify-content-between mb-4">
			<form class="form-inline"
				action="${pageContext.request.contextPath}/branch/" method="get">
				<div class="form-group mb-2">
					<label for="searchKeyword" class="sr-only">지점명</label> <input
						type="text" id="searchKeyword" name="searchKeyword"
						class="form-control" placeholder="지점명으로 검색"
						value="${param.searchKeyword}">
				</div>
				<button type="submit" class="btn btn-primary mb-2">검색</button>
			</form>

			<form action="${pageContext.request.contextPath}/branch/add"
				method="get">
				<button type="submit" class="btn btn-success mr-3">지점 추가</button>
			</form>
		</section>

		<section>
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th scope="col">지점번호</th>
						<th scope="col">지점명</th>
						<th scope="col">지역</th>
						<th scope="col">전화번호</th>
						<th scope="col">설명</th>
						<th scope="col">지점장</th>
						<th scope="col">지점장 번호</th>
						<th scope="col" class="text-center">관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="branch" items="${branches}">
						<tr>
							<th scope="row">${branch.branchNo}</th>
							<td>${branch.branchName}</td>
							<td>${branch.branchRegion}</td>
							<td>${branch.branchTel}</td>
							<td>${branch.branchDescription}</td>
							<td>${branch.empName}</td>
							<td>${branch.empPhone}</td>
							<td class="text-center"><a
								href="${path}/branch/update/${branch.branchNo}"
								class="btn btn-primary btn-sm">수정</a> 
								<!-- 삭제 버튼 -->
								<!-- <button onclick="deleteBranch(${branch.branchNo})"
									class="btn btn-danger btn-sm">삭제</button></td> -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>



	</div>

	<script>
    function deleteBranch(branchNo) {
        if(confirm("정말 삭제하시겠습니까?")) {
            fetch('/branch/' + branchNo, {
                method: 'DELETE'
            })
            .then(response => {
                if(response.ok || response.redirected) {
                    alert('삭제되었습니다.');
                    window.location.href = '/branch/';  
                } else {
                    alert('삭제 실패');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('삭제 중 문제가 발생했습니다.');
            });
        }
    }
</script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
