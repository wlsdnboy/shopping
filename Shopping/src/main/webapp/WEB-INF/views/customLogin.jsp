<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

body {
	margin: 0;
	padding: 0;
	background: url(img.jpg) center center fixed no-repeat;
}

video {
	position: fixed;
	top: 0;
	left: 0;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -1;
}
</style>


<!-- Custom styles for this template -->
<link href="/resources/css/signin.css" rel="stylesheet">

</head>
<body class="text-center">






	<video class="video-container" autoplay muted loop>
		<source src="resources/img/thisisneverthat® Pokémon Collection Ⅱ.mp4">
	</video>
	<main class="form-signin">
		<%-- <form method="post" action="/login">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" />
			<h1 class="h3 mb-3 fw-normal">JINWOOSHOP</h1>

			<h1 class="h6 mb-3 fw-normal">Please sign in</h1>


			<div class="form-floating">

				<input type="text" class="form-control" id="floatingInput"
					name="username" placeholder="name@example.com"> <label
					for="floatingInput">Email address</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					name="password" placeholder="Password"> <label
					for="floatingPassword">Password</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me"
					name="remember-me"> Remember me
				</label>
			</div>

			<button class="w-100 btn btn-lg btn-primary" type="submit">Sign
				in</button>

			<p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" />
		</form>
 --%>



	</main>


	<div class="modal modal-signin  modal fade" tabindex="-1" role="dialog"
		id="modalSignin">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content rounded-5 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<!-- <h5 class="modal-title">Modal title</h5> -->
					<h2 class="fw-bold mb-0">JINWOOSHOP</h2>

					<a href="/index">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</a>
				</div>


				<div class="modal-body p-5 pt-0">
					<form method="post" action="/login" class="mymodal">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token}" />
						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-4"
								id="floatingInput" placeholder="아이디" name="username"> <label
								for="floatingInput">Email address</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-4"
								id="floatingPassword" placeholder="비밀번호" name="password">
							<label for="floatingPassword">Password</label>
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-4 btn-dark"
							type="submit">로그인</button>

						<a href="/signUp"><button
								class="w-100 mb-2 btn btn-lg rounded-4 btn-light" type="button"
								style="board: 1px solid black;">회원가입</button></a>


					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {

			$("#modalSignin").modal("show");

		});
	</script>


	<!-- 
 
	<div id="carouselExampleFade" class="carousel slide  mx-auto"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/resources/img/thisisneverthat.jpg" class="d-block w-100"
					alt="123">
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
 -->
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
	
</script>

</html>
