<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


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
a:hover {
	color: yellow;
}

a {
	color: black;
}
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
	<table class="table">


		<tbody>

			<c:forEach items="${list }" var="list" varStatus="status">
				<tr>
					<th scope="row" style="text-align: center;"><c:out
							value="${status.index +1}  " /></th>

					<td colspan="2"><h5 style="font-size: 50px;">
							<span onmouse> <a href="/shopdetail/view1?gdsNum=${list.gdsNum }">${list.gdsName }</a>
							</span>
						</h5></td>
					<td style="text-align: left;"><h5 style="font-size: 50px;">
							<fmt:formatNumber pattern="###,###,###" value="${list.gdsPrice}" />
							원
						</h5></td>
					<td><img class="card-img-top" src="${list.gdsImg }" alt="..."
						style="width: 50px; height: 50px;" /></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>






	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<!-- <script src="js/scripts.js"></script> -->

	<%@ include file="../includes/footer.jsp"%>

</body>
<script src="/resources/js/script.js"></script>
</html>



