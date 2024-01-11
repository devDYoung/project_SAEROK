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

<div class="documentForm">
	<div class="pd-ltr-20 xs-pd-20-0">
		<div class="min-height-200px">
			<div class="page-header">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="title">
							<h4>일반(휴가)신청서</h4>
						</div>
						<nav aria-label="breadcrumb" role="navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">결재</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>

			<form name="writeForm" id="frm" action="/wefer/aInsert.do"
				method="post">
				<div class="pd-20 card-box mb-30">
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">제목</label>
						<div class="col-sm-12 col-md-10 wrap">
							<select id="payment_item" name="payment_item" onchange="select()"
								class=" selectpicker ">
								<option value="no">일반</option>
								<option value="반차">반차</option>
								<option value="연차">연차</option>
							</select> <input id="ann" class="form-control kind" type="text"
								placeholder="제목을 입력하세요" /> <input type="hidden"
								name="annual_kind" id="k" type="text" placeholder="제목을 입력하세요" />
						</div>
					</div>
					<div id="annDate_one" style="display: none">
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">시작일</label>
							<div class="col-sm-12 col-md-10">
								<input id="datepicker1" class="form-control"
									name="annual_stddate" placeholder="Select Date" type="text">
							</div>
						</div>
					</div>
					<div id="annDate_two" style="display: none">
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">종료일</label>
							<div class="col-sm-12 col-md-10">
								<input id="datepicker2" class="form-control"
									name="annual_enddate" placeholder="Select Date" type="text">
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">수신참조인</label>
						<div class="col-sm-12 col-md-10 wrap">
							<div id="person-form-group" class="form-control">
								<div class="fa-hover"></div>

								<div class="modal fade" id="Medium-modal" tabindex="-1"
									role="dialog" aria-labelledby="myLargeModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<!-- <div class="modal-header"></div> -->
										<div class="modal-content">
											<div class="modal-body">
												<div class="chat-list bg-light-gray">
													<div class="chat-search select-People"></div>
													<div class="chat-search" id="set-name"
														style="overflow: scroll; position: relative; height: 10%">
														<!--  클릭한 참조자 이름  -->
													</div>
													<div
														class="notification-list chat-notification-list customscroll">

														<ul class="submenu ref">
															<!-- 참조자 나오는 부분 -->
														</ul>
														<!-- 스크롤부분 -->
													</div>
													<!-- 회색박스 -->
												</div>
											</div>
											<div class="modal-footer">
												<button id="clear-set-name" type="button"
													class="btn btn-primary">정정</button>
												<button id="prj-add-project" type="button"
													class="btn btn-primary">추가</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<i class="icon-copy fi-torsos-female-male"
								style="font-size: 40px; padding-right: 15px; display: block; margin-left: 10px; line-height: 1;"
								data-toggle="modal" data-target="#Medium-modal"></i>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-10 col-md-2 col-form-label">참조문서</label>
						<div class="col-sm-12 col-md-10">
							<input type="file" class="form-control">
						</div>
					</div>
				</div>
				<div class="html-editor pd-20 card-box mb-30">
					<div class="jsx-2303464893 editor">
						<div class="fr-box fr-basic fr-top" role="application">
							<div class="fr-wrapper show-placeholder" dir="auto"
								style="overflow: scroll;">
								<textarea name="annual_content"
									style="width: 100%; height: 412px;"></textarea>
							</div>
						</div>
					</div>
				</div>
				<input type="button" id="savebutton"
					class="pd-20 btn btn-primary btn-lg" style="float: right;"
					value="결재작성" />
			</form>
		</div>
	</div>
</div>




