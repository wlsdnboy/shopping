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
		<form method="post" action="/register">

			<div class="mb-3">
				<label class="form-label"> 제목 </label> <input type="text"
					class="form-control" name="title">

			</div>
			<div class="mb-3">
				<label class="form-label"> 작성자 </label> <input type="text"
					class="form-control" name="writer">

			</div>




			<br>
			<textarea name="content" class="form-control"
				style="height: 500px; resize: none;"></textarea>


			<br />
			<button type="submit" class="btn btn-dark" style="float: right;">작성</button>
		</form>
	</div>
	<br />
	<br />
</body>
<%@ include file="includes/footer.jsp"%>
</html>
