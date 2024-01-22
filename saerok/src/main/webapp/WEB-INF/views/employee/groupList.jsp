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

<section id="ato-success">
    <div class="container-fluid page-wrapper">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">ATO 조직도</h6>
            </div>
            <br>
            <div class="ato-myimg" style="text-align: center;">
                <label for="fileUploaderLabel" class="custom-file-upload">
                    <img src="${path}/resources/upload/profile/ato_master.png" 
                        id="profile-img" class="img-profile rounded-circle" alt="ato-profile-img">
                </label>
                <p>ATO_MASTER</p>
            </div>
            <div class="card-body">
                <div class="modal-dialog" role="document" style="display: flex; justify-content: center;">

                    <!-- 첫 번째 부서: 인사팀-HR -->
                    <div class="modal-content"
                        style="width: 300px; height: 400px; position: relative; margin-right: 10px;">
                        <div class="modal-body">
                            <div style="display: flex;">
                                <div style="width: 300px;">
                                    <ul id="mixed" class="loadDeptButton">
                                        <li><span class="deptName" role="button" style="color: black;"> 인사팀-HR </span>
                                            <ul class="team-list"></ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 두 번째 부서: 관리팀-MG -->
                    <div class="modal-content"
                        style="width: 300px; height: 400px; position: relative; margin-right: 10px;">
                        <div class="modal-body">
                            <div style="display: flex;">
                                <div style="width: 300px;">
                                    <ul id="mixed" class="loadDeptButton">
                                        <li><span class="deptName" role="button" style="color: black;"> 관리팀-MG </span>
                                            <ul class="team-list"></ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--세 번째 부서 : 영업팀-SA  -->
                    <div class="modal-content"
                        style="width: 300px; height: 400px; position: relative; margin-right: 10px;">
                        <div class="modal-body">
                            <div style="display: flex;">
                                <div style="width: 300px;">
                                    <ul id="mixed" class="loadDeptButton">
                                        <li><span class="deptName" role="button" style="color: black;"> 영업팀-SA </span>
											<ul class="team-list"></ul></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
						<!--네 번째 부서 : 지점팀-STORE  -->
                    <div class="modal-content"
                        style="width: 300px; height: 400px; position: relative; margin-right: 10px;">
                        <div class="modal-body">
                            <div style="display: flex;">
                                <div style="width: 300px;">
                                    <ul id="mixed" class="loadDeptButton">
                                        <li><span class="deptName" role="button" style="color: black;"> 지점팀-STORE </span>
												<ul class="team-list"></ul></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
// 버튼 클릭 시 loadDeptInfo 호출
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
                    const $a = $("<span>").text(e.empName + " " + e.jobName);
                    $li.on("click", function(event) {
                        event.stopPropagation();
                    });
                    $li.append($a);
                    ul.append($li);
                });

            },
            error: function(xhr, status, error) {

                console.error('Failed:', error);
            }
        });
    });
});

// 조직도
$(document).ready(function() {
    $('.team-list').hide(); // 부서 하위 목록 숨김

    $('.deptName').click(function() {
        $(this).siblings('.team-list').toggle();
    });

    $('.team-list li').click(function() {
        console.log('List item clicked:', $(this).text());
    });
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
