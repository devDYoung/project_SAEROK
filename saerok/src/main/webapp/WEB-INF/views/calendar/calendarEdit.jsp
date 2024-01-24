<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


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
		margin-left: 45px;
        width: 100px;
        height: 23px;
        font-size: 13px;
        border: none;
		display: inline;
    }

    #file-name{
        margin-left: 50px;
    }

    #create, #start, #end, #cate, #file, #line{
        margin-left: 10%;
        margin-top: 10px;
        font-size: 15px;
    }

    .datepicker-start, .datepicker-end, #now_date{
        margin-left: 67px;
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

    #submit, #center-bot{
        margin: auto;
        width: 100px;
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
	                  <h6 class="m-0 font-weight-bold text-primary" >일정 작성</h6>
	              </div>
	              
	              <div class="card-body">
									<!--start-->
									<!-- Page Heading -->
								    <form action="${path }/calendar/Edit" method="post">
								        <div id="page">
								            <div>
								                <textarea id="title" name="title" placeholder="" value="">${schedule.skdTitle}</textarea>
								            </div>
								            <div id="create">
								                작성일 <input id="now_date" type="date" value="">
												<script>document.getElementById('now_date').valueAsDate = new Date();</script>
								            </div>
								            <div id="cate">
											
													카테고리  
											
												<select name="category" id="select" class="form-select form-select-sm" aria-label=".form-select-sm example">
														  <option value="1" selected>기타</option>
														  <option value="2">회의</option>
														  <option value="3">휴가</option>
														  <option value="4">반차</option>
														  <option value="5">외근</option>
														</select>
								            </div>
											<script>
												const x = '${schedule.category}'
												document.querySelector('#select').value=x;
											</script>
								            <div id="start">
								                시작일 <input class="datepicker-start" name="startDate">
								                <script>
								                  $(function(){
								                    $( ".datepicker-start" ).datepicker({ minDate: 0
													, dateFormat : "yy-mm-dd"
													});
								                    $('.datepicker-start').datepicker('setDate', "${schedule.skdStart}");
									
								                  })
								                </script>
								            </div>
								            <div id="end">
								                종료일 <input class="datepicker-end" name="endDate">
								                <script>
								                  $(function(){
								                    $('.datepicker-end').datepicker({ minDate: 0
														, dateFormat : "yy-mm-dd"});
								                    $('.datepicker-end').datepicker('setDate', "${schedule.skdEnd}");
								                  })
								                </script>
								            </div>

								            <hr id="line">
								            <div>
								                <textarea id="con" placeholder="내용을 입력하세요" name="content" value="">${schedule.skdContent}</textarea>
								            </div>
								            <div id="center-bot" ><input class="btn btn-primary btn-user btn-block" type="submit" value="작성하기"></div>
								        </div>
								    </form>
									<!--end-->
							  </div>
	
					  </div>
			<!-- DataTales Example End-->
		  </div>
	<!-- End Page Content -->
