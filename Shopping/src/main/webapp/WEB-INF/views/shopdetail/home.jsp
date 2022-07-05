<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/shopdetailnavbar.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<!-- <link href="../css/styles.css" rel="stylesheet" /> -->

<link rel="stylesheet" href="../resources/css/stylec.css">
<style>
</style>
</head>
<body>
	<div style="position: fixed; margin-top: 40%; margin-left: 85%;">
		<sec:authorize access="isAuthenticated()">
			<a class="dropdown-item" href="/shopdetail/cartList"> <img
				src="../resources/img/shopping-icon-2184065_640.png"
				style="width: 100px; height: 100px;" />

			</a>
		</sec:authorize>
	</div>


	<!-- Header-->
	<header>
		<div class="container" style="margin-top: 100px;">
			<div id="carouselExampleFade" class="carousel slide carousel-fade"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="../resources/img/2022060810053600000068904.jpg"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="../resources/img/2022060716243300000044789.jpg"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="../resources/img/2022060314054000000051544.jpg"
							class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleFade" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleFade" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</header>
	<!-- Section-->


	<section class="py-5">

		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4">
			<c:forEach items="${list }" var="list">
				<div class="col">
					<a href="/shopdetail/view1?gdsNum=${list.gdsNum }"> <img
						class="card-img-top" src="${list.gdsImg }" alt="..." />
					</a>
					<div style="text-align: center;">
						<h5 class="fw-bolder">${list.gdsName }</h5>
						<fmt:formatNumber pattern="###,###,###" value="${list.gdsPrice}" />
						원
					</div>
				</div>
			</c:forEach>

		</div>

		<%-- <div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${list }" var="list">
					<div class="col mb-5">

						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top" src="${list.gdsThumbImg }" alt="..." />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${list.gdsName }</h5>
									<!-- Product price-->

									<fmt:formatNumber pattern="###,###,###"
										value="${list.gdsPrice}" />
									원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/shopdetail/view?gdsNum=${list.gdsNum }">상세 페이지</a>
								</div>
							</div>

						</div>

					</div>

				</c:forEach>
			</div>

		</div>
 --%>

	</section>




	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<!-- <script src="js/scripts.js"></script> -->

	<%@ include file="../includes/footer.jsp"%>

</body>
<script src="/resources/js/script.js"></script>
</html>



