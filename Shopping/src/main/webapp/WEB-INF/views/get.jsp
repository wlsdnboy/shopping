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

			<div class="mb-3">
				<label class="form-label"> 게시물 번호 </label> <input type="text"
					class="form-control" name="bno"
					value='<c:out value="${board.bno }"/>' readonly="readonly">

			</div>


			<div class="mb-3">
				<label class="form-label"> 제목 </label> <input type="text"
					class="form-control" name="title"
					value='<c:out value="${board.title }"/>' readonly="readonly">

			</div>
			<div class="mb-3">
				<label class="form-label"> 작성자 </label> <input type="text"
					class="form-control" name="writer"
					value='<c:out value="${board.writer }"/>' readonly="readonly">

			</div>

			<div class="mb-3">
				 
					
					<c:out value="${fn:replace(board.content, IF, '<br/>') }" escapeXml="false" />
					

			</div>
			<button class="btn btn-dark" style="float: right;">
				<a href="/list">목록</a>
			</button>

		</form>
	</div>
</body>


</html>