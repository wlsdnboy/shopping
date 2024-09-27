<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/shopdetailnavbar.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>Sidebars · Bootstrap v5.1</title>









<!-- 
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/stylec.css" rel="stylesheet">
<style>
</style>





</head>
<body>

	<input type="hidden" name="gdsNum" value="${view.gdsNum}"
		class="gdsNum" />
	<input type="hidden" name="gdsName" value="${view.gdsName }"
		class="gdsName" />
	<input type="hidden" name="cateCode" value="${view.cateCode }"
		class="cateCode" />


	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0" src="${view.gdsImg}"
						alt="..." />
				</div>
				<div class="col-md-6">
					<div class="small mb-1">
						<fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" />
						EA
					</div>
					<h1 class="display-5 fw-bolder">${view.gdsName}</h1>
					<div class="fs-5 mb-5">
						<span><fmt:formatNumber pattern="###,###,###"
								value="${view.gdsPrice}" /> 원</span>
					</div>
					<p class="lead mb-5">${view.gdsDes }</p>
					<div class="d-flex mb-5">

						<button class="btn btn-outline-dark flex-shrink-0 plus"
							type="button">
							<i class="bi-cart-fill me-1">+</i>
						</button>
						<input class="form-control text-center me-3 ms-3 numBox"
							id="inputQuantity" type="text" value="1" max="${view.gdsStock }"
							style="max-width: 3rem" readonly />
						<button class="btn btn-outline-dark flex-shrink-0 minus"
							type="button">
							<i class="bi-cart-fill me-1">-</i>
						</button>
					</div>

					<sec:authorize access="isAuthenticated()">
						<p class="addToCart">
							<button type="button" class="btn btn-dark addCart_btn mb-3"
								style="width: 100%;">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
  <path
										d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
</svg>
								&nbsp;카트에 담기
							</button>
					</sec:authorize>
				</div>
			</div>
		</div>
	</section>
	<!-- Related items section-->

	<section class="py-5 bg-light">

		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">Related products</h2>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${list }" var="list">

					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->

							<img class="card-img-top" src="${list.gdsImg }" alt="..." />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${list.gdsName }</h5>
									<!-- Product price-->
									<fmt:formatNumber pattern="###,###,###"
										value="${view.gdsPrice}" />
									원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/shopdetail/view1?gdsNum=${list.gdsNum }">상세 보기</a>
								</div>
							</div>

						</div>


					</div>
				</c:forEach>


			</div>

		</div>

	</section>


	<%-- <div class="container-fluid">
		<div class="row">
			<div class="col mx-auto" style="text-align: center;">
				<img src="${view.gdsImg}" style="width: 900px;">
			</div>
			<div class="col mx-auto" style="position: relative;">
				<div style="margin-top: 70px;">
					<h1>${view.gdsName}</h1>

				</div>
				<hr>


				<div style="margin-top: 10px;">
					<h4>
						<fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
						원
					</h4>
				</div>

				<div class="goodsInfo" style="">


					<p class="gdsStock">
						<span>재고 </span>
						<fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" />
						EA
					</p>
					<br>
					<div class="btn-group btn-group-lg mb-5" role="group"
						aria-label="...">
						<input type="radio" class="btn-check" name="btnradio"
							id="btnradio1" autocomplete="off" checked> <label
							class="btn btn-outline-primary" for="btnradio1">S</label> <input
							type="radio" class="btn-check" name="btnradio" id="btnradio2"
							autocomplete="off"> <label
							class="btn btn-outline-primary" for="btnradio2">M</label> <input
							type="radio" class="btn-check" name="btnradio" id="btnradio3"
							autocomplete="off"> <label
							class="btn btn-outline-primary" for="btnradio3">L</label>
					</div>


					<p>구입 수량</p>

					<c:if test="${view.gdsStock !=0 }">
						<p class="cartStock">

							<button type="button" class="btn btn-dark plus">+</button>
							<input type="number" class="numBox" min="1"
								max="${view.gdsStock }" value="1" readonly="readonly"
								style="width: 90%; border-radius: 30px; margin-left: 5px; margin-right: 5px; text-align: center;" />&nbsp;
							<button type="button" class="btn btn-dark minus">-</button>
 --%>

	<script>
					$(".plus").click(function(){
						var num = $(".numBox").val();
						var plusNum = Number(num) + 1;
						
						if(plusNum > ${ view.gdsStock}){
							$(".numbox").val(num);
						}else{
							$(".numBox").val(plusNum);
						}
					
					});
					
					
					$(".minus").click(function(){
						var num = $(".numBox").val();
						var minusNum = Number(num) - 1;
						
						if(minusNum <=0){
							$(".numBox").val(num);
						}else {
							$(".numBox").val(minusNum);
						}
					
					});
				
				
				</script>
	<%-- </c:if>
					<sec:authorize access="isAuthenticated()">
						<p class="addToCart">
							<button type="button" class="btn btn-dark addCart_btn mb-3"
								style="width: 100%;">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
  <path
										d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
</svg>
								&nbsp;카트에 담기
							</button>
					</sec:authorize>


					<hr>
					${view.gdsDes }
 --%>
	<script>
						var csrfHeaderName = "${_csrf.headerName}";
						var csrfTokenValue = "${_csrf.token}";

						$(".addCart_btn").click(
								function() {
									var gdsNum = $(".gdsNum").val();
									var cartStock = $(".numBox").val();
									var gdsName =$(".gdsName").val();
									var data = {
										gdsNum : gdsNum,
										cartStock : cartStock,
										gdsName : gdsName
									};

									$.ajax({
										url : "/shopdetail/view/addCart",
										type : "post",
										data : data,
										beforeSend : function(xhr) {
											xhr.setRequestHeader(
													csrfHeaderName,
													csrfTokenValue);
										},
										success : function() {
											alert("카트 담기 성공");
											$(".numBox").val("1");
										},
										error : function() {
											alert("카트 담기 실패");
										}
									});
								});
					</script>


	<!-- 	</div>

	</div>
	</div>
	</div> -->

	<script src="/resources/js/script.js"></script>
</body>

<%@ include file="../includes/footer.jsp"%>
</html>
