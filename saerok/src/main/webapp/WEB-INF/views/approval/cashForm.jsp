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


<form class="documentForm" name="cashForm" action="${path}"
	method="POST" onsubmit="return check_onclick()">
	<div id="documentForm " class="documentForm"
		style="margin: 50px 50px 50px 50px; width: min-content;">
		<div class="v_doc_Form">
			<table border="1" style="display: inline-block; text-align: center;">
				<tr>
					<td rowspan="2" colspan="4"
						style="color: black; font-size: 40px; font-weight: 600;">지출결의서</td>
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
					<td colspan="1">마감일</td>
					<td colspan="1"><input type="date" name="erDeadline"
						id="erDeadline" style="font-size: 20px;"></td>
					<td colspan="1" style="height: 70px; width: 80px;">지출금액</td>
					<td colspan="2"><input type="text" name="allAmount"
						id="allAmount"></td>
					
				</tr>
				<tr>
					<td style="color: black; height: 50px; width: 80px;">제 목</td>
					<td colspan="8"><textarea class="form-control" name="erTitle"
							id="erTitle"
							style="width: 100%; height: 50px; resize: none; overflow: hidden;"></textarea></td>
				</tr>
				<tr>
					<td rowspan="10" style="width: 80px; height: 100%">내 역</td>
					<td colspan="2">적 요</td>
					<td colspan="2">금 액</td>
					<td colspan="2">비 고</td>
					<td colspan="1" style="font-size: 17px">
						<button type="button" class="btn btn-primary"
                    onclick="fn_addForm();">추가</button>
                    <button type="button" class="btn btn-odanger"
                    onclick="fn_deleteForm();">삭제</button>
					</td>
				</tr>
				<tr id="putContents">
					<td colspan="2"><input type="text" name="erDetail"
						id="erDetail"></td>
					<td colspan="2"><input type="text" name="erAmount"
						id="erAmount"></td>
					<td colspan="3"><input type="text" name="erReference"
						id="erReference" value="-"></td>
				</tr>
				<tr>
					<td colspan="8"
						style="text-align: center; height: 100px; border-bottom: none;">위
						금액을 청구하오니 결재바랍니다.</td>
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
			<input type="hidden" name="basicForm" value="폼의서">
			<button type="submit" class="btn btn-primary"  onclick="">등록</button>
			<!-- ${path}/approval/updateLeave -->
			<input type="text" style="border: none; width: 10px;" disabled>
			<button type="reset" class="btn btn-primary" onclick="">취소</button>
		</div>
	</div>
</form>
<!-- 필수 입력 스크립트 -->
<script>
	function check_onclick() {
		var loaWriteForm = document.loaWriteForm;

		if (loaWriteForm.loaContent.value == "" || loaWriteForm.loaTitle.value == "") {
			Swal.fire({
				icon : 'error',
				title : '상세내용 또는 \n제목란이 비어있습니다.',
				text : '확인 후 등록하세요!'
			})
			return false;
		} else if (loaWriteForm.proposerText.value == "") {
			Swal.fire({
				icon : 'error',
				title : '결재서명 후 \n결재를 진행해주세요.'
			})
			return false;
		} else {
			return true;
		}
	}
</script>

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
	    $("#allAmount").bind('keyup keydown',function(){
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
$(document).ready(function() {
    // 추가 버튼 클릭 시 동작
    $(".btn-primary").on("click", function() {
        // 새로운 행 생성
        var newRow = '<tr>'
            + '<td colspan="2"><input type="text" name="erDetail" id="erDetail"></td>'
            + '<td colspan="2"><input type="text" name="erAmount" id="erAmount"></td>'
            + '<td colspan="2"><input type="text" name="erReference" id="erReference" value="-"></td>'
            + '</tr>';

        // 생성된 행을 마지막 행으로 추가
        $("#putContents").after(newRow);
    });

    // 삭제 버튼 클릭 시 동작
    $(".btn-outline-danger").on("click", function() {
        // 마지막 행 제거
        $("#putContents").prev().remove();
    });
});
</script>






