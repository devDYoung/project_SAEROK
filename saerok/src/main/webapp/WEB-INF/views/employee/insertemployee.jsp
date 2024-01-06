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

  .ato-headermsg {
    margin-left: 20px;
    display: flex;
    align-items: center;
  }

  .ato-insertimg {
    width: 460px;
    height: 700px;
  }
</style>
</head>
<body>
  <section class="insertato-section">
    <div class="container">
      <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
          <!-- Nested Row within Card Body -->
          <div class="row">
            <div class="col-lg-5">
              <img class="ato-insertimg" src="${path}/resources/img/atoinsert.jpg" alt="아토 logo">
            </div>
            <div class="col-lg-7">
              <div class="p-5">
                <div class="text-center">
                  <h1 class="h4 text-gray-900 mb-4">ATO 사원등록</h1>
                </div>
                <br>
                <form class="user">
                  <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                      <input type="text" class="form-control form-control-user" id="empNo"
                        placeholder="사원이름">
                    </div>
                    <div class="col-sm-6">
                      <input type="password" class="form-control form-control-user" id="empPw"
                        placeholder="비밀번호">
                    </div>
                  </div>
                  <div class="form-group">
                    <input type="email" class="form-control form-control-user" id="empEmail"
                      placeholder="Email Address">
                  </div>
                   <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="empPhone"
                      placeholder="전화번호">
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                      <input type="text" class="form-control form-control-user"
                        id=empDate placeholder="입사일">
                    </div>
                    <div class="col-sm-6">
                      <input type="text" class="form-control form-control-user"
                        id="issueAnnu" placeholder="발급연차">
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                      <input type="text" class="form-control form-control-user"
                        id=issueAnnu placeholder="부서">
                    </div>
                    <div class="col-sm-6">
                      <input type="text" class="form-control form-control-user"
                        id="empDate" placeholder="직급">
                    </div>
                  </div>
                 	<br><br>
                   <a href="" class="btn btn-primary btn-user btn-block">사원등록</a>
                   <br>
                    <a href="" class="btn btn-primary btn-user btn-block">취소</a>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
  </section>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
