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
	<jsp:param name="" value="받은쪽지함" />
</jsp:include>

<!-- 전체 리스트 출력 -->
<div class="container-fluid">


	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">받은 쪽지함</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">

					<thead>
						<tr>
							<div>
								<button class="btn btn-rounded btn-outline-primary col-1"
									onclick="location.assign('${path}/note/write');">쪽지쓰기</button>
							</div>
						</tr>
						<tr>
							<th>쪽지번호</th>
							<th>보낸사람</th>
							<th>제목</th>
							<th>날짜</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${not empty receivedNotes}">
						<c:forEach items="${receivedNotes}" var="note">
							<tr>
								<td><c:out value="${note.noteNo}"/></td>
								<td><c:out value="${note.sndEmpNo}"/></td>
								<td><c:out value="${note.noteTitle}"/></td>
								<td><c:out value="${note.regDtime}"/></td>
								<td class="text-right">
									<button onclick="deleteNote(${note.noteNo})"
										class="btn btn-danger btn-sm">삭제</button>
								</td>
							</tr>
						</c:forEach>
						</c:if>
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