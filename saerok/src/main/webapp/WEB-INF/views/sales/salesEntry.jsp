<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
<!DOCTYPE html>
<html>

<style>
#typeSelect, #productSelect {
    min-width: 100px;  /* 원하는 너비로 조정하세요 */
}
</style>



<head>
    <title>매출등록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="text-center my-4">매출등록</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th colspan="6" class="text-center">날짜: <span id="date"></span></th>
                </tr>
                <tr>
                    <th></th>
                    <th>타입</th>
                    <th>제품명</th>
                    <th>수량</th>
                    <th>단가</th>
                    <th>총가격</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>빈칸</td>
                    <td>
                        <select id="typeSelect" class="form-control">
                            <option>헤어</option>
                            <option>식료</option>
                            <option>바디</option>
                            <option>미용</option>
                            <option>향수</option>
                            <!-- 타입을 추가하려면 여기에 option을 추가하세요 -->
                        </select>
                    </td>
                    <td>
                        <select id="productSelect" class="form-control">
                            <!-- 제품을 추가하려면 여기에 option을 추가하세요 -->
                        </select>
                    </td>
                    <td>수량</td>
                    <td>단가</td>
                    <td>총가격</td>
                </tr>
                <!-- 여기에 더 많은 행을 추가하세요 -->
            </tbody>
        </table>
    </div>

    <script>
        document.getElementById('date').innerHTML = new Date().toLocaleDateString();
        
        var products = {
            "헤어": ["레몬 샴푸", "코코넛 컨디셔너", /* ... */],
            "식료": ["천연 올리브 오일", "허니 버터 아몬드", /* ... */],
            "바디": ["라벤더 바디 워시", "핑크 그레이프프루트 바디 로션", /* ... */],
            "미용": ["마이크로파이버 클렌징 패드", "페이셜 요가 마사저", /* ... */],
            "향수": ["화이트 머스크 오 드 퍼퓸", "로즈 앤 바닐라 오 드 코롱", /* ... */]
        };
        
        var typeSelect = document.getElementById('typeSelect');
        var productSelect = document.getElementById('productSelect');
        
        typeSelect.addEventListener('change', function() {
            var selectedType = this.value;
            
            // 제품명 select 박스 초기화
            productSelect.innerHTML = '';
            
            // 선택된 타입에 따른 제품명 추가
            products[selectedType].forEach(function(product) {
                var option = document.createElement('option');
                option.value = product;
                option.text = product;
                productSelect.appendChild(option);
            });
        });
        
        // 페이지 로드 시 초기 제품명 설정
        typeSelect.dispatchEvent(new Event('change'));
    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
