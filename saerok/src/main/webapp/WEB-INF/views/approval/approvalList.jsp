<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<link
	href="https://cdn.datatables.net/v/dt/dt-1.13.8/datatables.min.css"
	rel="stylesheet" />

<script
	src="https://cdn.datatables.net/v/dt/dt-1.13.8/datatables.min.js">
	
</script>

<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="" value="전자결재리스트" />
</jsp:include>



<!-- 전체 리스트 -->

<div class="container-fluid">


	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">전체 리스트</h6>
			<div class="d-flex justify-content-end">
				<button class="btn btn-rounded btn-outline-primary col-1"
					onclick="location.assign('${path}/approval/basicForm');">작성하기</button>
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">

					<thead>

						<tr>
							<th>결재번호</th>
							<th>제목</th>
							<th>기안자</th>
							<th>문서구분종류</th>
							<th>진행상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="a" items="${approval}">
							<tr>
								<td><c:out value="${a.apvNo}" /></td>
								<td><c:out value="${a.apvName}" /></td>
								<td><c:out value="${loginEmployee.empName }" /></td>
								<td><c:out value="${a.apvDocNo}" /></td>
								<td><c:out value="${a.apvCheck }" /></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</div>
	</div>

</div>




<script>
	$(document).ready(function() {

		new DataTable('#dataTable', {
			info : false,
			ordering : true,
			paging : true
		});
	});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />