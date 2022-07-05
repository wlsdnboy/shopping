<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Heroic Features - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/stylec.css" rel="stylesheet" />
</head>
<body>

	<!-- Header-->
	<header class="py-5">
		<div class="container px-lg-5">
			<div class="p-4 p-lg-5 bg-light rounded-3 text-center">
				<div class="m-4 m-lg-5">
					<h1 class="display-5 fw-bold">JINWOOSHOP</h1>
					<p class="fs-4">
						관리자 화면입니다 <br>
						<sec:authentication property="principal.username" />
						님 환영합니다
					</p>
				</div>
			</div>
		</div>
	</header>
	<!-- Page Content-->
	<section class="pt-4">
		<div class="container px-lg-5">
			<!-- Page Features-->
			<div class="row gx-lg-5">
				<div class="col-lg-6 col-xxl-4 mb-5">
					<div class="card bg-light border-0 h-100">
						<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
							<a href="/admin/goods/register"><button type="button"
									class="btn btn-primary mb-5">

									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
  <path
											d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
</svg>
								</button></a>
							<h2 class="fs-4 fw-bold">상품 등록</h2>
							<p class="mb-0">상품을 추가해 주세요.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-xxl-4 mb-5">
					<div class="card bg-light border-0 h-100">
						<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
							<a href="/admin/goods/list"><button type="button"
									class="btn btn-primary mb-5">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
  <path
											d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
</svg>
								</button></a>
							<h2 class="fs-4 fw-bold">상품 목록</h2>
							<p class="mb-0">상품 목록 입니다. 상품을 변경하거나 삭제해 주세요.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-xxl-4 mb-5">
					<div class="card bg-light border-0 h-100">
						<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
							<a href="/admin/shop/orderList"><button type="button"
									class="btn btn-primary mb-5">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-box-seam" viewBox="0 0 16 16">
  <path
											d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5l2.404.961L10.404 2l-2.218-.887zm3.564 1.426L5.596 5 8 5.961 14.154 3.5l-2.404-.961zm3.25 1.7-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z" />
</svg>

								</button></a>
							<h2 class="fs-4 fw-bold">주문 목록</h2>
							<p class="mb-0">주문목록 입니다. 주문 목록과 배송상태를 변경해 주세요.</p>
						</div>
					</div>
				</div>

				<div class="col-lg-6 col-xxl-4 mb-5">
					<div class="card bg-light border-0 h-100">
						<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
							<a href="/admin/member/list"><button type="button"
									class="btn btn-primary mb-5">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path
											d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
</svg>

								</button></a>
							<h2 class="fs-4 fw-bold">회원목록</h2>
							<p class="mb-0">회원목록 입니다.</p>
						</div>
					</div>
				</div>


			</div>
		</div>


		<%@ include file="../includes/footer.jsp"%>
	</section>

</body>
</html>