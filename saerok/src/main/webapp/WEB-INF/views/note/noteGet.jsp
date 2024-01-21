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

<jsp:include page="/WEB-INF/views/common/header.jsp" />

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
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="@fat">쪽지 쓰기</button>
							</div>
						</tr>

						<tr>
							<th>쪽지번호</th>
							<th>보낸사람</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty receivedNotes}">
							<c:forEach var="note" items="${receivedNotes}">
								<tr>
									<td><c:out value="${note.noteNo}" /></td>
									<td><c:out value="${note.sndEmpNo}" /></td>
									<td><c:out value="${note.regDtime}" /></td>

								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Message</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			
			<!-- keyup 사용해서 사원 조회 -->
			<div class="modal-body">
				<form autocomplete="off">
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">수신자 </label> <input
							type="text" class="form-control" id="recipient-name"
							placeholder="사원 이름을 검색해주세요." data-sb-validations="required,email"
							onkeyup="searchEmp();" list="searchResult" />
						<datalist id="searchResult"></datalist>
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">내용</label>
						<textarea class="form-control" id="message-text"></textarea>
					</div>
				</form>
			</div>
			<style>
.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
}

.btn-primary {
	/* 여기에 원하는 스타일 속성을 추가하세요 */
	font-family: 'material-symbols-outlined', sans-serif;
	/* 추가적으로 필요한 스타일 속성을 설정하세요 */
}
</style>

			<div class="modal-footer">
				<button type="button"
					class="btn btn-primary material-symbols-outlined" id="send-btn">보내기</button>
			</div>

		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
	$(document).ready(function() {
		/* 
		new DataTable('#dataTable', {
			info : false,
			ordering : true,
			paging : true
		});
		 */
		$('#send-btn').click(function() {
			
			var recipientName = $('#recipient-name').val();
			var messageText = $('#message-text').val();
			
			// AJAX로 데이터 전송
			$.ajax({
				type : 'POST',
				url : '${path}/note/send', 
				data : {
					recipientName : recipientName,
					messageText : messageText
				},
				success : function(response) {
					 $('#myModal').modal('hide');
				},
				error : function(error) {
				}
			});
		});
	});
</script>
