<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="springform"
	uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- CKEditor JS 파일 포함 -->
<script src="${path}/resources/ckeditor/ckeditor.js"></script>

<!-- CKEditor 초기화 스크립트 -->
<script>
	window.onload = function() {
		CKEDITOR.replace("bordContent", {
			filebrowserUploadUrl : '${path}/board/imageUpload.do',
			height : 500,
			width : 1000
		});
	};

	// 폼 제출 전 컨텐츠 업데이트 함수
	function updateContent() {
		CKEDITOR.instances.bordContent.updateElement();

		// 폼 제출 전에 필요한 경우 추가 로직이나 유효성 검사를 수행
		document.getElementById("form").submit();
	}
</script>

<html>
<head>
<title>게시글 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<section>
		<div class="container px-5 my-5 px-5">
			<h2>게시글 작성</h2>
			<form name="form" id="form" role="form" method="post" action="/board/save"
				enctype="multipart/form-data">
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text"
						class="form-control" name="boardTitle" id="boardTitle"
						placeholder="제목을 입력해 주세요" value="${bbs.title}">
				</div>
				<textarea class="form-control" name="bordContent" id="bordContent"></textarea>
				<div>
					<!-- 저장 버튼 -->
					<button type="button" class="btn btn-sm btn-success" id="writeBtn"
						onclick="updateContent()">저장</button>
					<!-- 목록 버튼 -->
					<button type="button" class="btn btn-sm btn-primary"
						onclick="window.location.href='/board/All';">목록</button>
				</div>
			</form>
		</div>
	</section>
</body>
</html>
