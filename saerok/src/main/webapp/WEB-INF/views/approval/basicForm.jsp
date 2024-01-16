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
	<jsp:param value="일반" name="title" />
</jsp:include>

<script src="./jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="./bootstrapt/css/bootstrap.min.css" />
<link rel="stylesheet" href="./bootstrapt/css/bootstrap.css" />
<script src="./bootstrapt/js/bootstrap.min.js"></script>


<button id="testBtn" class="btn">모달 test</button>

<!-- Modal-->
<div class="modal fade" id="testModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					
				</button>
				<h3 class="modal-title" id="exampleModalLabel">결재선</h3>
			</div>
			<div class="modal-body">조직도 트리구조</div>
			<div class="modal-footer">
				<a class="btn" id="modalY" href="#">예</a>
				<button class="btn" type="button" data-dismiss="modal">아니요</button>
			</div>
		</div>
	</div>
</div>




<script>
	$('#testBtn').click(function(e) {
		e.preventDefault();
		$('#testModal').modal("show");
	});
</script>

<strong>&nbsp; 문서 종류 : </strong>
<select id="selectDoc" name="selectDoc" class="form-select"
	onchange="loadDocumentForm(this.value)">
	<option value="D1">기본 신청서</option>
	<option value="D2">휴가신청서</option>
	<option value="D3">지출 결의서</option>
</select>

<button type="button" onclick="openModal()">결재</button>





<form class="documentForm" name="basicForm" action="${path}"
	method="POST" onsubmit="return check_onclick()">
	<div id="documentForm " class="documentForm"
		style="margin: 50px 50px 50px 50px; width: min-content;">
		<div class="v_doc_Form">
			<table border="1" style="display: inline-block; text-align: center;">
				<tr>
					<td rowspan="2" colspan="4"
						style="color: black; font-size: 40px; font-weight: 600;">품의서</td>
					<td rowspan="2"
						style="color: black; padding-top: 20px; font-size: 20px;">결 재</td>
					<td style="color: black; font-size: 15px;">최초승인자</td>
					<td style="color: black; font-size: 15px;">중간승인자</td>
					<td style="color: black; font-size: 15px;">최종승인자</td>
				</tr>
				<tr>
					<td style="">
						<!-- 이미지화 시켜서 인쇄할 수 있는 방법 찾아보기 --> <input type="text" value=""
						id="firstApprover" name="firstApprover" readonly="readonly"
						class="nameView"> <input type="button" value="검색"
						class="searchMember" id="firstBtn" name="firstApprover">
					</td>
					<td><input type="text" value="" id="interimName"
						name="interimApprover" readonly="readonly" class="nameView">
						<input type="button" value="검색" class="searchMember"
						id="secondBtn" name="interimApprover"></td>
					<td><input type="text" value="" id="finalApprover"
						name="finalApprover" readonly="readonly" class="nameView">
						<input type="button" value="검색" class="searchMember" id="thirdBtn"
						name="finalApprover"></td>
				</tr>
				<tr>
					<td colspan="2" style="color: black; height: 70px;">
						<button class="send-open" type="button">+ 수신참조자 +</button>
					</td>
					<td colspan="6" style="height: 70px;"><textArea readonly
							name="referList" id="referList" class="form-control"
							style="border: none; font-size: 19px; width: 600px; height: 60px; text-align: center; resize: none;"></textArea>
					</td>
				</tr>
				<tr>
					<td
						style="color: black; height: 70px; width: 80px; font-size: 15px;">성
						명</td>
					<td><input type="text" name="writerName"
						style="border: none; background: transparent; text-align: center;"
						value="${ loginEmployee.empName }" readonly></td>
					<td style="color: black; width: 80px; font-size: 15px;">부 서</td>
					<td><input type="text"
						style="border: none; background: transparent; text-align: center;"
						value="${ loginEmployee.deptName }" readonly></td>
					<td style="color: black; width: 80px; font-size: 15px;">직 급</td>
					<td colspan="3"><input type="text"
						style="border: none; background: transparent;"
						value="${ loginEmployee.jobName }" readonly></td>
				</tr>
				<tr>
					<td style="color: black; height: 50px; width: 80px;">제 목</td>
					<td colspan="8"><textarea class="form-control" name="loaTitle"
							id="loaTitle"
							style="width: 100%; height: 50px; resize: none; overflow: hidden;"></textarea></td>
				</tr>
				<tr>
					<td colspan="8" style="height: 90px;">
						<!-- <label class="inputFileButton" for="inputFile">
                       첨부파일 업로드
                         </label>
               
                         <input type="file" id="inputFile" style="display: none;" /> -->

						<input type="file" id="inputFile" name="appLoaFileUpload" />
					</td>
				</tr>
				<tr>
					<td style="color: black; height: 70px; width: 300px;">상세내용</td>


					<td colspan="8"><textarea class="form-control"
							name="loaContent" id="loaContent" cols="151px" rows="11px"
							style="width: 100%; height: 300px; border: none; resize: none; overflow: hidden; font-size: 25px;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="8"
						style="text-align: center; height: 100px; border-bottom: none;">위와
						같은 품의사유로, 검토 후 결재 바랍니다.</td>
				</tr>
				<tr style="color: black; border-top: none; border-bottom: none;">
					<td colspan="8" style="text-align: center; height: 100px;">
						2024년 &nbsp; 2 월 &nbsp; 2일 &nbsp;</td>
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
			<input type="hidden" name="vasicForm" value="폼의서">
			<button type="submit" class="btn btn-primary" onclick="">등록</button>
			<!-- ${path}/approval/updateLeave -->
			<input type="text" style="border: none; width: 10px;" disabled>
			<button type="reset" class="btn btn-primary" onclick="">취소</button>
		</div>
	</div>
</form>

<script>
	//AJAX양식선택
	function loadDocumentForm(docType) {
		$.ajax({
			url : '/approval/docForms',
			type : 'GET',
			data : {
				docType : docType
			},
			success : function(response) {
				// 여기서 반환된 내용을 처리하거나 표시합니다.
				$(".documentForm").html(response);
			},
			error : function(error) {
				console.error('문서 양식을 불러오는 중 오류가 발생했습니다.');
			}
		});
	}
</script>

<!-- 필수 입력 스크립트 -->


<!-- 서명 클릭 스크립트  -->
<script>
	$(document).ready(function() {
		$("#proposer").one("click", function() {
			var proposerValue = $("input[name='writerName']").val();
			$("#proposerText").append(proposerValue);
		});
	});

	// 금액 자동 포맷팅 스크립트 함수명에 fn_ 추가
	$(document).ready(function() {
		$("#allAmount").bind('keyup keydown', function() {
			fn_inputNumberFormat(this);
		});

		function fn_inputNumberFormat(obj) {
			obj.value = fn_comma(fn_uncomma(obj.value));
		}

		function fn_comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}

		function fn_uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, '');
		}

		function fn_getNumberOnly(str) {
			var len = str.length;
			var sReturn = "";

			for (var i = 0; i < len; i++) {
				if ((str.charAt(i) >= "0") && (str.charAt(i) <= "9")) {
					sReturn += str.charAt(i);
				}
			}
			return sReturn;
		}
	});
</script>

<!-- 비고 +/- -->
<script>
	function fn_addForm() {
		alert("추가함");
		var newRow = '<tr>'
				+ '<td colspan="2"><input type="text" name="erDetail" id="erDetail"></td>'
				+ '<td colspan="2"><input type="text" name="erAmount" id="erAmount"></td>'
				+ '<td colspan="3"><input type="text" name="erReference" id="erReference" value="-"></td>'
				+ '<td><button type="button" class="deleteButton" onclick="fn_deleteForm(this);">삭제</button></td>'
				+ '</tr>';

		// 생성된 행을 마지막 행으로 추가
		$("#putContents").after(newRow);
	}

	function fn_deleteForm(button) {
		// 현재 버튼이 속한 행을 선택하고 삭제합니다.
		$(button).closest('tr').remove();
	}
</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />