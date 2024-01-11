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
	<jsp:param value="CommuteSideBar" name="" />
</jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<section>
	<h3>근태관리</h3>
	<div>
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<p style="font-size: 14px">
			<fmt:formatDate value="${today}" type="date" pattern="yyyy-MM-dd (E)" />
		</p>
		<p id="clock" style="font-size: 40px"></p>
		<div>
			<div class="d-flex" style="font-size: 12px">
				<p class="col-6" style="padding: 0px;">출근시간</p>
				<c:choose>
					<c:when test="${empty c.inDtime }">
						<p class="col-6 text-right" style="padding: 0px;">미등록</p>
					</c:when>
					<c:otherwise>
						<p class="col-6 text-right" style="padding: 0px;">${c.inDtime}</p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="d-flex" style="font-size: 12px">
				<p class="col-6" style="padding: 0px;">퇴근시간</p>
				<c:choose>
					<c:when test="${empty c.outDtime }">
						<p class="col-6 text-right" style="padding: 0px;">미등록</p>
					</c:when>
					<c:otherwise>
						<p class="col-6 text-right" style="padding: 0px;">${c.outDtime}</p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="d-flex" style="font-size: 12px">
				<p class="col-7" style="padding: 0px;">주간 누적 근무시간</p>
				<p class="col-5 text-right" style="padding: 0px;">00h 00m 00s</p>
			</div>
		</div>
	</div>

	<br>
	<%-- <form> --%>
		<div class="d-flex align-items-center">
			<!-- 출근시간 없으면 출근가능, 퇴근 불가능 -->
			<!-- 출근 시간이 있으면, 출근 불가능, 퇴근 가능 -->
			<!-- 출근시간, 퇴근시간이 있으면, 출근 불가능, 퇴근 불가능 -->
			<c:choose>
				<c:when test="${empty c.inDtime }">
					<input type="button" id="startBtn"
										class="btn btn-rounded btn-outline-primary col-6"
										style="margin: 2px" value="출근하기" name="status">
									<input type="button" id="endBtn"
										class="btn btn-rounded btn-outline-primary col-6"
										style="margin: 2px" value="퇴근하기" name="status">
				</c:when>
				<c:when test="${not empty c.inDtime && empty c.outDtime}">
					<input type="button" id="startBtn"
										class="btn btn-rounded btn-outline-primary col-6"
										style="margin: 2px" value="출근하기" name="status">
									<input type="button" id="endBtn"
										class="btn btn-rounded btn-outline-primary col-6"
										style="margin: 2px" value="퇴근하기" name="status">
				</c:when>
				<c:otherwise>
					<input type="button" id="startBtn"
										class="btn btn-rounded btn-outline-primary col-6"
										style="margin: 2px" value="출근하기" name="status">
									<input type="button" id="endBtn"
										class="btn btn-rounded btn-outline-primary col-6"
										style="margin: 2px" value="퇴근하기" name="status">
				</c:otherwise>
			</c:choose>
		</div>
		<div id="status" class="align-items-center"
			style="border: 1px solid rgb(95, 118, 232); border-radius: 10px; background-color: white;">
			<input type="button"  id="workIn" class="d-flex col-12 btn btn-outline-primary"
				style="border: none; border-top-left-radius: 9px; border-top-right-radius: 9px;"
				value="출근" name="status">
			<input type="button" class="d-flex col-12 btn btn-outline-primary"
				style="border: none;" value="퇴근" name="status">
		</div>
		<input type="hidden" name="cNo" value="${c.commuteNo}"> <input>
			type="hidden" name="main" value="1">
	<%-- </form> --%>
	<br>
	<!-- 근태관리, 내 근태 현황, 내 연차 내역, 내 인사정보 -->
<!-- 
	<h6 class="card-title">근태관리</h6>
	<div class="list-group">
		<a href="" class="list-group-item">내 근태 현황</a> <a
			href="" class="list-group-item">내 연차 내역</a> <a
			href="" class="list-group-item">내 인사정보</a>
	</div> -->

	<script>
		$(function() {
			$("#status").css("z-index", "1")
			$(".list-group").css("z-index", "0")
			$(".card-title").css("z-index", "0")

			$("#selectStatus").click(function() {
				if ($("#status").css("display") == "none") {
					$("#status").show();

					var width = $("#selectStatus").css("width");

					$("#status").css("width", width)
				}

				else {
					$("#status").hide();
				}
			})

		})

		$("#workIn").click(function(){
			debugger;
			$.ajax({
				type: "POST", 
				url: "${path}/workIn.do",
				data: { 
					empNo: "${loginEmployee.empNo}"
				},
				success : function(result){
					if(result == "success"){
						//todo 버튼 활성화
					}else{
						alert("출근 실패");
					}
				},
				error : function(){
					alert("근무정보를 조회할 수 없습니다. \n관리자에게 문의하세요.");
				}
			});
		});
		
		function printClock() {

			const clock = document.getElementById("clock"); // 출력할 장소 선택
			const currentDate = new Date(); // 현재시간
			const calendar = currentDate.getFullYear() + "-"
					+ (currentDate.getMonth() + 1) + "-"
					+ currentDate.getDate() // 현재 날짜
			const currentHours = addZeros(currentDate.getHours(), 2);
			const currentMinute = addZeros(currentDate.getMinutes(), 2);
			const currentSeconds = addZeros(currentDate.getSeconds(), 2);

			clock.innerHTML = currentHours + ":" + currentMinute + ":"
					+ currentSeconds; //날짜를 출력해 줌

			setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출

			function addZeros(num, digit) { // 자릿수 맞춰주기
				const zero = '';
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