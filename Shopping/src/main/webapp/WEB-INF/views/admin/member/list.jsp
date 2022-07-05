<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../includes/navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="">


		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token}" />
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col"
						style="display: table-cell; text-align: center; vertical-align: middle;">아이디</th>
					<th scope="col"
						style="display: table-cell; text-align: center; vertical-align: middle;">이름</th>
					<th scope="col"
						style="display: table-cell; text-align: center; vertical-align: middle;">이메일</th>
					<th scope="col"
						style="display: table-cell; text-align: center; vertical-align: middle;">주소</th>
					<th scope="col"
						style="display: table-cell; text-align: center; vertical-align: middle;">핸드폰번호</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${memberList }" var="memberList">
					<tr>
						<td
							style="display: table-cell; text-align: center; vertical-align: middle;"><a
							href="/admin/member/memberView?n=${memberList.userid }">${memberList.userid }</a>
						</td>
						<td
							style="display: table-cell; text-align: center; vertical-align: middle;">${memberList.userName }</td>

						<td
							style="display: table-cell; text-align: center; vertical-align: middle;">${memberList.useremail }</td>
						<td
							style="display: table-cell; text-align: center; vertical-align: middle;">${memberList.useraddress }</td>
						<td
							style="display: table-cell; text-align: center; vertical-align: middle;">${memberList.userphoneNumber }</td>


					</tr>
				</c:forEach>

			</tbody>
		</table>


	</div>

</body>
<%@ include file="../../includes/footer.jsp"%>
</html>