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
	src="https://cdn.datatables.net/v/dt/dt-1.13.8/datatables.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section id="ato-success">
	<div class="container-fluid">
		<form class="selectempList" id="updateempForm" action="${path}/selectemp" method="post">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">ATO 사원리스트</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th scope="col" class="text-center">사번</th>
									<th scope="col" class="text-center">이름</th>
									<th scope="col" class="text-center">부서</th>
									<th scope="col" class="text-center">직책</th>
									<th scope="col" class="text-center">전화번호</th>
									<th scope="col" class="text-center">이메일</th>
									<th scope="col" class="text-center">주소</th>
									<th scope="col" class="text-center">상세주소</th>
									<th scope="col" class="text-center">재직여부</th>
									<th scope="col" class="text-center">ATO사원수정</th>
								</tr>

							</thead>
							<tbody>
								<c:if test="${not empty empList}">
									<c:forEach var="loginEmployee" items="${empList}">
										<tr>
											<td><c:out value="${loginEmployee.empNo}" /></td>
											<td><c:out value="${loginEmployee.empName}" /></td>
											<td><c:out value="${loginEmployee.deptName}" /></td>
											<td><c:out value="${loginEmployee.jobName}" /></td>
											<td><c:out value="${loginEmployee.empPhone}" /></td>
											<td><c:out value="${loginEmployee.empEmail}" /></td>
											<td><c:out value="${loginEmployee.empAddr}" /></td>
											<td><c:out value="${loginEmployee.empDetailAddr}" /></td>
											<td><c:out value="${loginEmployee.workYn}" /></td>
											<td> 
												<button class="btn btn-outline-primary listupdatebtn" type="button"
													 data-toggle="modal" 
													 >수정하기</button>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
			<!-- 수정하기 Modal-->
			<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">ATO 사원수정</h5>
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<br>
							<div class="col-md-8">
								<label for="inputNo" class="form-label">사번</label> 
								<input type="text" class="form-control" value="${loginEmployee.empNo }" name="empNo" disabled>
							</div>
							<br>
							<div class="col-md-8">
								<label for="inputName" class="form-label">이름</label> 
								<input type="hidden" value="${loginEmployee.empNo }" name="empNo">
								<input type="text" class="form-control" value="${loginEmployee.empName }" name="empName" disabled>
							</div>
							<br>
							<div class="col-sm-8">
								<label for="inputdeptCode" class="form-label">부서</label> 
								<select name="deptCode" class="form-select form-select-sm rounded" aria-label="Small select example" style="height: 40px; width: 100%;">
									<option selected>부서</option>
									<option value="100">인사팀</option>
									<option value="200">관리팀</option>
									<option value="300">영업팀</option>
									<option value="400">지점</option>
								</select>
							</div>
							<br>
							<div class="row">
								<div class="col-12">
									<p>직책</p>
								</div>
								<div class="col-6">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="jobCode" value="10" checked> 
										<label class="form-check-label" for="flexRadioDefault1">부장</label>
									</div>
								</div>
								<div class="col-6">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="jobCode" value="20" > 
										<label class="form-check-label" for="flexRadioDefault2">대리</label>
									</div>
								</div>
								<div class="col-6">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="jobCode" value="30"> 
										<label class="form-check-label" for="flexRadioDefault3">사원</label>
									</div>
								</div>
								<div class="col-6">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="jobCode" value="40" > 
										<label class="form-check-label" for="flexRadioDefault4">지점장</label>
									</div>
								</div>
							</div>
							<br>
							<div class="col-6">
								<label for="inputdeptCode" class="form-label">재직여부</label> <br>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="workYn" value="Y"> 
									<label class="form-check-label" for="flexRadioDefault3">Y</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="workYn" value="N">
									<label class="form-check-label" for="flexRadioDefault3">N</label>
								</div>
							</div>
							<div class="modal-footer">
								
								<button class="btn btn-outline-primary" id="updatebtn" type="button"
									>수정하기</button>
								<a class="btn btn-outline-danger" href="">삭제하기</a>
							</div>
							
						</div>
					</div>
				</div>
			
	

</section>




<script>
/* 	$(".listupdatebtn").click(e=>{
		const tr=$(e.target).parents("tr");
		const td=$(tr).find("td");
		console.log(td);
		td.each((i,e)=>{
			const val=e.innerText;
			console.log(e,val);
			 
			
		})
		
		
		$("#updateModal").modal("show");
	}); */
	
	$(document).ready(function() {
	    $(".listupdatebtn").click(function() {
	        var empNo = $(this).closest('tr').find('td:eq(0)').text();
	        var empName = $(this).closest('tr').find('td:eq(1)').text();
	        var deptName = $(this).closest('tr').find('td:eq(2)').text();
	        var jobName = $(this).closest('tr').find('td:eq(3)').text();
	        var workYn = $(this).closest('tr').find('td:eq(8)').text();
	        
	        // 필요한 modal 위치에 세팅
	        $("#updateModal").find(".modal-title").text("ATO 사원수정");
	        $("#updateModal").find("[name=empNo]").val(empNo);
	        $("#updateModal").find("[name=empName]").val(empName);
	        $("#updateModal").find("[name=deptCode]").val(deptName); 
	        $("#updateModal").find("[name=jobCode][value=" + jobName + "]").prop("checked", true);
	        $("#updateModal").find("[name=workYn][value=" + workYn + "]").prop("checked", true);

	        // 모달 보여주기
	        $("#updateModal").modal('show');
	    });
	});
	
	
	
	
	
	$(document).ready(function() {

		new DataTable('#dataTable', {
			info : false,
			ordering : true,
			paging : true
		});
	});
</script>


<script>
	//파일업로드 script
	// 파일 선택 input의 변경 이벤트를 감지하여 동작하는 함수
// 	document.querySelector('input[type=file]').addEventListener('change',
// 			handleFileSelect);

	function changeImg() {
		document.querySelector("input[type=file]").click();
	}

	// 파일 선택하면 동작함
	function handleFileSelect(event) {
		var selectedFile = event.target.files[0];

		if (selectedFile) {
			// 파일 미리보기
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('profile-img').src = e.target.result;
			};
			reader.readAsDataURL(selectedFile);
		}
	}
</script>

<!-- 수정하기 ajax로 보내기 -->
<script>
	$("#updatebtn").click(function (event) {
	    event.preventDefault(); 
	    $.ajax({
	        type: "POST",
	        url: "${path}/updateemp", 
	        data: $("#updateempForm").serialize(), 
	        dataType: "json", 
	        success: function (data) {
	            if (data.successYn == "Y") {
	                alert("수정완료!!");
	            } else {
	                alert("수정실패!!");
	            }
	        },
	        error: function (error) {
	            console.error("수정 중 에러발생!!:", error);
	            alert("수정 중 에러가 발생했습니다.");
	        }
	    });
	});

</script>










<jsp:include page="/WEB-INF/views/common/footer.jsp" />


<!-- 섹션 시작 -->
<%-- <section id="ato-success">
		<div class="container-fluid">
			<form class="insertEmp" id="employeeForm" action="${path}/selectemp">
				<h1 class="h3 mb-2 text-gray-800">ATO 사원조회</h1>
				<br>
			</form>
		</div>
	</section>
</body>

 --%>

