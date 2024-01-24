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


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- 전체 리스트 출력 -->
<div class="container-fluid">


   <!-- DataTales Example -->
   <div class="card shadow mb-4">
      <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">보낸 쪽지함</h6>
      </div>
      <div class="card-body">
         <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%"
               cellspacing="0">
               <thead>
                  <tr>
                     <th>선택</th>
                     <th>번호</th>
                     <th>받는사람</th>
                     <th>날짜</th>
                     <th>수신확인</th>
                  </tr>
               </thead>
               <tbody>
                  <c:if test="${not empty sentNotes}">
                     <c:forEach var="note" items="${sentNotes}">
                        <tr>
                           <td><input type="checkbox" name="noteCheckBox" /></td>
                           <td><c:out value="${note.noteNo}" /></td>
                           <td><c:out value="${note.rcvEmpNo}" /></td>
                           <td><c:out value="${note.regDtime}" /></td>
                           <td><c:out value="${note.readYN}" /></td>

                        </tr>
                     </c:forEach>
                  </c:if>
               </tbody>
            </table>
         </div>
      </div>
   </div>
</div>

<script>
   $(document).ready(function() {
      /* new DataTable('#dataTable', {
         info : false,
         ordering : true,
         paging : true
      }); */
      $('#send-btn').click(function() {
         var recipientName = $('#recipient-name').val();
         var messageText = $('#message-text').val();
         debugger
         // AJAX로 데이터 전송
         $.ajax({
            type : 'POST',
            url : '${path}/note/send', // 실제 주소로 매핑
            data : {
               recipientName : recipientName,
               messageText : messageText
            },
            success : function(response) {
               alert(response);
               $("#Modal").modal("hide");
               location.replace("${path}/note/send");
            },
            error : function(error) {
               console.log("에러에러",error);
               alert("쪽지쪽지")
            }
         });
      });
   });
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
