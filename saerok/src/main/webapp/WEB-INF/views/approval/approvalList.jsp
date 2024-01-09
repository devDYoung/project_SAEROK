<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value="전자결재리스트"/>
</jsp:include>


	<h2>전자결재 리스트</h2>
<table border="1">
    <thead>
        <tr>
            <th>문서 구분</th>
            <th>문서 이름</th>
            <th>사원 번호</th>
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
                <td><c:out value="${a.apvState}"/></td>
                
                <!-- 나머지 필드 -->
            </tr>
        </c:forEach>
    </tbody>
</table>
     <div id="pageBar">
        ${pageBar }
     </div> 




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>