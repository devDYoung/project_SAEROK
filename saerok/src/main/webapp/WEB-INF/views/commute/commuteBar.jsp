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
	<div class="home-content">
		<div style="display: flex;">
			<!-- 본문 왼쪽 -->
			<div class="home-content-div">
				<div id="home-left" class="div-padding div-margin">
					<div style="height: 50px;"></div>
					<!-- <div class="col-lg-5 col-md-12"> -->
						<div class="card" style="padding: 0px 15px 10px;">
							<div class="card-body">
<%-- 								<div id="profileImg"
									style="position:absolute; right:0; height:140px; width:130px; 
                            margin-right:15px;
                            background-image:url(${ pageContext.servletContext.contextPath }/resources/assets/images/${ profileImg });
                            background-size:cover;
                            ">
								</div> --%>
								<h4 class="card-title mb-3 font-weight-bold">출퇴근</h4>
								<h4 id="todate" class="card-title mb-3 font-weight-bold"></h4>
								<p id="clock" style="font-size: 40px"></p>
								<div>
									<br>
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
								<form method="get" action="${path}/changeWorkStatus">
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
											style="border: none;" value="5" name="status">외근</button>
										<button type="submit"
											class="d-flex col-12 btn btn-outline-primary"
											style="border: none;" value="6" name="status">출장</button>
										<button type="submit"
											class="d-flex col-12 btn btn-outline-primary"
											style="border: none; border-bottom-left-radius: 9px; border-bottom-right-radius: 9px;"
											value="7" name="status">반차</button>
									</div>
									<input type="hidden" name="wNo" value="$"> <input
										type="hidden" name="main" value="1">
								</form>
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


</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />