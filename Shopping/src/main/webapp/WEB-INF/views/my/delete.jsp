<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>Signin Template · Bootstrap v5.1</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

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

<!-- Bootstrap core CSS -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">

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

.btn-checkbox {
	display: none;
}
</style>


<!-- Custom styles for this template -->
<link href="../resources/css/signin.css" rel="stylesheet">
</head>
<body class="text-center mt-5">



	<main class="form-signin">
		<form action="/my/delete" method="post">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" /> <input type="hidden" name="userid"
				value="${member.userid }">

			<h1 class="h3 mb-3 fw-normal">탈퇴하시겠습니까?</h1>



			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me"
					class="checkbox1"> 동의합니다
				</label>
			</div>
			<button class="w-100 btn btn-lg btn-danger btn-checkbox"
				type="submit">탈퇴</button>



		</form>
		<button class="w-100 btn btn-lg btn-warning mt-3"
			onclick="location.href='/my/index'">뒤로 가기</button>
		<p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
	</main>

	<script>
		$(".checkbox1").click(function() {

			var checked = $(".checkbox1").is(':checked');

			if (checked) {
				$(".btn-checkbox").slideDown();

			} else {
				$(".btn-checkbox").slideUp();
			}
		});
	</script>

	<script>
		$(".btn-checkbox").on("click", function(e) {
			// 로그아웃 버튼을 클릭한다면,
			e.preventDefault();
			$("form").submit();// csrf 값을 가지고 /customLogout 으로 post 접근 처리.
		});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
</body>
</html>
