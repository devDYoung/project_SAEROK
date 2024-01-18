<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지점 수정</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<!-- 임시 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

<style>
.container-fluid {
	font-family: 'Noto Sans KR', sans-serif;
}

</style>
</head>
<body>

	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">지점 수정</h1>
		</div>
		<hr class="my-4">
		<form
			action="${pageContext.request.contextPath}/branch/update/${branch.branchNo}"
			method="post">
			<div class="form-group">
				<label for="branchNo">지점번호</label> <input type="text"
					class="form-control" id="branchNo" name="branchNo"
					value="${branch.branchNo}" readonly>
			</div>
			<div class="form-group">
				<label for="branchName">지점명</label> <input type="text"
					class="form-control" id="branchName" name="branchName"
					value="${branch.branchName}" required>
			</div>
			<div class="form-group">
				<label for="branchRegion">지역</label> <input type="text"
					class="form-control" id="branchRegion" name="branchRegion"
					value="${branch.branchRegion}" required>
			</div>
			<div class="form-group">
				<label for="branchTel">전화번호</label> <input type="text"
					class="form-control" id="branchTel" name="branchTel"
					value="${branch.branchTel}" required>
			</div>
			<div class="form-group">
				<label for="branchDescription">설명</label>
				<textarea class="form-control" id="branchDescription"
					name="branchDescription" rows="3">${branch.branchDescription}</textarea>
			</div>

			<div class="form-group">
				<label for="empNo">지점장 선택</label> <select class="form-control"
					id="empNo" name="empNo" required>
					<option value="ATO_19"
						${branch.empNo == 'ATO_19' ? 'selected' : ''}>김남길
						(010-8969-7894)</option>
					<option value="ATO_20"
						${branch.empNo == 'ATO_20' ? 'selected' : ''}>박서준
						(010-8963-4254)</option>
					<option value="ATO_21"
						${branch.empNo == 'ATO_21' ? 'selected' : ''}>이종석
						(010-7766-3355)</option>
					<option value="ATO_22"
						${branch.empNo == 'ATO_22' ? 'selected' : ''}>김세정
						(010-8963-3698)</option>
					<option value="ATO_23"
						${branch.empNo == 'ATO_23' ? 'selected' : ''}>안유진
						(010-1212-3636)</option>
					<option value="ATO_24"
						${branch.empNo == 'ATO_24' ? 'selected' : ''}>김지수
						(010-1414-5656)</option>
				</select>

			</div>
			<button type="submit" class="btn btn-primary">수정</button>
			<a href="${pageContext.request.contextPath}/branch/"
				class="btn btn-secondary">취소</a>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script>
    document.addEventListener("DOMContentLoaded", function() {
        var form = document.querySelector("form");

        form.onsubmit = function() {
            if (!isAllFieldsFilled()) {
                alert("모든 필드를 입력해주세요.");
                return false;
            }
            return true;
        };

        function isAllFieldsFilled() {
            var inputs = form.querySelectorAll("input[required], select[required], textarea[required]");
            for (var i = 0; i < inputs.length; i++) {
                if (!inputs[i].value.trim()) {
                    return false;
                }
            }
            return true;
        }

    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />