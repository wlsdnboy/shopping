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

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body style="width: 70%; margin: auto;">

	<div style="height: 100px;">
		<h1>주문목록</h1>
	</div>
	<table class="table  table-hover">
		<thead>
			<tr>
				<th scope="col"></th>

			</tr>

		</thead>
		<tbody>
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
					<td
						style="display: table-cell; text-align: center; vertical-align: middle;">${orderList.delivery }</td>
				</tr>


			</c:forEach>
		</tbody>
	</table>

	<br>
	<br>


	<table class="table  table-hover">
		<thead>
			<tr>
				<th scope="col"></th>

			</tr>
		</thead>
		<tbody>




			<c:forEach items="${orderView}" var="orderView" varStatus="status">

				<c:if test="${status.first}">
					<tr>
						<th scope="row">주문자</th>
						<td>${orderView.userId}</td>

					</tr>
					<tr>
						<th scope="row">수령인</th>
						<td>${orderView.orderRec}</td>

					</tr>
					<tr>
						<th scope="row">제품 이름</th>
						<td>${orderView.gdsNames }</td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td>(${orderView.userAddr1}) ${orderView.userAddr2}
							${orderView.userAddr3}</td>

					</tr>



					<tr>

						<th scope="row">가격</th>
						<td><fmt:formatNumber pattern="###,###,###"
								value="${orderView.amount}" /> 원</td>

					</tr>
					<tr>
						<th scope="row">배송 상태</th>
						<td><input type="text" name="delivery" class="delivery"
							value="${orderView.delivery }" readonly /></td>

					</tr>
					<tr>
						<th scope="row">배송 상태 변경</th>
						<td><div class="deliveryChange">
								<form role="form" method="post" class="deliveryForm">
									<input type="hidden" name="${_csrf.parameterName }"
										value="${_csrf.token}" /> <input type="hidden" name="orderId"
										value="${orderView.orderId }" /> <input type="hidden"
										name="delivery" class="delivery" value="" />


									<div class="btn-group me-2" role="group"
										aria-label="Second group">
										<button type="button" class="btn btn-secondary delivery1_btn">주문접수</button>
										<button type="button" class="btn btn-secondary delivery2_btn">입금확인</button>
										<button type="button" class="btn btn-secondary delivery3_btn">배송중</button>
										<button type="button" class="btn btn-secondary delivery4_btn">배송완료</button>
										<button type="button" class="btn btn-secondary delivery5_btn">주문취소</button>
									</div>
								</form>
							</div></td>

					</tr>
				</c:if>
			</c:forEach>

		</tbody>
	</table>


	<script>
		$(document).ready(function() {
			swal({
				  title: "배송 완료 처리 하시겠습니까?",
				  text: "고객의 배송 상태도 배송 완료 처리 됩니다",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					 
				    swal("배송 완료!", {
				      icon: "success",
				    });
				    
				    $(".delivery").val("배송완료");
					run();
				  } else {
				    swal("Your imaginary file is safe!");
				    history.back();
				  }
				});
		});

		$(".delivery1_btn").click(function() {
			$(".delivery").val("주문접수");

		});

		$(".delivery2_btn").click(function() {
			$(".delivery").val("입금확인");
			run();

		});
		$(".delivery3_btn").click(function() {
			$(".delivery").val("배송중");

		});
		$(".delivery4_btn").click(function() {
			$(".delivery").val("배송완료");
			run();
		});
		$(".delivery5_btn").click(function() {
			$(".delivery").val("주문취소");

		});

		function run() {
			$(".deliveryForm").submit();
		}
	</script>



</body>
<%@ include file="../../includes/footer.jsp"%>
</html>