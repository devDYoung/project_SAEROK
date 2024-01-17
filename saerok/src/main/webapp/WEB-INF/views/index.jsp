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
<link rel="stylesheet" href="${path }/resources/css/emp.css">
<!-- Bootstrap core JavaScript-->
<script src="${path }/resources/vendor/jquery/jquery.min.js"></script>
<script
   src="${path }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
<div class="app-dashboard-body-content off-canvas-content"
      data-off-canvas-content>
      <!-- 상단 타이틀 -->
      <div class="home-topbar topbar-div">
         <!-- <div></div> -->
      </div>
      <!-- 본문시작 -->
      <div class="page-wrapper">
                  <div class="home-content">
                     <div style="display: flex;">
                        <!-- 본문 왼쪽 -->
                        <div class="home-content-div">
                           <div id="home-left" class="div-padding div-margin">
                        <div style="height: 50px;"></div>
                              <table id="home-my-tbl">
                                 <tbody>
                                           <tr>
                                                <td id="year" colspan="2" class="font-14">clock</td>
                                            </tr>
                                    <tr>
                                       <td colspan="2">
                                          <c:if test="${!empty sessionScope.loginMember.attachment}">
                                             <img src="${pageContext.request.contextPath}/resources/upload/emp/${sessionScope.loginMember.attachment.renameFilename}" alt="" class="img">
                                          </c:if>
                                          <c:if test="${empty sessionScope.loginMember.attachment}">
                                             <img src="${pageContext.request.contextPath}/resources/images/default.png" alt="" class="img">
                                          </c:if>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">${sessionScope.loginMember.name} ${sessionScope.loginMember.jobTitle}</td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">${sessionScope.loginMember.deptTitle}</td>
                                    </tr>
                                     
                                            <tr>
                                                <td colspan="2" id="clock" style="color:black;">clock</td>
                                            </tr>
                                    <tr>
                                                <td class="font-14 font-bold">업무상태</td>
                                                <td class="text-right font-14 color-red font-bold" id="work-state">출근전</td>
                                            </tr>    
                                            <tr>
                                                <td class="font-14 font-bold">출근시간</td>
                                                <td class="text-right font-14" id="startwork-time">미등록</td>
                                            </tr>
                                            <tr>
                                                <td class="font-14 font-bold">퇴근시간</td>
                                                <td class="text-right font-14" id="endwork-time">미등록</td>
                                            </tr>
                                            <tr class="btn-tr">
                                                <td><button class="font-bold" id="btn-startwork">출근하기</button></td>
                                                <td class="text-right"><button class="font-bold" id="btn-endwork">퇴근하기</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                
                                </div>
                        </div>
   <%-- <div class="app-dashboard-body-content off-canvas-content"
      data-off-canvas-content>
      <!-- 상단 타이틀 -->
      <div class="home-topbar topbar-div">
         <!-- <div></div> -->
      </div>
      <!-- 본문시작 -->
      <div>
         <div class="home-content">
            <div style="display: flex;">
               <!-- 본문 왼쪽 -->
               <div class="home-content-div">
                  <div id="home-left" class="div-padding div-margin">
                     <div style="height: 50px;"></div>
                     <div class="ato-login-img" name="oriFileName">
                        <img
                           src="${path}/resources/upload/profile/${loginEmployee.destFileName}"
                           alt="ato-profile-img" class="ato-login-img">
                     </div>
                     <br>
                     <!-- 이미지 경로 수정하기 -->
                     <h4 id="todate" class="card-title mb-3 font-weight-bold"></h4>
                     <p id="clock" style="font-size: 40px"></p>
                     <div>
                        <br>
                        <div class="d-flex" style="font-size: 16px;">
                           <p class="col-6" style="padding: 0px;">${loginEmployee.empName }
                              ${loginEmployee.jobName}</p>
                           <!-- <p class="col-6 text-right" style="padding: 0px;" id="inDtime"></p> -->
                        </div>
                        <div class="d-flex" style="font-size: 16px">
                           <p class="col-6" style="padding: 0px;">${loginEmployee.deptName}</p>
                           <!-- <p class="col-6 text-right" style="padding: 0px;" id="outDtime"></p> -->
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
                           <p class="col-6 text-right" style="padding: 0px;"
                              id="work-status"></p>
                        </div>
                     </div>
                     <!-- 출퇴근 버튼 -->
                     <div class="d-flex align-items-center">
                        <input type="button" id="startBtn"
                           class="btn btn-rounded btn-outline-primary col-6"
                           style="margin: 2px" value="출근하기" name="work-status" /> <input
                           type="button" id="endBtn"
                           class="btn btn-rounded btn-outline-primary col-6"
                           style="margin: 2px" value="퇴근하기" name="work-status" />
                     </div>
                     <input type="hidden" name="commuteNo" value="${c.commuteNo}">
                     <input type="hidden" name="index" value="1">
                  </div>
               </div>
            </div>
         </div> --%>
         <!-- </div>
               </div> -->
         <!-- 본문 가운데 -->
         <div>
            <div id="home-center" class="div-padding div-margin">
               <div id="board-div" class="home-div">
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
                     <li class="nav-item"><a href="#approval" data-toggle="tab"
                        aria-expanded="true" class="nav-link"> <i
                           class="mdi mdi-account-circle d-lg-none d-block mr-1"></i> <span
                           class="d-none d-lg-block  font-weight-bold">결재</span>
                     </a></li>
                  </ul>
                  <div class="tab-content">
                     <div class="tab-pane" id="board">
                        <p>공지사항</p>
                     </div>
                     <div class="tab-pane active" id="calendar">
                     <!--  <div class="col-xl-6 col-lg-6"> -->
           <!--  <div class="card shadow mb-4 border-left-info"> -->
                <!-- Card Header - Dropdown -->
                <!--  <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">중요일정</h6>
                </div>  -->
                <!-- Card Body -->
              <!--   <div class="card-body"> -->
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <tbody>
                            <c:if test="">
                              <c:forEach var="i" begin="0" end="4">
                                 <c:if test="">
                                  <tr>
                                      <td colspan="2">
                                         <a href="">
                                            
                                         </a>
                                      </td>
                                  </tr>
                               </c:if>
                              </c:forEach>
                           </c:if>
                           <c:if test="">
                               <tr>
                                   <td colspan="2">중요한 일정이 없습니다.</td>
                               </tr>
                           </c:if>
                        </tbody>
                    </table>
     <!--  </div> --> 
          <!--   </div> -->
                     </div>
                     <div class="tab-pane" id="approval">결재</div>
                  </div>

               </div>
            </div>
            
            <div id="home-center" class="div-padding div-margin">
               <div class="card-header py-2">
                  <h6 class="m-0 font-weight-bold text-primary">월별매출</h6>
               </div>
               <div class="chart-area">
                  <canvas id="monthlySalesChart"></canvas>
               </div>
            </div>
         </div>
      </div>

      <!-- 본문 오른쪽 -->
      <div>
         <div id="home-right-div" class="div-padding div-margin">
            <%-- <h5 style="padding: 20px">이번주 신제품</h5>

            <div id="carouselExampleIndicators" class="carousel slide"
               data-ride="carousel">
               <div class="carousel-inner" role="listbox">
                  <div class="carousel-item">
                     <img class="img-fluid"
                        src="${paht }/resources/upload/IMG_2341.jpg" alt="First slide">
                  </div>
                  <div class="carousel-item">
                     <img class="img-fluid"
                        src="${path }/resources/upload/IMG_2342.jpg" alt="Second slide">
                  </div>
                  <div class="carousel-item active">
                     <img class="img-fluid"
                        src="${path }/resources/upload/IMG_2343.jpg" alt="Third slide">
                  </div>
               </div>
               <a class="carousel-control-prev" href="#carouselExampleIndicators"
                  role="button" data-slide="prev"> <span
                  class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                  class="sr-only">Previous</span>
               </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
                  role="button" data-slide="next"> <span
                  class="carousel-control-next-icon" aria-hidden="true"></span> <span
                  class="sr-only">Next</span>
               </a>
            </div> --%>
            
         </div>
      </div>
   </div>

   <!-- 본문 오른쪽 -->

   <div class="notification-list">
      <div class="left-noti"></div>
      <div class="right-noti"></div>
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
         //console.log("직원 번호: " + empNo);
         
         //출근 버튼 클릭시

         $("#startBtn").click(function(e){
            $.ajax({
             type: "POST", 
             url: "${path}/commute/workIn.do",
             data: { 
                status: "10" // 10: 출근
             },
             success : function(result){
                console.log(result);
                if(result.successYn == "Y"){
                   //todo 버튼 활성화
                   alert("출근 성공 \n출근 시간: " + result.indtime);
                   
                   const indtime=new Date(result.indtime);
                   
                   document.querySelector("#inDtime").innerText=
                      indtime.getHours()+":"+
                      (indtime.getMinutes()<10?"0"+indtime.getMinutes():indtime.getMinutes());
                      
                   
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
      
      
      // 퇴근버튼 클릭시
      $("#endBtn").click(function(e){
           $.ajax({
               type: "POST", 
               url: "${path}/commute/workOut.do",
               data: { 
                   status: "20" // 20: 퇴근
               },
               success : function(result){
                  console.log(result);
                   if(result.successYn == "Y"){
                       // 퇴근 성공
                       alert("퇴근 성공\n퇴근 시간: " + result.outdtime);
           
                       const outdtime=new Date(result.outdtime);
                       
                       document.querySelector("#outDtime").innerText=
                      outdtime.getHours()+":"+
                      (outdtime.getMinutes()<10?"0"+outdtime.getMinutes():outdtime.getMinutes());
                       
                       
                   } else {
                       alert("퇴근 실패");
                   }
                   
                  
               },
               error : function(){
                   alert("근무정보를 조회할 수 없습니다. \n관리자에게 문의하세요.");
               }
           });
       });
      


      //시간표시 기능
      
         window.onload = function() {
          printClock();
      }   
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
   <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

   <!-- Custom scripts for all pages-->
   <script src="/js/sb-admin-2.min.js"></script>

   <!-- Page level plugins -->
   <script src="/vendor/chart.js/Chart.min.js"></script>

   <!-- Page level custom scripts -->
   <script src="/js/demo/chart-area-demo.js"></script>
   <script src="/js/demo/chart-pie-demo.js"></script>
   <script src="/js/demo/chart-bar-demo.js"></script>

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
<%-- <script src="${pageContext.request.contextPath}/resources/js/emp.js"></script> --%>
<br>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
