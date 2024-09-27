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
	<div style="width: 50%; margin: auto;">

		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">상품명</th>
					<th scope="col">카테고리</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">등록날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="list">
					<tr>
						<td><img src="${list.gdsThumbImg }"></td>
						<td><a href="/admin/goods/view?gdsNum=${list.gdsNum }">${list.gdsName}</a></td>
						<td>${list.cateName }</td>
						<td><fmt:formatNumber value="${list.gdsPrice }"
								pattern="###,###,###" /></td>
						<td>${list.gdsStock}</td>
						<td><fmt:formatDate value="${list.gdsDate }"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>


	</div>
	<%@ include file="../../includes/footer.jsp"%>

</body>
</html>