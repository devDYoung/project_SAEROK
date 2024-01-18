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
    min-width: 100px;  
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
                    <th colspan="6" class="text-center"><span id="date"></span></th>
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
                        
                        </select>
                    </td>
                    <td>
                        <select id="productSelect" class="form-control">
                          
                        </select>
                    </td>
                    <td>수량</td>
                    <td>단가</td>
                    <td>총가격</td>
                </tr>
            
            </tbody>
        </table>
    </div>

    <script>
        document.getElementById('date').innerHTML = new Date().toLocaleDateString();
        
        var products = {
        	    "헤어": ["레몬 샴푸", "코코넛 컨디셔너", "아르간 오일 샴푸", "컬 강화 헤어 젤", "티트리 스칼프 케어", "비오틴 볼륨 스프레이", "케라틴 헤어 마스크", "모로칸 헤어 오일", "씨솔트 헤어 왁스", "퍼퓸 헤어 미스트", "알로에 베라 헤어 젤", "카페인 헤어 토닉"],
        	    "식료": ["천연 올리브 오일", "허니 버터 아몬드", "프리미엄 참기름", "유기농 그린티", "바닐라 아몬드 밀크", "허브 인퓨전 티", "오가닉 허니", "다크 초콜릿", "퀴노아 시리얼", "에너지 바", "아보카도 오일", "유기농 말차 파우더", "건조 블루베리"],
        	    "바디": ["라벤더 바디 워시", "핑크 그레이프프룻 바디 로션", "쉬어버터 핸드 크림", "쿨링 알로에 젤", "오트밀 바디 스크럽", "코코아 바디 버터", "망고 바디 오일", "로즈워터 바디 미스트", "페퍼민트 풋 크림", "바닐라 바디 폴리쉬"],
        	    "미용": ["마이크로파이버 클렌징 패드", "페이셜 요가 마사저", "포어 클린징 브러시", "실리콘 메이크업 스펀지", "LED 뷰티 마스크", "골드 언더아이 패치", "블랙헤드 리무버 키트", "아이브로우 스탬프", "립 스크럽", "헤어 라인 쉐도우"],
        	    "향수": ["화이트 머스크 오 드 퍼퓸", "로즈 앤 바닐라 오 드 코롱", "시트러스 프레시 오 드 뚜왈렛", "자스민 오 드 퍼퓸", "샌달우드 오 드 코롱", "라벤더 오 드 퍼퓸", "피오니 오 드 뚜왈렛", "아쿠아 마린 오 드 코롱", "버베나 오 드 퍼퓸", "오리엔탈 오 드 퍼퓸"]
        	};

        
        var typeSelect = document.getElementById('typeSelect');
        var productSelect = document.getElementById('productSelect');
        
        typeSelect.addEventListener('change', function() {
            var selectedType = this.value;
            
          
            productSelect.innerHTML = '';
            
           
            products[selectedType].forEach(function(product) {
                var option = document.createElement('option');
                option.value = product;
                option.text = product;
                productSelect.appendChild(option);
            });
        });
        
      
        typeSelect.dispatchEvent(new Event('change'));
    </script>
    
    
    
    
    
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />