<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/navbar.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>Sidebars · Bootstrap v5.1</title>









<!-- 
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<style>
a {
	cursor: pointer;
	text-decoration: none;
	color: black;
	text-align: center;
}

a:hover {
	color: black;
}

.image-container {
	display: grid;
	grid-template-columns: repeat(4, 25%);
	grid-gap: 0;
	grid-auto-rows: 1fr;
	position: relative;
	overflow: hidden;
	background: #fff;
}
</style>





</head>
<body>




	<div id="carouselExampleFade"
		class="carousel slide carousel-fade w-25 h-25 mx-auto"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/resources/img/i4p1.jpg" class="d-block w-100" alt="123">
			</div>
			<div class="carousel-item ">
				<img src="/resources/img/i4p.jpg" class="d-block w-100" alt="456">
			</div>
			<div class="carousel-item ">
				<img src="/resources/img/i4p1.jpg" class="d-block w-100" alt="1">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleFade" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleFade" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<div class="image-container ml-5">
		<a href="/list"> <img src="/resources/img/thisisneverthat.jpg"
			alt="11" width=500px height=300px> <span>안녕하세요</span> <br /> <span>안녕하세요</span>

		</a> <img src="/resources/img/thisisneverthat.jpg" alt="11" width=500px
			height=300px> <img src="/resources/img/thisisneverthat.jpg"
			alt="11" width=500px height=300px> <img
			src="/resources/img/thisisneverthat.jpg" alt="11" width=500px
			height=300px> <img src="/resources/img/thisisneverthat.jpg"
			alt="11" width=500px height=300px> <img
			src="/resources/img/stussyhoody.webp" alt="11" width=500px
			height=300px><img src="/resources/img/thisisneverthat.jpg"
			alt="11" width=500px height=300px> <img
			src="/resources/img/stussyhoody.webp" alt="11" width=500px
			height=300px>

	</div>



	<br>
	<sec:authorize access="isAuthenticated()">
		<button class="btn btn-dark btn-reply" style="float: right;">댓글
			등록</button>
	</sec:authorize>
	
	<br>
	<br>
	


</body>

<%@ include file="includes/footer.jsp"%>
</html>
