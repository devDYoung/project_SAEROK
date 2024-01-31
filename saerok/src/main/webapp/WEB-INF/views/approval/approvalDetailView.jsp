<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Optional" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
<style>
.custom-file-link {
	color: blue;
	text-decoration: underline;
	cursor: pointer;
}

.custom-file-input {
	display: none; /* Hide the file input */
}

.custom-file-link {
	color: blue;
	text-decoration: underline;
	cursor: pointer;
}

/* model */
.btn {
	font-size: 1em;
	padding: 10px;
	margin: 5px;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 20% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 300px;
	text-align: center;
}

.button-container {
	display: flex;
	justify-content: space-around;
}

.approve {
	background-color: #4CAF50;
	color: white;
}

.reject {
	background-color: #f44336;
	color: white;
}

.cancel {
	background-color: #555555;
	color: white;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- <img
	src="https://approval.office.hiworks.com/gabia.biz/approval/sign/approval/A/2/87786"
	style="width: auto; height: auto; max-width: none;" alt="아이콘"> -->


<form class="documentForm" name="basicForm"
	enctype="multipart/form-data">
	<input type="hidden" name="loginEmp" value="${loginEmployee.empNo }">
	<div id="documentForm " class="documentForm"
		style="margin: 50px 50px 50px 50px; width: min-content;">
		<div class="basicForm">
			<table border="1" style="display: inline-block; text-align: center;">
				<tr>
					<td rowspan="3" colspan="4"
						style="width: 300px; height: 140px; font-size: 40px; font-weight: 600;">품
						의 서</td>
					<td rowspan="3"
						style="width: 20px; padding-top: 30px; font-size: 25px;">결 재
					</td>
					<c:forEach var="apvLine"
						items="${approvalDetailView.apvWriter.stream()
				    .sorted((e,e2)->e2.getWriterList()-e.getWriterList()).toList() }">
						<td class="apvLine"
							style="height: 25px; width: 100px; font-size: 17px">
							${apvLine.apvEmpName}</td>
					</c:forEach>

				</tr>


				<tr>
					<c:forEach var="writer"
						items="${approvalDetailView.apvWriter.stream()
        .sorted((e,e2)->e2.getWriterList()-e.getWriterList()).toList() }">
						<td><c:set var="apvStatus"
								value="${approvalDetailView.apvWriter.stream()
                .filter(e->e.getWriterList()==writer.getWriterList())
                .toList().get(0).getApvState()}" />
							<c:choose>
								<c:when test="${apvStatus eq 300}">
									<img src="${path }/resources/img/approval.png"
										style="width: 30px;" />
								</c:when>
								<c:when test="${apvStatus eq 200}">
									<img src="${path }/resources/img/rejection.png"
										style="width: 30px;" />
								</c:when>
								<c:otherwise>
									<c:if test="${writer.apvEmpNo eq loginEmployee.empNo }">
										<c:if
											test="${approvalDetailView.apvWriter.stream()
                            .filter(e->e.getWriterList()>writer.getWriterList())
                            .allMatch(e->e.getApvState()=='300').orElse(true) }">
											<!-- 결재 버튼을 누르면 모달 창을 띄움 -->
											<input type="button" id="apv1" class="apvLineButton"
												value="결재" onclick="showModal();" />
											<!-- 모달 창 -->

											<div id="myModalApv" class="modal">
												<div class="modal-content">
													<h2>결재</h2>
													<p>결재하시겠습니까?</p>
													<div class="button-container">
														<button type="button" onclick="aprv(event)"
															class="btn approve">승인</button>
														<button type="button" onclick="aprv(event)"
															class="btn reject">반려</button>
														<button type="button" onclick="cancel(event)"
															class="btn cancel">취소</button>
													</div>
												</div>
											</div>
											<div id="rejectModal" class="modal">
												<div class="modal-content">
													<h2>반려</h2>
													<p>반려 사유를 입력하시오.</p>
													<textarea id="returnReason" rows="4" cols="50"></textarea>
													<button onclick="reject()" class="btn reject">확인</button>
												</div>
											</div>
										</c:if>
									</c:if>
								</c:otherwise>
							</c:choose></td>
					</c:forEach>
				</tr>
				<tr>
					<td colspan="2" style="color: black; height: 70px;">수신참조자</td>
					<td colspan="6" id="referContainer" style="height: 70px;">진행중</td>
				</tr>
				<tr>
					<td
						style="color: black; height: 70px; width: 80px; font-size: 15px;">성
						명</td>
					<td><input type="text" name="writerName"
						style="border: none; background: transparent; text-align: center;"
						value="${approvalDetailView.appEmpName}" readonly></td>
					<td style="color: black; width: 80px; font-size: 15px;">부 서</td>
					<td><input type="text"
						style="border: none; background: transparent; text-align: center;"
						value="${approvalDetailView.deptName}" readonly></td>
					<td style="color: black; width: 80px; font-size: 15px;">직 급</td>
					<td colspan="3"><input type="text"
						style="border: none; background: transparent;"
						value="${approvalDetailView.jobName}" readonly></td>
				</tr>
				<tr>
					<td style="color: black; height: 50px; width: 80px;">제 목</td>
					<td colspan="8"><input class="form-control"
						value="${approvalDetailView.letterTitle }" name="letterTitle"
						id="loaTitle"
						style="width: 100%; height: 50px; resize: none; overflow: hidden; font-size: 20px;" /></td>
				</tr>
				<tr>
					<td colspan="8" style="height: 50px;"><label
						class="custom-file-link" for="fileDownloadLink">
							${approvalDetailView.oriFileName} </label> <input type="text"
						class="custom-file-input" name="upFileView" style="display: none;"
						id="fileDownloadLink" value="${approvalDetailView.oriFileName}"
						readonly /></td>

				</tr>
				<tr>
					<td style="color: black; height: 70px; width: 300px;">상세내용</td>


					<td colspan="8"><input class="form-control"
						name="letterDetail" id="loaContent" cols="151px" rows="11px"
						value="${approvalDetailView.letterDetail }"
						style="width: 100%; height: 300px; border: none; resize: none; overflow: hidden; font-size: 20px;" />
					</td>
				</tr>
				<tr>
					<td colspan="8"
						style="text-align: center; height: 100px; border-bottom: none;">위와
						같은 품의사유로, 검토 후 결재 바랍니다.</td>
				</tr>
				<tr style="color: black; border-top: none; border-bottom: none;">
					<td colspan="8" style="text-align: center; height: 100px;">
						${approvalDetailView.appWriteDate}</td>
						<!-- test -->
				</tr>
				<tr>
					<td colspan="8"
						style="color: black; text-align: right; height: 100px; padding-right: 50px;">
						<input type="button" name="sign" id="sign"
						style="font-size: 15px; width: 70px; height: 30px; border: none; text-align: center; border-radius: 20px; margin-right: 10px"
						value="서명" /> <textArea name="signText" id="signText"
							style="width: 100px; border: none; text-align: center; resize: none; font-size: 24px;"
							readonly="readonly"></textArea>
					</td>
				</tr>
			</table>
		</div>
		<div id="button" style="text-align: center; margin-top: 10px">
			<input type="hidden" name="basicForm" value="품의서">
			<button type="button" class="btn btn-primary"
				onclick="window.close();">확인</button>
		</div>
	</div>
</form>

<!--결재 모달 창  -->
<script>
	function showModal() {
		document.getElementById("myModalApv").style.display = "block";
	}

	function showRejectModal() {
		document.getElementById("myModalApv").style.display = "none";
		document.getElementById("rejectModal").style.display = "block";
	}
	 function cancel() {
	        document.getElementById("myModalApv").style.display = "none";
	        document.getElementById("rejectModal").style.display = "none";

	 }

	function aprv(e) {
		let returnReason = "";
		let status = e.target.innerText.trim();
		if (status == "반려") {
			returnReason = prompt("반려사유를 작성하세요 ");
		}
		// AJAX를 사용하여 서버에 승인을 전송
		$.ajax({
			type : "POST",
			url : "${path}/approval/updateApprovalStatus",
			data : {
				appSeq : "${approvalDetailView.appSeq}", 
				apvState : status,
				returnReason : returnReason,
			},
			success : function(response) {
				alert(response.approvalMessage);
				const $img = document.createElement("img");
				$img.src = "${path}/resources/img/"
						+ (response.resultCode == 300 ? "approval.png"
								: "rejection.png");
				$img.style.width = "30px";

				const apvLineBtn = document.querySelector("#apv1");
				const apvContainer = apvLineBtn.parentElement
				apvContainer.innerHTML = "";
				apvContainer.appendChild($img);
			},
			error : function(error) {
				// 실패 시 처리
				console.error("승인 실패");
			}
		});

		// 모달 창 숨기기
		document.getElementById("myModalApv").style.display = "none";
	}

	function reject() {
		
		var returnReason = document.getElementById("returnReason").value;

		// AJAX를 사용하여 서버에 반려 사유를 전송
		$.ajax({
			type : "POST",
			url : "${path}/updateApprovalStatus",
			data : {
				appSeq : "${approvalDetailView.appSeq}", 
				apvState : "반려",
				returnReason : returnReason
			},
			success : function(response) {
				console.log("반려 성공");
			},
			error : function(error) {
				console.error("반려 실패");
			}
		});

		// 모달 창 숨기기
		document.getElementById("rejectModal").style.display = "none";
	}
</script>


