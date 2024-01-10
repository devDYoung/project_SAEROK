<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="springform"
	uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="받은쪽지함" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>받은 쪽지함</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- 임시 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">

<style>
.container-fluid {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">받은 쪽지함</h1>
		</div>
		<hr class="my-4">

		<section class="d-flex justify-content-between mb-4">

			<form action="/note/write" method="write">
				<button type="submit" class="btn btn-success mr-3 float-right">쪽지
					쓰기</button>
			</form>
		</section>



		<section>
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th scope="col">쪽지번호</th>
						<th scope="col">보낸사람</th>
						<th scope="col">제목</th>
						<th scope="col">날짜</th>
						<th scope="col" class="text-center">관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="note" items="${receivedNotes}">
						<tr>
							<th scope="row">${note.noteNo}</th>
							<td>${note.sndEmpNo}</td>
							<td>${note.noteTitle}</td>
							<td>${note.regDtime}</td>
							<td class="text-right">
								<button onclick="deleteNote(${note.noteNo})"
									class="btn btn-danger btn-sm">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>



	</div>

	<script>
    function deleteNote(noteNo) {
        if(confirm("휴지통으로 옮기겠습니까?")) {
            fetch('/note/' + noteNo, {
                method: 'DELETE'
            })
            .then(response => {
                if(response.ok || response.redirected) {
                    alert('휴지통으로 이동하였습니다.');
                    window.location.href = '/note/';  
                } else {
                    alert('삭제 실패');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('삭제 중 문제가 발생했습니다.');
            });
        }
    }
</script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</body>
</html>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />