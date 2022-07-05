<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/sidebar.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Resume - Start Bootstrap Theme</title>

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/stylescss.css" rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/stylec.css">
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark  fixed-top"
		id="sideNav" style="background: black;">
		<a class="navbar-brand js-scroll-trigger" href="#page-top"> <span
			class="d-block d-lg-none">Clarence Taylor</span> <span
			class="d-none d-lg-block"></span>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#about">회원</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#experience">회원정보 변경</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#education">장바구니</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#skills">주문내역</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#interests">회원탈퇴</a></li>

			</ul>
		</div>
	</nav>
	<!-- Page Content-->
	<div class="container-fluid p-0">
		<!-- About-->
		<section class="resume-section" id="about">
			<div class="resume-section-content">
				<h1 class="mb-0">
					${vo.userid }님! <span class="text-primary">&nbsp;환영합니다</span>
				</h1>

			</div>
		</section>
		<hr class="m-0" />

		<form action="/my/index" method="post" name="fr">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" />
			<!-- Experience-->
			<section class="resume-section" id="experience">
				<div class="resume-section-content">
					<h2 class="mb-5">회원정보 변경</h2>

					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">아이디</h3>

							<p>
								<input type="text" class="form-control mt-3" name="userid"
									value="${vo.userid }" readonly />
							</p>
						</div>

					</div>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">이름</h3>

							<p>
								<input type="text" class="form-control mt-3" name="userName"
									value="${vo.userName }" />
							</p>
						</div>

					</div>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">비밀번호</h3>

							<p>
								<input type="password" class="form-control mt-3" name="userpw" />
							</p>
						</div>

					</div>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">이메일</h3>

							<p>
								<input type="email" class="form-control mt-3"
									value="${vo.useremail }" name="useremail" />
							</p>
						</div>

					</div>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">주소</h3>

							<p>
								<input type="text" class="form-control mt-3"
									value="${vo.useraddress }" name="useraddress" />
							</p>
						</div>

					</div>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">전화번호</h3>

							<p>
								<input type="text" class="form-control mt-3"
									value="${vo.userphoneNumber }" name="userphoneNumber" />
							</p>
						</div>

					</div>

					<button type="submit" class="btn btn-dark">회원정보 변경</button>
				</div>
			</section>
		</form>
		<hr class="m-0" />
		<!-- Education-->
		<section class="resume-section" id="education">
			<div class="resume-section-content">
				<h2 class="mb-5">장바구니</h2>
				<div class="subheading mb-3">Shopping Basket</div>
				<div
					class="d-flex flex-column flex-md-row justify-content-between mb-5">
					<div class="flex-grow-1">

						<table class="table">
							<thead>

								<tr>
									<th scope="col"><input type="checkbox" name="allCheck"
										id="allCheck" /></th>
									<th scope="col">상품</th>
									<th scope="col"
										style="display: table-cell; text-align: center; vertical-align: middle;">상품이름</th>
									<th scope="col"
										style="display: table-cell; text-align: center; vertical-align: middle;">가격</th>
									<th scope="col"
										style="display: table-cell; text-align: center; vertical-align: middle;">수량</th>
									<th scope="col"
										style="display: table-cell; text-align: center; vertical-align: middle;">합계</th>
								</tr>

							</thead>
							<tbody>


								<c:set var="sum" value="0" />
								<c:forEach items="${cartList}" var="cartList">

									<tr>
										<th scope="row"><input type="checkBox" name="chBox"
											class="chBox" data-cartNum="${cartList.cartNum }" /></th>
										<td><img src="${cartList.gdsThumbImg}"
											style="width: 150px; height: 150px;" /></td>
										<td
											style="display: table-cell; text-align: center; vertical-align: middle;">${cartList.gdsName}</td>
										<td
											style="display: table-cell; text-align: center; vertical-align: middle;"><fmt:formatNumber
												pattern="###,###,###" value="${cartList.gdsPrice}" /></td>
										<td
											style="display: table-cell; text-align: center; vertical-align: middle;">${cartList.cartStock}</td>
										<td
											style="display: table-cell; text-align: center; vertical-align: middle;"><fmt:formatNumber
												pattern="###,###,###"
												value="${cartList.gdsPrice * cartList.cartStock}" /></td>
									</tr>
									<c:set var="sum"
										value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />




								</c:forEach>

							</tbody>
						</table>
						<div class="sum">
							총 합계 :
							<fmt:formatNumber pattern="###,###,###" value="${sum }" />
							원



						</div>

					</div>
				</div>



			</div>
		</section>
		<hr class="m-0" />
		<!-- Skills-->
		<section class="resume-section" id="skills">
			<div class="resume-section-content">
				<h2 class="mb-5">주문내역</h2>
				<div class="subheading mb-3">OrderList</div>
				<table class="table">
					<thead>

						<tr>


							<th scope="col"
								style="display: table-cell; text-align: center; vertical-align: middle;">주문번호</th>
							<th scope="col"
								style="display: table-cell; text-align: center; vertical-align: middle;">이름</th>
							<th scope="col"
								style="display: table-cell; text-align: center; vertical-align: middle;">주소</th>
							<th scope="col"
								style="display: table-cell; text-align: center; vertical-align: middle;">가격</th>
							<th scope="col"
								style="display: table-cell; text-align: center; vertical-align: middle;">배송상태</th>
						</tr>
					</thead>
					<tbody>


						<c:set var="sum" value="0" />
						<c:forEach items="${orderList}" var="orderList">

							<tr>


								<td
									style="display: table-cell; text-align: center; vertical-align: middle;"><a
									href="/shopdetail/orderView?n=${orderList.orderId}">${orderList.orderId}</a></td>
								<td
									style="display: table-cell; text-align: center; vertical-align: middle;">${orderList.orderRec}</td>
								<td
									style="display: table-cell; text-align: center; vertical-align: middle;">(${orderList.userAddr1})
									${orderList.userAddr2} ${orderList.userAddr3}</td>
								<td
									style="display: table-cell; text-align: center; vertical-align: middle;"><fmt:formatNumber
										pattern="###,###,###" value="${orderList.amount}" /> 원</td>
								<td
									style="display: table-cell; text-align: center; vertical-align: middle;">${orderList.delivery }</td>
							</tr>

						</c:forEach>

					</tbody>
				</table>
			</div>
		</section>
		<hr class="m-0" />
		<!-- Interests-->
		<section class="resume-section" id="interests">
			<div class="resume-section-content">
				<h2 class="mb-5">회원탈퇴</h2>
				<a href="/my/delete">
					<button type="button" class="btn btn-danger">회원탈퇴</button>
				</a>
			</div>
		</section>
		<hr class="m-0" />
		<!-- Awards-->

	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/resources/js/script.js"></script>

	<script src="../resources/js/scriptsjs.js"></script>


</body>
</html>
