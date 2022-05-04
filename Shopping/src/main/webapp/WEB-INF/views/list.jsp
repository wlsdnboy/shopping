<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/navbar.jsp"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>Hello, world!</title>
<link href="resources/css/style.css" rel="stylesheet">

</head>
<body style="width: 100%; height: 100%">

	<div style="width: 70%; margin: auto; margin-top: 30px;">
		<h1>문의 사항</h1>
		<br />
		<p>&nbsp;Q&A</p>

	</div>

	<table class="table table-hover  dataTable" style="width: 70%;">
		<thead class="table-dark">
			<tr>
				<th width="10%">번호</th>
				<th width="40%">제목</th>
				<th width="20%" style="text-align: left;">작성자</th>
				<th width="20%" style="text-align: left;">작성일</th>

			</tr>
		</thead>
		<tbody>

			<c:forEach var="board" items="${list }">
				<tr>
					<td><c:out value="${board.bno }" /></td>
					<td><a href="${board.bno }" class="move"><c:out
								value="${board.title }" /></a></td>
					<td style="text-align: left;"><c:out value="${board.writer }" /></td>
					<td style="text-align: left;"><fmt:formatDate
							pattern="yyyy-MM-dd" value="${board.regdate }" /></td>

				</tr>

			</c:forEach>
		</tbody>
	</table>

	<table>
		<!-- 페이지네이션 -->
		<tr>
			<td>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev}">
							<li class="page-item previous"><a
								href="${pageMaker.startPage-1 }" class="page-link"> Prev</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }">

							<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'>

								<a href="${num }" class="page-link">${num }</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next }">
							<li class="page-item next"><a href="${pageMaker.endPage+1 }"
								class="page-link"> Next</a></li>
						</c:if>
					</ul>
				</nav>
			</td>
		</tr>

	</table>
	<!-- 페이지네이션 -->

	<!-- 페이지 이동시 정보 -->
	<form id="actionForm" action="/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">

	</form>
	<!-- 페이지 이동시 정보 -->

	<table>

		<tr>
			<td><button type="button" class="btn btn-dark regBtn">글쓰기</button></td>
		</tr>
	</table>
	<br />



	<!-- 쪽번호 끝 -->
	<!--모달창   -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content">
				<div class="modal-header"></div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="button" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<!--모달창   -->


	<script>
		$(document)
				.ready(
						function() {
							// datatable 라이브러리 이용
							$('.dataTable').DataTable({
								"order" : [ [ 0, "desc" ] ],
								"paging" : false, // 페이징 표시 안한다.
								"bFilter" : false, // 검색창 표시 안한다.
								"info" : false
							});

							// 글쓰기 창 이동
							$(".regBtn").on("click", function() {
								console.log("클릭");
								self.location = "/register";
							});

							var result = '<c:out value="${result}"/>';

							checkModal(result);

							// 모달창 표시
							function checkModal(result) {
								if (result === '') {
									// == 는 값만 비교, === 은 값과 형식도 비교.
									return;
								}
								if ($.isNumeric(result)) {// 전달된 값이 숫자인가?
									if (parseInt(result) > 0) {
										$(".modal-body").html(
												"게시글 " + parseInt(result)
														+ "번 등록");
									}
								} else {
									$(".modal-body").html(result);
									// 수정과 삭제시에는 success 라는 문자열이 전달 되므로,

									// 성공 메세지만 표시하기 원함.
								}
								$("#myModal").modal("show");// 모달창 표시
							}

							// 페이지 이동 처리
							var actionForm = $("#actionForm");
							$(".page-item a").on(
									"click",
									function(e) {
										e.preventDefault();
										//기본 동작을 막음
										console.log("click");
										//웹 브라우저 검색창1에 클릭을 표시
										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										//액션폼 인풋태그에서 네임이 pageNum인 값을 찾아서 
										//href의 값으로 대신한다
										actionForm.submit();
									});

							//게시물을 들어갔다와도 pageNum값과 amount값을 가지고 있는다
							$(".move")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												actionForm
														.append("<input type='hidden' name='bno' "
																+ "value='"
																+ $(this).attr(
																		"href")
																+ "'>");
											//append는 요소 내부의 끝부분에 삽입한다
												actionForm.attr("action",
														"/get")
												actionForm.submit();

											})

						});
	</script>


	<%@ include file="includes/footer.jsp"%>
</body>




</html>



