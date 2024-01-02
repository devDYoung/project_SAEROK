<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="CommuteList" name=""/> 
</jsp:include>
     <link href="${pageContext.request.contextPath }/resources/css/app.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/css/foundation.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath }/resources/css/emp.css" rel="stylesheet" class="commute"/>
    <script src="https://kit.fontawesome.com/cbe4aa3844.js" crossorigin="anonymous"></script>
	<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<section>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />