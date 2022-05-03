<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/navbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("IF", "\n");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="width: 60%; margin: auto;">
		<form>

			<table class="table mt-5">
				<thead>
					<tr>
						<th scope="col"><c:out value="${board.title }" /></th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="col"><c:out value="${board.writer }" /></th>

					</tr>
					<tr>
						<td scope="row"><c:out value="${board.content }" /></td>

					</tr>
					<tr>
						<td style="border: none; float: right;"><button type="button"
								class="btn btn-warning">
								<a href="/modify?bno=${board.bno }">수정</a>
							</button>
							<button type="button" class="btn btn-dark"><a href="/list">목록</button></td>

					</tr>
				</tbody>
			</table>


		</form>
	</div>
</body>


</html>