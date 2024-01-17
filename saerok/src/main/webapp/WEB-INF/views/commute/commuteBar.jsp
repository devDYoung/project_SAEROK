<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
	
                <div class="all-container app-dashboard-body-content off-canvas-content" data-off-canvas-content>
                <!-- 왼쪽 추가 메뉴 -->
                <div class="left-container">
                    <div id="home-left-work" class="div-padding div-margin">
                        <table id="home-work-tbl">

                            <tbody>
                                <tr>
                                    <td id="year" colspan="2" class="font-14">clock</td>
                                </tr>
                                <tr>
                                    <td colspan="2" id="clock" style="color:black;">clock</td>
                                </tr>
                                <tr>
                                    <td class="font-14 font-bold">업무상태</td>
                                    <td class="text-right font-14 color-red font-bold" id="work-status">출근전</td>
                                </tr>            
                                <tr>
                                    <td class="font-14 font-bold">출근시간</td>
                                    <td class="text-right font-14" id="inDtime">미등록</td>
                                </tr>
                                <tr>
                                    <td class="font-14 font-bold">퇴근시간</td>
                                    <td class="text-right font-14" id="outDtime">미등록</td>
                                </tr>
                                <tr>
                                    <td class="font-14 font-bold">주간 누적 근무시간</td>
                                    <td class="text-right font-14" id="totalwork-time">0h 0m 0s</td>
                                </tr>
                                <tr class="btn-tr">
                                    <td><button class="font-bold" id="startBtn">출근하기</button></td>
                                    <td class="text-right"><button class="font-bold" id="endBtn">퇴근하기</button></td>
                                </tr>
                            </tbody>
                        </table>
                    
                    </div>
                </div>
             </div>

<script>
window.addEventListener('load', function(){
	
    
    $.ajax({
 	   url : '${path }/commute/commute.do',
 	   method:'GET',
 	   contentType : "application/json; charset=utf-8",
 	   success(data){
 		   console.log(data);
 		   if(data){
 			   const {commuteNo,inDtime,outDtime,overtime,workingDay,status,lateYN,empNo,workingHours} = data;
 			   var starttime = new Date(inDtime);
 			   var endtime = new Date(outDtime);
 			   
 			   //하루 근무시간 계산
 			   const daytimes = workingHours; //퇴근시간 - 출근시간
 			   console.log(daytimes);
 			   
 			   const workStatus = document.querySelector("#work-status");
 			  workStatus.textContent = status;
 			   
 			   
 			   if(inDtime){
 				 var hours = (starttime.getHours()); 
                 var minutes = starttime.getMinutes();
                 var seconds = starttime.getSeconds();
                 var startWorkTime = `\${hours < 10 ? '0' + hours : hours}:\${minutes < 10 ? '0'+minutes : minutes}:\${seconds < 10 ? '0'+seconds : seconds}`;
                 // 출근시간 정보 출력
                 document.querySelector('#startwork-time').textContent = startWorkTime;
 			   }
 			   
 			   if(outDtime){
  				  var hours = (endtime.getHours()); 
                  var minutes = endtime.getMinutes();
                  var seconds = endtime.getSeconds();
                  var endWorkTime = `\${hours < 10 ? '0' + hours : hours}:\${minutes < 10 ? '0'+minutes : minutes}:\${seconds < 10 ? '0'+seconds : seconds}`;
                  // 퇴근시간 정보 출력
 				  document.querySelector('#endwork-time').textContent = endWorkTime;
 			   }
 			   
 			   if(daytimes > 0){
 				   //하루 근무시간 update
 				  updateWorkTime(daytimes);
 			   }
 		   }
 	   },
 	   error : console.log
    });
   
});



//출근 버튼 클릭 시
document.querySelector('#startBtn').addEventListener('click', function () {
	
	$.ajax({
	   url : '${path }/commute/workIn.do',
	   method : 'POST',
	   contentType : "application/json; charset=utf-8",
	   success(data){
			console.log(data);
	       if(data.successYn == "Y"){
	           alert("출근 성공입니다.");
	       }else if(data.successYn == '연차'){
	    	   alert("연차중입니다.");
	    	   return;
	       }
	       else{
	           alert("이미 출근하셨습니다.");
	           	return;
	       }
	   },
	   error : console.log
   });
});

//퇴근하기 버튼 누를시
document.querySelector('#endBtn').addEventListener('click', function () {
	
	$.ajax({
	   url : '${path }/commute/workOut.do',
	   method : 'POST',
	   contentType : "application/json; charset=utf-8",
	   success(data){
		   console.log(data);
		   
		   if(data.successYn == "Y"){
	           alert("퇴근 성공입니다.");
	       }else if(data.successYn == '출근전'){
	    	   alert("출근전입니다.");
	    	   return;
	       }else if(data.successYn == '연차'){
	    	   alert("연차중입니다.");
	    	   return;
	       }
	       else{
	           alert("이미 퇴근하셨습니다.");
	           return;
	       }
		},
	   error : console.log
   });
});

const updateWorkTime = (daytimes) =>{
	
    $.ajax({
        url: '${path }/commute/updateWorkTime.do',
        method: 'POST',
        data: {daytimes},
        success(data) {
          console.log(data);
          getStartAndEndDateOfWeek();
        },
        error: console.log
      });
	};

//이번주 누적시간 가져오기
function getStartAndEndDateOfWeek() {
	  const today = new Date();
	  const todayDay = today.getDay(); // 오늘 날짜의 요일 (0: 일요일, 1: 월요일, ..., 6: 토요일)

	  const startDate = new Date(today); // 해당 주의 시작일
	  startDate.setDate(startDate.getDate() - todayDay);

	  const endDate = new Date(today); // 해당 주의 종료일
	  endDate.setDate(endDate.getDate() + (6 - todayDay));

	  const start = startDate.getFullYear() + "." + (startDate.getMonth() + 1) + "." + startDate.getDate();
	  const end = endDate.getFullYear() + "." + (endDate.getMonth() + 1) + "." + endDate.getDate();
	  
	  $.ajax({
		  url : "${path }/commute/weekTotalTime.do",
		  data : {start, end},
		  contentType : "application/json; charset=utf-8",
		  success(data){
			  console.log(data);
			  const {totalMonthOverTime ,totalMonthTime, weekOverTime ,weekTotalTime} = data;
			  const totalWorkTime = document.querySelector("#totalwork-time");
			  
			  totalWorkTime.textContent = chageWorkTime(weekTotalTime + weekOverTime);
		  },
		  error : console.log
		  
	  });
}

function chageWorkTime(times){
	const time = times / 1000;
	const hours = Math.floor(time / 3600); // 시간 계산
	const minutes = Math.floor((time % 3600) / 60); // 분 계산
	const seconds = Math.floor(time % 60); // 초 계산
	
	return `\${hours}h \${minutes}m \${seconds}s`;	
}

</script>						
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	