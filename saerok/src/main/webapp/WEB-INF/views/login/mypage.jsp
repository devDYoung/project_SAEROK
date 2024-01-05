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
    width: 120px;
    height: 90px;
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
						<div class="col-md-5">
    						<label for="inputAddr" class="form-label">주소</label> 
   						<div class="input-group">
       						<input type="text" class="form-control" value="${loginEmployee.empAddr}" name="empAddr" id="empAddr">
        					<button type="button"  class="btn btn-outline-primary" onclick="addrBtnAction();">주소찾기</button>
   						 </div>
							</div>
						<br><br><br><br>
						<div class="col-md-6">
							<label for="inputAddr" class="form-label">상세주소</label> 
							<input type="text" class="form-control" value="${loginEmployee.empDetailAddr}" name="empDetailAddr" id="empDetailAddr">
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
		//	console.log("aaa", "${employee.empEmail}");
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
							location.reload();
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
	<!-- daum address api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	 function addrBtnAction() {
         new daum.Postcode({
             oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var addr = ''; // 주소 변수
                 var extraAddr = ''; // 참고항목 변수

                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                 }

                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                 if(data.userSelectedType === 'R'){
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                         extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if(data.buildingName !== '' && data.apartment === 'Y'){
                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if(extraAddr !== ''){
                         extraAddr = ' (' + extraAddr + ')';
                     }
                     // 조합된 참고항목을 해당 필드에 넣는다.
                     document.getElementById("extraAddr").value = extraAddr;
                 
                 } else {
                     document.getElementById("extraAddr").value = '';
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById("zipcode").value = data.zonecode;
                 document.getElementById("empAddr").value = addr;
                 // 커서를 상세주소 필드로 이동한다.
                 document.getElementById("empDetailAddr").focus();
             }
         }).open();
     }
	
	
	</script>
	
	
	
	
