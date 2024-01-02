<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<section>
	<div>
		<div class="home-content">
			<div style="display: flex;">
				<!-- 본문 왼쪽 -->
				<div class="home-content-div">
					<div id="home-left" class="div-padding div-margin">
						<div style="height: 50px;"></div>
						<table id="home-my-tbl">
							<tbody>
								<tr>
									<td id="year" colspan="2" class="font-14">시계</td>
								</tr>
								<tr>
									<td colspan="2"><c:if
											test="">
											<img src="<!-- 프로필 -->" alt="" class="img">
										</c:if> <c:if test="">
											<img src="" alt="" class="img">
										</c:if></td>
								</tr>
								<tr>
									<td colspan="2">사원이름 직급</td>
								</tr>
								<tr>
									<td colspan="2">부서명</td>
								</tr>

								<tr>
									<td colspan="2" id="clock" style="color: black;">시계</td>
								</tr>
								<tr>
									<td class="font-14 font-bold">업무상태</td>
									<td class="text-right font-14 color-red font-bold"
										id="work-state">출근전</td>
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
									<td class="text-right"><button class="font-bold"
											id="btn-endwork">퇴근하기</button></td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
				<script>
window.addEventListener('load', function(){
	
	const csrfHeader = "${_csrf.headerName}";
   const csrfToken = "${_csrf.token}";
   const headers = {};
   headers[csrfHeader] = csrfToken;
   
   $.ajax({
	   url : '${pageContext.request.contextPath}/workingManagement/checkWorkTime.do',
	   contentType : "application/json; charset=utf-8",
	   success(data){
		   console.log(data);
		   if(data){
			   const {commuteno,inDtime,outDtime,lateYN,status,overtime,empNo} = data;
			   var starttime = new Date(inDtime);
			   var endtime = new Date(outDtime);
			   
			   //하루 근무시간 계산
			   const daytimes = endtime - starttime;
			   console.log(daytimes);
			   
			   const workStatus = document.querySelector("#work-status");
			   workStworkStatusate.textContent = status;
			   
			   
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
				  updateDayWorkTime(daytimes);
			   }
		   }
	   },
	   error : console.log
   });
  
});



//출근 버튼 클릭 시
document.querySelector('#btn-startwork').addEventListener('click', function () {
	
	const csrfHeader = "${_csrf.headerName}";
   const csrfToken = "${_csrf.token}";
   const headers = {};
   headers[csrfHeader] = csrfToken;
	
	$.ajax({
	   url : '${pageContext.request.contextPath}/commute/insertStartWork.do',
	   method : 'POST',
	   headers,
	   contentType : "application/json; charset=utf-8",
	   success(data){
			console.log(data);
	       if(data.state === "성공"){
	           alert("출근이 성공적으로 등록됬습니다.");
	           location.reload();
	       }else if(data.state === '출장'){
	    	   alert("출장시에는 자동적으로 출근처리가 완료됩니다.");
	    	  return;
	       }else if(data.state === '연차'){
	    	   alert("연차중입니다.");
	    	   return;
	       }
	       else{
	           alert("이미 출근하셨습니다.");
	       }
	   },
	   error : console.log
  });
});

//퇴근하기 버튼 누를시
document.querySelector('#btn-endwork').addEventListener('click', function () {
	
	const csrfHeader = "${_csrf.headerName}";
   const csrfToken = "${_csrf.token}";
   const headers = {};
   headers[csrfHeader] = csrfToken;
	
	$.ajax({
	   url : '${pageContext.request.contextPath}/commute/updateEndWork.do',
	   method : 'POST',
	   headers,
	   contentType : "application/json; charset=utf-8",
	   success(data){
		   console.log(data);
		   
		   if(data.status === "성공"){
	           alert("퇴근이 성공적으로 등록됬습니다.");
	           location.reload();
	       }else if(data.status === '출근전'){
	    	   alert("출근전입니다.");
	    	   return;
	       }else if(data.status === '출장'){
	    	   alert("출장시에는 자동적으로 퇴근처리가 완료됩니다.");
	    	  return;
	       }else if(data.status === '연차'){
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

const updateDayWorkTime = (daytimes) =>{
	
	const csrfHeader = "${_csrf.headerName}";
   const csrfToken = "${_csrf.token}";
   const headers = {};
   headers[csrfHeader] = csrfToken;
	
   $.ajax({
       url: '${pageContext.request.contextPath}/commute/updateDayWorkTime.do',
       method: 'POST',
       headers,
       data: {daytimes},
       success(data) {
         console.log(data);
       },
       error: console.log
     });
	};
</script>
				<!-- 본문 가운데 -->
				<div>
					<div id="home-center" class="div-padding div-margin">
					</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />