<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="springform"
	uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="쪽지작성" />
</jsp:include>
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
			<form id="contactForm" data-sb-form-api-token="API_TOKEN">
				<!-- 사원 입력-->
				<div class="form-floating mb-3">
					<h>받는 사람</h>
					<input class="form-control" id="email" type="email"
						placeholder="name@example.com"
						data-sb-validations="required,email" /> <!-- <label for="email">Email
						address</label> -->
					<div class="invalid-feedback" data-sb-feedback="email:required">An
						email is required.</div>
					<div class="invalid-feedback" data-sb-feedback="email:email">Email
						is not valid.</div>
					<div class="d-grid text-right">
						<button class="btn-sm btn btn-primary btn-lg disabled" id="submitButton"
							type="submit">사원 조회</button>
					</div>
				</div>
				<!-- 쪽지 제목 입력-->
				<div class="form-floating mb-3">
					<h>제목</h>
					<input class="form-control" id="name" type="text"
						placeholder="쪽지 제목을 입력하세요." data-sb-validations="required" />
					<!-- <label for="name">Full name</label>
						<div class="invalid-feedback" data-sb-feedback="name:required">A
							name is required.</div>
					</div> -->


					<!-- Message input-->
					<div class="form-floating mb-3">
						<textarea class="form-control" id="message" type="text"
							placeholder="Enter your message here..." style="height: 10rem"
							data-sb-validations="required"></textarea>
						<label for="message">Message</label>
						<div class="invalid-feedback" data-sb-feedback="message:required">A
							message is required.</div>
					</div>
					<!-- Submit success message-->
					<!---->
					<!-- This is what your users will see when the form-->
					<!-- has successfully submitted-->
					<div class="d-none" id="submitSuccessMessage">
						<div class="text-center mb-3">
							<div class="fw-bolder">Form submission successful!</div>
							To activate this form, sign up at <br /> <a
								href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
						</div>
					</div>
					<!-- Submit error message-->
					<!---->
					<!-- This is what your users will see when there is-->
					<!-- an error submitting the form-->
					<div class="d-none" id="submitErrorMessage">
						<div class="text-center text-danger mb-3">Error sending
							message!</div>
					</div>
					<!-- Submit Button-->
					<div class="d-grid text-right">
						<button class="btn-sm btn btn-primary btn-lg disabled btn" id="submitButton"
							type="submit">보내기</button>
					</div>
			</form>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />