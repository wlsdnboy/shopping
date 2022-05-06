<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/navbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
						<td style="border: none; float: right;">
							<button data-oper="modify" id="boardModBtn" type="button"
								class="btn btn-warning">
								<a href="/modify?bno=${board.bno }">수정</a>
							</button>
							<button data-oper="list" id="boardListBtn" type="button"
								class="btn btn-dark">
								<a href="/list?pageNum=${cri.pageNum }&amount=${cri.amount }">
									목록 </a>
							</button>
						</td>

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
		<ul class="list-group list-group-flush">
			<li class="list-group-item">An item</li>
			<li class="list-group-item">A second item</li>
			<li class="list-group-item">A third item</li>
			<li class="list-group-item">A fourth item</li>
			<li class="list-group-item">And a fifth one</li>
		</ul>
	</div>

	<!-- 덧글 목록 끝 -->





	<!-- 덧글 입력 창  -->
	<br />
	<br />
	<br />
	<div style="width: 60%; margin: auto;">
		<hr>
		<form method="post" action="/register">

			<div class="mb-3">
				<label class="form-label"> 작성자 </label> <input type="text"
					class="form-control" name="writer" style="width: 10%;">

			</div>

			<label class="form-label">내용 </label>
			<textarea name="content" class="form-control"
				style="height: 100px; resize: none;"></textarea>


			<br />
			<button type="submit" class="btn btn-dark" style="float: right;">댓글
				등록</button>
		</form>
	</div>
	<br />
	<br />


	<!-- 덧글 입력 창  -->


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
		$(document).ready(function() {
			var formObj = $("form");
			var bnoValue = '<c:out value="${board.bno}"/>';

			// 덧글 작성일 항목.
			var modalRegisterBtn = $("#modalRegisterBtn");
			// 모달에서 표시되는 덧글쓰기 버튼.
			var modalInputReply = modal.find("input[name='reply']");
			// 덧글 내용
			var modalInputReplyer = modal.find("input[name='replyer']");// 덧글

			$("#addReplyBtn").on("click", function(e) {
				// 덧글 쓰기 버튼을 클릭한다면,
				modal.find("input").val("");
				// 모달의 모든 입력창을 초기화
				modalInputReplyDate.closest("div").hide();
				// closest : 선택 요소와 가장 가까운 요소를 지정.
				// 즉, modalInputReplyDate 요소의 가장 가까운
				// div를 찾아서 숨김. (날짜창 숨김)
				modal.find("button[id != 'modalCloseBtn']").hide();
				// 모달창에 버튼이 4개 인데, 닫기 버튼을 제외하고 숨기기.
				modalRegisterBtn.show(); // 등록 버튼은 보여라.
				$("#myModal").modal("show");// 모달 표시.
			});
			// 모달창 닫기
			$("#modalCloseBtn").on("click", function(e) {
				modal.modal("hide");
				// 모달 닫기 라는 버튼을 클릭한다면 모달창을 숨김.
			});
			// 덧글 쓰기.
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
				});
			});
			// 덧글 목록 보이기.
			replyService.getList({
				bno : bnoValue,
				page : 1
			}, function(list) {
				for (var i = 0, len = list.length || 0; i < len; i++) {
					console.log(list[i]);
				}
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
		});
	</script>

	<%@ include file="includes/footer.jsp"%>
</body>


</html>