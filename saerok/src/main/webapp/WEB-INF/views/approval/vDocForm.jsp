<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<table border="1"
	style="width: 800px; margin-top: 1px; border-collapse: collapse;">
	<!-- Header -->
	<colgroup>
		<col width="310">
		<col width="490">
	</colgroup>

	<tbody>
		<tr>
			<td
				style="height: 70px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;"
				colspan="2" class="">휴&nbsp;&nbsp;가&nbsp;&nbsp;문&nbsp;&nbsp;서</td>
		</tr>
		<tr>
			<td
				style="text-align: center; color: black; font-size: 15px; vertical-align: top;">

				<table
					style="border: 1px solid; margin-top: 1px; border-collapse: collapse; width: 318px;">
					<!-- User -->
					<colgroup>
						<col width="90">
						<col width="120">
					</colgroup>

					<tbody>
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 15px; font-weight: bold;">

								문서구분</td>
							<td
								style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 15px; width: 100px;">

							</td>
						</tr>
						<tr style="height: 32px;">
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 15px; font-weight: bold;">
								부&nbsp;&nbsp;&nbsp;서</td>
							<td
								style="padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 15px;">

								${ loginEmployee.deptName}</td>
						</tr>

						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 15px; font-weight: bold;">
								기 안 자</td>
							<td
								style="padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 15px;">

								${ loginEmployee.empName}</td>
						</tr>


					</tbody>
				</table> <br> <br>
				<table class="__se_tbl"
					style="width: 800px; margin-top: 0px; border-collapse: collapse !important; color: black; background: white; border: 1px solid black; font-size: 12px; font-family: malgun gothic, dotum, arial, tahoma;">
					<tbody>
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								휴가&nbsp;종류</td>
							<td
								style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
								<label><input type="radio" name="vacation" value="연차">연차</label>
								<label><input type="radio" name="vacation" value="반차">반차</label>
							</td>
						</tr>

						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								기간 및 일시</td>
							<td
								style="padding: 3px; border: 1px solid black; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; background: rgb(255, 255, 255);">
								<input class="datepicker" type="date" id="startDate"
								placeholder="시작일"> &nbsp;~&nbsp; <input
								class="datepicker" type="date" id="endDate" placeholder="종료일">
							</td>
						</tr>
						
						
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								연차&nbsp;일수</td>
							<td
								style="padding: 3px; border: 1px solid black; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; background: rgb(255, 255, 255);">
								<span id="restPointArea"
								style="font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
								id="applyPointArea"
								style="font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
							</td>
						</tr>
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 80px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								<b style="color: rgb(255, 0, 0);">*</b>&nbsp;휴가&nbsp;사유
							</td>
							<td><textarea class="form-control"
									style="width: 100%; line-height: 120%; height: 72px;"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"
								style="width: 800px; padding: 20px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; background: #ddd;">
								1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다. 단, 최초
								입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다.<br> 2. 경조사
								휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br> 3.
								공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<button class="btn btn-secondary" type="submit" id="">제출</button>
							</td>
						</tr>
					</tbody>
				</table>