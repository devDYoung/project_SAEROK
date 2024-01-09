<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%-- <c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/> --%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value="전자결재리스트"/>
</jsp:include>

<section id=content>
	<h2>전자결재 리스트</h2>
	<div>
		건수
	</div>
    <table border="1">
       
            <tr>
                <th>번호</th>
                <th>문서 번호/종류</th>
                <th>문서 이름</th>
                <th>사원 번호</th>
                <th>수정자 ID</th>
                <th>담당자 번호</th>
                <th>참조/참조 대상</th>
                <th>결재 상태</th>
            </tr>
            <%-- <c:forEach var="approval" items="${approval}">  
                <tr>
                    <td>test </td>
                    <td>test  ${approval.apvNo}</td>
                    <td>test  ${approval.apvName}</td>
                    <td>test  ${approval.apvCheck}</td>
                    <td>test  ${approval.regTime}</td>
                    <td>test  ${approval.modId}</td>
                 <td>test  ${approval.modTime}</td>
                    <td>test  ${approval.empNo}</td>
                    <td>test  ${approval.apvEmpNo}</td>
                    <td>test ${approval.refCc}</td> 
                </tr>
           </c:forEach> --%>
    </table> 
     <div id="pageBar">
        ${pageBar }
     </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>