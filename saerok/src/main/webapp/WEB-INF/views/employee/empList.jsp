<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
<!-- 페이지 헤더 포함 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- 필요한 CSS 및 JavaScript 파일 포함 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

</head>
<body>
	<!-- 섹션 시작 -->
	<section id="ato-success">
		<div class="container-fluid">
			<form class="insertEmp" id="employeeForm" action="${path}/selectemp"
				method="post">
				<h1 class="h3 mb-2 text-gray-800">ATO 사원조회</h1>
				<br>
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">ATO 사원리스트</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">							
									<tr>
										<th scope="col">사번</th>
										<th scope="col">부서</th>
										<th scope="col">직책</th>
										<th scope="col">이름</th>
										<th scope="col">이메일</th>
										<th scope="col">주소</th>
										<th scope="col">재직여부</th>
									</tr>
								<c:if test="${not empty empList}">
									<c:forEach var="loginEmployee" items="${empList}">
										<tr>
											<td><c:out value="${loginEmployee.empNo}"/></td>
											<td><c:out value="${loginEmployee.deptName}"/></td>
											<td><c:out value="${loginEmployee.jobName}"/></td>
											<td><c:out value="${loginEmployee.empName}"/></td>
											<td><c:out value="${loginEmployee.empEmail}"/></td>
											<td><c:out value="${loginEmployee.empAddr}"/></td>
											<td><c:out value="${loginEmployee.workYn}"/></td>
											
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>

</body>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
