<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/navbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("LF", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/style.css" rel="stylesheet">
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
						<td scope="row"><c:out
								value="${fn:replace(board.content, LF, '<br>')}"
								escapeXml="false" /></td>

					</tr>
					<tr>
						<td style="border: none; float: right;">
							<button type="button" class="btn btn-warning">
								<a href="/modify?bno=${board.bno }">수정</a>
							</button>
							<button type="button" class="btn btn-dark">
								<a href="/list?pageNum=${cri.pageNum }&amount=${cri.amount }">
									목록 </a>
							</button>
						</td>

					</tr>
				</tbody>
			</table>


		</form>

		<form id="operForm" action="/modify" method="get">
			<input type="hidden" id="bno" name="bno" value="${board.bno }" /> <input
				type="hidden" name="pageNum" value="${cri.pageNum }" /> <input
				type="hidden" name="amount" value="${cri.amount }" />

			<!-- 폼을 생성해서 게시물 번호를 숨김값으로 전달 -->
		</form>
	</div>
</body>


</html>