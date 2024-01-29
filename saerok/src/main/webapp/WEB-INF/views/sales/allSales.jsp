<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>

<!DOCTYPE html>
<html>
<head>
<title>매출 현황</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
	
<!-- 임시 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

</head>
<body>

<style>
.container-fluid {
	font-family: 'Noto Sans KR', sans-serif;
}
.narrow-column {
	width: 15%;
}

.wide-column {
	width: 50%;
	text-align: center;
}

.chart-area {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>


	<div class="container-fluid">

		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">매출 현황</h1>
		</div>
    <hr class="my-4">

		<div class="row">

			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-s font-weight-bold text-primary text-uppercase mb-2">
									일간 매출</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<fmt:formatNumber value="${todaySalesTotal}" type="currency" />
								</div>
							</div>
							<div class="col-auto">
								<i class="bi bi-calendar3-event fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-s font-weight-bold text-success text-uppercase mb-2">
									월간 매출</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<fmt:formatNumber value="${currentMonthSalesTotal}"
										type="currency" />
								</div>
							</div>
							<div class="col-auto">
								<i class="bi bi-calendar3 fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-info shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-s font-weight-bold text-info text-uppercase mb-2">
									연간 매출</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<fmt:formatNumber value="${currentYearSalesTotal}"
										type="currency" />
								</div>
							</div>
							<div class="col-auto">
								<i class="bi bi-calendar3-fill fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xl-7 col-lg-6">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">매출 추이 (그래프)</h6>
					</div>
					<div class="card-body">
						<div class="chart-area">
							<canvas id="monthlySalesChart"></canvas>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xl-5 col-lg-6">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">매출 추이 (바 차트)</h6>
					</div>
					<div class="card-body">
						<div class="chart-area">

							<canvas id="monthlySalesBarChart"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-12">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">월간 지점별 매출 비교</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead class="thead-light">
								<tr>
									<th class="narrow-column">월</th>
									<th class="narrow-column">지역</th>
									<th class="narrow-column">지점</th>
									<th class="wide-column text-center">월간 매출</th>
								</tr>
							</thead>
							<tbody>
								<!-- 데이터 반복 구문 -->
								<c:forEach items="${currentMonthBranchSales}" var="sale">
									<tr>
										<td>${sale.salesMonth}</td>
										<td>${sale.branchRegion}</td>
										<td>${sale.branchName}</td>
										<td class="text-center"><fmt:formatNumber
												value="${sale.totalSales}" type="number" pattern="#,##0원" /></td>
									</tr>
								</c:forEach>
								<!-- 데이터 반복 구문 끝 -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>




	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script src="vendor/jquery/jquery.min.js"></script>

	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<script src="js/sb-admin-2.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


	<script>
const monthlySalesData = {
    labels: [],
    sales: []
};

<c:forEach items="${monthlySalesTotals}" var="record">
    monthlySalesData.labels.push("${record.SALESMONTH}");
    monthlySalesData.sales.push(${record.TOTALSALES}); 
</c:forEach>

const ctx = document.getElementById('monthlySalesChart').getContext('2d');
const gradient = ctx.createLinearGradient(0, 0, 0, 400);
gradient.addColorStop(0, 'rgba(0, 123, 255, 0.5)');
gradient.addColorStop(1, 'rgba(0, 123, 255, 0)');

const monthlySalesChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: monthlySalesData.labels,
        datasets: [{
            label: '월간 매출액',
            backgroundColor: gradient,
            borderColor: 'rgba(0, 123, 255, 1)',
            data: monthlySalesData.sales,
            fill: true,
            pointBackgroundColor: 'white',
            pointBorderColor: 'rgba(0, 123, 255, 1)',
            pointHoverBackgroundColor: 'rgba(0, 123, 255, 1)',
            pointHoverBorderColor: 'white'
        }]
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: '월간 매출 추이',
            fontColor: 'black',
            fontSize: 20
        },
        scales: {
            y: {
                grid: {
                    drawBorder: true,
                    color: 'lightgrey'
                },
                beginAtZero: true,
                ticks: {
                    fontColor: 'black'
                }
            },
            x: {
                grid: {
                    drawBorder: true,
                    color: 'lightgrey'
                },
                ticks: {
                    fontColor: 'black'
                }
            }
        },
        legend: {
            labels: {
                fontColor: 'black'
            }
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        tooltips: {
            mode: 'index',
            intersect: false
        }
    }
});

const ctxBar = document.getElementById('monthlySalesBarChart').getContext('2d');
const gradientBar = ctxBar.createLinearGradient(0, 0, 0, 400);
gradientBar.addColorStop(0, 'rgba(255, 99, 132, 0.5)');
gradientBar.addColorStop(1, 'rgba(255, 99, 132, 0)');

const monthlySalesBarChart = new Chart(ctxBar, {
    type: 'bar',
    data: {
        labels: monthlySalesData.labels,
        datasets: [{
            label: '월간 매출액',
            backgroundColor: gradientBar,
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1,
            data: monthlySalesData.sales
        }]
    },
    options: {
        responsive: true,
        legend: {
            position: 'top',
            labels: {
                fontColor: 'black'
            }
        },
        title: {
            display: true,
            text: '월간 매출 추이 (바 차트)',
            fontColor: 'black',
            fontSize: 20
        },
        scales: {
            yAxes: [{
                gridLines: {
                    drawBorder: true,
                    color: 'lightgrey'
                },
                ticks: {
                    beginAtZero: true,
                    fontColor: 'black'
                }
            }],
            xAxes: [{
                gridLines: {
                    drawBorder: true,
                    color: 'lightgrey'
                },
                ticks: {
                    fontColor: 'black'
                }
            }]
        },
        tooltips: {
            mode: 'index',
            intersect: false
        }
    }
});
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />