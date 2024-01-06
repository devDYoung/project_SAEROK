<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/> 

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
  .insertato-section {
    margin-top: 1px;
  }

  .insertato-section i {
    margin-right: 10px; 
    font-size: 24px;
  }
  .ato-headermsg{
  	margin-left: 20px;
  	display: flex;
    align-items: center;
  }

  
</style>
</head>
<body>
  <section class="insertato-section">
    <div class="ato-headermsg">
      <i class="fas fa-gift"></i>
      <h4>아토 사원등록</h4>
    </div>
    
    
    
    
    
    
  </section>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
