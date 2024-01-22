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
<!-- 	<link
	href="https://cdn.datatables.net/v/dt/dt-1.13.8/datatables.min.css"
	rel="stylesheet" />

<script
	src="https://cdn.datatables.net/v/dt/dt-1.13.8/datatables.min.js">
	
</script> -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="CommuteMain" name="ATO" />
</jsp:include>
<c:if test = "${!empty sessionScope.alertMsg}">
	<script>
		alert("${sessionScope.alertMsg}");
	</script>
	<c:remove var="alertMsg"></c:remove>
</c:if>


<style>

	#tab{
		margin:auto;
		width: 90%;
	}
	
	.card{
		margin-top: 20px;
	}


	

</style>

<!-- Begin Page skdContent -->
       <div class="container-fluid">
          <!-- DataTales Example Start-->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" >일정 조회</h6>
              </div>
              
              <div class="card-body">
								<!--start-->
								<!-- Page Heading -->
								<div id="tab">
								
								<nav>
								  <div class="nav nav-tabs" id="nav-tab" role="tablist">
								    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">회의</button>
								    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">휴가</button>
								    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">반차</button>
								    <button class="nav-link" id="nav-out-tab" data-bs-toggle="tab" data-bs-target="#nav-out" type="button" role="tab" aria-controls="nav-out" aria-selected="false">외근</button>								    
								    <button class="nav-link" id="nav-ect-tab" data-bs-toggle="tab" data-bs-target="#nav-ect" type="button" role="tab" aria-controls="nav-ect" aria-selected="false">기타</button>
								  </div>
								</nav>
								<div class="tab-content" id="nav-tabcontent">
								
								  <!-- 회의 -->
								  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
								  
									  <div class ="d-flex flex-wrap w-100">
										<c:forEach items="${scheduleList}" var="s">
											<c:if test="${s.category eq 20}">
											
											<div class="row">
												<div class="col-md-4">
													<div class="card" style="width: 21rem; height: 10rem; margin: 20px;">
														<div class="card-body">
															<c:if test="${s.skdImpt eq 'N'}">
																<h5 id="star${s.scheduleNo}"  style="float: right;">☆</h5>
																</c:if>
																<c:if test="${s.skdImpt eq 'Y'}">
																<h5 id="star${s.scheduleNo}" style="float: right;">★</h5>
																</c:if>
																<script>
																		$('#star${s.scheduleNo}').on('click', function() {
																			console.log('adfadsf');
																			$.ajax({
																			type: "get",
																			url: `${path}/calendar/Impt`,
																			data: {
																				scheduleNo : '${s.scheduleNo}'
																			},
																			success: function (check) {
																				if(check == 'Y'){
																					document.querySelector('#star${s.scheduleNo}').innerHTML='★';
																				}else if(check =='N'){
																					document.querySelector('#star${s.scheduleNo}').innerHTML='☆';
																				}
																			}
																			});
																		});
																</script>
														  <h5 class="card-title" onclick="location.href='${path}/calendar/Detail/${s.scheduleNo}'" style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">${s.skdTitle}</h5>
														  <h5 class="card-title">${s.skdStart}</h5>
														  <h6 class="card-subtitle mb-2 text-muted">${s.empNo}</h6>
														  <p class="card-text" style='overflow:hidden; white-space:nowrap; text-overflow:ellipsis;'>${s.skdContent}</p>
														</div>
													 </div>
												</div>
											</div>
	
											</c:if>
										</c:forEach>
									</div>
									
								</div>
								<!-- 회의 끝 -->
								 
								  <!-- 휴가 -->
								  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
								  
									  <div class ="d-flex flex-wrap w-100">
										<c:forEach items="${scheduleList}" var="s">
											<c:if test="${s.category eq 3}">
											
											<div class="row">
												<div class="col-md-4">
													<div class="card" style="width: 21rem; height: 10rem; margin: 20px;">
														<div class="card-body">
															<c:if test="${s.star eq 'N'}">
																<h5 id="star${s.scheduleNo}"  style="float: right;">☆</h5>
																</c:if>
																<c:if test="${s.star eq 'Y'}">
																<h5 id="star${s.scheduleNo}" style="float: right;">★</h5>
																</c:if>
																<script>
																		$('#star${s.scheduleNo}').on('click', function() {
																			console.log('adfadsf');
																			$.ajax({
																			type: "get",
																			url: `${path}/calendar/Impt`,
																			data: {
																				scheduleNo : '${s.scheduleNo}'
																			},
																			success: function (check) {
																				if(check == 'Y'){
																					document.querySelector('#star${s.scheduleNo}').innerHTML='★';
																				}else if(check =='N'){
																					document.querySelector('#star${s.scheduleNo}').innerHTML='☆';
																				}
																			}
																			});
																		});
																</script>
														  <h5 class="card-title" onclick="location.href='${path}/calendar/Detail/${s.scheduleNo}'" style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">${s.skdTitle}</h5>
														  <h5 class="card-title">${s.skdStart} ~ ${s.skdEnd}</h5>
														  <h6 class="card-subtitle mb-2 text-muted">${s.empNo}</h6>
														  <p class="card-text" style='overflow:hidden; white-space:nowrap; text-overflow:ellipsis;'>${s.skdContent}</p>
														</div>
													 </div>
												</div>
											</div>
	
											</c:if>
										</c:forEach>
									</div>

								  </div>
								  <!-- 휴가 끝 -->
								  
								  <!-- 반차 -->
								  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
								  
									  <div class ="d-flex flex-wrap w-100">
										<c:forEach items="${scheduleList}" var="s">
											<c:if test="${s.category eq 4}">
											
											<div class="row">
												<div class="col-md-4">
													<div class="card" style="width: 21rem; height: 10rem; margin: 20px;">
														<div class="card-body">
															<c:if test="${s.skdImpt eq 'N'}">
																<h5 id="star${s.scheduleNo}"  style="float: right;">☆</h5>
																</c:if>
																<c:if test="${s.skdImpt eq 'Y'}">
																<h5 id="star${s.scheduleNo}" style="float: right;">★</h5>
																</c:if>
																<script>
																		$('#star${s.scheduleNo}').on('click', function() {
																			console.log('adfadsf');
																			$.ajax({
																			type: "get",
																			url: `${path}/calendar/Impt`,
																			data: {
																				scheduleNo : '${s.scheduleNo}'
																			},
																			success: function (check) {
																				if(check == 'Y'){
																					document.querySelector('#star${s.scheduleNo}').innerHTML='★';
																				}else if(check =='N'){
																					document.querySelector('#star${s.scheduleNo}').innerHTML='☆';
																				}
																			}
																			});
																		});
																</script>
														  <h5 class="card-title" onclick="location.href='${path}/calendar/Detail/${s.scheduleNo}'" style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">${x.skdTitle}</h5>
														  <h5 class="card-title">${s.skdStart}</h5>
														  <h6 class="card-subtitle mb-2 text-muted">${s.empNo}</h6>
														  <p class="card-text" style='overflow:hidden; white-space:nowrap; text-overflow:ellipsis;'>${s.skdContent}</p>
														</div>
													 </div>
												</div>
											</div>
	
											</c:if>
										</c:forEach>
									</div>

								  </div>
								  <!-- 반차 끝-->
								  
								  <!-- 외근 -->
								  <div class="tab-pane fade" id="nav-out" role="tabpanel" aria-labelledby="nav-out-tab" tabindex="0">
								  
									  <div class ="d-flex flex-wrap w-100">
										<c:forEach items="${scheduleList}" var="s">
											<c:if test="${s.category eq 5}">
											
											<div class="row">
												<div class="col-md-4">
													<div class="card" style="width: 21rem; height: 10rem; margin: 20px;">
														<div class="card-body">
															<c:if test="${s.skdImpt eq 'N'}">
																<h5 id="star${x.scheduleNo}"  style="float: right;">☆</h5>
																</c:if>
																<c:if test="${x.skdStar eq 'Y'}">
																<h5 id="star${x.scheduleNo}" style="float: right;">★</h5>
																</c:if>
																<script>
																		$('#star${s.scheduleNo}').on('click', function() {
																			console.log('adfadsf');
																			$.ajax({
																			type: "get",
																			url: `${path}/calendar/Impt`,
																			data: {
																				scheduleNo : '${s.scheduleNo}'
																			},
																			success: function (check) {
																				if(check == 'Y'){
																					document.querySelector('#star${s.scheduleNo}').innerHTML='★';
																				}else if(check =='N'){
																					document.querySelector('#star${s.scheduleNo}').innerHTML='☆';
																				}
																			}
																			});
																		});
																</script>
														  <h5 class="card-title" onclick="location.href='${path}/calendar/Detail/${s.scheduleNo}'" style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">${s.skdTitle}</h5>
														  <h5 class="card-title">${s.skdStart}</h5>
														  <h6 class="card-subtitle mb-2 text-muted">${s.empNo}</h6>
														  <p class="card-text" style='overflow:hidden; white-space:nowrap; text-overflow:ellipsis;'>${s.skdContent}</p>
														</div>
													 </div>
												</div>
											</div>
	
											</c:if>
										</c:forEach>
									</div>

								  </div>
								  <!-- 외근 끝-->
								  
								  <!-- 기타 -->
								  <div class="tab-pane fade" id="nav-ect" role="tabpanel" aria-labelledby="nav-ect-tab" tabindex="0">
								  
									  <div class ="d-flex flex-wrap w-100">
										<c:forEach items="${scheduleList}" var="s">
											<c:if test="${s.category eq 1}">
											
											<div class="row">
												<div class="col-md-4">
													<div class="card" style="width: 21rem; height: 10rem; margin: 20px;">
														<div class="card-body">
															<c:if test="${s.skdImpt eq 'N'}">
																<h5 id="star${s.scheduleNo}"  style="float: right;">☆</h5>
																</c:if>
																<c:if test="${s.skdImpt eq 'Y'}">
																<h5 id="star${s.scheduleNo}" style="float: right;">★</h5>
																</c:if>
																<script>
																		$('#star${s.scheduleNo}').on('click', function() {
																			console.log('adfadsf');
																			$.ajax({
																			type: "get",
																			url: `${path}/calendar/Impt`,
																			data: {
																				scheduleNo : '${s.scheduleNo}'
																			},
																			success: function (check) {
																				if(check == 'Y'){
																					document.querySelector('#star${s.scheduleNo}').innerHTML='★';
																				}else if(check =='N'){
																					document.querySelector('#star${s.scheduleNo}').innerHTML='☆';
																				}
																			}
																			});
																		});
																</script>
														  <h5 class="card-title"  onclick="location.href='${path}/calendar/Detail/${s.scheduleNo}'" style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">${s.skdTitle}</h5>
														  <h5 class="card-title">${s.skdStart}</h5>
														  <h6 class="card-substitle mb-2 text-muted">${s.empNo}</h6>
														  <p class="card-text" style='overflow:hidden; white-space:nowrap; text-overflow:ellipsis;'>${s.skdContent}</p>
														</div>
													 </div>
												</div>
											</div>
	
											</c:if>
										</c:forEach>
									</div>

								  </div>
								  <!-- 기타 끝-->
								  
								</div><!-- tab Content -->
								
								</div><!-- tab -->
						  	  
 								</div> 
									
								</div>
								<!--end-->
						  </div>

				  </div>
		<!-- DataTales Example End-->
		
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	  </div>
<!-- End Page Content -->



	