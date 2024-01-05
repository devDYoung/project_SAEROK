<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/> 

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
#profile-img {
	width: 5%;
	height: auto;
	margin-top: 100px;
	margin-left: 600px;
}

.mypage-simple-info {
	margin-top: 100px;
	margin-left: 370px;
}

.mypage-simple-info {
	width: 50%;
	height: auto;
}

#button {
	width: 10%;
	height: auto;
	margin-top: 15px;
	margin-bottom: 70px;
	margin-left: 670px;
}
#profile-img {
    width: 5%;
    height: auto;
    margin-top: 50px;
    margin-left: 370px; /* Adjust this value to move the image to the left */
}

.mypage-section{
	margin-top: 1px;

}


</style>
</head>
<body>
	<section class="mypage-section">
		<div class="myPage-container">
			<!-- <h2 id="profile-comment">내 프로필</h2> -->
			<img id="profile-img" class="img-profile rounded-circle"
				src="${pageContext.request.contextPath }/resources/img/ato100px.png"></a> 
				
			<form id="mypageForm" action="${path }/updatemypage" method="post">
				<div class="mypage-simple-info">
					<div class="form-group row">
						<div class="col-md-6">
							<label for="inputName" class="form-label">이름</label> 
							<input type="hidden" value="${loginEmployee.empNo }" name="empNo">
							<input type="text" class="form-control" value="${loginEmployee.empName }" name="empName">
						</div>
						<div class="col-md-6">
							<label for="inputDate" class="form-label">입사일</label> 
							<input type="text" class="form-control" value="${loginEmployee.empDate}" name="date" disabled>
						</div>
						<br><br><br><br>
						<div class="col-md-6">
							<label for="inputNo" class="form-label">사번</label> 
							<input type="text" class="form-control" value="${loginEmployee.empNo }" name="empNo" disabled>
						</div>
						<%-- <div class="col-md-6">
							<label for="inputPw" class="form-label">비밀번호</label> 
							<input type="password" class="form-control" value="${loginEmployee.empPw }" name="empPw">
						</div> --%>
						<br><br><br><br>
						<div class="col-md-6">
							<label for="inputPhone" class="form-label">전화번호</label> 
							<input type="text" class="form-control" value="${loginEmployee.empPhone }" name="empPhone">
						</div>
						<br><br><br><br>
						<div class="col-md-6">
							<label for="inputEmail" class="form-label">이메일</label> 
							<input type="email" class="form-control" value="${loginEmployee.empEmail}" name="empEmail">
						</div>
						<br><br><br><br>
						<div class="col-md-6">
							<label for="inputAddr" class="form-label">주소</label> 
							<input type="text" class="form-control" value="${loginEmployee.empAddr}" name="empAddr">
						</div>
						<br><br><br><br>
						<div class="col-md-6">
							<label for="inputAddr" class="form-label">상세주소</label> 
							<input type="text" class="form-control" value="${loginEmployee.empDetailAddr}" name="empDetailAddr">
						</div>
						<br><br><br><br>
						<div class="col-md-6">
							<label for="inputDept" class="form-label">부서</label> 
							<input type="hidden" value="${loginEmployee.deptCode}" name="deptCode">
							<input type="text" class="form-control" value="${loginEmployee.deptName}" name="deptName" disabled>
						</div>
						<br><br><br><br>
						<div class="col-md-6">
							<label for="inputJob" class="form-label">직책</label> 
							<input type="hidden" value="${loginEmployee.jobCode}" name="jobCode">
							<input type="text" class="form-control" value="${loginEmployee.jobName}" name="jobName" disabled>
						</div>
						<br><br><br><br>
					</div>
				</div>
			</form>
		</div>
		<!-- myPage-container -->
		<div class="d-grid gap-2 d-md-block" id="button">
			<button id="mypageButton" type="submit"
				class="btn btn-outline-primary">수정</button>
			<button type="reset" class="btn btn-outline-primary">취소</button>
		</div>
	</section>


	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(document).ready(function() {
			console.log("aaa", "${employee.empEmail}");
			$("#mypageButton").click(function(event) {
				event.preventDefault(); // 기본 폼 제출 방지

				// 프로필 업데이트를 위한 AJAX 요청
				$.ajax({
					type : "POST",
					url : "/updatemypage", // 실제 서버 측 엔드포인트로 대체
					data : $("#mypageForm").serialize(), // 폼 데이터 직렬화
					dataType:'JSON',					
					success : function(data) {
						if (data.successYn == "Y") {
							alert("수정완료!!");
							location.replace("${path}/logoutpage");
						} else {
							alert("수정실패!!");
						}
						// 성공 응답 처리
						// 성공 메시지를 표시하거나 사용자를 리디렉션
					},
					error : function(error) {
						// 오류 응답 처리
						console.error("수정 중 에러발생!!:", error);
						// 사용자에게 오류 메시지를 표시
					}
				});
			});
		});
		/* 잔디테스트  */
	</script>
