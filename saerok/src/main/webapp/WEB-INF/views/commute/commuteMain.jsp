<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="CommuteMain" name="ATO" />
</jsp:include>
<%-- <jsp:include page="/WEB-INF/views/commute/commuteBar.jsp" /> --%>
 <link rel="stylesheet" href="${path }/resources/css/emp.css">
 <style>
    #work-week-container {
        text-align: center;
        width: 900px; /* 원하는 너비 값으로 조절 */
        margin: 0 auto; /* 가운데 정렬을 위해 필요한 부분 */
    }
    #work-week-container > div {
        margin: 0 10px;
    }
</style>
  <div class="home-container">
                    <div class="div-padding">
                        <div id="date-box">
                            <h4>
                                <button id="prev-btn"><i class="fa-solid fa-chevron-left"></i></button>
                                <span id="date-text">2023.03</span>
                                <button id="next-btn"><i class="fa-solid fa-chevron-right"></i></button>
                            </h4>
                        </div>

                        <div id="work-week-container">
                            <div id="work-week-time">
                                <div>
                                    <p class="font-14">이번주 누적</p>
                                    <h4 class="main-color" id="main-totalwork-time">0h 0m 0s</h4>
                                </div>
                                <div>
                                    <p class="font-14">이번주 초과</p>
                                    <h4 class="main-color" id="main-week-over-time">0h 0m 0s</h4>
                                </div>
                                <div>
                                    <p class="font-14">이번주 잔여</p>
                                    <h4 class="main-color" id="main-work-time">40h 0m 0s</h4>
                                </div>
                                <div>
                                    <p class="font-14">이번달 누적</p>
                                    <h4 class="color-gray" id="main-month-work-time">0h 0m 0s</h4>
                                </div>
                                <div>
                                    <p class="font-14">이번달 연장</p>
                                    <h4 class="color-gray" id="main-month-over-time">0h 0m 0s</h4>
                                </div>
                            </div>
                        </div>

                        <div id="work-info-container"></div>

                    </div>
                </div>
     
     
	<script>
        window.addEventListener('load',()=>{
                sendData();
                weekTimes();
        });
        
        let currentDate = new Date();

            function setCurrentDate() {
                const dateText = document.getElementById("date-text");
                const year = currentDate.getFullYear();
                const month = currentDate.getMonth() + 1;
                const monthText = month < 10 ? `0\${month}` : month;
                dateText.textContent = `\${year}.\${monthText}`;
            }

            setCurrentDate();

            document.getElementById("prev-btn").addEventListener("click", () => {
                    currentDate.setMonth(currentDate.getMonth() - 1);
                    setCurrentDate();
                     sendData();
                    
            });

                document.getElementById("next-btn").addEventListener("click", () => {
                    currentDate.setMonth(currentDate.getMonth() + 1);
                    setCurrentDate();
                    sendData();
            });


    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
