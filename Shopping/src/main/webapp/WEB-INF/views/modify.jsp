<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/navbar.jsp"%>

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

			<div class="mb-3">
				<input type="hidden" name=bno value="${board.bno }" /> <label
					class="form-label">제목</label> <input type="text"
					class="form-control" name="title" value="${board.title }">

			</div>
			<div class="mb-3">
				<label class="form-label"> 작성자 </label> <input type="text"
					class="form-control" name="writer" value="${board.writer }">

			</div>




			<br>
			<textarea name="content" class="form-control"
				style="height: 500px; resize: none;">
				${board.content }</textarea>


			<br />
			<div style="float: right;">
				<button type="submit" data-oper='modify' class="btn btn-success">Modify</button>
				<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
				<button type="submit" data-oper='list' class="btn btn-info">List</button>
			</div>

			<br /> <br />
		</form>
	</div>
	<script>
		$(document).ready(function() {
			var formObj = $("form"); // 폼이라는 변수명을 가진 것들을 formObj에 넣는다
			$('button').on("click", function(e) {
				//버튼이 클릭된다면
				e.preventDefault(); // 기본 동작을 막는다
				var operation = $(this).data("oper");
				//버튼에서 oper데이터를 읽어서 operation에 넣는다
				console.log(operation) //operation 값을 출력

				if (operation === 'remove') {
					//operation 값이 remove라면
					formObj.attr("action", "/remove");
					//form의 액션 속성을 변경한다
				} else if (operation === 'list') {
					self.location = "/list";
					return;
				}
				formObj.submit();
			});

		});
	</script>



</body>

<%@ include file="includes/footer.jsp"%>
</html>
