<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/navbar.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



</head>
<body>


	<br>
	<br>
	<br>

	<div style="width: 70%; margin: auto;">
		<form role="form" method="post" action="/modify">

			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" /> <input type="hidden" name="pageNum"
				value="${cri.pageNum }" /> <input type="hidden" name="amount"
				value="${cri.amount }" /> <input type="hidden" name="type"
				value="${cri.type }"> <input type="hidden" name="keyword"
				value="${cri.keyword }">
			<div class="mb-3">
				<input type="hidden" name=bno value="${board.bno }" /> <label
					class="form-label">제목</label> <input class="form-control"
					name='title' value=${board.title }>

			</div>
			<div class="mb-3">
				<label class="form-label"> 작성자 </label> <input type="text"
					class="form-control" name="writer" value=${board.writer } readonly>

			</div>




			<br>
			<textarea name="content" class="form-control"
				style="height: 500px; resize: none;">${board.content }</textarea>


			<br />

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading"></div>
						<div class="panel-body">
							<div class="form-group uploadDiv">
								파일 첨부: <input type="file" name="uploadFile" multiple>
								<!-- http://tcpschool.com/html-tagattrs/input-multiple -->
							</div>
							<div class="uploadResult">
								<ul></ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<br />

			<div style="float: right;">
				<sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="isAuthenticated()">
					<!-- 인증된 사용자만 허가 -->
					<c:if test="${pinfo.username eq
board.writer }">
						<!-- 인증되었으면서 작성자가 본인
일때 수정 버튼 표시 -->
						<button type="submit" data-oper='modify' class="btn btnsuccess">Modify</button>
						<button type="submit" data-oper='remove' class="btn btndanger">Remove</button>
					</c:if>
				</sec:authorize>
				<button type="submit" data-oper='list' class="btn btn-info">List</button>
			</div>

			<br /> <br />
		</form>
	</div>
	<script>
		$(document)
				.ready(
						function() {
							var formObj = $("form"); // 문서 중 form 요소를 찾아서 변수에 할당.
							$('button')
									.on(
											"click",
											function(e) {
												// 버튼이 클릭된다면 아래 함수 수행. e라는 이벤트 객체를 전달하면서.
												e.preventDefault(); // 기본 이벤트 동작 막기.
												var operation = $(this).data(
														"oper");
												// 버튼에서 oper 속성 읽어서 변수에 할당.
												console.log(operation);
												// 브라우저 로그로 oper값 출력.

												if (operation === 'remove') {
													formObj.attr("action",
															"/remove")
													// form에 액션 속성을 변경.
												} else if (operation === 'list') {
													/* self.location = "/board/list";
													return; */
													/* 폼의 내용을 비우고 재설정 하는 이유는, 
													목록 이동시 게시물의 제목, 내용, 작성자 등은 전달할 필요 없기 때문에 */
													var pageNumTag = $("input[name='pageNum']");
													var amountTag = $("input[name='amount']");
													var keywordTag = $("input[name='keyword']");
													var typeTag = $("input[name='type']");

													formObj.attr("action",
															"/list")
															.attr("method",
																	"get");
													formObj.empty();//폼의 내용들 비우기.
													formObj.append(pageNumTag);
													formObj.append(amountTag);
													formObj.append(keywordTag);
													formObj.append(typeTag);
												}

												// 수정 처리에 대한 추가 구현 시작.(첨부 파일 정보를 디비에 저장하기 위한 부분)
												else if (operation === 'modify') {
													var str = "";
													$(".uploadResult ul li")
															.each(
																	function(i,
																			obj) {
																		var jobj = $(obj);
																		console
																				.log(jobj
																						.data("filename"));
																		str += "<input type='hidden' name='attachList[";
																		str += i
																				+ "].fileName' value='"
																				+ jobj
																						.data("filename")
																		str += "'>";

																		str += "<input type='hidden' name='attachList[";
																		str += i
																				+ "].uuid' value='"
																				+ jobj
																						.data("uuid")
																		str += "'>";

																		str += "<input type='hidden' name='attachList[";
																		str += i
																				+ "].uploadPath' value='"
																				+ jobj
																						.data("path")
																		str += "'>";

																		str += "<input type='hidden' name='attachList[";
																		str += i
																				+ "].fileType' value='"
																				+ jobj
																						.data("type")
																		str += "'>";
																	});
													formObj.append(str);
												}
												// 수정 처리에 대한 추가 구현 끝.

												formObj.submit();
											});// end_button_event

							// 수정 처리는 쓰기 + 읽기.
							// 첨부파일 목록, 삭제, 추가.(첨부파일 목록 표시)
							(function() {
								var bno = '<c:out value="${board.bno}"/>';
								// 화면상에 공유된 bno 값 가져와 사용 준비.
								$
										.getJSON(
												"/getAttachList",
												{
													bno : bno
												},
												function(arr) {
													console.log(arr);
													var str = "";
													$(arr)
															.each(
																	function(i,
																			attach) {
																		var fileCallPath = encodeURIComponent(attach.uploadPath
																				+ "/"
																				+ attach.uuid
																				+ "_"
																				+ attach.fileName);
																		str += "<li data-path='";
							str += attach.uploadPath+"' data-uuid='";
							str += attach.uuid+"' data-filename='";
							str += attach.fileName+"' data-type='";
							str += attach.fileType+"'><div>";
																		str += "<img src='/resources/img/attach.png' width='20' height='20'> ";
																		str += "<span>"
																				+ attach.fileName
																				+ "</span>&nbsp;&nbsp;";
																		str += "<b data-file='"+fileCallPath;
							str += "' data-type='file'>[x]</b>";
																		str += "</div></li>";
																	});
													$(".uploadResult ul").html(
															str);
												});
							})();
							// 첨부파일 목록 표시 스크립트-끝

							var csrfHeaderName = "${_csrf.headerName}";
							var csrfTokenValue = "${_csrf.token}";

							// 첨부파일은 0개 이상 여러개.(첨부파일 목록 중에서 일부 삭제 처리)
							// 첨부파일의 x 버튼을 눌렀을때 처리 스크립트
							$(".uploadResult")
									.on(
											"click",
											"b",
											function(e) {
												console.log("delete file");
												var delConfirm = confirm('선택한 파일을 삭제 하시겠습니까?\n확인을 선택하면 복구 불가 합니다.');
												if (delConfirm) {
													var targetFile = $(this)
															.data("file");
													var type = $(this).data(
															"type");
													var targetLi = $(this)
															.closest("li");
													$
															.ajax({
																url : '/deleteFile',
																data : {
																	fileName : targetFile,
																	type : type
																},
																dataType : 'text',
																type : 'POST',
																beforeSend : function(
																		xhr) {
																	xhr
																			.setRequestHeader(
																					csrfHeaderName,
																					csrfTokenValue);
																},

																success : function(
																		result) {
																	alert(result);
																	targetLi
																			.remove();
																}
															});
												} else {
													return;
												}
											});// 첨부 파일 일부 삭제 처리 끝.

							// 첨부파일 등록과 표시 시작	
							var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
							// 정규표현식. 일부 파일의 업로드 제한.
							// https://regexper.com/

							var maxSize = 5242880; // 5MB

							function checkExtension(fileName, fileSize) {
								if (fileSize >= maxSize) {
									alert("파일 크기 초과");
									return false;
								}

								if (regex.test(fileName)) {
									alert("해당 종류의 파일은 업로드 불가.");
									return false;
								}
								return true;
							}

							$("input[type='file']")
									.change(
											function(e) {
												var formData = new FormData();
												var inputFile = $("input[name='uploadFile']");
												var files = inputFile[0].files;
												for (var i = 0; i < files.length; i++) {
													if (!checkExtension(
															files[i].name,
															files[i].size)) {
														return false;
													}
													formData.append(
															"uploadFile",
															files[i]);
												}

												$
														.ajax({
															url : '/uploadAjaxAction',
															processData : false,
															contentType : false,
															data : formData,
															type : 'POST',
															dataType : 'json',
															beforeSend : function(
																	xhr) {
																xhr
																		.setRequestHeader(
																				csrfHeaderName,
																				csrfTokenValue);
															},

															success : function(
																	result) {
																console
																		.log(result);
																showUploadResult(result);
																// 첨부파일 업로드 결과를 json으로 받으면,
																// 그 내용을 화면에 표시.
															}
														});// end_ajax
											});// end_change

							function showUploadResult(uploadResultArr) {
								if (!uploadResultArr
										|| uploadResultArr.length == 0) {
									// json 처리 결과가 없다면 함수 종료.
									return;
								}
								var uploadUL = $(".uploadResult ul");
								var str = "";

								// each 구문은 전달된 배열의 길이 만큼, 
								// each 이후의 함수를 반복 처리.
								$(uploadResultArr)
										.each(
												function(i, obj) {
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/"
															+ obj.uuid
															+ "_"
															+ obj.fileName);
													// encodeURIComponent : 
													// uri 로 전달되는 특수문자의 치환.
													// & ?
													var fileLink = fileCallPath
															.replace(
																	new RegExp(
																			/\\/g),
																	"/");
													// 전달되는 값들 중에서 역슬러시를 찾아서 슬러시로 변경.

													str += "<li data-path='";
				str+=obj.uploadPath+"' data-uuid='";
				str+=obj.uuid+"' data-filename='";
				str+=obj.fileName+"' data-type='";
				str+=obj.image+"'><div>";
													str += "<img src='/resources/img/attach.png' width='20' height='20'> ";
													str += "<span>"
															+ obj.fileName
															+ "</span> ";
													str += "<b data-file='"+fileCallPath;
				str+="' data-type='file'>[x]</b>";
													str += "</div></li>";
												});
								uploadUL.append(str);
							}// end_showUploadResult
							// 첨부파일 서버 공간에 등록 및 목록 갱신 - 끝

							// 수정 버튼을 눌렀을때 첨부파일 정보 숨김값으로 폼 전송 처리.

						});// end_ready
	</script>



</body>

<%@ include file="includes/footer.jsp"%>
</html>
