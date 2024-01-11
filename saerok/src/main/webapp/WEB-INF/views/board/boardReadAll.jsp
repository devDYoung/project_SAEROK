<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="springform"
	uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="전체게시판" />
</jsp:include>

<body id="page-top">
	<!-- 전체 게시판 페이지 내용 작성 -->
	<c:forEach var="note" items="${noteRead}">
		<p>${note.sender}님으로부터:${note.subject}</p>
	</c:forEach>
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">받은 쪽지함</h1>
		<p class="mb-4">쪽지를 확인하세요 !!</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Message</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>선택</th>
								<th>번호</th>
								<th>제목</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" name="yourCheckboxName"
									value="yourCheckboxValue"></td>
								<td>1</td>
								<td>오늘 점심 베이글 드시러 가시죠.</td>
								<td>2024/01/04</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="yourCheckboxName"
									value="yourCheckboxValue"></td>
								<td>2</td>
								<td>새해 복 많이 받으세요.</td>
								<td>2024/01/04</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="yourCheckboxName"
									value="yourCheckboxValue"></td>
								<td>3</td>
								<td>오늘 회식 오시나요~?</td>
								<td>2024/01/05</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="yourCheckboxName"
									value="yourCheckboxValue"></td>
								<td>4</td>
								<td>어느덧 2024년, 저희 회사를. . .</td>
								<td>2024/01/05</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="yourCheckboxName"
									value="yourCheckboxValue"></td>
								<td>5</td>
								<td>쪽지 구현 얼른해주세요.</td>
								<td>2024/01/05</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>






	<jsp:include page="/WEB-INF/views/common/footer.jsp" />