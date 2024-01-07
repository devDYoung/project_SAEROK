<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/> 

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!--   <link rel="stylesheet" href="/resources/demos/style.css">
 -->  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
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
    height: 825px;
    float: left; /* 이미지를 왼쪽으로 정렬합니다. */
  }

  #profile-img {
    width: 80px;
    height: 60px;
    margin-top: 10px;
    margin-left: 10px; /* 이미지를 왼쪽으로 이동시키기 위해 수정 */
  }
  

    .dropdown-item {
        color: white; /* 흰색으로 변경 */
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
              <img class="ato-insertimg" src="${path}/resources/img/ato-cosmatic.jpg" alt="아토 logo">
            </div>
            <div class="col-lg-7">
              <div class="p-5">
                <div class="text-center">
                  <h1 class="h4 text-gray-900 mb-4">ATO 사원등록</h1>
                  <img id="profile-img" class="img-profile rounded-circle"
				src="${pageContext.request.contextPath }/resources/img/ato100px.png"></a>
                </div>
                <br>
                <form class="insertEmp" id="employeeForm" action="${path}/insertempEnd" method="post">
                  <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                      <input type="text" class="form-control form-control-user" name="empName"
                        placeholder="사원이름">
                    </div>
                    <div class="col-sm-6">
                      <input type="password" class="form-control form-control-user" name="empPw"
                        placeholder="비밀번호">
                    </div>
                  </div>
                  <div class="form-group">
                    <input type="email" class="form-control form-control-user" name="empEmail"
                      placeholder="Email Address">
                  </div>
                   <div class="form-group">
                    <input type="text" class="form-control form-control-user" name="empPhone"
                      placeholder="전화번호">
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                      <input type="text" class="form-control form-control-user"
                        name=empDate placeholder="입사일">
                    </div>
                    <div class="col-sm-6">
                      <input type="text" class="form-control form-control-user"
                        name="issueAnnu" placeholder="발급연차">
                    </div>
                  </div>
                   <div class="col-sm-6 mb-3 mb-sm-0">
			      <div class="col-sm-24">
				    <select name="deptCode" class="form-select form-select-sm rounded" aria-label="Small select example" style="height: 40px;">
				        <option selected>부서</option>
				        <option value="100">인사팀</option>
				        <option value="200">관리팀</option>
				        <option value="300">영업팀</option>
				        <option value="400">지점</option>
				    </select>
				 </div>
				 </div>
				 <br>
				 <div class="row">
				    <div class="col-12">
				        <p>직급</p>
				    </div>
				 	<div class="row">
					    <div class="col-6">
					        <div class="form-check form-check-inline">
					            <input class="form-check-input" type="radio" name="jobCode" value="10">
					            <label class="form-check-label" for="flexRadioDefault1">부장</label>
					        </div>
					    </div>
					    <div class="col-6">
					        <div class="form-check form-check-inline">
					            <input class="form-check-input" type="radio" name="jobCode" value="20" checked>
					            <label class="form-check-label" for="flexRadioDefault2">대리</label>
					        </div>
					    </div>
					    <div class="col-6">
					        <div class="form-check form-check-inline">
					            <input class="form-check-input" type="radio" name="jobCode" value="30">
					            <label class="form-check-label" for="flexRadioDefault3">사원</label>
					        </div>
					    </div>
					    <div class="col-6">
					        <div class="form-check form-check-inline">
					            <input class="form-check-input" type="radio" name="jobCode" value="40" checked>
					            <label class="form-check-label" for="flexRadioDefault4">지점장</label>
					        </div>
					    </div>
					</div>
					</div>
                 	<br><br>
                     <button type="submit" class="btn btn-primary btn-user btn-block" onclick="submitForm()">사원등록</button>
                   <br><br>
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
<!--   <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script> -->


  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

<script>
    function submitForm() {
        // Gather form data
        var empName = $("#empName").val();
        var empPw = $("#empPw").val();
        var empEmail = $("#empEmail").val();
        // Add more fields as needed

        // Construct URL with parameters
        var url = "${path}/insertempEnd?empName=" + encodeURIComponent(empName)
                  + "&empPw=" + encodeURIComponent(empPw)
                  + "&empEmail=" + encodeURIComponent(empEmail);
        // Add more parameters as needed

        // Redirect to the URL
        window.location.href = url;
    }
</script>



