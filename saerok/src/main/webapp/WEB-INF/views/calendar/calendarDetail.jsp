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
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="CommuteMain" name="ATO" />
</jsp:include> --%>
<style>
    #page{
        width: 95%;
        height: 100%;
        margin: auto;
        background-color: white;
    }

    #title{
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
        color:rgb(189, 189, 189);
    }

    #select{
        margin-left: 55px;
        margin-top: 10px;
        font-size: 15px;
    }

    #file-name{
        margin-left: 50px;
    }

    #create, #start, #end, #cate, #file, #line  {
        margin-left: 10%;
        margin-top: 10px;
        font-size: 15px;
    }

    #now_date{
        margin-left: 70px;
        margin-top: 10px;
        font-size: 15px;
    }

    .datepicker-start, #write{
        text-decoration: none;
        margin-left: 67px;
        height: 20px;
        border: none;
    }

    .datepicker-end{
        text-decoration: none;
        margin-left: 70px;
        height: 20px;
        border: none;
    }

    #line{
        margin-top: 20px;
        width: 80%;
    }

    #con{
        margin-left: 10%;
        width: 80%;
        height: 600px;
        border: none;
        height: 600px;
        resize: none;
    }

    #submit{
        margin: auto;
        width: 60px;
    }
    
    #edit, #delete{
        text-align: center;
        width: 100px;
    }

    #buttons{
        
        justify-content: center;
    }

    #edit, #delete{
        margin: auto;
        width: 100px;
    }

    #center-bot{
        display: flex;
        justify-content: center;
    }
    #btns{
        width: 300px;
    }


</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"  crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"  crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />


<!-- Begin Page Content -->
       <div class="container-fluid">
          <!-- DataTales Example Start-->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" >일정</h6>
              </div>
              
              <div class="card-body">
								<!--start-->
								<!-- Page Heading -->
							    <form action="" method="post">
							        <div id="page">
							            <div calss="title" style="margin-top: 45px;">
                                            <a id="title">${schedule.skdTitle}</a>
							            </div>
							            <div id="create">
							                작성일 <a id="now_date">${schedule.modDtime}</a>
							            </div>
                                        <div id="create">
							                작성자 <a id="now_date">${schedule.empNo}</a>
							            </div>
							            <div id="start">
							                시작일 <a class="datepicker-start"  name="startDate">${schedule.skdStart}</a>
							            </div>
							            <div id="end">
							                종료일<a class="datepicker-end" name="endDate">${schedule.skdEnd}</a>
							            </div>
							            <hr id="line">
							            <div>
							                <div id="con">${schedule.skdContent}</div>
							            </div>
							            <c:if test="${ schedule.empNo eq loginEmployee.empNo }">
                                            <div id="center-bot">
                                                <div class="row" id="btns">
                                                    <a class="btn btn-primary btn-user btn-block" id="edit" href="${path}/calendar/Edit/${schedule.scheduleNo}">수정하기</a>
                                                    <a class="btn btn-danger btn-user btn-block" id="delete" href="${path}/calendar/Delete/${schedule.scheduleNo}">삭제하기</a>
                                                </div>

                                            </div>
                                           
										</c:if>
							        </div>
							    </form>
								<!--end-->
						  </div>

				  </div>
		<!-- DataTales Example End-->
	  </div>
<!-- End Page Content -->

	