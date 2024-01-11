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
	<jsp:param value="일반" name="title" />
</jsp:include>
<style>
.chat-box .chat-desc ul, .pd-ltr-20 {
	padding: 20px 20px 10px;
}

.wrap {
	display: flex;
}

.bootstrap-tagsinput {
	box-sizing: border-box;
	width: 100%;
	border: 0;
}
</style>
<strong>&nbsp; 문서 종류 : </strong>
<select id="selectDoc" name="selectDoc" class="form-select" onchange="loadDocumentForm(this.value)">
	<option value="D1">일반(휴가)신청서</option>
	<option value="D3">사 직 서</option>
</select>


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
								<select id="payment_item" name="payment_item"
									onchange="select()" class=" selectpicker ">
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
	<script>
	//제목 선택 (반차, 연차 선택에 따른 시작일, 종료일 입력창 표시)
		$("#payment_item").change(function() {
			var selected = $(this).val();
			if (selected === "반차") {
				$("#annDate_one").show();
				$("#annDate_two").hide();
			} else if (selected === "연차") {
				$("#annDate_one").show();
				$("#annDate_two").show();
			} else {
				$("#annDate_one").hide();
				$("#annDate_two").hide();
			}
		});
	</script>

	<script>
	//수신 참조인 추가
	$("#prj-add-project").click(function() {
	    var selectedPerson = $(".select-People").val();
	    $("#set-name").append('<p>'+selectedPerson+'</p>');
	    $(".select-People").val('');
	});

	// 수신 참조인 정정
	$("#clear-set-name").click(function() {
	    $("#set-name").empty();
	});
	</script>
	<script>
	//결재 작성 버튼 클릭
	$("#savebutton").click(function() {
    $("#frm").submit();
});
	</script>

<script>
//AJAX양식선택
function loadDocumentForm(docType) {
    $.ajax({
        url: '/approval/docForms',
        type: 'GET',
        data: { docType: docType },
        success: function(response) {
            // 여기서 반환된 내용을 처리하거나 표시합니다.
            $(".documentForm").html(response);
        },
        error: function(error) {
            console.error('문서 양식을 불러오는 중 오류가 발생했습니다.');
        }
    });
}
</script>
<script>
//휴가신청서 vDocForm
$(document).ready(function () {
    $(".datepicker").datepicker({
        dateFormat: "yy-mm-dd"
    });
});
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />