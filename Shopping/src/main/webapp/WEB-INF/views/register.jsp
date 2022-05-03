<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/navbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>



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
			<textarea name="content" class="form-control" style="height:500px; resize: none;" ></textarea>


			<br />
			<button type="submit" class="btn btn-dark" style="float: right;">작성</button>
		</form>
	</div>

</body>
</html>
