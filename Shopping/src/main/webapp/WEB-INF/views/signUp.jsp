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


<title>Checkout example · Bootstrap v5.1</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/checkout/">




<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


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
<link href="/resources/css/form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">

	<div class="container">

		<div class="py-5 text-center">

			<h2>JINWOOSHOP</h2>
			<p class="lead">안녕하세요 JINWOOSHOP입니다</p>
		</div>


		<div class="">
			<h4 class="mb-3 text-center">회원가입</h4>
			<form class="needs-validation" action="/signUp" method="post"
				novalidate>
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token}" />



				<div class="col-12">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path
							d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
</svg>
					<label for="name" class="form-label">이름</label> <input type="text"
						class="form-control" id="userName" name="userName"
						placeholder="이름" required>

					<div class="invalid-feedback">이름을 입력해주세요</div>
				</div>




				<div class="col-12">
					<label for="username" class="form-label">아이디</label>
					<div class="input-group has-validation">
						<input type="text" class="form-control" id="userid" name="userid"
							placeholder="아이디" required>

						<div class="invalid-feedback">아이디를 입력해주세요</div>
					</div>
				</div>





				<div class="col-12">
					<label for="username" class="form-label">패스워드</label>
					<div class="input-group has-validation">
						<input type="password" class="form-control" id="userpw"
							name="userpw" placeholder="비밀번호" required>

						<div class="invalid-feedback">비밀번호를 입력해주세요</div>
					</div>
				</div>


				<div class="col-12">
					<label for="username" class="form-label">패스워드 확인</label>
					<div class="input-group has-validation">
						<input type="password" class="form-control" id="passwordConfirm"
							placeholder="비밀번호" required>

					</div>
				</div>




				<div class="col-12">
					<label for="email" class="form-label">Email</label> <input
						type="email" class="form-control" id="useremail" name="useremail"
						placeholder="you@example.com" required>
					<div class="invalid-feedback">이메일을 입력해주세요</div>
				</div>

				<div class="col-12">
					<label for="address" class="form-label">주소</label> <input
						type="text" class="form-control" id="useraddress"
						name="useraddress" placeholder="주소" required>
					<div class="invalid-feedback">주소를 입력해 주세요</div>
				</div>


				<div class="col-12">
					<label for="address" class="form-label">번호</label> <input
						type="text" class="form-control" id="userphoneNumber"
						name="userphoneNumber" placeholder="번호" required>
					<div class="invalid-feedback">핸드폰 번호를 입력해 주세요</div>
				</div>




				<hr class="my-4">

				<button class="w-100 btn btn-primary btn-lg testCheck">Continue
					to checkout</button>
			</form>
		</div>
	</div>


	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; 2017–2021 Company Name</p>
		<ul class="list-inline">
			<li class="list-inline-item"><a href="#">Privacy</a></li>
			<li class="list-inline-item"><a href="#">Terms</a></li>
			<li class="list-inline-item"><a href="#">Support</a></li>
		</ul>
	</footer>

	<script>
		var phoneNumberReg = /^[0-9]+$/;
		var result = phoneNumberReg.exec($("#userphoneNumber").val());
		$(document).ready(function() {
			$(".testCheck").on("click", function() {
				var password = $("#userpw").val(); // 비밀번호값 불러오기
				var passwordConfirm = $("#passwordConfirm").val(); // 비밀번호 확인값 불러오기

				if (!phoneNumberReg.test($("#userphoneNumber").val())) {
					alert("숫자만 입력 가능합니다");
					$("#userphoneNumber").val("");

				}

				if (password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다  다시 입력해 주세요");
					$("#userpw").val("");
					$("#passwordConfirm").val("");

					return;
				}

				$("testCheck").submit();

			});

		});
	</script>



	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<script src="/resources/js/form-validation.js"></script>


</body>
</html>
