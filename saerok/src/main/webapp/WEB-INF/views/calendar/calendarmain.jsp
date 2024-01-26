<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginEmployee"
   value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
<%@page import="java.util.List"%>
<%@page import="com.saerok.jy.schedule.dto.*"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
</script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="CommuteMain" name="ATO" />
</jsp:include>
<!-- cdn -->
<!-- fullcalendar css -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
<style>
.fc-event-time {
   display: none;
}
#page {
   width: 95%;
   height: 100%;
   margin: auto;
   background-color: white;
}
#title {
   margin-top: 30px;
   margin-left: 10%;
   border: none;
   width: 80%;
   height: 50px;
   resize: none;
   font-size: 30px;
   font-weight: 600;
}
textarea:focus {
   outline: none;
}
textarea::placeholder {
   color: rgb(189, 189, 189);
}
#select {
   width: 100px;
   height: 23px;
   font-size: 13px;
   border: none;
   display: inline;
   margin-left: 45px;
}
#file-name {
   margin-left: 50px;
}
#create, #start, #end, #cate, #file, #line {
   margin-left: 10%;
   margin-top: 10px;
   font-size: 15px;
}
.datepicker-start, .datepicker-end, #now_date {
   margin-left: 67px;
   height: 20px;
   border: none;
}
#line {
   margin-top: 20px;
   width: 80%;
}
#con {
   margin-left: 10%;
   width: 80%;
   height: 300px;
   border: none;
   height: 300px;
   resize: none;
}
#submit, #center-bot {
   margin: auto;
   width: 100px;
}
</style>

<!-- Begin Page Content -->
<div class="container-fluid">
   <!-- DataTales Example Start-->
   <div class="card shadow mb-4">
      <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">일정</h6>
      </div>

      <button type="button" id="addCalendarBtn" class="btn btn-primary"
         data-toggle="modal" data-target="#calendarModal" data-whatever="@fat"
         style="display: none;">일정 쓰기</button>
      <div class="card-body">
         <!--start-->
         <!-- Modal -->
         <div class="modal fade" id="calendarModal" tabindex="-1"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
               <form class="modal-content" action="${path}/write" method="post">
                  <!-- <div class="modal-header">
                  </div> -->
                  <div class="modal-body">
                     <div>
                        <textarea id="title" name="title" placeholder="일정 제목"></textarea>
                     </div>
                     <div id="create">
                        작성일 <input id="now_date" type="date" value="">
                        <script>document.getElementById('now_date').valueAsDate = new Date();</script>
                     </div>
                     <div id="cate">
                        카테고리<select name="cateNo" id="select"
                           class="form-select form-select-sm"
                           aria-label=".form-select-sm example">
                           <option value="3" selected>기타</option>
                           <option value="1">휴가</option>
                           <option value="2">반차</option>
                        </select>
                     </div>
                     <div id="start">
                        시작일 <input class="datepicker-start" name="startDate">
                        <script>
                                          $(function(){
                                            $( ".datepicker-start" ).datepicker({ minDate: 0});
                                            $('.datepicker-start').datepicker('setDate', 'today');
                                          })
                                        </script>
                     </div>
                     <div id="end">
                        종료일 <input class="datepicker-end" name="endDate">
                        <script>
                                          $(function(){
                                            $('.datepicker-end').datepicker({ minDate: 0});
                                            $('.datepicker-end').datepicker('setDate', 'today');
                                          })
                                        </script>
                     </div>
                     <hr id="line">
                     <div>
                        <textarea id="con" placeholder="내용을 입력하세요" name="content"></textarea>
                     </div>
                  </div>
                  <!-- </div> -->
                  <div class="modal-footer">
                     <div id="saveBtn">
                        <input class="btn btn-primary btn-user btn-block" type="submit"
                           value="작성하기">
                     </div>
                     <div id="center-bot2">
                        <input class="btn btn-primary btn-user btn-block" type="submit" 
                           value="취소하기">
                     </div>
                  </div>
               </form>
            </div>
         </div>
         <!-- Modal 끝 -->

         <div id='calendar'></div>
             <style>
       #calendar .fc-scroller {
        overflow-x: hidden !important;
        overflow-y: auto;
      }
      /* 일요일 날짜 빨간색 */
      .fc-day-sun a {
        color: red;
        text-decoration: none;
      }
      
      /* 토요일 날짜 파란색 */
/*       .fc-day-sat a {
        color: blue;
        text-decoration: none;
      } */
      .fc-license-message{
         display: none;
      }
    </style>
 <!--    <script>
    $('#cancelModifyBtn').on('click', function () {
        // 취소 버튼 클릭 시 모달 닫기
        $('#calendarModal').modal('hide');
        $('#calendarModal').modal('show');
    });</script> -->

         <script>
                  document.addEventListener('DOMContentLoaded', function() {
                     var calendarEl = document.getElementById('calendar');
                     var calendar = new FullCalendar.Calendar(calendarEl, {
                             googleCalendarApiKey: 'AIzaSyDZTRgjuENE0svix_V-Fzl6EKEOttucbHw',
                               eventSources: [
                                   {
                                       googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
                                       color: 'pink',
                                       textColor: 'black'
                                   }
                               ],
                        initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                        headerToolbar : { // 헤더에 표시할 툴 바
                           start : 'prev next today',
                           center : 'title',
                           end : 'dayGridMonth,dayGridWeek,dayGridDay'
                        },
                     
                        selectable : true, // 달력 일자 드래그 설정가능
                        droppable : true,
                        editable : true,
                        locale: 'ko', // 한국어 설정
                        eventDisplay:'block',
                        dateClick: function(info) {
                           $("#addCalendarBtn").click();
                           //alert('clicked ' + info.dateStr);
                         },
                        //DB에서 List 불러오기
                           events : [ 
                                <%List<Schedule> scheduleList = (List<Schedule>) request.getAttribute("scheduleList");%>
                                 <%if (scheduleList != null) {%>
                                 <%for (Schedule schedule : scheduleList) {%>
                                 {
                                    title : '<%=schedule.getSkdTitle()%>',
                                     start : '<%=schedule.getSkdStart()%>',
                                     end : '<%=schedule.getSkdEnd()%>',
                                     backgroundColor : '#03a' + Math.round(Math.random() * 0xfff).toString(16),
                                 borderColor : '#FFFFFF'
                                  },
                        <%}
                     }%>
                                 ]
                     });
                     calendar.render();
                  });
                  
               </script>
         <!--end-->
      </div>
   </div>
   <!-- DataTales Example End-->
</div>
<!-- End Page Content -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />