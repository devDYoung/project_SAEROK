<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
<form class="documentForm" name="basicForm"
	action="${path }/approval/insertAppLetter.do" method="POST"
	enctype="multipart/form-data">
	<input type="hidden" name="loginEmp" value="${loginEmployee.empNo }">
	<div id="documentForm " class="documentForm"
		style="margin: 50px 50px 50px 50px; width: min-content;">
		<div class="basicForm">
			<table border="1" style="display: inline-block; text-align: center;">
				 <tr>
                    <td rowspan="3" colspan="4" style="width: 300px; height: 140px; font-size: 40px; font-weight: 600;">품 의 서</td>
                    <td rowspan="3" style="width: 20px; padding-top: 30px; font-size: 25px;">결 재</td>
                    <c:forEach var="apvLine" items="${approvalDetailView.apvWriter.stream().sorted(e->e.getWriterList()).toList() }">
                    <td style="height: 25px; width: 100px; font-size:17px">
                    	${apvLine.apvEmpName }
                    </td>
                    </c:forEach>
                </tr>
				<tr>
					<td><input type="button" value="결재"/></td>
					<td><input type="button" value="결재"/></td>
					<td><input type="button" value="결재"/></td>
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
						value="${ loginEmployee.empName }" readonly></td>
					<td style="color: black; width: 80px; font-size: 15px;">부 서</td>
					<td><input type="text"Na
						style="border: none; background: transparent; text-align: center;"
						value="${ loginEmployee.deptName }" readonly></td>
					<td style="color: black; width: 80px; font-size: 15px;">직 급</td>
					<td colspan="3"><input type="text"
						style="border: none; background: transparent;"
						value="${ loginEmployee.jobName }" readonly></td>
				</tr>
				<tr>
					<td style="color: black; height: 50px; width: 80px;">제 목</td>
					<td colspan="8"><input class="form-control" value="${approvalDetailView.letterTitle }"
							name="letterTitle" id="loaTitle"
							style=" width: 100%; height: 50px; resize: none; overflow: hidden; font-size: 20px;"/></td>
				</tr>
				<tr>
					<td colspan="8" style="height: 50px;"><label
						class="custom-file-link" for="fileDownloadLink">
							${approvalDetailView.oriFileName} </label> <input type="text"
						class="custom-file-input" name="upFile" style="display: none;"
						id="fileDownloadLink" value="${approvalDetailView.oriFileName}"
						readonly /></td>
				</tr>
				<tr>
					<td style="color: black; height: 70px; width: 300px;">상세내용</td>


					<td colspan="8"><input class="form-control"
							name="letterDetail" id="loaContent" cols="151px" rows="11px" value="${approvalDetailView.letterDetail }"
							style="width: 100%; height: 300px; border: none; resize: none; overflow: hidden; font-size: 20px;"/>
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
			<input type="hidden" name="basicForm" value="품의서">
			<button type="submit" class="btn btn-primary" onclick="">확인</button>
			<input type="text" style="border: none; width: 10px;" disabled>
			<button type="reset" class="btn btn-primary" onclick="">취소</button>
		</div>
	</div>
</form>

<script>
    function showApprovalName(writerList) {
        // 각 writerList에 대응하는 승인자 이름을 가져오는 로직을 작성
        var approvalName = getApprovalName(writerList);
        
        // 가져온 이름을 어떻게 표시할지 처리 (예: 알림창)
        alert(approvalName);
    }

    function getApprovalName(writerList) {
        // writerList 값에 따라 승인자 이름을 반환하는 로직
        switch(writerList) {
            case 1:
                return "${approvalDetailView.apvWriter[0].apvEmpName}";
            case 2:
                return "${approvalDetailView.apvWriter[1].apvEmpName}";
            case 3:
                return "${approvalDetailView.apvWriter[2].apvEmpName}";
            default:
                return "Unknown";
        }
    }
</script>
