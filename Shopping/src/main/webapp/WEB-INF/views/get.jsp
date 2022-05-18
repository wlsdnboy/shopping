<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/navbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>




<%
	pageContext.setAttribute("LF", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/style.css" rel="stylesheet">
</head>
<body>

	<div style="width: 60%; margin: auto;">
		<form>

			<table class="table mt-5">
				<thead>
					<tr>
						<th scope="col"><c:out value="${board.title }" /></th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="col"><c:out value="${board.writer }" /></th>

					</tr>
					<tr>
						<td scope="row"><c:out
								value="${fn:replace(board.content, LF, '<br>')}"
								escapeXml="false" /></td>

					</tr>
					<tr>
						<td>


							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading">첨부파일</div>
										<div class="panel-body">
											<div class="uploadResult">
												<ul></ul>
											</div>
										</div>
									</div>
								</div>
							</div>
					</tr>
					<tr>
						<td style="border: none; float: right;"><sec:authentication
								property="principal" var="pinfo" /> <sec:authorize
								access="isAuthenticated()">
								<c:if test="${pinfo.username eq board.writer }">
									<button data-oper="modify" id="boardModBtn" type="button"
										class="btn btn-warning">
										<a href="/modify?bno=${board.bno }">수정</a>
									</button>
								</c:if>
							</sec:authorize>

							<button data-oper="list" id="boardListBtn" type="button"
								class="btn btn-dark">
								<a href="/list?pageNum=${cri.pageNum }&amount=${cri.amount }">
									목록 </a>
							</button></td>

					</tr>
				</tbody>
			</table>


		</form>

		<form id="operForm" action="/modify" method="get">
			<input type="hidden" id="bno" name="bno" value="${board.bno }" /> <input
				type="hidden" name="pageNum" value="${cri.pageNum }" /> <input
				type="hidden" name="amount" value="${cri.amount }" /> <input
				type="hidden" name="type" value="${cri.type }"> <input
				type="hidden" name="keyword" value="${cri.keyword }">
			<!-- 폼을 생성해서 게시물 번호를 숨김값으로 전달 -->
		</form>
	</div>


	<!--덧글 목록 시작  -->
	<br />

	<div style="width: 60%; margin: auto;">
		&nbsp;
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
  <path
				d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
</svg>
		댓글목록 <br /> <br />
		<ul class="chat">
			<li></li>

		</ul>
		<br />
		<div class="panel-footer"></div>
		<br />
		<sec:authorize access="isAuthenticated()">
			<button class="btn btn-dark btn-reply" style="float: right;">댓글
				등록</button>
		</sec:authorize>

		<br /> <br />
	</div>

	<!-- 덧글 목록 끝 -->








	<!--덧글 입력 모달창 시작  -->

	<!-- 덧글 입력 모달창 시작 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					&times;
					<h4 class="modal-title" id="myModalLabel">덧글 창</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>덧글</label> <input class="formcontrol" name="reply"
							value="새 덧글">
					</div>
					<div class="form-group">
						<label>작성자</label> <input class="formcontrol" name="replyer"
							value="replyer">
					</div>
					<div class="form-group">
						<label>덧글 작성일</label> <input class="formcontrol" name="replyDate"
							value="">
					</div>
				</div>
				<div class="modal-footer">
					<button id="modalModBtn" type="button" class="btn
btnwarning">수정</button>
					<button id="modalRemoveBtn" type="button" class="btn
btndanger">삭제</button>
					<button id="modalRegisterBtn" type="button" class="btn btnprimary">등록</button>
					<button id="modalCloseBtn" type="button" class="btn
btndefault">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 덧글 입력 모달창 끝 -->



	<script type="text/javascript" src="/resources/js/reply.js"></script>

	<script>
		$(document)
				.ready(
						function() {
							
							var
							csrfHeaderName="${_csrf.headerName}";
							var csrfTokenValue="${_csrf.token}";
							$(document).ajaxSend(function(e,xhr,options){
							xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
							});

							var operForm = $("#operForm");
							/* 문서중 form 요소를 찾아서 변수에 할당. */
							$('button[data-oper="modify"]').on(
									"click",
									function(e) {
										/* 버튼이 클릭된다면 아래 함수 수행, e라는 이벤트 객체를
										전달하면서 */
										operForm.attr("action", "/modify")
												.submit();
									});
							$('button[data-oper="list"]').on(
									"click",
									function(e) {
										/* 버튼이 클릭된다면 아래 함수 수행, e라는 이벤트 객체를
										전달하면서 */
										operForm.find("#bno").remove();
										operForm.attr("action", "/list")
												.submit();
									});

							$("#boardModBtn").on("click", function(e) {
								e.preventDefault();
								var operation = $(this).data("oper");
								// 버튼에서 oper 속성을 읽어서 변수에 할당
								console.log(operation);

								if (operation == 'modify') {
									formObj.attr("action", "/modify");
									// form의 action 속성을 변경한다
								}
								formObj.submit();

							});

							$("#boardListBtn").on("click", function(e) {
								e.preventDefault();

								var operation = $(this).data("oper");

								if (operation == 'list') {
									console.log(operation);

									formObj.attr("action", "/list");

								}
								formObj.submit();
							});

							
							var bnoValue = '<c:out value="${board.bno}"/>';
							
							var replyer=null;
								<sec:authorize access="isAuthenticated()">
							replyer = '${pinfo.username}';
							</sec:authorize>
							
							//console.log(replyService);
							var modal = $("#myModal");
							// 덧글 용 모달.
							var modalInputReplyDate = modal
									.find("input[name='replyDate']");
							// 덧글 작성일 항목.
							var modalRegisterBtn = $("#modalRegisterBtn");
							// 모달에서 표시되는 덧글쓰기 버튼.
							var modalInputReply = modal
									.find("input[name='reply']");
							// 덧글 내용
							var modalInputReplyer = modal
									.find("input[name='replyer']");// 덧글 작성자.
							//덧글 입력 모달창 보이기.

							var bnoValue = '<c:out value="${board.bno}"/>';

							$(".btn-reply")
									.on(
											"click",
											function(e) {
												// 새덧글 버튼을 클릭한다면,
												modal.find("input").val("");
												
												
												modal.find("input[name='replyer']").val(replyer);
												modal.find("input[name='replyer']").attr("readonly" , "readonly");
												modalInputReplyDate.closest("div").hide();
												// 모달의 모든 입력창을 초기화
												modalInputReplyDate.closest(
														"div").hide();
												// closest : 선택 요소와 가장 가까운 요소를 지정.
												// 즉, modalInputReplyDate 요소의 가장 가까운
												// div를 찾아서 숨김. (날짜창 숨김)
												modal
														.find(
																"button[id != 'modalCloseBtn']")
														.hide();
												// 모달창에 버튼이 4개 인데, 닫기 버튼을 제외하고 숨기기.
												modalRegisterBtn.show(); // 등록 버튼은 보여라.
												$("#myModal").modal("show");// 모달 표시.
											});

							// 모달창 닫기
							$("#modalCloseBtn").on("click", function(e) {
								modal.modal("hide");
								// 덧글 모달 닫기 라는 버튼을 클릭한다면 모달창을 숨김.
							});

							// 모달창에서 덧글 쓰기.
							modalRegisterBtn.on("click", function(e) {
								// 덧글 등록 버튼을 눌렀다면,
								var reply = {
									reply : modalInputReply.val(),
									replyer : modalInputReplyer.val(),
									bno : bnoValue
								}; // ajax로 전달할 reply 객체 선언 및 할당.
								replyService.add(reply, function(result) {
									alert(result);
									// ajax 처리후 결과 리턴.
									modal.find("input").val("");
									
									
									
									// 모달창 초기화
									modal.modal("hide");// 모달창 숨기기

									// 덧글 작성 즉시 목록 갱신용 함수 호출.
									showList(-1);
									// -1 이나 99나 현재는 영향이 없지만, 차후 덧글의 페이징 처리에서 -1 사용 예정.
								});// 덧글 쓰기 함수 끝
							});// 덧글 쓰기버튼처리 끝.

							var replyUL = $(".chat");

							function showList(page) {
								replyService
										.getList(
												{
													bno : bnoValue,
													page : page || 1
												},
												function(replyTotalCnt, list) {
													console
															.log("replyTotalCnt :"
																	+ replyTotalCnt);

													if (page == -1) {
														// 페이지 번호가 음수 값 이라면,
														pageNum = Math
																.ceil(replyTotalCnt / 10.0);
														// 게시물별 덧글 총갯수가 11일때, 2를 리턴.
														// 덧글의 마지막 페이지 구하기.
														showList(pageNum);
														// 덧글 목록 새로고침(갱신)
														return;
													}

													var str = "";

													if (list == null
															|| list.length == 0) {
														replyUL.html("");
														return;
													}// 목록이 없을때 처리 끝.

													for (var i = 0, len = list.length || 0; i < len; i++) {
														str += "<li class='left ";
										str += "clearfix' data-rno='";
										str += list[i].rno+"'>";
														str += "<div><div class='header' ";
										str += "><strong class='";
										str += "primary-font'>";
														str += list[i].replyer
																+ "</strong>";
														str += "<small class='float-sm-right '>";
														str += replyService
																.displayTime(list[i].replyDate)
																+ "</small></div>";
														str += "<p>"
																+ list[i].reply;
														str += "</p></div></li>";
													}
													replyUL.html(str);

													showReplyPage(replyTotalCnt);

												});//end
							}//end_showList
							showList(-1);

							var pageNum = 1;
							var replyPageFooter = $(".panel-footer");

							function showReplyPage(replyCnt) {
								var endNum = Math.ceil(pageNum / 10.0) * 10;
								// pageNum : 1 이라고 가정하면,
								// Math.ceil(1/10.0) 처리하고 *10, 즉 endNum : 10
								var startNum = endNum - 9;// - 나올지도..
								var prev = startNum != 1;// false = (1 !=1)
								var next = false;
								// replyCnt : 384, endNum : 39
								if (endNum * 10 >= replyCnt) {// 100 >= 384
									endNum = Math.ceil(replyCnt / 10.0);
								}
								if (endNum * 10 < replyCnt) {
									next = true;
								}
								var str = "<ul class='pagination";
								str+=" justify-content-center'>";
								if (prev) {
									str += "<li class='page-item'><a ";
									str += "class='page-link' href='";
									str += (startNum - 1);
									str += "'>이전</a></li>";
								}
								for (var i = startNum; i <= endNum; i++) {
									var active = pageNum == i ? "active" : "";
									str += "<li class='page-item "+ active
									+"'><a class='page-link' ";
									str+="href='"+i+"'>"
											+ i + "</a></li>";
								}
								if (next) {
									str += "<li class='page-item'>";
									str += "<a class='page-link' href='";
									str += (endNum + 1) + "'>다음</a></li>";
								}
								str += "</ul>";
								console.log(str);
								replyPageFooter.html(str);
							}

							replyPageFooter.on("click", "li a", function(e) {
								e.preventDefault();
								var targetPageNum = $(this).attr("href");
								pageNum = targetPageNum;
								showList(pageNum);
							});

							var modalModBtn = $("#modalModBtn");
							var modalRemoveBtn = $("#modalRemoveBtn");

							$(".chat")
									.on(
											"click",
											"li",
											function(e) {
												//클래스 chat 을 클릭하는데, 하위 요소가 li라면,
												var originalReplyer = modalInputReplyer.val();
												var rno = $(this).data("rno");
												// 덧글에 포함된 값들 중에서 rno를 추출하여 변수 할당.
												console.log(rno);

												replyService
														.get(
																rno,
																function(reply) {
																	modalInputReply
																			.val(reply.reply);
																	modalInputReplyer
																			.val(reply.replyer);
																	modalInputReplyDate
																			.val(
																					replyService
																							.displayTime(reply.replyDate))
																			.attr(
																					"readonly",
																					"readonly");
																	// 댓글 목록의 값들을 모달창에 할당.
																	modal
																			.data(
																					"rno",
																					reply.rno);
																	// 표시되는 모달창에 rno 라는 이름으로 data-rno를 저장.
																	modal
																			.find(
																					"button[id !='modalCloseBtn']")
																			.hide();
																	modalModBtn
																			.show();
																	modalRemoveBtn
																			.show();
																	// 버튼 보이기 설정.
																	$(
																			"#myModal")
																			.modal(
																					"show");
																});
											}); // 끝_덧글 읽기.

							modalModBtn.on("click", function(e) {
								var originalReplyer =
									modalInputReplyer.val();

								var reply = {
									rno : modal.data("rno"),
									reply : modalInputReply.val(),
									replyer : originalReplyer
								};
								
								if(!replyer){
									alert("로그인후 수정 가능");
									modal.modal("hide");
									return;
								}
								if(replyer != originalReplyer){
									alert("자신이 작성한 댓글만 수정 가능");
									modal.modal("hide");
									return;
								
								}
									
									
								replyService.update(reply, function(result) {
									alert(result);
									modal.modal("hide");
									showList(-1);
								});
							});

							modalRemoveBtn.on("click", function(e) {
								var rno = modal.data("rno");
								var originalReplyer =
									modalInputReplyer.val();
									if(!replyer){
									alert("로그인후 삭제 가능");
									modal.modal("hide");
									return;
									}
									if(replyer != originalReplyer){
									alert("자신이 작성한 댓글만 삭제 가능");
									modal.modal("hide");
									return;
									}

								replyService.remove(rno,originalReplyer, function(result) {
									alert(result);
									modal.modal("hide");
									showList(-1);
								});
							});

							(function() {
								var bno = '<c:out value="${board.bno}"/>';
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
																		str += "<li data-path='";
										str+=attach.uploadPath+"'data-uuid='";
										str+=attach.uuid+"' data-filename='";
										str+=attach.fileName+"' data-type='";
										str+=attach.fileType+"'><div>";
																		str += "<img src='/resources/img/attach.png'  width='20' height='20'>";
																		str += "<span>"
																				+ attach.fileName
																				+ "</span><br/> ";
																		str += "</div></li>";

																	});
													$(".uploadResult ul").html(
															str);

												});
							})();

							$(".uploadResult")
									.on(
											"click",
											"li",
											function(e) {
												console.log("download file");
												var liObj = $(this);
												var path = encodeURIComponent(liObj
														.data("path")
														+ "/"
														+ liObj.data("uuid")
														+ "_"
														+ liObj
																.data("filename"));
												self.location = "/download?fileName="
														+ path;
											});

						});
	</script>

	<%@ include file="includes/footer.jsp"%>
</body>


</html>