<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="MainPage" name="ATO" />
</jsp:include>
<!-- Calendar & Reservation JavaScript -->
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    Axios CDN
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    Moment CDN
    <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    fullcalendar-scheduler CDN
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.9.0/main.min.js"></script>
    fullcalendar-scheduler 언어 CDN
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.9.0/locales-all.min.js"></script>-->
    
<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<style>
.ato-login-img {
	max-width: 70%;
	max-height: 70%;
	width: auto;
}
</style>
<script>
    	const empNo = "${ loginEmployee.empNo }";
    </script>

<section>
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-7 col-md-12">
						<div class="card">
							<div class="card-body">
								<!-- <h4 class="card-title mb-3 font-weight-bold">전체게시판</h4> -->
								<ul class="nav nav-tabs mb-3">
									<li class="nav-item"><a href="#board" data-toggle="tab"
										aria-expanded="false" class="nav-link"> <i
											class="mdi mdi-home-variant d-lg-none d-block mr-1"></i> <span
											class="d-none d-lg-block  font-weight-bold">공지사항</span>
									</a></li>
									<li class="nav-item"><a href="#calendar" data-toggle="tab"
										aria-expanded="true" class="nav-link active"> <i
											class="mdi mdi-account-circle d-lg-none d-block mr-1"></i> <span
											class="d-none d-lg-block  font-weight-bold">일정</span>
									</a></li>
									<li class="nav-item"><a href="#sales" data-toggle="tab"
										aria-expanded="true" class="nav-link"> <i
											class="mdi mdi-account-circle d-lg-none d-block mr-1"></i> <span
											class="d-none d-lg-block  font-weight-bold">매출현황</span>
									</a></li>
								</ul>

								<div class="tab-content">
									<div class="tab-pane" id="board">
										<p>공지사항 리스트 출력하기</p>

									</div>
									<div class="tab-pane active" id="calendar">
										<!-- calendar app -->
										달력 넣기
									</div>
									<div class="tab-pane" id="sales">
										<!-- sales list -->
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-0 font-weight-bold text-primary">월별매출</h6>
											</div>
											<div class="card-body">
												<div class="chart-area">
													<canvas id="monthlySalesChart"></canvas>
												</div>
												<hr>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-5 col-md-12">
						<div class="card" style="padding: 0px 10px 15px 10px;">
							<div class="ato-login-img" name="oriFileName">
								<img
									src="${path}/resources/upload/profile/${loginEmployee.destFileName}"
									alt="ato-profile-img" class="ato-login-img">
							</div>
							<br>
							<%-- <div id="profileImg"
                           style="position:absolute; right:0; height:140px; width:130px; 
                                  margin-right:15px;
                                  background-image:url(${ pageContext.servletContext.contextPath }/resources/assets/images/${ profileImg });
                                  background-size:cover;">
                        </div>  --%>
							<!-- 이미지 경로 수정하기 -->
							<h4 id="todate" class="card-title mb-3 font-weight-bold"></h4>
							<p id="clock" style="font-size: 40px"></p>
							<div>
								<br>
								<div class="d-flex" style="font-size: 16px;">
									<p class="col-6" style="padding: 0px;">${loginEmployee.empName }
										${loginEmployee.jobName}</p>
									<p class="col-6 text-right" style="padding: 0px;" id="inDtime"></p>
								</div>
								<div class="d-flex" style="font-size: 16px">
									<p class="col-6" style="padding: 0px;">${loginEmployee.deptName}</p>
									<p class="col-6 text-right" style="padding: 0px;" id="outDtime"></p>
								</div>
								<div class="d-flex" style="font-size: 16px;">
									<p class="col-6" style="padding: 0px;">출근시간</p>
									<p class="col-6 text-right" style="padding: 0px;" id="inDtime"></p>
								</div>
								<div class="d-flex" style="font-size: 16px">
									<p class="col-6" style="padding: 0px;">퇴근시간</p>
									<p class="col-6 text-right" style="padding: 0px;" id="outDtime"></p>
								</div>
								<div class="d-flex" style="font-size: 16px">
									<p class="col-6" style="padding: 0px;">근무상태</p>
									<p class="col-6 text-right" style="padding: 0px;" id="outDtime"></p>
								</div>
							</div>
							<%-- <form method="get" action="${path}/changeStatus.do"> --%>
								<!-- 출퇴근 버튼 -->
								<div class="d-flex align-items-center">
									<input type="button" id="startBtn"
										class="btn btn-rounded btn-outline-primary col-6"
										style="margin: 2px" value="출근하기" name="status">
									<input type="button" id="endBtn"
										class="btn btn-rounded btn-outline-primary col-6"
										style="margin: 2px" value="퇴근하기" name="status">
								</div>
								<input type="hidden" name="commuteNo" value="${c.commuteNo}">
								<input type="hidden" name="index" value="1">
							<%-- </form> --%>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-lg-7">
					<div class="card">
						<div class="card-body">
							<div class="d-flex align-items-start">
								<h4 class="card-title mb-0 font-weight-bold">결재함</h4>
							</div>
							<div class="col-md-12 col-sm-12" style="margin-top: 50px;">
								<ul class="list-group" id="boardList">
									<div class="index_section2">
										<form action="">
											<div id="e-pay-status">
												<span> <a href="${path}"
													style="color: rgb(59, 211, 39);">결재대기</a>
													<div>건</div>
												</span> <span> <a href="${path}"
													style="color: rgb(59, 211, 39);">결재중</a>
													<div>건</div>
												</span> <span> <a href="${path}"
													style="color: rgb(59, 211, 39);">결재완료</a>
													<div>건</div>
												</span>
											</div>
										</form>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-lg-5">
					<div class="card">
						<div class="card-body">
							<div id="carouselExampleIndicators" class="carousel slide"
								data-ride="carousel">
								<h4 class="card-title mb-0 font-weight-bold">이번 주 신제품</h4>
								<br>
								<div class="carousel-inner" role="listbox">
									<div class="carousel-item">
										<img class="img-fluid"
											src="${paht }/resources/upload/IMG_2341.jpg"
											alt="First slide">
									</div>
									<div class="carousel-item">
										<img class="img-fluid"
											src="${path }/resources/upload/IMG_2342.jpg"
											alt="Second slide">
									</div>
									<div class="carousel-item active">
										<img class="img-fluid"
											src="${path }/resources/upload/IMG_2343.jpg"
											alt="Third slide">
									</div>
								</div>
								<a class="carousel-control-prev"
									href="#carouselExampleIndicators" role="button"
									data-slide="prev"> <span class="carousel-control-prev-icon"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleIndicators" role="button"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>

						</div>

					</div>
				</div>
			</div>
			<div class="pNotice-wrapper"
				style="position: fixed; right: 0; bottom: 0; padding: 0px 20px 15px 0px; width: auto; height: auto;">

			</div>
		</div>
	</div>

	</div>



	<script>
      $(function() {
         //출퇴근 버튼 설정
         var start = "${c.inDtime}";
         var end = "${c.outDtime}";
         //null이면 출근x, 퇴근x
         //null이 아니면 - 출근o, 퇴근x
         //          - 출근o, 퇴근o
         if (start == "") {
            $('#startBtn').attr('disabled', false);
            $('#endBtn').attr('disabled', false);

            $('#inDtime').text("미등록")
            $('#outDtime').text("미등록")
         }
         if (start != "" && end == "") {
            $('#startBtn').attr('disabled', true) //출근버튼 비활성화

            $('#inDtime').text(start) //출근시간 표시
            $('#outDtime').text("미등록")
         } else if (start != "" && end != "") {
            $('#startBtn').attr('disabled', true) //출근버튼 비활성화
            $('#endBtn').attr('disabled', true) //퇴근버튼 비활성화

            $('#inDtime').text(start) //출근시간 표시
            $('#outDtime').text(end) //퇴근시간 표시
         }
         
         // loginEmployee가 null이 아닌 경우에만 속성에 액세스하기 전에 null 체크
         var empNo = "${loginEmployee != null ? loginEmployee.empNo : 'null'}";
         console.log("직원 번호: " + empNo);
         
         $("#startBtn").click(function(e){
        	 $.ajax({
 				type: "POST", 
 				url: "${path}/workIn.do",
 				data: { 
 					status: "10" // 10: 출근, 20: 퇴근
 				},
 				success : function(result){
 					if(result.successYn == "Y"){
 						//todo 버튼 활성화
 						alert("출근성공");
 					}else{
 						alert("출근 실패");
 					}
 				},
 				error : function(){
 					alert("근무정보를 조회할 수 없습니다. \n관리자에게 문의하세요.");
 				}
 			});
         });
     });


      //시간표시 기능
      function printClock() {

         var clock = document.getElementById("clock"); // 출력할 장소 선택
         var todate = document.getElementById("todate");
         var currentDate = new Date(); // 현재시간
         var day = new Array('일', '월', '화', '수', '목', '금', '토')
         var today = day[currentDate.getDay()];
         var calendar = currentDate.getFullYear() + "-"
               + (currentDate.getMonth() + 1) + "-"
               + currentDate.getDate() + " (" + today + ")"// 현재 날짜
         var currentHours = addZeros(currentDate.getHours(), 2);
         var currentMinute = addZeros(currentDate.getMinutes(), 2);
         var currentSeconds = addZeros(currentDate.getSeconds(), 2);

         clock.innerHTML = currentHours + ":" + currentMinute + ":"
               + currentSeconds; //날짜를 출력해 줌
         todate.innerHTML = calendar; //날짜를 출력해 줌

         setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출

         function addZeros(num, digit) { // 자릿수 맞춰주기
            var zero = '';
            num = num.toString();
            if (num.length < digit) {
               for (i = 0; i < digit - num.length; i++) {
                  zero += '0';
               }
            }
            return zero + num;
         }
      }

      function setCookie(name, value, expiredDate) {
         var today = new Date();

         today.setDate(today.getDate() + expiredDate);

         document.cookie = name + '=' + escape(value) + '; expires='
               + today.toGMTString();
      }

      function getCookie(name) {

         var cookie = document.cookie;

         if (cookie != "") {
            var cookie_arr = cookie.split(";");
            for ( var index in cookie_array) {
               var cookie_name = cookie_arr[index].split("=");
               if (cookie_name[0] == "mycookie") {
                  return cookie_name[1];
               }

            }

         }
      }
         
   </script>


	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>
	<script src="js/demo/chart-bar-demo.js"></script>

</section>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<script>
const monthlySalesData = {
    labels: [],
    sales: []
};

<c:forEach items="${monthlySalesTotals}" var="record">
    monthlySalesData.labels.push("${record.SALESMONTH}");
    monthlySalesData.sales.push(${record.TOTALSALES}); 
</c:forEach>

const ctx = document.getElementById('monthlySalesChart').getContext('2d');
const gradient = ctx.createLinearGradient(0, 0, 0, 400);
gradient.addColorStop(0, 'rgba(0, 123, 255, 0.5)');
gradient.addColorStop(1, 'rgba(0, 123, 255, 0)');

const monthlySalesChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: monthlySalesData.labels,
        datasets: [{
            label: '월간 매출액',
            backgroundColor: gradient,
            borderColor: 'rgba(0, 123, 255, 1)',
            data: monthlySalesData.sales,
            fill: true,
            pointBackgroundColor: 'white',
            pointBorderColor: 'rgba(0, 123, 255, 1)',
            pointHoverBackgroundColor: 'rgba(0, 123, 255, 1)',
            pointHoverBorderColor: 'white'
        }]
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: '월간 매출 추이',
            fontColor: 'black',
            fontSize: 20
        },
        scales: {
            yAxes: [{
                gridLines: {
                    drawBorder: true,
                    color: 'lightgrey'
                },
                ticks: {
                    beginAtZero: true,
                    fontColor: 'black'
                }
            }],
            xAxes: [{
                gridLines: {
                    drawBorder: true,
                    color: 'lightgrey'
                },
                ticks: {
                    fontColor: 'black'
                }
            }]
        },
        legend: {
            labels: {
                fontColor: 'black'
            }
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        tooltips: {
            mode: 'index',
            intersect: false
        }
    }
});
</script>

<br>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />