<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Stylish Portfolio - Start Bootstrap Template</title>
<!-- Favicon-->
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
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/stylec.css" rel="stylesheet" />

<style>
video {
	width: 100%;
	position: relative;
	z-index: 0;
}

header {
	z-index: 1;
}

/* .overlay {
	width: 50%;
	position: absolute;
	z-index: 1;
	top: 50%;
	left: 50%;
} */
</style>

<link rel="stylesheet" href="/resources/css/animations.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>
<body id="page-top">
	<!-- Navigation-->
	<%@ include file="includes/sidebar.jsp"%>
	<!-- Header-->

	<!-- 	<video class="video-container" autoplay muted loop>
		<source src="resources/img/videoplayback (3).mp4">
	</video> -->

	<header class="masthead d-flex align-items-center">
		<div class="container px-4 px-lg-5 text-center">
			<div data-aos="fade-up" data-aos-duration="2000">
				<h1 class="mb-1">JINWOO SHOP</h1>
				<h3 class="mb-5">
					<em>Ambition to Create Novel Expression</em>
				</h3>
				<a class="btn btn-dark btn-xl" href="#about">Find Out More</a>
			</div>
		</div>
	</header>




	<!-- About-->

	<section class="content-section bg-light" id="about">
		<div class="container px-4 px-lg-5 text-center">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-lg-10">
					<div data-aos="fade-up" data-aos-duration="1000">

						<h2>JINWOO SHOP에 오신것을 환영합니다!</h2>
						<p class="lead mb-5">JINWOO SHOP은 but near missed things’ 이라는
							브랜드 슬로건, 철학을 바탕으로 사람들이 일상에서 쉽게 놓치고 있는 것들을 익숙하지만 낯설고, 새롭게 느낄 수 있도록
							표현하는 활동에 집중하고 있으며, 사진, 영상, 공간, 디자인, 예술, 가구 등 문화 콘텐츠를 우리의 방식으로
							재편집하여 새로운 문화를 제안합니다.</p>
						<a class="btn btn-dark btn-xl" href="#services">What We Offer</a>
					</div>
				</div>
			</div>
		</div>


	</section>

	<!-- Services-->
	<div data-aos="fade-right" data-aos-duration="1000">
		<section class="content-section  text-white text-center" id="services"
			style="background: black;">
			<div class="container px-4 px-lg-5">
				<div class="content-section-heading">
					<h3 class="text-secondary mb-0">Services</h3>
					<h2 class="mb-5">What We Offer</h2>
				</div>
				<div class="row gx-4 gx-lg-5">
					<div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
						<div id="object" class="floating">
							<span class="service-icon rounded-circle mx-auto mb-3"><svg
									xmlns="http://www.w3.org/2000/svg" width="30" height="30"
									fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
  <path
										d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
</svg></span>
						</div>
						<h4>
							<strong>다양한 상품</strong>
						</h4>
						<p class="text-faded mb-0">다양한 상품을 구경하실 수 있습니다!</p>
					</div>

					<div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
						<div id="object" class="floating">
							<span class="service-icon rounded-circle mx-auto mb-3"><svg
									xmlns="http://www.w3.org/2000/svg" width="30" height="30"
									fill="currentColor" class="bi bi-clipboard" viewBox="0 0 16 16">
  <path
										d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z" />
  <path
										d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z" />
</svg></span>
						</div>
						<h4>
							<strong>문의 게시판</strong>
						</h4>
						<p class="text-faded mb-0">궁금한 사항은 문의 게시판에 작성 할 수 있습니다!</p>
					</div>
					<div class="col-lg-3 col-md-6 mb-5 mb-md-0">
						<div id="object" class="floating">
							<span class="service-icon rounded-circle mx-auto mb-3"><svg
									xmlns="http://www.w3.org/2000/svg" width="30" height="30"
									fill="currentColor" class="bi bi-cash" viewBox="0 0 16 16">
  <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
  <path
										d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2H3z" />
</svg></span>
						</div>
						<h4>
							<strong>저렴한 가격</strong>
						</h4>
						<p class="text-faded mb-0">저럼한 가격의 상품을 구매할 수 있습니다!</p>
					</div>
					<div class="col-lg-3 col-md-6 mb-5 mb-md-0">
						<div id="object" class="floating">
							<span class="service-icon rounded-circle mx-auto mb-3"><svg
									xmlns="http://www.w3.org/2000/svg" width="30" height="30"
									fill="currentColor" class="bi bi-images" viewBox="0 0 16 16">
  <path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
  <path
										d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z" />
</svg></span>
						</div>
						<h4>
							<strong>스타일</strong>
						</h4>
						<p class="text-faded mb-0">다른 사람들의 멋진 스타일을 확인 할 수 있습니다!</p>
					</div>
				</div>
			</div>

		</section>
	</div>
	<!-- Callout-->
	<div data-aos="zoom-in" data-aos-duration="2000">
		<section class="callout">
			<div class="container px-4 px-lg-5 text-center">
				<h2 class="mx-auto mb-5">JINWOO SHOP의 &nbsp; 다음 스테이지로 &nbsp;
					이동하세요!</h2>
				<a class="btn btn-dark btn-xl" href="/customLogin">LOGIN!</a>

			</div>
		</section>
	</div>
	<!-- Portfolio-->
	<section class="content-section" id="portfolio"
		style="background: black;">
		<div class="container px-4 px-lg-5">
			<div class="content-section-heading text-center">
				<h3 class="text-secondary mb-0">SHOP</h3>
				<h2 class="mb-5" style="color: white;">SHOP DETAILS</h2>
			</div>
			<div class="row gx-0">
				<div class="col-lg-6">
					<a class="portfolio-item" href="/shopdetail/home">
						<div class="caption">
							<div class="caption-content">
								<div class="h2">SHOP</div>
								<p class="mb-0">A yellow pencil with envelopes on a clean,
									blue backdrop!</p>
							</div>
						</div> <img class="img-fluid" src="resources/img/stussy.webp" alt="..." />
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item" href="/list">
						<div class="caption">
							<div class="caption-content">
								<div class="h2">BOARD</div>
								<p class="mb-0">A dark blue background with a colored
									pencil, a clip, and a tiny ice cream cone!</p>
							</div>
						</div> <img class="img-fluid"
						src="resources/img/Outerwear_a8268209-38f6-4f14-b314-07cef032600a_720x.webp"
						alt="..." />
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item" href="/shopdetail/ranking">
						<div class="caption">
							<div class="caption-content">
								<div class="h2">RANKING</div>
								<p class="mb-0">Strawberries are such a tasty snack,
									especially with a little sugar on top!</p>
							</div>
						</div> <img class="img-fluid"
						src="resources/img/Tops_8c2e1f3d-5b01-4de6-afd3-8d5f5af176f9_720x.webp"
						alt="..." />
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item" href="#!">
						<div class="caption">
							<div class="caption-content">
								<div class="h2">STYLE</div>
								<p class="mb-0">A yellow workspace with some scissors,
									pencils, and other objects.</p>
							</div>
						</div> <img class="img-fluid" src="resources/img/stussy_next.webp"
						alt="..." />
					</a>
				</div>
			</div>
		</div>
	</section>
	<!-- Call to Action-->
	<section class="content-section bg-primary text-white"
		style="background: url(/resources/img/063_1403378944.jpg)">
		<div class="container px-4 px-lg-5 text-center">
			<h2 class="mb-4" style="color: white;">스테판 커리의 우승을 축하합니다</h2>
			<a class="btn btn-xl btn-light me-4" href="#!">Click Me!</a> <a
				class="btn btn-xl " href="#!" style="background-color: blue;"><span
				style="color: white;">Look at Me!</span></a>
		</div>
	</section>
	<!-- Map-->
	<video class="video-container" autoplay muted loop>
		<source src="resources/img/videoplayback (3).mp4">
	</video>
	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container px-4 px-lg-5">
			<ul class="list-inline mb-5">
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="#!"><i
						class="icon-social-facebook"></i></a></li>
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="#!"><i
						class="icon-social-twitter"></i></a></li>
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white" href="#!"><i
						class="icon-social-github"></i></a></li>
			</ul>
			<p class="text-muted small mb-0">Copyright &copy; JINWOOSHOP</p>
		</div>
	</footer>

	<script>
		AOS.init();
	</script>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"><i
		class="fas fa-angle-up"></i></a>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/resources/js/script.js"></script>

</body>
</html>
