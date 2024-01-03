<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="title" value="쪽지작성"/>
</jsp:include>


<div class="content_title" id="content_title">
<fieldset>
<span class="detail_select">
	<a href="#" onclick="NoteWrite.Send();">보내기</a>

	<a href="#" onclick="NoteWrite.Save();">임시저장</a>
</span>
</fieldset>
</div>


<div class="content_inbox" style>
<div class="cont_box">
<fieldset>
<div class="write_field">
<div class="write_input">
<p>받는 사원</p>
<div class="txt">
<div class="position">
<textarea class="cc_addr" name="to_addr" id="to_addr" onkeydown="if(event.keyCode==13)return false;" placeholder="메일 주소 사이에 ,(콤마) 또는 ;(세미콜론)으로 구분하여 입력하세요." autocomplete="off" tabindex="1"></textarea>
<a href="#" class="addaddr icon" onclick=";addressbook.getAddressbook(FROM_MAIL, 'MW_Address.EnterInitialAddress', 'MW_Address.applyAddress');"></a>

</div>
<div class="write_input">
<label for="write_txt3">제목</label>
<div class="txt title">
<div class="position">
<input name="subject" type="text" value tabindex="4" maxlength="180">
</div>
</div>
</div>
<div class="write_input" id="m_file_attach_area" style="display:block">
<div class="txt file">
<div class="position">

<div class="file-list" id="m_file_upload_holder">
<div class="top">
<div class="left">
<a href="#" class="addfile" onclick="HiworksMailUploader.selectFiles()">파일 첨부</a>
<a href="#" class="icon hidecont hide" style="background-position: -258px -38px;" id="m_write_attach_file"></a>
</div>
</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>






















