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

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="사직서" name="title" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/form.css">


<div class="content-wrapper">
	<!-- Content -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card">
			<!-- Basic Layout -->
			<div class="row">
				<div class="col-xl">
					<div class="card-header">
						<h2 class="mb-0">
							<strong>문&nbsp;서&nbsp;작&nbsp;성</strong>
						</h2>
					</div>
					<!-- 구분선 -->
					<hr class="m-0">
					<div class="card-body">
						<form id="approvalForm" method="post">
							<!-- 선택된 결재자 정보를 저장할 hidden 필드 -->
							<input type="hidden" name="approvalLine" value=""> 
							<input type="hidden" name="approvalLine" value=""> 
							<input type="hidden" name="approvalLine" value="">
							<!-- 상단 -->
							<div class="row" style="margin-bottom: 5px;">
								<!-- 기안자 정보 -->
								<div class="col-md-4">
									<table class="table table-sm table-bordered infoTh">
										<tbody>
											<tr>
												<th>문서종류</th>
												<td><select id="docCatCd" name="docCatCd"
													class="form-select">
														<option value="D1">사직서 문서</option>
														<option value="D2">휴가 문서</option>
														<option value="D3">지출 결의서</option>
												</select></td>
											</tr>
											<tr>
												<th>기안자</th>
												<td>${loginEmployee.empName}</td>
											</tr>
											<tr>
												<th>기안일</th>
												<td><a id="today"></a></td>
											</tr>
											<tr>
												<th>문서번호</th>
												<td>&nbsp;</td>
											</tr>

										</tbody>
									</table>
								</div>

								<div class="col-md-3">&nbsp;</div>

								<!-- 결재선 -->
								<div class="col-md-5 table-bordered">
									<!-- 결재 -->
									<div class="row mb-1">
										<button class="col-sm-1 modalAddUserToDeptBtn"
											data-bs-toggle="modal" data-bs-target="#modal2"
											style="font-weight: bolder; display: flex; justify-content: center; align-items: center; border: 1px solid #d9dee3;">결재
										</button>
										<div class="col-sm-11">
											<!-- 선택된 결재자 정보를 표시할 HTML 요소 -->
											<div id="selectedApprovers">
												<p>
													첫 번째 결재자: <span id="firstApproverName"></span>
												</p>
												<p>
													두 번째 결재자: <span id="secondApproverName"></span>
												</p>
												<p>
													세 번째 결재자: <span id="thirdApproverName"></span>
												</p>
											</div>
										</div>
									</div>
									<!-- 참조 -->
									<div class="row">
										<button class="col-sm-1" data-bs-toggle="modal"
											data-bs-target="#refModal"
											style="font-weight: bolder; display: flex; justify-content: center; align-items: center; border: 1px solid #d9dee3;">참조
										</button>
										<div class="col-sm-11">
											<div class="table table-bordered">
												<input class="form-control" type="text" name="userName"
													id="refUserList" placeholder="참조를 선택하세요"
													readonly="readonly" value="" />

											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 신청양식 -->
							<div id="03" style="margin-top: 20px;">
								<!-- 제목 입력 -->
								<div class="mb-3">
									<input type="hidden" name="userId" value="${userId}"> <input
										type="text" name="aprvTitle" maxlength="50"
										class="form-control" placeholder="제목을 입력하세요"
										required="required" />
								</div>
								<!-- 내용 입력 -->
								<div class="mb-1">
									<!-- 네이버 에디터 -->
									<textarea name="aprvContents" class="form-control" id="editor"
										placeholder="내용을 입력하세요" maxlength="2500"
										style="height: 380px; width: 100%"></textarea>
									<script type="text/javascript">
												        var oEditors = [];
												        nhn.husky.EZCreator.createInIFrame({
												            oAppRef: oEditors,
												            elPlaceHolder: "editor",
												            sSkinURI: "${path}/smartEditor/SmartEditor2Skin.html",  // 스킨 경로
												            fCreator: "createSEditor2",
												            htParams: {
												            	bUseToolbar : true,
												            	bUseVerticalResizer: false,
												            	bUseModeChanger: false
												            }
												        });
												        
												        function submitContents(){
												        	oEditors.getById["editor"].exec("UPDATE_CONTENTS_FIELD",[]);
												        }
								
												        function submitForm() {
												            var selectedValue = $('#docCatCd').val();
												            if(selectedValue == '03'){
												            	submitContents();
												            }
												            var formData = new FormData($('#approvalForm')[0]); // 폼 데이터를 가져오는 방식 변경
												        	formData.append("reference",refSelected)
												            // 폼 데이터 전송 (AJAX 예제)
												            $.ajax({
												                url: '/yeyebooks/approval/addApproval',
												                type: 'POST',
												                data: formData,
												                processData: false, // 중요: 폼 데이터를 jQuery가 자동으로 처리하지 않도록 설정
												                contentType: false, // 중요: 데이터 유형을 설정하지 않도록 설정
												                success: function(response) {
												                    Swal.fire({
												                    	icon: 'success',
												                    	title: '성공',
												                    	text: '결재가 기안되었습니다.'
												                    }).then(function(){
												                    	location.href="/yeyebooks/approval/approvalList";
												                    })
												                },
												                error: function(error) {
												                    // 오류 시 처리
												                }
												            });
												        }
												    </script>
								</div>
							</div>
							<br>

							<!-- 지출결의서 -->
							<div id="01" style="display: none; margin: 20px 0;">
								<table class="table table-sm table-bordered">
									<tbody style="text-align: center;">
										<tr>
											<th colspan="4">
												<h2>지&nbsp;&nbsp;출&nbsp;&nbsp;내&nbsp;&nbsp;역</h2>
											</th>
										</tr>
										<tr>
											<th>제목</th>
											<td colspan="3"><input type="text" name="aprvTitle"
												maxlength="50" class="form-control" placeholder="제목을 입력하세요"
												required="required" /></td>
										</tr>
										<tr>
											<th>지출내용</th>
											<td colspan="3"><textarea name="aprvContents"
													class="form-control" placeholder="내용을 입력하세요"
													required="required"></textarea></td>
										</tr>
										<tr>
											<th>사용내역</th>
											<td colspan="3"><textarea id="acntContents"
													name="acntContents" class="form-control"
													placeholder="내용을 입력하세요" required="required"></textarea><br>
											</td>
										</tr>
										<tr>
											<th>지출날짜</th>
											<td>
												<div style="display: flex; justify-content: center;">
													<input type="date" id="acntYmd" name="acntYmd"
														class="form-control form-control-sm">
												</div>
											</td>

											<th>사용처</th>
											<td><input type="text" id="acntNm" name="acntNm"
												class="form-control form-control-sm"></td>


										</tr>
										<tr>
											<th>지출금액</th>
											<td><input type="number" id="acntAmount"
												name="acntAmount" value=0
												class="form-control form-control-sm"></td>
											<th>구분</th>
											<td colspan="3"><select id="acntCreditCd"
												name="acntCreditCd" class="form-select">
													<option value="01">법인</option>
													<option value="02">개인</option>
											</select></td>
										</tr>
									</tbody>
								</table>
							</div>

							<label for="files">첨부 파일:</label>
							<button type="button" id="addFile" class="btn btn-primary btn-sm">추가</button>
							<button type="button" id="removeFile"
								class="btn btn-primary btn-sm">삭제</button>
							<div id="files" class="my-2">
								<input class="form-control approvalFiles" type="file"
									name="multipartFile" multiple><br>
							</div>

							<button type="button" class='btn btn-primary'
								onclick="submitForm()" style="float: right;">문서등록</button>
						</form>
						<!-- 문서 끝 -->
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- card End -->
</div>
<!-- / Content -->
</div>
<!-- / Content Wrapper -->
</div>
<!-- / Layout page -->
</div>
<!-- / Layout wrapper -->







<%-- <div style="display: flex; justify-content: center; flex-direction: column; align-items: center;"> 
	<h1>사직서</h1>
	<form>
		<table border="1">
				<tr>
					<th>신청</th>
					<th>결제</th>
				</tr>
								<tr>
									<td><span class="sign_rank">${loginEmployee.deptName}</span>
									</td>
								</tr>
								<tr>
									<td><span class="sign_wrap">${loginEmployee.empName}</span>
									</td>
								</tr>
								<tr>
									<td><span class="sign_date"> <c:set var="now"
												value="" /> <fmt:formatDate value="${now}"
												pattern="yyyy-MM-dd" />
									</span></td>
								</tr>
							</tbody>
						</table>
	</form>

	<br>
	<div>
		<form>
			<table border="1">
			<tr class="sign-tbl-bottom-tr">
					<th>직급</th>
					<td>${loginEmployee.jobName}</td>
					<th>사번</th>
					<td>${loginEmployee.empNo}</td>
					</tr>
					<tr>
					<th>성명</th>
					<td>${loginEmployee.empName}</td>
					<th>근무부서</th>
					<td>${loginEmployee.deptName}</td>
				</tr>
				<tr class="sign-tbl-bottom-tr">
					<th>입사일</th>
					<td><input type="date" name="start-date" id="start-date"
						value="${loginEmployee.empDate}" readonly /></td>
					<th>퇴사일</th>
					<td><input type="date" name="endDate" id="end-date"
						onKeyPress="noKey(event);" /> <script>
										const endDate = document.querySelector('#end-date');
										endDate.min = today;
										endDate.value = today;
									</script></td>
				</tr>
				
				<tr class="sign-tbl-bottom-tr">
					
					
					
					
				</tr>
				<tr>
					<th colspan="4">퇴직 사유</th>
				</tr>
				<tr>
					<td colspan="4"><textarea cols="60" rows="5" id="reason"
							name="reason"></textarea></td>
				</tr>
				</tbody>
			</table>
			<div style="display: flex; justify-content: right; margin-top: 10;">
				<button class="btn btn-rounded btn-outline-primary col-2" >제출</button>
			</div>
		</form>
	</div>
</div>
<!-- 결재 문서 end -->
<script>
	/* 날짜 키보드 입력 막기 */
	const noKey = (event) => {
		event.preventDefault();
		return false;
	};
	
	/* 사직서 폼 제출 */
	const signCreate = () => {
		const frm = document.resignationCreateFrm;
		const reason = frm.reason;
		
		if (/^\s+$/.test(reason.value) || !reason.value) {
			alert('퇴사 사유를 작성해주세요.');
			reason.select();
			return false;
		}
		
		frm.submit();
	};
</script> --%>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />
