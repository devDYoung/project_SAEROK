<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="CommuteList" name="" />
</jsp:include>
<section>
	<%-- <div class="home-content">
		<div style="display: flex;">
			<!-- 본문 왼쪽 -->
			<div class="home-content-div">
				<div id="home-left" class="div-padding div-margin">
					<div style="height: 50px;"></div>
					<!-- <div class="col-lg-5 col-md-12"> -->
						<div class="col-lg-5 col-md-12">
						<div class="card" style="padding: 0px 10px 15px 10px;">
							<div class="card-body">
								<div id="profileImg"
									style="position: absolute; right: 0; 
									height: 140px; width: 130px; margin-right: 15px; 
									background-image: url('/resources/upload/IMG_2281.JPG'); 
									background-size: cover;">
								</div>
								<div id="profileImg"
									style="position:absolute; right:0; height:140px; width:130px; 
                            		margin-right:15px;
                            		background-image:url(${ pageContext.servletContext.contextPath }/resources/assets/images/${ profileImg });
                            		background-size:cover;">
								</div>
								<!-- 이미지 경로 수정하기 -->
								<h4 class="card-title mb-3 font-weight-bold">근태관리</h4>
								<h4 id="todate" class="card-title mb-3 font-weight-bold"></h4>
								<p id="clock" style="font-size: 40px"></p>
								<div>
									<br>
									<div class="d-flex" style="font-size: 16px;">
										<p class="col-6" style="padding: 0px;">${loginEmployee.empName }
											${loginEmployee.jobName}</p>
										<p class="col-6 text-right" style="padding: 0px;"
											id="startTime"></p>
									</div>
									<div class="d-flex" style="font-size: 16px">
										<p class="col-6" style="padding: 0px;">${loginEmployee.deptName}</p>
										<p class="col-6 text-right" style="padding: 0px;" id="endTime"></p>
									</div>
									<div class="d-flex" style="font-size: 16px;">
										<p class="col-6" style="padding: 0px;">출근시간</p>
										<p class="col-6 text-right" style="padding: 0px;"
											id="startTime"></p>
									</div>
									<div class="d-flex" style="font-size: 16px">
										<p class="col-6" style="padding: 0px;">퇴근시간</p>
										<p class="col-6 text-right" style="padding: 0px;" id="endTime"></p>
									</div>
								</div>
								<form method="get" action="/changeStatus">
									<!-- 출퇴근 버튼 -->
									<div class="d-flex align-items-center">
										<button type="submit" id="startBtn"
											class="btn btn-rounded btn-outline-primary col-6"
											style="margin: 2px" value="1" name="status">출근하기</button>
										<button type="submit" id="endBtn"
											class="btn btn-rounded btn-outline-primary col-6"
											style="margin: 2px" value="2" name="status">퇴근하기</button>
									</div>

									<!-- 상태 설정버튼 -->
									<div class="d-flex align-items-center"
										style="margin-top: 15px;">
										<button type="button" id="selectStatus"
											class="btn btn-rounded btn-outline-primary col-12"
											style="margin: 2px 2px 0px 2px;">
											근무상태변경<i data-feather="chevron-down" class="feather-icon"></i>
										</button>
									</div>
									<div id="status" class="align-items-center"
										style="border: 1px solid rgb(95, 118, 232); border-radius: 10px; background-color: white;">
										<button type="submit"
											class="d-flex col-12 btn btn-outline-primary"
											style="border: none; border-top-left-radius: 9px; border-top-right-radius: 9px;"
											value="3" name="status">출근</button>
										<button type="submit"
											class="d-flex col-12 btn btn-outline-primary"
											style="border: none;" value="4" name="status">퇴근</button>
										<button type="submit"
											class="d-flex col-12 btn btn-outline-primary"
											style="border: none;" value="5" name="status">지각</button>
										<button type="submit"
											class="d-flex col-12 btn btn-outline-primary"
											style="border: none;" value="6" name="status">연차</button>
										<button type="submit"
											class="d-flex col-12 btn btn-outline-primary"
											style="border: none; border-bottom-left-radius: 9px; border-bottom-right-radius: 9px;"
											value="7" name="status">반차</button>
									</div>
									<input type="hidden" name="cNo" value="${c.commuteNo }">
									<input type="hidden" name="main" value="1">
								</form>
							</div>
						</div>
					</div>
				</div>
				</div>
				</div>
				</div>
				<script>
				$(function(){
					//출퇴근 버튼 설정
					var start = "${w.startTime}";
					var end = "${w.endTime}";
					console.log(start)
					console.log(end)
				  	//null이면 출근x, 퇴근x
					//null이 아니면 - 출근o, 퇴근x
					//			 - 출근o, 퇴근o
					if(start == ""){
						console.log("없음")
						
						$('#startBtn').attr('disabled', false);
					  	$('#endBtn').attr('disabled', false);
					  	
					  	$('#startTime').text("미등록")
						$('#endTime').text("미등록")
					}
				 	if(start != "" && end == ""){
				 		$('#startBtn').attr('disabled', true)	//출근버튼 비활성화
				 			
				 		$('#startTime').text(start)	//출근시간 표시
				 		$('#endTime').text("미등록")
				 	}
				 	else if(start != "" && end != ""){
				 		$('#startBtn').attr('disabled', true)	//출근버튼 비활성화
				 		$('#endBtn').attr('disabled', true)		//퇴근버튼 비활성화
				 			
				 		$('#startTime').text(start)	//출근시간 표시
				 		$('#endTime').text(end)		//퇴근시간 표시
				 	}
				 		
				 	//근무상태 선택버튼 css설정
				 	$("#status").css("z-index","1")
					$(".list-group").css("z-index","0")
					$(".card-title").css("z-index","0")
					
					$("#status").css("display","none")
					$("#status").css("position","absolute")
					
					$("#selectStatus").click(function(){
						if($("#status").css("display") == "none") {
							$("#status").show();
							
							var width = $("#selectStatus").css("width");
							
							$("#status").css("width", width)
						}
						
						else {
							$("#status").hide();
						}
					})
				})
				
			    //시간표시 기능
			    function printClock() {
			    
				    var clock = document.getElementById("clock");	// 출력할 장소 선택
				    var todate = document.getElementById("todate");
				    var currentDate = new Date();	// 현재시간
				    var day = new Array('일', '월', '화', '수', '목', '금', '토')
				    var today = day[currentDate.getDay()];
				    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() + " (" + today + ")"// 현재 날짜
				    var currentHours = addZeros(currentDate.getHours(),2); 
				    var currentMinute = addZeros(currentDate.getMinutes() ,2);
				    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
				    
				    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds; //날짜를 출력해 줌
				    todate.innerHTML = calendar; //날짜를 출력해 줌
				    
				    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
				    
				    
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
			    
			   function setCookie(name,value,expiredDate){
					var today = new Date();
					
					today.setDate(today.getDate() + expiredDate);
					
					document.cookie = name + '=' + escape(value) + '; expires=' + today.toGMTString();
				}
				
				function getCookie(name){
					
					var cookie = document.cookie;
					
					if ( cookie != "") {
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
 --%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
	.inner:hover{
		color: rgb(95,118,232);
		cursor: pointer;
	}
	
	#status{
		display:none;
		position:absolute;
	}
	
	.selects1:hover, .selects2:hover, .selects3:hover, .selects4:hover, .selects5:hover{
		background-color: rgba(95,118,232, 0.1);
	}
	
	.week, .selects1, .selects2, .selects3, .selects4, .selects5{
		display:none;
	}
	
</style>
	<h3>근태관리</h3>
	<div>
		<c:set var="today" value="<%= new java.util.Date() %>"/>
		<p style="font-size:14px"><fmt:formatDate value="${today}" type="date" pattern="yyyy-MM-dd (E)"/></p>
		<p id="clock" style="font-size:40px"></p>
		<div>
			<div class="d-flex" style="font-size: 12px">
				<p class="col-6" style="padding:0px;">출근시간</p>
				<c:choose>
					<c:when test="${empty c.inDtime }">
						<p class="col-6 text-right" style="padding:0px;">미등록</p>
					</c:when>
					<c:otherwise>
						<p class="col-6 text-right" style="padding:0px;">${c.inDtime}</p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="d-flex" style="font-size: 12px">
				<p class="col-6" style="padding:0px;">퇴근시간</p>
				<c:choose>
					<c:when test="${empty c.outDtime }">
						<p class="col-6 text-right" style="padding:0px;">미등록</p>
					</c:when>
					<c:otherwise>
						<p class="col-6 text-right" style="padding:0px;">${c.outDtime}</p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="d-flex" style="font-size: 12px">
				<p class="col-7" style="padding:0px;">주간 누적 근무시간</p><p class="col-5 text-right" style="padding:0px;">00h 00m 00s</p>
			</div>
		</div>
	</div>
	
	<br>
	<form method="get" action="changeStatus">
		<div class="d-flex align-items-center">
		<!-- 출근시간 없으면 출근가능, 퇴근 불가능 -->
		<!-- 출근 시간이 있으면, 출근 불가능, 퇴근 가능 -->
		<!-- 출근시간, 퇴근시간이 있으면, 출근 불가능, 퇴근 불가능 -->
		<!-- 버튼 속성 disable 주기 -->
		<c:choose>
			<c:when test="${empty c.inDtime }">
				<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status">출근하기</button>
				<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status" disabled>퇴근하기</button>
			</c:when>
			<c:when test="${not empty c.inDtime && empty c.outDtime}">
				<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status" disabled>출근하기</button>
				<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status">퇴근하기</button>
			</c:when>
			<c:otherwise>
				<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status" disabled>출근하기</button>
				<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status" disabled>퇴근하기</button>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="d-flex align-items-center">
			<button type="button" id="selectStatus" class="btn btn-rounded btn-outline-primary col-12" style="margin:2px 2px 0px 2px;">근무상태변경<i data-feather="chevron-down" class="feather-icon"></i></button>
		</div>
			<div id="status" class="align-items-center" style="border: 1px solid rgb(95,118,232); border-radius: 10px; background-color:white;">
			<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none; border-top-left-radius: 9px; border-top-right-radius: 9px;" value="3" name="status">출근</button>
			<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="4" name="status">퇴근</button>
			<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="5" name="status">지각</button>
			<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="6" name="status">연차</button>
			<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none; border-bottom-left-radius: 9px; border-bottom-right-radius: 9px;" value="7" name="status">반차</button>
		</div>
		<input type="hidden" name="cNo" value="${c.commuteNo }">
		<input type="hidden" name="main" value="0">
	</form>
	<br>
	<!-- 근태관리, 내 근태 현황, 내 연차 내역, 내 인사정보 -->
            
    <h6 class="card-title">근태관리</h6>
    <div class="list-group"> 
		<a href="/commuteCheck" class="list-group-item">내 근태 현황</a>
	    <a href="/annualList" class="list-group-item">내 연차 내역</a> 
	    <a href="/mypage" class="list-group-item">내 인사정보</a> 
    </div>
    
    <script>
		$(function(){
			$("#status").css("z-index","1")
			$(".list-group").css("z-index","0")
			$(".card-title").css("z-index","0")
			
			$("#selectStatus").click(function(){
				if($("#status").css("display") == "none") {
					$("#status").show();
					
					var width = $("#selectStatus").css("width");
					
					$("#status").css("width", width)
				}
				
				else {
					$("#status").hide();
				}
			})
			
		})
		
		function printClock() {
		    
		    var clock = document.getElementById("clock");	// 출력할 장소 선택
		    var currentDate = new Date();	// 현재시간
		    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
		    var currentHours = addZeros(currentDate.getHours(),2); 
		    var currentMinute = addZeros(currentDate.getMinutes() ,2);
		    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
		    
		    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds; //날짜를 출력해 줌
		    
		    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
		    
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
	</script>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />