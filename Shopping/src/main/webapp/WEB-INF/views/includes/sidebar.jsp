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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css"
	rel="stylesheet" />

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />

<title>Hello, world!</title>
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/stylec.css" rel="stylesheet" />
</head>
<body>

	<a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a href="#page-top">JINWOO SHOP</a></li>
			<li class="sidebar-nav-item"><a class="nav-link" href="#"
				data-bs-toggle="collapse" data-bs-target="#collapseLayouts"
				aria-expanded="true" aria-controls="collapseLayouts"> Shop </a>
				<div class="collapse" id="collapseLayouts"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion"
					style="">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="/shopdetail/home"> 모든 상품
							&emsp;&emsp;&emsp;&emsp;&emsp; </a> <a class="nav-link"
							href="/shopdetail/list?c=101"> 티셔츠
							&emsp;&emsp;&emsp;&emsp;&emsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="nav-link" href="/shopdetail/list?c=103">후드
							&emsp;&emsp;&emsp;&emsp;&emsp;</a> <a class="nav-link"
							href="/shopdetail/list?c=104">셔츠
							&emsp;&emsp;&emsp;&emsp;&emsp;</a> <a class="nav-link"
							href="/shopdetail/list?c=201">데님 팬츠
							&emsp;&emsp;&emsp;&emsp;&emsp;</a> <a class="nav-link"
							href="/shopdetail/list?c=202">코튼 팬츠
							&emsp;&emsp;&emsp;&emsp;&emsp;</a> <a class="nav-link"
							href="/shopdetail/list?c=301">집업
							&emsp;&emsp;&emsp;&emsp;&emsp;</a> <a class="nav-link"
							href="/shopdetail/list?c=307">블루종
							&emsp;&emsp;&emsp;&emsp;&emsp;</a> <a class="nav-link"
							href="/shopdetail/list?c=400">액세서리
							&emsp;&emsp;&emsp;&emsp;&emsp;</a>

					</nav>
				</div>
			<li class="sidebar-nav-item"><a href="/list">Board</a></li>
			<li class="sidebar-nav-item"><a href="/shopdetail/ranking">Ranking</a></li>
			<li class="sidebar-nav-item"><a href="#portfolio">Style</a></li>
			<sec:authorize access="isAnonymous()">
				<li class="sidebar-nav-item"><a href="/customLogin">Login</a></li>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<li class="sidebar-nav-item"><a href="/signUp">Sign Up</a></li>

			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="sidebar-nav-item"><a class="dropdown-item"
					href="/customLogout">Logout</a></li>

			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="sidebar-nav-item"><a class="dropdown-item"
					href="/shopdetail/cartList">Cart</a></li>

			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="sidebar-nav-item"><a class="dropdown-item"
					href="/shopdetail/orderList">orderList</a></li>
			</sec:authorize>
			<li class="sidebar-nav-item"></li>

			<sec:authorize access="isAuthenticated()">
				<li class="sidebar-nav-item"><a class="dropdown-item"
					href="/my/index"> <sec:authentication
							property="principal.username" /></a></li>

			</sec:authorize>

			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class="sidebar-nav-item"><a class="dropdown-item"
					href="/admin/adminIndex"> 관리자 페이지 </a></li>

			</sec:authorize>


		</ul>
	</nav>


</body>
</html>