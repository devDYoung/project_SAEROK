<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<div class="all-container app-dashboard-body-content off-canvas-content"
	data-off-canvas-content>
	<div class="page-wrapper">
		<div class="home-content">
			<!-- <div style="display: flex;"> -->
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
								<td colspan="2"><c:if test="${!empty loginEmployee}">
										<img
											src="${path}/resources/upload/profile/${loginEmployee.destFileName}"
											alt="" class="img">
									</c:if></td>
							</tr>
							<tr>
								<td colspan="2">${loginEmployee.empName}
									${loginEmployee.jobName}</td>
							</tr>
							<tr>
								<td colspan="2">${loginEmployee.deptName}</td>
							</tr>

							<tr>
								<td colspan="2" id="clock" style="color: black;">clock</td>
							</tr>
							<tr>
								<td class="font-14 font-bold">업무상태</td>
								<td class="text-right font-14 color-red font-bold"
									id="work-status">출근전</td>
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
								<td><button class="font-bold" id="startBtn">출근</button></td>
								<td class="text-right"><button class="font-bold"
										id="endBtn">퇴근</button></td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>

	<script>
	window.addEventListener('load', function(){

	    getStartAndEndDateOfWeek();

	    $.ajax({
	        url : '${path }/commute/commute.do',
	        method:'GET',
	        success: handleCommuteData,
	        error: handleAjaxError
	    });
	    // 출근 버튼 클릭 시
	    document.querySelector('#startBtn').addEventListener('click', handleStartBtnClick);

	    // 퇴근 버튼 클릭 시
	    document.querySelector('#endBtn').addEventListener('click', handleEndBtnClick);
	});
	
	function handleCommuteData(data) {
	    console.log(data);
	    if (data && data[0] !== null && typeof data[0] === 'object') {
	        const { commuteNo, inDtime, outDtime, status } = data[0];
	        const starttime = new Date(inDtime);
	        const endtime = new Date(outDtime);

	        const workStatus = document.querySelector("#work-status");
	        workStatus.textContent = status;

	        displayTime("#startwork-time", inDtime);
	        displayTime("#endwork-time", outDtime);
	    }
	}
	   // 출근 버튼 클릭 시의 처리
	function handleStartBtnClick() {
	    $.ajax({
	        url: '${path }/commute/workIn.do',
	        method: 'POST',
	        success: function (data) {
	            console.log(data);
	            if (data.status === "출근") {
	                alert("출근 성공입니다.");
	                location.reload();
	            } else if (data.status === '출장') {
	                alert("출장시에는 출근처리됩니다.");
	                return;
	            } else if (data.status === '연차') {
	                alert("연차중입니다.");
	                return;
	            } else {
	                alert("이미 출근하셨습니다.");
	                return;
	            }
	        },
	        error: console.log
	    });
	}
	// 퇴근 버튼 클릭 시의 처리
	function handleEndBtnClick() {
	    $.ajax({
	        url: '${path}/commute/workOut.do',
	        method: 'POST',
	        success: function (data) {
	            console.log(data);

	            if (data.status === "퇴근") {
	                alert("퇴근 성공입니다.");
	                location.reload();
	            } else if (data.status === '이미 퇴근') {
	                alert("이미 퇴근하셨습니다.");
	                return;
	            } else if (data.status === '출근 기록이 없음') {
	                alert("출근 기록이 없습니다.");
	                return;
	            }
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	            console.error("AJAX Error: ", textStatus, ", ", errorThrown);
	        }
	    });
	}
	function formatTime(time) {
	    const hours = time.getHours().toString().padStart(2, '0');
	    const minutes = time.getMinutes().toString().padStart(2, '0');
	    const seconds = time.getSeconds().toString().padStart(2, '0');
	    return `${hours}:${minutes}:${seconds}`;
	}

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

	// 이번주 누적시간 가져오기
	function getStartAndEndDateOfWeek() {
	    const today = new Date();
	    const todayDay = today.getDay();

	    const startDate = new Date(today);
	    startDate.setDate(startDate.getDate() - todayDay + (todayDay === 0 ? -6 : 1));

	    const endDate = new Date(today);
	    endDate.setDate(endDate.getDate() + (6 - todayDay + (todayDay === 0 ? 0 : 1)));

	    const start = startDate.getFullYear() + "." + (startDate.getMonth() + 1) + "." + startDate.getDate();
	    const end = endDate.getFullYear() + "." + (endDate.getMonth() + 1) + "." + endDate.getDate();

	    $.ajax({
	        url: "${path}/commute/weekTotalTime.do",
	        data: { start, end },
	        success: function (data) {
	            console.log("Success", data);
	            const { totalMonthOverTime, totalMonthTime, weekOverTime, weekTotalTime } = data;
	            const mainTotalWorkTime = document.querySelector("#main-totalwork-time");
	            const mainWeekOverTime = document.querySelector("#main-week-over-time");
	            const mainWorkTime = document.querySelector("#main-work-time");
	            const monthWorkTime = document.querySelector("#main-month-work-time");
	            const monthOverTime = document.querySelector("#main-month-over-time");

	            let times = 144000000 - (weekTotalTime + weekOverTime);
	            mainTotalWorkTime.textContent = changeWorkTime(weekTotalTime + weekOverTime);
	            mainWeekOverTime.textContent = changeWorkTime(weekOverTime);
	            if (times < 0) {
	                mainWorkTime.textContent = changeWorkTime(0);
	            } else {
	                mainWorkTime.textContent = changeWorkTime(times);
	            }
	            monthWorkTime.textContent = changeWorkTime(totalMonthTime + totalMonthOverTime);
	            monthOverTime.textContent = changeWorkTime(totalMonthOverTime);
	        },
	        error: function (xhr, status, error) {
	            console.error("Error:", error);
	            console.error("Status:", status);
	            console.error("Response:", xhr.responseText);
	            // 에러 정보 출력
	        }
	    });
	}

function changeWorkTime(times){
	const time = times / 1000;
	const hours = Math.floor(time / 3600); // 시간 계산
	const minutes = Math.floor((time % 3600) / 60); // 분 계산
	const seconds = Math.floor(time % 60); // 초 계산
	
	return `\${hours}h \${minutes}m \${seconds}s`;	
}




</script>
	