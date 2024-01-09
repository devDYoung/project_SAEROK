<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 페이지 헤더 포함 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- 필요한 CSS 및 JavaScript 파일 포함 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

</head>
<body>
    <!-- 섹션 시작 -->
    <section id="ato-success">
        <div class="container-fluid">
         <form class="insertEmp" id="employeeForm" action="${path}/selectemp" method="post">
            <!-- 테이블 헤더 및 설명 -->
            <h1 class="h3 mb-2 text-gray-800">Tables</h1>

            <!-- DataTables 예제 -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!-- 테이블 구성 -->
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Office</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Office</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <!-- 테이블 데이터 -->
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <!-- 기타 데이터 행 추가 가능 -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- 나머지 페이지 내용 및 푸터 등 -->
		</form>
        </div>
    </section>

    <!-- 페이지 푸터 포함 -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
