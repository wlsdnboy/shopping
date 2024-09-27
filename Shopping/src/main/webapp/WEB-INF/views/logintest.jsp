<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

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
</style>


<!-- Custom styles for this template -->
<link href="/resources/css/signin.css" rel="stylesheet">
</head>
<body class="text-center">






	<main class="form-signin">
		<form method="post" action="/login">
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
	</main>

</body>

	</html>
