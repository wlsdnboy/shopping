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
<body style="width: 60%; margin: auto;">
	<c:forEach items="${member }" var="member">
		<form method="post" name="fr">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" />
			<!-- Experience-->

			<section class="resume-section" id="experience">
				<div class="resume-section-content">
					<h2 class="mb-5">회원정보 변경</h2>

					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">아이디</h3>

							<p>
								<input type="text" class="form-control mt-3" name="userid"
									value="${member.userid }" readonly />
							</p>
						</div>

					</div>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">이름</h3>

							<p>
								<input type="text" class="form-control mt-3" name="userName"
									value="${member.userName }" />
							</p>
						</div>

					</div>

					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">이메일</h3>

							<p>
								<input type="email" class="form-control mt-3"
									value="${member.useremail }" name="useremail" />
							</p>
						</div>

					</div>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">주소</h3>

							<p>
								<input type="text" class="form-control mt-3"
									value="${member.useraddress }" name="useraddress" />
							</p>
						</div>

					</div>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">전화번호</h3>

							<p>
								<input type="text" class="form-control mt-3"
									value="${member.userphoneNumber }" name="userphoneNumber" />
							</p>
						</div>

					</div>


					<div style="text-align: center;">
						<button type="submit" class="btn btn-dark">회원정보 변경</button>
						<br>
					</div>

				</div>
			</section>
		</form>
		<div style="text-align: center;">
			<a href="/admin/member/delete?n=${member.userid }"><button
					class="btn btn-danger">회원정보 변경1</button></a>
		</div>
	</c:forEach>

</body>

<%@ include file="../../includes/footer.jsp"%>
</html>