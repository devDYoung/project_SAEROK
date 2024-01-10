<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value="전자결재리스트"/>
</jsp:include>

<div id="contentContainer">
    <select id="tagId" >
        <option value="">양식을 선택하세요</option>
        <option value="D1">일반 신청서</option>
        <option value="D2">휴가 신청서</option>
        <option value="D3">지출 결의서</option>
    </select>
    <!-- 버튼 추가 -->
    <button onclick="handleButtonClick()">버튼 클릭</button>
</div>

<table border="1">
    <thead>
        <tr>
            <th>문서 구분</th>
            <th>제목</th>
            <th>사원 이름</th>
            <th>수정자 ID</th>
            <th>담당자 번호</th>
            <th>참조/참조 대상</th>
            <th>결재 상태</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="a" items="${approval}">
            <tr>
                <td><c:out value="${a.apvDocNo}"/></td>
                <td><c:out value="${a.apvName}"/></td>
                <td><c:out value="$"/></td>
                <td><c:out value="$"/></td>
        
                <!-- 나머지 필드 -->
            </tr>
        </c:forEach>
    </tbody>
</table>
     <div id="pageBar">
        ${pageBar }
     </div> 
   
   
   
<script>
    function handleButtonClick() {
        // 선택된 양식의 값을 가져오기
        var selectedUpdate = document.getElementById("tagId").value;

        // 선택된 양식에 따라 다른 동작 수행
        switch (selectedUpdate) {
            case "D1":
                alert("일반 신청서를 처리합니다.");
                break;
            case "D2":
                alert("휴가 신청서를 처리합니다.");
                break;
            case "D3":
                alert("지출 결의서를 처리합니다.");
                break;
            default:
                alert("양식을 선택하세요.");
                break;
        }
    }
</script>
     




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>