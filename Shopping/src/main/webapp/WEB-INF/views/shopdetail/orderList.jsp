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
a {
	color: black;
}
</style>





</head>
<body style="margin: auto;">
	<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token}" />


	<div style="width: 70%; margin: auto;">
		<h1 style="margin-top: 50px;">주문내역</h1>
		<hr>
	</div>
	<br>
	<br>
	<br>


	<div style="width: 70%; margin: auto;">
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
	<br>
	<br>



<script>




</script>




</body>

<%@ include file="../includes/footer.jsp"%>
</html>
