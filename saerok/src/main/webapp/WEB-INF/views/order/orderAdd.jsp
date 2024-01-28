<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />


<!DOCTYPE html>
<html>
<head>
<title>발주 신청</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>



<style>
.container-fluid {
	font-family: 'Noto Sans KR', sans-serif;
}

.product-name-width {
	width: 30%;
}

.category-width {
	width: 15%;
}

.custom-date {
	font-size: 1.25rem;
	font-weight: bold;
}
</style>
</head>


<body>
	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">발주 신청</h1>
		</div>
		<hr class="my-4">

		<form id="orderForm" action="${path}/owner/order/add" method="post">
			<div class="row justify-content-center">
				<div class="col-md-3">
					<div class="input-group date" id="datepicker">
						<div class="input-group-prepend">
							<button type="button" class="btn custom-button" id="prevDate">
								<i class="fa fa-chevron-left"></i>
							</button>
						</div>
						<input type="text" class="form-control custom-date"
							name="orderDate" id="orderDate" readonly
							style="background-color: transparent; border: none; text-align: center;">
						<div class="input-group-append">
							<button type="button" class="btn custom-button" id="nextDate">
								<i class="fa fa-chevron-right"></i>
							</button>
						</div>
					</div>
				</div>
			</div>

			<table class="table">
				<thead>
					<tr class="text-center">
						<th>카테고리</th>
						<th>제품명</th>
						<th>수량</th>
						<th>단가</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<tr class="orderData">
						<td class="category-width"><select class="form-control"
							id="category" name="category">
								<option value="">카테고리 선택</option>
								<c:forEach var="item" items="${items}">
									<c:if
										test="${not empty item.itemCategory and not fn:contains(categories, item.itemCategory)}">
										<option value="${item.itemCategory}">${item.itemCategory}</option>
										<c:set var="categories"
											value="${categories} ${item.itemCategory}" />
									</c:if>
								</c:forEach>
						</select></td>
						<td class="product-name-width"><select class="form-control"
							id="item" name="itemId">
								<option value="">제품 선택</option>
						</select></td>
						<td><input type="number" class="form-control" id="quantity"
							name="quantity" min="0"></td>
						<td><input type="text" class="form-control" id="price"
							name="price" readonly></td>
						<td><input type="text" class="form-control" id="totalPrice"
							name="totalPrice" readonly></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="jsonData" id="jsonData">
			<button type="button" id="addRow" class="btn btn-secondary">제품 추가</button>
			<button type="button" id="removeRow" class="btn btn-danger">제품 삭제</button>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>
	</div>

	<script>
	$(document).ready(function() {
	    $('#orderForm').submit(function(e) {
	        var orderDataList = [];
	        var orderDate = $('#orderDate').val();
	        var isValid = true;

	        $('.orderData').each(function() {
	            var itemId = $(this).find('select[name="itemId"]').val();
	            var quantity = $(this).find('input[name="quantity"]').val();
	            var category = $(this).find('#category').val();

	            if (!category) {
	                alert('카테고리를 선택해주세요.');
	                isValid = false;
	                return false;
	            }

	            if (!itemId) {
	                alert('제품을 선택해주세요.');
	                isValid = false;
	                return false;
	            }

	            if (!quantity) {
	                alert('수량을 입력해주세요.');
	                isValid = false;
	                return false;
	            }

	            orderDataList.push({
	                itemId : itemId,
	                quantity : quantity
	            });
	        });

	        if (!isValid) {
	            e.preventDefault();
	            return;
	        }

	        var jsonData = JSON.stringify({
	            order: {orderDate: orderDate},
	            details: orderDataList
	        });

	        $('#jsonData').val(jsonData);
	        this.submit();
	    });

	    $('#addRow').click(function() {
	        var newRow = $('.orderData:last').clone();
	        newRow.find('select').val('');
	        newRow.find('input').val('');
	        newRow.appendTo('tbody');
	        bindEventsToRow(newRow);
	    });

	    $('#removeRow').click(function() {
	        if ($('.orderData').length > 1) {
	            $('.orderData:last').remove();
	        } else {
	            alert('최소 1개 제품은 필요합니다.');
	        }
	    });
	    
	    bindEventsToRow($('.orderData'));


	    function bindEventsToRow(row) {
			row
					.find('#category')
					.change(
							function() {
								var selectedCategory = $(
										this).val();
								var itemSelect = row
										.find('#item');
								itemSelect
										.empty()
										.append(
												'<option value="">제품 선택</option>');
								<c:forEach items="${items}" var="item">
								if ('${item.itemCategory}' === selectedCategory) {
									itemSelect
											.append('<option value="${item.itemId}" data-price="${item.itemPrice}">${item.itemName}</option>');
								}
								</c:forEach>
							});

			// 아이템 선택 시 가격 설정
			row.find('#item').change(
					function() {
						var price = $(this).find(
								'option:selected').data(
								'price');
						row.find('#price').val(price);
						calculateTotal(row);
					});

			// 수량 변경 시 총액 계산
			row.find('#quantity').on('input change keyup', function() {
			    calculateTotal(row);
			});
		}

		// 총 가격 계산 함수
		function calculateTotal(row) {
			var quantity = row.find('#quantity').val();
			var price = row.find('#price').val();
			var totalPrice = quantity * price;
			row.find('#totalPrice').val(totalPrice);
		}
	    var datePicker = $('#datepicker').datepicker({
	        format : "yyyy.mm.dd",
	        autoclose : true,
	        todayHighlight : true,
	        showOnFocus : false,
	        language : "kr",
	    }).datepicker("setDate", new Date());

	    $('#orderDate').on('click', function() {
	        datePicker.datepicker('show');
	    });

	    $('#prevDate').click(function(e) {
	        e.stopPropagation();
	        var currentDate = datePicker.datepicker('getDate');
	        currentDate.setDate(currentDate.getDate() - 1);
	        datePicker.datepicker('setDate', currentDate).datepicker('hide');
	    });

	    $('#nextDate').click(function(e) {
	        e.stopPropagation();
	        var currentDate = datePicker.datepicker('getDate');
	        currentDate.setDate(currentDate.getDate() + 1);
	        datePicker.datepicker('setDate', currentDate).datepicker('hide');
	    });
	});
	</script>

	<script src="${path }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${path }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="${path}/resources/js/sb-admin-2.min.js"></script>
</body>


</html>


