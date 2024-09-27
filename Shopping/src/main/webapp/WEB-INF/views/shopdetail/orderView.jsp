<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/shopdetailnavbar.jsp"%>
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

<style>
</style>





</head>
<body style="width: 70%; margin: auto;">


	<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token}" />

	<div style="margin-top: 50px; height: 100px;">
		<h4>주문 상세 내역</h4>
		<hr>
	</div>

	<table class="table">
		<thead>

			<tr>
				<th scope="col"></th>
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
			<c:forEach items="${orderView}" var="orderView">

				<tr>
					<th scope="row"></th>
					<td><img src="${orderView.gdsThumbImg}"
						style="width: 150px; height: 150px;" /></td>
					<td
						style="display: table-cell; text-align: center; vertical-align: middle;">${orderView.gdsName}</td>
					<td
						style="display: table-cell; text-align: center; vertical-align: middle;"><fmt:formatNumber
							pattern="###,###,###" value="${orderView.gdsPrice}" /></td>
					<td
						style="display: table-cell; text-align: center; vertical-align: middle;">${orderView.cartStock}</td>
					<td
						style="display: table-cell; text-align: center; vertical-align: middle;"><fmt:formatNumber
							pattern="###,###,###"
							value="${orderView.gdsPrice * orderView.cartStock}" /></td>

				</tr>


			</c:forEach>

		</tbody>
	</table>

	<div style="margin-top: 50px; height: 100px;">
		<h4>배송지 정보</h4>
		<hr>
	</div>

	<div class="orderInfo">
		<c:forEach items="${orderView}" var="orderView" varStatus="status">

			<c:if test="${status.first}">
				<p>
					<span>수령인 </span>${orderView.orderRec}</p>
				<p>
					<span>주소 </span>(${orderView.userAddr1}) ${orderView.userAddr2}
					${orderView.userAddr3}
				</p>


				<c:set var="sum" value="${orderView.amount }">
				</c:set>
			</c:if>

		</c:forEach>
	</div>



	<div style="margin-top: 50px; height: 100px;">

		<h4>최종 결제 정보</h4>
		<hr>
		<span>가격</span>
		<fmt:formatNumber pattern="###,###,###" value="${sum }" />
		원

	</div>

	<div style="margin-top: 50px; height: 100px; text-align: center;">

		<h4 style="text-align: left;">주문 취소</h4>
		<hr>


		<form role="form" method="post">
			<c:forEach items="${orderView}" var="orderView">

				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token}" />

				<input type="hidden" value="${orderView.delivery }" name="delivery" />


				<c:set var="delivery" value="${orderView.delivery }" />




			</c:forEach>

			<c:if test="${delivery == '주문접수' }">
				<button type="submit" class="btn btn-danger"
					style="margin-top: 30px;">주문취소</button>
			</c:if>
		</form>
	</div>


	&nbsp;&nbsp;&nbsp;

	<script>
		
	</script>






</body>

<%@ include file="../includes/footer.jsp"%>


</html>
