<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="springform"
	uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.dy {
	margin-left: 200px;
}
</style>
<div class="content">
	<div class="row gx-5 justify-content-center">
		<div class="col-lg-8 col-xl-6">
			<!-- * * * * * * * * * * * * * * *-->
			<!-- * * SB Forms Contact Form * *-->
			<!-- * * * * * * * * * * * * * * *-->
			<!-- This form is pre-integrated with SB Forms.-->
			<!-- To make this form functional, sign up at-->
			<!-- https://startbootstrap.com/solution/contact-forms-->
			<!-- to get an API token!-->
			<form id="contactForm" data-sb-form-api-token="API_TOKEN" autocomplete="off">
				<!-- 사원 입력-->
				<div class="form-floating mb-3">
					<h>받는 사람</h>
					<input class="form-control" id="email" type="text" autocomplete="off"
						placeholder="사원 이름을 검색해주세요."
						data-sb-validations="required,email" onkeyup="searchEmp();" list="searchResult"/>
						<datalist id="searchResult"></datalist>
					<div class="invalid-feedback" data-sb-feedback="email:required">An
						email is required.</div>
					<div class="invalid-feedback" data-sb-feedback="email:email">Email
						is not valid.</div>
					<div class="d-grid text-right">
						<button class="btn-sm btn btn-primary btn-lg" id="submitButton"
							type="button" onclick="openEmployeeModal()">사원 조회</button>
					</div>
				</div>
				<!-- 쪽지 제목 입력-->
				<div class="form-floating mb-3">
					<h>제목</h>
					<input class="form-control" id="name" type="text"
						placeholder="제목을 입력해 주세요." data-sb-validations="required" />
					<div class="invalid-feedback" data-sb-feedback="name:required">A
						name is required.</div>
				</div>
				<!-- Message input-->
				<div class="form-floating mb-3">
					<h>내용</h>
					<textarea class="form-control" id="message" type="text"
						style="height: 10rem" data-sb-validations="required"></textarea>
					<label for="message">Message</label>
					<div class="invalid-feedback" data-sb-feedback="message:required">A
						message is required.</div>
				</div>
				<!-- Submit success message-->
				<div class="d-none" id="submitSuccessMessage">
					<div class="text-center mb-3">
						<div class="fw-bolder">Form submission successful!</div>
						To activate this form, sign up at <br /> <a
							href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
					</div>
				</div>
				<!-- Submit error message-->
				<div class="d-none" id="submitErrorMessage">
					<div class="text-center text-danger mb-3">Error sending
						message!</div>
				</div>
				<!-- Submit Button-->
				<div class="d-grid text-right">
					<button class="btn-sm btn btn-primary btn-lg disabled btn"
						id="submitButton" type="submit">보내기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- Employee Modal -->
<div class="modal fade" id="employeeModal" tabindex="-1"
	aria-labelledby="employeeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<form
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- 모달 창 내용 추가-->
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">부서</th>
							<th scope="col">사원</th>
							<th scope="col">선택</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td><button class="btn btn-primary">선택</button></td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>
<div id="searchList">
	<span id="empNo"></span>
	<span id="empName"></span>
</div>
<script>

</script>
<!-- 이건 플랜B
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function openEmployeeModal() {
		var employeeModal = new bootstrap.Modal(document
				.getElementById('employeeModal'));
		employeeModal.show();
		// 사원 조회 함수 호출
		employeeSearch();
	}
	function employeeSearch(){
		// ajax요청
		fetch('${path}/employeeSearch').then(response=>response.json()).the(data=>{
			// 테이블에 추가하기
			updateEmployeeTable(data);
			})
			.catch(error=>console.error('검색하신 사원이 존재하지 않습니다.',error));
			
		}
	
	
</script>
 -->