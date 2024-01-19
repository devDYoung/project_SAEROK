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
	<jsp:param value="일반" name="title" />
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<!-- Modal-->
<div class="modal fade" id="testModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content"
			style="width: 1000px; height: 1000px; left: -50%; display: flex; position: relative;">
			<div class="modal-header">
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close"></button>
			
			</div>
			<div class="modal-body">
				<div style="display: flex;">
					<div style="border: 1px solid black; width: 300px;">
						<ul id="mixed" class="loadDeptButton">
							<li><span class="deptName" role="button"
								style="color: black;"> <i class="fas fa-search fa-fw"></i>
									인사팀-HR
							</span>
								<ul class="team-list"></ul></li>
							<li><span class="deptName" role="button"
								style="color: black;"> <i class="fas fa-fw fa-folder"></i>
									관리팀-MG
							</span>
								<ul class="team-list"></ul></li>
							<li><span class="deptName" role="button"
								style="color: black;"> <i class="fas fa-fw fa-folder"></i>
									영업-SA
							</span>
								<ul class="team-list"></ul></li>
							<li><span class="deptName" role="button"
								style="color: black;"> <i class="fas fa-fw fa-folder"></i>
									지점팀-STORE
							</span>
								<ul class="team-list"></ul></li>
						</ul>
					</div>
					
				</div>
			</div>


			<div class="modal-footer">
				<a class="btn" id="modalY" onclick="fn_modalClose();">예</a>
				<button class="btn" type="button" data-dismiss="modal">아니요</button>
			</div>
		</div>
	</div>
</div>

<script>
function fn_modalClose(){
	alert("등록완료 !!");
	$("#testModal").modal("hide");
	const approvalLineContainer = $($.makeArray($(".basicForm>table tr:first-child>td:gt(1)")).reverse());
	const addLineEmp=$("#approverElement>label");
	addLineEmp.each((i,e)=>{
		console.log(approvalLineContainer[i]);
		console.log(e);
		$(e).find("input[type=checkbox]").attr("type","hidden");
		$(approvalLineContainer[i]).html("");
				
		$(approvalLineContainer[i]).append(e);
	});
	 // 참조자 추가
    const referContainer = $("#referContainer"); 
    const addLineRefer = $("#referElement>label"); 
    referContainer.html(""); 
    addLineRefer.each((i,e)=>{
        $(e).find("input[type=checkbox]").attr("type","hidden");
        referContainer.append(e);
    });
	
}
function loadDeptInfo(depCode) {
    console.log('DEPT_CODE:', depCode);
}

//버튼 클릭 시 loadDeptInfo 호출
$(document).ready(function() {
    $('.loadDeptButton>li').click(function(e) {
        const deptName = e.currentTarget.children[0].innerText;
        const deptCodeName = deptName.substring(deptName.indexOf("-") + 1);
        let deptCode;
        switch(deptCodeName) {
            case "HR": deptCode = 100; break;
            case "MG": deptCode = 200; break;
            case "SA": deptCode = 300; break;
            case "STORE": deptCode = 400; break;
        }
        $.ajax({
            url: '${path}/approval/checkDept',
            method: 'GET',
            data: { deptCode: deptCode },
            success: function(response) {
                const ul = $(e.currentTarget).find(".team-list");
                ul.html("");

                response.forEach(e => {
                	  const $li = $("<li>");
                	  const $label=$("<label>");
                	  const $input=$("<input>").attr({"type":"checkbox","value":e.empNo,"class":"choiceEmp"});
                	  const $a = $("<span>").text(e.empName + " " + e.jobName);
                	  $li.on("click", function(event) {
                		
                	    event.stopPropagation();
                	  });
                	  $label.append($input).append($a);
                	  $li.append($label);
                	  ul.append($li);
                	});

            },
            error: function(xhr, status, error) {
                console.error('Failed:', error);
            }
        });
    });
});
</script>


<!--모달창 띄우기  -->
<script>
	$(function(){
		$('#testBtn').click(function(e) {
			e.preventDefault();
			$('#testModal').modal("show");
		});	
		$('#testBtn2').click(function(e) {
			e.preventDefault();
			$('#testModal').modal("show");
		});	
	})
	
	
	<!-- 조직도 -->
	$(document).ready(function() {
		  $('.team-list').hide(); // 부서 하위 목록 숨김

		  $('.deptName').click(function() {
		    $(this).siblings('.team-list').toggle();
		  });

		  $('.team-list li').click(function() {
		    // 하위 목록의 클릭 이벤트 처리
		    console.log('List item clicked:', $(this).text());
		  });
		});
</script>


<form class="documentForm" name="basicForm" action="" method="POST"
	onsubmit="return check_onclick()">
	<div id="documentForm " class="documentForm"
		style="margin: 50px 50px 50px 50px; width: min-content;">
		<div class="basicForm">
			<table border="1" style="display: inline-block; text-align: center;">
				<tr>
					
					<td rowspan="2"
						style="color: black;  font-size: 20px;"><input
						type="button" id="testBtn2" class="rounded-circle border-0" value="결재" /></td>
	
				</tr>
				
				
				<tr>
					<td
						style="color: black; height: 70px; width: 80px; font-size: 15px;">성
						명</td>
					<td><input type="text" name="writerName"
						style="border: none; background: transparent; text-align: center;"
						value="${ loginEmployee.empName }" readonly></td>
					<td style="color: black; width: 80px; font-size: 15px;">부 서</td>
					<td><input type="text"
						style="border: none; background: transparent; text-align: center;"
						value="${ loginEmployee.deptName }" readonly></td>
					<td style="color: black; width: 80px; font-size: 15px;">직 급</td>
					<td colspan="3"><input type="text"
						style="border: none; background: transparent;"
						value="${ loginEmployee.jobName }" readonly></td>
				</tr>

				
			</table>
		</div>
		
	</div>
</form>








<jsp:include page="/WEB-INF/views/common/footer.jsp" />
