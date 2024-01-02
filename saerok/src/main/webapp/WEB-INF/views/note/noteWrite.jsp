<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- 전체 틀 -->
<div id="container">
	<div id="drag_wrap">
		<div id="drag" class="ui-draggable ui-draggable-handle"
			style="left: 0px; width: 15px; right: auto; top: 0px;"></div>
	</div>
	
	<!-- header 추가하기 -->
	<div class="new-split-item left" style="width: inherit">
		<div class="new-sidebar">
			<a class="main-btn" href="/gabia.biz/mail/webmail/m_write"> <span>쪽지쓰기</span>
			</a>
			<!-- 메뉴 활성바 내리기 추가할 것 -->

			<!-- 편지쓰는 폼 추가 -->
			<div id="contents" style="left: 276px;">
				<form name="frmMain" id="frmMain" enctype="multipart/form-data"
					method="post" target="hiddenFrame" style="display: inline"
					action="/gabia.biz/mail/webmail/m_send_mail/save/auto_save">

					<!-- 받는 사람 목록 표시 부분 추가 -->
					<div class="write_input">
						<label for="write_txt3">받는 사원 주소록</label>
						<div class="txt to-list">
							<div class="position">
								<ul id="to_list" class="recipient-list"></ul>
								<textarea class="cc_addr" name="to_addr" id="to_addr"
									onkeydown="if(event.keyCode==13)return false;"
									placeholder="메일 주소 사이에 ,(콤마) 또는 ;(세미콜론)으로 구분하여 입력하세요."
									autocomplete="off" tabindex="1"></textarea>
								<a href="#" class="addaddr icon"
									onclick="addressbook.getAddressbook(FROM_MAIL, 'MW_Address.EnterInitialAddress', 'MW_Address.applyAddress');"></a>
							</div>
						</div>
					</div>

					<!-- 쪽지 내용 입력 부분 추가 -->
					<div class="write_input">
						<label for="write_txt3">쪽지 내용 작성</label>
						<div class="txt message">
							<div class="position">
								<textarea name="message_content" id="message_content"
									tabindex="3"></textarea>
							</div>
						</div>
					</div>

					<!-- 제목 입력 부분 -->
					<div class="write_input">
						<label for="write_txt3">제목</label>
						<div class="txt title">
							<div class="position">
								<input name="subject" type="text" value tabindex="4"
									maxlength="180">
							</div>
						</div>
					</div>

					<!-- filebox area -->
					<div class="write_input" id="m_file_attach_area"
						style="display: block">
						<div class="txt file">
							<div class="position">
								<div class="file-list" id="m_file_upload_holder">
									<div class="top">
										<div class="left">
											<a href="#" class="addfile"
												onclick="HiworksMailUploader.selectFiles()">파일 첨부</a> <a
												href="#" class="icon hidecont hide"
												style="background-position: -258px -38px;"
												id="m_write_attach_file"></a>
											<div class="dropdown hide" id="m_write_attach_file_detail">…</div>
										</div>
										<div class="center" style="display: block"
											id="m_fileupload_drag_txt">여기로 파일을 끌어놓으세요.</div>
										<div class="list" style="display: none"
											id="div_m_attach_file_list">…</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="write_input" id="m_file_attach_area_old"
						style="display: none">…</div>

					<!-- 보내기, 저장하기 버튼 추가 -->
					<fieldset>
						<span class="detail_select"> <a href="#"
							onclick="sendNote();">보내기</a>
						</span> <span class="detail_select"> <a href="#"
							onclick="saveNote();">저장하기</a>
						</span>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>
