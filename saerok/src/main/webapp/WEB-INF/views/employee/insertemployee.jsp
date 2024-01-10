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
    float: left; /* 이미지를 왼쪽으로 정렬 */
  }

  #profile-img {
    width: 100px;
    height: 90px;
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
              <img class="ato-insertimg" src="${path}/resources/img/ato-img4.jpg" alt="아토 logo">
            </div>
            <div class="col-lg-7">
              <div class="p-5">
                <form class="insertEmp" id="employeeForm" action="${path}/insertempEnd" method="post"
                enctype="multipart/form-data">
                 <div class="text-center">
                  <h1 class="h4 text-gray-900 mb-4" style="text-align: center;">ATO 사원등록</h1>
                  <label for="fileUploaderLabel" class="custom-file-upload">
				        <img id="profile-img" class="img-profile rounded-circle" src="${pageContext.request.contextPath }/resources/upload/profile/ato-imgg.png"></a>
				    </label>
				    <input type="file" id="oriFileName" name="oriFileName" style="display: none;">
                </div> 
                <br>
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
                   <button type="reset" class="btn btn-primary btn-user btn-block" onclick="resetForm()">등록취소</button>
                    <!-- <a href="" class="btn btn-primary btn-user btn-block">취소</a> -->
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


</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
	//사원등록 
    function submitForm() {
        var empName = $("#empName").val();
        var empPw = $("#empPw").val();
        var empEmail = $("#empEmail").val();

        var url = "${path}/insertempEnd?empName=" + encodeURIComponent(empName)
                  + "&empPw=" + encodeURIComponent(empPw)
                  + "&empEmail=" + encodeURIComponent(empEmail);
        window.location.href = url;
    }

	
    //파일업로드 script
    // 파일 선택 input의 변경 이벤트를 감지하여 동작하는 함수
    document.getElementById('oriFileName').addEventListener('change', handleFileSelect);

    // 파일 선택하면 동작함
    function handleFileSelect(event) {
        var selectedFile = event.target.files[0];

        if (selectedFile) {
            // 파일 미리보기
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('profile-img').src = e.target.result;
            };
            reader.readAsDataURL(selectedFile);

            // 여기에서 선택한 파일 정보를 FormData에 추가
            var formData = new FormData();
            formData.append("oriFileName", selectedFile);

        }
    }

    // 파일 선택 input 클릭하도록 설정
    document.querySelector('.custom-file-upload').addEventListener('click', function () {
        document.getElementById('oriFileName').click();
    });
	
    //취소버튼 누르면 index 화면으로 이동
    const resetForm = () => {
        location.replace("${path}/index");
    }
	
	

    
    
    
    
</script>




<div id=pageBar>${pageBar}</div> 


