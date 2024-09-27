<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">



<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />
<body>


	<header class="p-3 mb-3 border-bottom">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="/index"
					class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none"
					style="font-weight: bold;"> JINWOOSHOP &nbsp;&nbsp;&nbsp; </a>

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="/shopdetail/home" class="nav-link px-2 link-dark">상품목록</a></li>
					<li><a href="/list" class="nav-link px-2 link-dark">게시판</a></li>
					<li><a href="#" class="nav-link px-2 link-dark">STORY</a></li>

				</ul>



				<div class="dropdown text-end">
					<a href="#"
						class="d-block link-dark text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="https://github.com/mdo.png" alt="mdo" width="32"
						height="32" class="rounded-circle">

					</a>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
						<li><a class="dropdown-item" href="/my/index"><sec:authorize
									access="isAuthenticated()">
									<sec:authentication property="principal.username" />

								</sec:authorize> <sec:authorize access="isAnonymous()">
								</sec:authorize></a></li>
						<li><sec:authorize access="isAuthenticated()">
								<a class="dropdown-item" href="/customLogout"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</sec:authorize> <sec:authorize access="isAuthenticated()">
								<a class="dropdown-item" href="/shopdetail/cartList"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									장바구니
								</a>
							</sec:authorize> <sec:authorize access="isAuthenticated()">
								<a class="dropdown-item" href="/shopdetail/orderList"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									주문 리스트
								</a>
							</sec:authorize> <sec:authorize access="isAnonymous()">
								<a class="dropdown-item" href="/customLogin"> <i
									class="fas-fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400">

								</i> Login
								</a>

							</sec:authorize> <sec:authorize access="isAnonymous()">
								<a class="dropdown-item" href="/signUp"> <i
									class="fas-fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400">

								</i> sign Up
								</a>

							</sec:authorize> <sec:authorize access="hasRole('ROLE_ADMIN')">
								<a class="dropdown-item" href="/admin/adminIndex"> <i
									class="fas-fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400">

								</i> 관리자 페이지
								</a>
							</sec:authorize></li>
					</ul>
				</div>
			</div>
		</div>
	</header>

</body>
</html>