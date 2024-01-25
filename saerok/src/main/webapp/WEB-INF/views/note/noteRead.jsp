<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html>
<head>
<title>쪽지 상세 내용</title>
    <!-- 필요한 스타일 및 스크립트 추가 -->
</head>
<body>
    <div class="container-fluid">
        <div
         class="d-sm-flex align-items-center justify-content-center mb-4 mt-3">
            <h1 class="h3 mb-0 text-gray-800">쪽지 상세 내용</h1>
        </div>
        <hr class="my-4">

        <!-- 쪽지 상세 내용 표시 -->
        <div>
            <p>쪽지 번호: ${noteRead.noteNo}</p>
            <p>보낸 사람: ${noteRead.sndEmpNo}</p>
            <p>내용: ${noteRead.noteContent}</p>
            <p>날짜: <c:out value="${noteRead.regDtime}" />
         </p>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />