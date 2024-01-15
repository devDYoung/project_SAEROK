<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="springform"
	uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<section>
	<div class="container px-5 my-5 px-5">
		<h2>ckeditor글쓰기</h2>
		<form name="form" id="form" role="form" method="post" action=""
			enctype="multipart/form-data">
			<input type="hidden" name="bno" id="bno" value="${bbs.bno}" />
			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control" name="title" id="title"
					placeholder="제목을 입력해 주세요" value="${bbs.title}">
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" id="ckeditor" name="content" rows="3"
					name="Vboard_content">${bbs.content}</textarea>
			</div>
		</form>
		<div>
			<button type="button" class="btn btn-sm btn-success" id="writeBtn">저장</button>
			<button type="button" class="bn btn-sm btn-primary"
				onclick="javascript:location.href='/bbs/list';">목록</button>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
