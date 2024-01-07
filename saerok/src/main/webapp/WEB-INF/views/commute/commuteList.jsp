<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="CommuteList" name="" />
</jsp:include>
<section>
<!-- 	<!-- Begin Page Content -->
	<!-- <div class="container-fluid">

		Page Heading
		<h1 class="h3 mb-2 text-gray-800">근태조회</h1>

		DataTales Example
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">부서별 근태관리</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>&nbsp;</th>
								<th>부서명</th>
								<th>이름</th>
								<th>기간</th>
								<th>사용일수</th>
								<th>분류</th>
								<th>기타</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>&nbsp;</th>
								<th>부서명</th>
								<th>이름</th>
								<th>기간</th>
								<th>사용일수</th>
								<th>분류</th>
								<th>기타</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<th>&nbsp;</th>
								<th>부서명</th>
								<th>이름</th>
								<th>기간</th>
								<th>사용일수</th>
								<th>분류</th>
								<th>기타</th>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<th>부서명</th>
								<th>이름</th>
								<th>기간</th>
								<th>사용일수</th>
								<th>분류</th>
								<th>기타</th>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<th>부서명</th>
								<th>이름</th>
								<th>기간</th>
								<th>사용일수</th>
								<th>분류</th>
								<th>기타</th>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<th>부서명</th>
								<th>이름</th>
								<th>기간</th>
								<th>사용일수</th>
								<th>분류</th>
								<th>기타</th>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<th>부서명</th>
								<th>이름</th>
								<th>기간</th>
								<th>사용일수</th>
								<th>분류</th>
								<th>기타</th>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<th>부서명</th>
								<th>이름</th>
								<th>기간</th>
								<th>사용일수</th>
								<th>분류</th>
								<th>기타</th>
							</tr>
							<tr>
								<th>이름</th>
								<th>직책</th>
								<th>부서</th>
								<th>근무 상태</th>
							</tr>
							<tr>
								<th>이름</th>
								<th>직책</th>
								<th>부서</th>
								<th>근무 상태</th>
							</tr>
							<tr>
								<td>Colleen Hurst</td>
								<td>Javascript Developer</td>
								<td>San Francisco</td>
								<td>39</td>
								<td>2009/09/15</td>
								<td>$205,500</td>
							</tr>
							<tr>
								<td>Sonya Frost</td>
								<td>Software Engineer</td>
								<td>Edinburgh</td>
								<td>23</td>
								<td>2008/12/13</td>
								<td>$103,600</td>
							</tr>
							<tr>
								<td>Jena Gaines</td>
								<td>Office Manager</td>
								<td>London</td>
								<td>30</td>
								<td>2008/12/19</td>
								<td>$90,560</td>
							</tr>
							<tr>
								<td>Quinn Flynn</td>
								<td>Support Lead</td>
								<td>Edinburgh</td>
								<td>22</td>
								<td>2013/03/03</td>
								<td>$342,000</td>
							</tr>
							<tr>
								<td>Charde Marshall</td>
								<td>Regional Director</td>
								<td>San Francisco</td>
								<td>36</td>
								<td>2008/10/16</td>
								<td>$470,600</td>
							</tr>
							<tr>
								<td>Haley Kennedy</td>
								<td>Senior Marketing Designer</td>
								<td>London</td>
								<td>43</td>
								<td>2012/12/18</td>
								<td>$313,500</td>
							</tr>
							<tr>
								<td>Tatyana Fitzpatrick</td>
								<td>Regional Director</td>
								<td>London</td>
								<td>19</td>
								<td>2010/03/17</td>
								<td>$385,750</td>
							</tr>
							<tr>
								<td>Michael Silva</td>
								<td>Marketing Designer</td>
								<td>London</td>
								<td>66</td>
								<td>2012/11/27</td>
								<td>$198,500</td>
							</tr>
							<tr>
								<td>Paul Byrd</td>
								<td>Chief Financial Officer (CFO)</td>
								<td>New York</td>
								<td>64</td>
								<td>2010/06/09</td>
								<td>$725,000</td>
							</tr>
							<tr>
								<td>Gloria Little</td>
								<td>Systems Administrator</td>
								<td>New York</td>
								<td>59</td>
								<td>2009/04/10</td>
								<td>$237,500</td>
							</tr>
							<tr>
								<td>Bradley Greer</td>
								<td>Software Engineer</td>
								<td>London</td>
								<td>41</td>
								<td>2012/10/13</td>
								<td>$132,000</td>
							</tr>
							<tr>
								<td>Dai Rios</td>
								<td>Personnel Lead</td>
								<td>Edinburgh</td>
								<td>35</td>
								<td>2012/09/26</td>
								<td>$217,500</td>
							</tr>
							<tr>
								<td>Jenette Caldwell</td>
								<td>Development Lead</td>
								<td>New York</td>
								<td>30</td>
								<td>2011/09/03</td>
								<td>$345,000</td>
							</tr>
							<tr>
								<td>Yuri Berry</td>
								<td>Chief Marketing Officer (CMO)</td>
								<td>New York</td>
								<td>40</td>
								<td>2009/06/25</td>
								<td>$675,000</td>
							</tr>
							<tr>
								<td>Caesar Vance</td>
								<td>Pre-Sales Support</td>
								<td>New York</td>
								<td>21</td>
								<td>2011/12/12</td>
								<td>$106,450</td>
							</tr>
							<tr>
								<td>Doris Wilder</td>
								<td>Sales Assistant</td>
								<td>Sidney</td>
								<td>23</td>
								<td>2010/09/20</td>
								<td>$85,600</td>
							</tr>
							<tr>
								<td>Angelica Ramos</td>
								<td>Chief Executive Officer (CEO)</td>
								<td>London</td>
								<td>47</td>
								<td>2009/10/09</td>
								<td>$1,200,000</td>
							</tr>
							<tr>
								<td>Gavin Joyce</td>
								<td>Developer</td>
								<td>Edinburgh</td>
								<td>42</td>
								<td>2010/12/22</td>
								<td>$92,575</td>
							</tr>
							<tr>
								<td>Jennifer Chang</td>
								<td>Regional Director</td>
								<td>Singapore</td>
								<td>28</td>
								<td>2010/11/14</td>
								<td>$357,650</td>
							</tr>
							<tr>
								<td>Brenden Wagner</td>
								<td>Software Engineer</td>
								<td>San Francisco</td>
								<td>28</td>
								<td>2011/06/07</td>
								<td>$206,850</td>
							</tr>
							<tr>
								<td>Fiona Green</td>
								<td>Chief Operating Officer (COO)</td>
								<td>San Francisco</td>
								<td>48</td>
								<td>2010/03/11</td>
								<td>$850,000</td>
							</tr>
							<tr>
								<td>Shou Itou</td>
								<td>Regional Marketing</td>
								<td>Tokyo</td>
								<td>20</td>
								<td>2011/08/14</td>
								<td>$163,000</td>
							</tr>
							<tr>
								<td>Michelle House</td>
								<td>Integration Specialist</td>
								<td>Sidney</td>
								<td>37</td>
								<td>2011/06/02</td>
								<td>$95,400</td>
							</tr>
							<tr>
								<td>Suki Burks</td>
								<td>Developer</td>
								<td>London</td>
								<td>53</td>
								<td>2009/10/22</td>
								<td>$114,500</td>
							</tr>
							<tr>
								<td>Prescott Bartlett</td>
								<td>Technical Author</td>
								<td>London</td>
								<td>27</td>
								<td>2011/05/07</td>
								<td>$145,000</td>
							</tr>
							<tr>
								<td>Gavin Cortez</td>
								<td>Team Leader</td>
								<td>San Francisco</td>
								<td>22</td>
								<td>2008/10/26</td>
								<td>$235,500</td>
							</tr>
							<tr>
								<td>Martena Mccray</td>
								<td>Post-Sales support</td>
								<td>Edinburgh</td>
								<td>46</td>
								<td>2011/03/09</td>
								<td>$324,050</td>
							</tr>
							<tr>
								<td>Unity Butler</td>
								<td>Marketing Designer</td>
								<td>San Francisco</td>
								<td>47</td>
								<td>2009/12/09</td>
								<td>$85,675</td>
							</tr>
							<tr>
								<td>Howard Hatfield</td>
								<td>Office Manager</td>
								<td>San Francisco</td>
								<td>51</td>
								<td>2008/12/16</td>
								<td>$164,500</td>
							</tr>
							<tr>
								<td>Hope Fuentes</td>
								<td>Secretary</td>
								<td>San Francisco</td>
								<td>41</td>
								<td>2010/02/12</td>
								<td>$109,850</td>
							</tr>
							<tr>
								<td>Vivian Harrell</td>
								<td>Financial Controller</td>
								<td>San Francisco</td>
								<td>62</td>
								<td>2009/02/14</td>
								<td>$452,500</td>
							</tr>
							<tr>
								<td>Timothy Mooney</td>
								<td>Office Manager</td>
								<td>London</td>
								<td>37</td>
								<td>2008/12/11</td>
								<td>$136,200</td>
							</tr>
							<tr>
								<td>Jackson Bradshaw</td>
								<td>Director</td>
								<td>New York</td>
								<td>65</td>
								<td>2008/09/26</td>
								<td>$645,750</td>
							</tr>
							<tr>
								<td>Olivia Liang</td>
								<td>Support Engineer</td>
								<td>Singapore</td>
								<td>64</td>
								<td>2011/02/03</td>
								<td>$234,500</td>
							</tr>
							<tr>
								<td>Bruno Nash</td>
								<td>Software Engineer</td>
								<td>London</td>
								<td>38</td>
								<td>2011/05/03</td>
								<td>$163,500</td>
							</tr>
							<tr>
								<td>Sakura Yamamoto</td>
								<td>Support Engineer</td>
								<td>Tokyo</td>
								<td>37</td>
								<td>2009/08/19</td>
								<td>$139,575</td>
							</tr>
							<tr>
								<td>Thor Walton</td>
								<td>Developer</td>
								<td>New York</td>
								<td>61</td>
								<td>2013/08/11</td>
								<td>$98,540</td>
							</tr>
							<tr>
								<td>Finn Camacho</td>
								<td>Support Engineer</td>
								<td>San Francisco</td>
								<td>47</td>
								<td>2009/07/07</td>
								<td>$87,500</td>
							</tr>
							<tr>
								<td>Serge Baldwin</td>
								<td>Data Coordinator</td>
								<td>Singapore</td>
								<td>64</td>
								<td>2012/04/09</td>
								<td>$138,575</td>
							</tr>
							<tr>
								<td>Zenaida Frank</td>
								<td>Software Engineer</td>
								<td>New York</td>
								<td>63</td>
								<td>2010/01/04</td>
								<td>$125,250</td>
							</tr>
							<tr>
								<td>Zorita Serrano</td>
								<td>Software Engineer</td>
								<td>San Francisco</td>
								<td>56</td>
								<td>2012/06/01</td>
								<td>$115,000</td>
							</tr>
							<tr>
								<td>Jennifer Acosta</td>
								<td>Junior Javascript Developer</td>
								<td>Edinburgh</td>
								<td>43</td>
								<td>2013/02/01</td>
								<td>$75,650</td>
							</tr>
							<tr>
								<td>Cara Stevens</td>
								<td>Sales Assistant</td>
								<td>New York</td>
								<td>46</td>
								<td>2011/12/06</td>
								<td>$145,600</td>
							</tr>
							<tr>
								<td>Hermione Butler</td>
								<td>Regional Director</td>
								<td>London</td>
								<td>47</td>
								<td>2011/03/21</td>
								<td>$356,250</td>
							</tr>
							<tr>
								<td>Lael Greer</td>
								<td>Systems Administrator</td>
								<td>London</td>
								<td>21</td>
								<td>2009/02/27</td>
								<td>$103,500</td>
							</tr>
							<tr>
								<td>Jonas Alexander</td>
								<td>Developer</td>
								<td>San Francisco</td>
								<td>30</td>
								<td>2010/07/14</td>
								<td>$86,500</td>
							</tr>
							<tr>
								<td>Shad Decker</td>
								<td>Regional Director</td>
								<td>Edinburgh</td>
								<td>51</td>
								<td>2008/11/13</td>
								<td>$183,000</td>
							</tr>
							<tr>
								<td>Michael Bruce</td>
								<td>Javascript Developer</td>
								<td>Singapore</td>
								<td>29</td>
								<td>2011/06/27</td>
								<td>$183,000</td>
							</tr>
							<tr>
								<td>Donna Snider</td>
								<td>Customer Support</td>
								<td>New York</td>
								<td>27</td>
								<td>2011/01/25</td>
								<td>$112,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div> --> 
	<!-- /.container-fluid -->

<!-- 	</div> -->
<style>
	.inner:hover, .ab:hover{
		color: rgb(95,118,232);
		cursor: pointer;
	}
	
	#status{
		display:none;
		position:absolute;
	}
	
	.week1:hover, .week2:hover, .week3:hover, .week4:hover, .week5:hover{
		background-color: rgba(95,118,232, 0.1);
	}
	
	.header:hover{
		background-color: white;
	}
	.week, .week1, .week2, .week3, .week4, .week5{
		display:none;
	}
	
	.today{
		background-color: rgba(95,118,232);
		color : white;
		border-radius : 8px;
		padding: 1px;
	}
	
	.selectDetail{
		border: 1px solid rgb(95,118,232);
	}
</style>
	<h3>근태 현황</h3>
	<div class="row">
		<div class="m-auto">
			<span class="ab" id="before"><i data-feather="chevron-left" class="feather-icon"></i></span>
			<span>${year }.${month }</span>
			<span class="ab" id="after"><i data-feather="chevron-right" class="feather-icon"></i></span>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 m-auto">
			<div id = "summary" class="d-flex col-12 m-auto" style="border: 1px solid rgba(0,0,0,.125); background-color: white">
				<div class="col-4 m-auto" style="height:100%; padding:10px 0px">
					<p class="text-center m-auto" style="font-size:12px">이번주 누적</p>
					<p class="text-center m-auto text-primary">00h 00m 00s</p>
				</div>
				<div class="col-4 m-auto" style="height:100%; padding:10px 0px">
				<p class="text-center m-auto" style="font-size:12px">이번주 초과</p>
					<p class="text-center m-auto text-primary">00h 00m 00s</p>
				</div>
				<div class="col-4 m-auto" style="height:100%; padding:10px 0px">
					<p class="text-center m-auto" style="font-size:12px">이번주 잔여</p>
					<p class="text-center m-auto text-primary">52h 00m 00s</p>
				</div>
			</div>
		</div>
	</div>
	<br><br>
	
	<!-- 이번달 clist 출력  -->
	<c:set var="begin" value="0"/>
	<c:set var="end" value="6"/>
	
	<!-- 이번달이 4주인지 5주인지 구분 -->
	<!-- clist의 크기를 7로 나눠서 몫이 4이고, 나머지가 0이면 : 4주-->
	<!-- 그 외에는 5주-->
	<c:choose>
		<c:when test="${clist.size() / 7 == 4 && clist.size() % 7 == 0}">
			<c:set var="weekNum" value="4"/>
		</c:when>
		<c:otherwise>
			<c:set var="weekNum" value="5"/>
		</c:otherwise>
	</c:choose>
	<c:forEach var="week" begin ="1" end ="${weekNum }">
		<div class="row" style="border-bottom: 2px solid rgba(0,0,0,.125);">
			<!-- 주차 표시 -->
			<div class="d-flex col-12" style="padding: 0px 10px; border-bottom: 2px solid rgba(0,0,0,.125);">
				<div class="text-left col-2">
					<h5 class="chevron cl" id="chevron${week }"><i data-feather="chevron-down" class="feather-icon inner"></i>&nbsp;&nbsp;${week }주차</h5>
				</div>
			</div>
			
			<!-- 헤더 표시, 접었다 펼 수 있음 -->
			<div class="col-12 week${week } header" id="week${week }" style="border-bottom: 1px solid rgba(0,0,0,.125);">
				<div class="col-1 text-center">
					<span class="font-weight-bold">일차</span>
				</div>
				<div class="col-2">
					<span class="font-weight-bold">업무시작</span>
				</div>
				<div class="col-2">
					<span class="font-weight-bold">업무종료</span>
				</div>
				<div class="col-2">
					<span class="font-weight-bold">총 근무시간</span>
				</div>
				<div class="col-5">
					<span>근무시간 상세</span>
				</div>
			</div>
			
			<!-- 일자 표시 (7일) -->
			<c:forEach var="date" items="${clist }" begin ="${begin }" end ="${end }" varStatus ="status">
			<div class="col-12 select week${week }" id="${date.commuteNo }">
				<div class="col-1 text-center">
					<span class="date" id="<fmt:formatDate value="${date.cDate}" type="date" pattern="YYYY/MM/dd"/>"><fmt:formatDate value="${date.cDate}" type="date" pattern="dd"/></span>
					<span class="day"><fmt:formatDate value="${date.cDate}" type="date" pattern="E"/></span>
				</div>
				<div class="col-2">
					<c:set var="it" value="${date.inDtime }"/>
					<c:choose>
						<c:when test="${empty st }">
							<span class="inDtime"></span>
						</c:when>
						<c:otherwise>
							<span class="inDtime">${it }</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-2">
					<c:set var="ot" value="${date.endTime }"/>
					<c:choose>
						<c:when test="${empty ot }">
							<span class="outDtime"></span>
						</c:when>
						<c:otherwise>
							<span class="outDtime">${ot }</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-2">
					<c:choose>
						<c:when test="${empty it or empty ot }">
							<span class="totalTime totalTime1">00h 00m 00s</span>
						</c:when>
						<c:otherwise>
							<span class="totalTime totalTime2">${date.totalTime }</span>
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class="col-5">
					<span class="workDetail">기본00h 00m 00s / 초과00h 00m 00s</span>
				</div>
			</div>
			</c:forEach>
			<c:set var="begin" value="${begin+7 }"/>
			<c:set var="end" value="${end+7 }"/>
		</div>
		<br>
	</c:forEach>
	

	
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	<script>
	var year = ${year}
	var month = ${month}
	
	$('.ab').click(function(){
		if($(this).attr('id') == 'before'){
			month = month - 1;
			if(month < 1){
				year = year - 1;
				month = 12;
			}
		}
		else{
			month = month + 1;
			if(month > 12){
				year = year + 1;
				month = 1;
			}
		}

		var empNo = "${sessionScope.loginEmployee.empNo}";	//로그인유저 사번
		
		$.ajax({
			type: "POST", 
			url:"/selectWorkList",
			dataType:"html",	//html 방식
			data: { 
					year:year, 
					month: month, 
					empNo: empNo
				},
			success : function(result){
				
				$('#workList').html(result);	//html태그 넣기
			},
			error : function(){
				
				alert("근무정보를 조회할 수 없습니다. \n관리자에게 문의하세요.");
			}
		}); 
	})
	
		$(function(){
			
			//총 근무시간 형식 맞추기
			var length = $('.date').length;
			var totalTime = null;
			var totalTimeArr = null;
			
			for(var i = 0; i < length; i++){
				totalTime = $('.totalTime').eq(i).text()
				totalTimeArr = totalTime.split(" ");
				
				var h = Number(totalTimeArr[0].substr(0, totalTimeArr[0].length-1))
				var m = Number(totalTimeArr[1].substr(0, totalTimeArr[1].length-1))
				var s = Number(totalTimeArr[2].substr(0, totalTimeArr[2].length-1))
				
				h = zero(h)
				m = zero(m)
				s = zero(s)
				
				totalTime = h + "h " + m + "m " + s + "s";
				
				$('.totalTime').eq(i).text(totalTime);
			}			
			
			//오늘 날짜 찾기
			var currentDate = new Date();	// 현재시간
			
			var toDate = currentDate.getFullYear() + "/" + (currentDate.getMonth() + 1) + "/" + currentDate.getDate()
			
			//리스트
			var classDate;
			
			for(var i = 0; i < length; i++){
				classDate = $('.date').eq(i).attr('id');
				
				//오늘 날짜가 있는 주차 펼치기
				if(toDate == classDate){
					$('.date').eq(i).addClass('today')
					
					var weekNum = $('.today').parent().parent().attr('class').substr(18, 1);
					
					var weekClass = ".week" + weekNum
					var chevron = "#chevron" + weekNum;
					
					console.log(weekClass)
					console.log(weekNum)
					
					//#chevron?선택 -> remove, addClass
					$(chevron).removeClass('cl');
					$(chevron).addClass('op');
					$(weekClass).addClass('d-flex')
				}
			}
			
			//주별, 일별 누적 근무시간
			var weekNum = "${weekNum}";
			var num = 0;
			
			for(var i = 1; i <= weekNum; i++){
				
				var accumulation = "00h 00m 00s"; //누적시간
				var overtime = "00h 00m 00s"; //초과시간(누적시간 - 주 52시간)
				var leftTime = "52h 00m 00s";	//잔여시간
				
				for(var j = 0; j < 7; j++){
					var accumulation2 = accumulation;
					var overtime2 = overtime
					var leftTime2 = leftTime;
					
					var total = $('.totalTime').eq(num); //totalTime
					var workDetail = $('.workDetail').eq(num); //workDetail
					
					//accumulation
					var h1 = Number(accumulation.substr(0,2));
					var m1 = Number(accumulation.substr(4,2));
					var s1 = Number(accumulation.substr(8,2));
					
					//total
					var h2 = Number(total.text().substr(0,2));
					var m2 = Number(total.text().substr(4,2));
					var s2 = Number(total.text().substr(8,2));
					
					//누적시간 = 전날누적시간 + 하루 근무시간
					var h = h1 + h2
					var m = m1 + m2
					var s = s1 + s2
					
					if(s >= 60) {
						m = m + 1; //분 +1
						s = s - 60;
					}
					
					if(m >= 60) {
						h = h + 1; //시 +1
						m = m - 60;
					}
					
					//누적시간이 52시간을 넘었을 때 -> 초과시간 계산
					if(h>= 52 && m > 0 && s > 0){
						//overtime
						var h3 = h - 52;
						var m3 = m;
						var s3 = s;
						
						h3 = zero(h3)
						m3 = zero(m3)
						s3 = zero(s3)
						
						overtime = h3 + "h " + m3 + "m " + s3 + "s"
					}
					
					//이번주 잔여 (52시간 - 누적시간)
					var s4 = 60;
					var m4 = 60;
					var h4 = 52;
					
					if(s4 - s < 60){
						s4 = s4-s;
						m4 = m4 -1;
					}
					if(m4 - m < 60){
						m4 = m4 - m;
						h4 = h4 - 1;
					}
					h4 = h4 - h
					
					h4 = zero(h4)
					m4 = zero(m4)
					s4 = zero(s4)
					
					//이번주 잔여
					leftTime = h4 + "h " + m4 + "m " + s4 + "s"
					
					////////////////
					h = zero(h)
					m = zero(m)
					s = zero(s)
					
					accumulation = h + "h " + m + "m " + s + "s"
					
					//오늘 날짜이고, 총 근무시간이 00h 00m 00s이면(출퇴근 x) -> 누적시간 표시x
					if($('.date').eq(num).attr('class').includes('today')&&total.text() == '00h 00m 00s'){
						$('#summary').children().eq(0).children().eq(1).text(accumulation2)
						$('#summary').children().eq(1).children().eq(1).text(overtime2)
						$('#summary').children().eq(2).children().eq(1).text(leftTime2)
						break;
					}
					//오늘 날짜이면 -> 누적시간 표시o
					else if($('.date').eq(num).attr('class').includes('today')){
						$('#summary').children().eq(0).children().eq(1).text(accumulation)
						$('#summary').children().eq(1).children().eq(1).text(overtime)
						$('#summary').children().eq(2).children().eq(1).text(leftTime)
						
						workDetail.text("기본" + accumulation + " / 초과" + overtime);
						break;
					}
					else{
						workDetail.text("기본" + accumulation + " / 초과" + overtime);
					}
					num++;
				}
			}

			//자릿수에 "0"추가하기
			function zero(n){
				
				if(n < 10){
					n = "0" + n;
				}
				return n;
			}
			
			
			//주차 클릭시 아래 리스트 펼침, 닫힘
			$(".chevron").click(function(){
				
				var week = $(this).attr('id').substr(7, 1);
				
				if($(this).attr('class').includes('cl') == true) {
					$(this).removeClass('cl');
					$(this).addClass('op');
					
					//week? 클래스에 d-flex추가
					$(".week" + week).addClass('d-flex')
				}
				
				else if($(this).attr('class').includes('op') == true){
					
					$(this).removeClass('op');
					$(this).addClass('cl');
					
					//week? 클래스에 d-flex제거
					$(".week" + week).removeClass('d-flex')
					
				}
			})
		})
		
	</script>