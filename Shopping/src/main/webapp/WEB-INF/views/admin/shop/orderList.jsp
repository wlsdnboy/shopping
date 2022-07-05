<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../includes/navbar.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="list-group" style="width: 60%; margin: auto;">
		<c:forEach items="${orderList}" var="orderList">
			<a href="/admin/shop/orderView?n=${orderList.orderId}"
				class="list-group-item list-group-item-action d-flex gap-3 py-3"
				aria-current="true"> <img src="https://github.com/twbs.png"
				alt="twbs" width="32" height="32"
				class="rounded-circle flex-shrink-0">

				<div>
					<h6 class="mb-0">주문번호</h6>
					<p class="mb-0 opacity-75">${orderList.orderId}</p>
				</div>

			</a>
		</c:forEach>
	</div>
	<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token}" />

</body>

<%@ include file="../../includes/footer.jsp"%>
</html>