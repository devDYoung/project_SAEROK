<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginEmployee"
   value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value="전자결재리스트"/>
</jsp:include>

<section id=content>
	<h2>전자결재 </h2>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>