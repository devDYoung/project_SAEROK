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

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value="전자결재리스트"/>
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/form.css">	
											
	<td class="sign-tbl-right">
		<div class="sign-div-right">
		
			<table class="sign-right-tbl">
				<tbody>
					<tr>
						<th>신청</th>
						<td class="sign-right-tbl-border">
							<table class="sign-right-tbl-line">
								<tbody>
									<tr>
										<td>
											<span class="sign_wrap">$이름</span>
										</td>
									</tr>
									<tr>
										<td>
											<span class="sign_date">
												<%-- <c:set var="now" value="<%=  %>" /> --%>
												<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</td>
<br>
	<div class="div-sign-tbl">
		<table class="sign-tbl-bottom">
			<tbody>
				<tr>
					<th>입사일</th>
					<td>
						<input type="date" name="start-date" id="start-date" value="${sessionScope.loginMember.hireDate}" readonly/>
					</td>
					<th>퇴사일</th>
					<td>
						<input type="date" name="endDate" id="end-date" onKeyPress="noKey(event);"/>
					</td>
				</tr>
				<tr class="sign-tbl-bottom-tr">
					<th>직급</th>
					<th>사번</th>
					<th>성명</th>
					<th>근무부서</th>
				</tr>
				<tr class="sign-tbl-bottom-tr">
					<td>$직급</td>
					<td>$사번</td>
					<td>$이름</td>
					<td>$부서</td>
				</tr>
				<tr>
					<th colspan="4">퇴직 사유</th>
				</tr>
				<tr class="sign-tbl-bottom-tr">
					<td colspan="4">
						<textarea class="form-control" id="messageReason" type="text"
							placeholder="사유" 
							data-sb-validations="required">
						</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
						<!-- 결재 문서 end -->
						<script>
							/* 날짜 키보드 입력 막기 */
							const noKey = (event) => {
								event.preventDefault();
								return false;
							};
							
							/* 사직서 폼 제출 */
							const signCreate = () => {
								const frm = document.resignationCreateFrm;
								const reason = frm.reason;
								
								if (/^\s+$/.test(reason.value) || !reason.value) {
									alert('퇴사 사유를 작성해주세요.');
									reason.select();
									return false;
								}
								
								frm.submit();
							};
						</script>
						
				

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
