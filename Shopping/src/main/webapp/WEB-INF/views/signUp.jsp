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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

.id_ok {
	color: #fff;
	display: none;
}

.id_already {
	color: #6A82FB;
	display: none;
}
</style>


<!-- Custom styles for this template -->
<link href="/resources/css/form-validation.css" rel="stylesheet">
</head>
<body>

	<video class="video-container" autoplay muted loop>
		<source src="resources/img/thisisneverthat® Pokémon Collection Ⅱ.mp4">
	</video>

	<div class="modal modal-signin  modal fade" tabindex="-1" role="dialog"
		id="modalSignin">


		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content rounded-5 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<!-- <h5 class="modal-title">Modal title</h5> -->
					<h2 class="fw-bold mb-0">JINWOO SHOP</h2>

					<a href="/customLogin">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</a>
				</div>


				<div class="modal-body p-5 pt-0">
					<form method="post" action="/signUp" class="mymodal">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token}" />
						<div class="form-floating mb-3">

							<input type="text" class="form-control rounded-4" id="userName"
								placeholder="이름" name="userName"> <label
								for="floatingInput">이름</label>
							<div class="invalid-feedback">이름을 입력해주세요</div>
						</div>

						<div class="form-floating ">
							<input type="text" class="form-control rounded-4" id="userid"
								placeholder="아이디" name="userid"> <label
								for="floatingPassword">아이디</label> <span class="id_ok">사용
								가능한 아이디입니다.</span> <span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
						</div>

						<button class="idChk btn btn-dark mt-3 mb-3" type="button"
							id="idChk" onclick="idCheck();" value="N">중복확인</button>



						<div class="form-floating">
							<input type="password" class="form-control rounded-4" id="userpw"
								placeholder="비밀번호" name="userpw"> <label
								for="floatingPassword">비밀번호</label>
							<div class="invalid-feedback">비밀번호를 입력해주세요</div>
						</div>

						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-4"
								id="passwordConfirm" placeholder="비밀번호 확인"> <label
								for="floatingPassword">비밀번호 확인</label>
							<div class="invalid-feedback">비밀번호를 입력해주세요</div>
						</div>

						<div class="form-floating ">
							<input type="email" class="form-control rounded-4" id="useremail"
								name="useremail" placeholder="이메일"> <label
								for="floatingPassword">이메일</label>
							<div class="invalid-feedback">이메일을 입력해주세요</div>
						</div>

						<div class="form-floating ">
							<input type="text" class="form-control rounded-4"
								id="useraddress" name="useraddress" placeholder="주소"> <label
								for="floatingPassword">주소</label>
							<div class="invalid-feedback">주소를 입력해주세요</div>
						</div>

						<div class="form-floating mb-5 ">
							<input type="number" class="form-control rounded-4"
								id="userphoneNumber" name="userphoneNumber" placeholder="번호">
							<label for="floatingPassword">번호</label>
							<div class="invalid-feedback">번호를 입력해주세요</div>
						</div>


						<button class="w-100 btn btn-dark btn-lg testCheck"
							disabled="disabled">회원가입</button>




					</form>
				</div>
			</div>
		</div>
	</div>




	<script>
		var phoneNumberReg = /^[0-9]+$/;
		var result = phoneNumberReg.exec($("#userphoneNumber").val());
		$(document).ready(function() {
			$(".testCheck").on("click", function() {
				var password = $("#userpw").val(); // 비밀번호값 불러오기
				var passwordConfirm = $("#passwordConfirm").val(); // 비밀번호 확인값 불러오기

				if ($("#userid").val() == "") {
					swal("아이디를 입력해주세요.");
					return false;
				}

				if ($("#userName").val() == "") {
					swal("이름을 입력해주세요.");
					return false;
				}

				if ($("#userpw").val() == "") {
					swal("비밀번호를 입력해주세요.");
					return false;
				}

				if ($("#useraddress").val() == "") {
					swal("주소를 입력해주세요.");
					return false;
				}

				if ($("#useremail").val() == "") {
					swal("이메일을 입력해주세요.");
					return false;
				}
				if ($("#userphoneNumber").val() == "") {
					swal("핸드폰 번호를 입력해주세요.");
					return false;
				}

				if (password != passwordConfirm) {
					swal("비밀번호가 일치하지 않습니다  다시 입력해 주세요");
					$("#userpw").val("");
					$("#passwordConfirm").val("");

					return false;
				}
				swal("회원가입 완료!", "JINWOO SHOP에 오신것을 환영합니다", "success");
				$("testCheck").submit();

			});

		});
	</script>
	<script>
		$(document).ready(function() {

			$("#modalSignin").modal("show");

		});
	</script>


	<script>
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		function idCheck() {
			$.ajax({
				url : "/idCheck",
				type : "post",
				dataType : "json",
				data : {
					"userid" : $("#userid").val()
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success : function(data) {
					if (data == 1) {
						swal("중복 아이디", "중복된 아이디 입니다", "error");

					} else if (data == 0) {
						$("#idChk").attr("value", "Y");
						swal("사용 가능한 아이디 입니다")
						$(".testCheck").removeAttr("disabled");
					}
				}

			})
		}
	</script>

	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<script src="/resources/js/form-validation.js"></script>


</body>
</html>
