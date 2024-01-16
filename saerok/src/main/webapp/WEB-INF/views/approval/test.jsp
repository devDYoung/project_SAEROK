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

<!-- 서명 클릭 스크립트  -->
<script>
	$(document).ready(function() {
		$("#proposer").one("click", function() {
			var proposerValue = $("input[name='writerName']").val();
			$("#proposerText").append(proposerValue);
		});
	});

	// 금액 자동 포맷팅 스크립트 함수명에 fn_ 추가
	$(document).ready(function() {
	    $("#allAmount").bind('keyup keydown',function(){
	        fn_inputNumberFormat(this);
	    });

	    function fn_inputNumberFormat(obj) {
	        obj.value = fn_comma(fn_uncomma(obj.value));
	    }

	    function fn_comma(str) {
	        str = String(str);
	        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	    }

	    function fn_uncomma(str) {
	        str = String(str);
	        return str.replace(/[^\d]+/g, '');
	    }

	    function fn_getNumberOnly(str) {
	        var len = str.length;
	        var sReturn = "";

	        for (var i = 0; i < len; i++) {
	            if ((str.charAt(i) >= "0") && (str.charAt(i) <= "9")) {
	                sReturn += str.charAt(i);
	            }
	        }
	        return sReturn;
	    }
	});
</script>

<!-- 비고 +/- -->
<script>
$(document).ready(function() {
    // 추가 버튼 클릭 시 동작
    $(".btn-primary").on("click", function() {
        // 새로운 행 생성
        var newRow = '<tr>'
            + '<td colspan="2"><input type="text" name="erDetail" id="erDetail"></td>'
            + '<td colspan="2"><input type="text" name="erAmount" id="erAmount"></td>'
            + '<td colspan="2"><input type="text" name="erReference" id="erReference" value="-"></td>'
            + '</tr>';

        // 생성된 행을 마지막 행으로 추가
        $("#putContents").after(newRow);
    });

    // 삭제 버튼 클릭 시 동작
    $(".btn-outline-danger").on("click", function() {
        // 마지막 행 제거
        $("#putContents").prev().remove();
    });
});

</script>