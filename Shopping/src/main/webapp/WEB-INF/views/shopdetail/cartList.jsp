<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
.orderInfo {
	display: none;
}
</style>





</head>
<body>
	<div style="width: 70%; margin: auto;">
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token}" />

		<div style="height: 200px;">
			<h1 style="margin-top: 100px;">
				<sec:authentication property="principal.username" />
				님의 장바구니
			</h1>
		</div>



		<br>

		<table class="table">
			<thead>

				<tr>
					<th scope="col"><input type="checkbox" name="allCheck"
						id="allCheck" /></th>
					<th scope="col">상품</th>
					<th scope="col"
						style="display: table-cell; text-align: center; vertical-align: middle;">상품이름</th>
					<th scope="col"
						style="display: table-cell; text-align: center; vertical-align: middle;">가격</th>
					<th scope="col"
						style="display: table-cell; text-align: center; vertical-align: middle;">수량</th>
					<th scope="col"
						style="display: table-cell; text-align: center; vertical-align: middle;">합계</th>
				</tr>

			</thead>
			<tbody>


				<c:set var="sum" value="0" />
				<c:forEach items="${cartList}" var="cartList">

					<tr>
						<th scope="row"><input type="checkBox" name="chBox"
							class="chBox" data-cartNum="${cartList.cartNum }" /></th>
						<td><img src="${cartList.gdsThumbImg}"
							style="width: 150px; height: 150px;" /></td>
						<td
							style="display: table-cell; text-align: center; vertical-align: middle;">${cartList.gdsName}</td>
						<td
							style="display: table-cell; text-align: center; vertical-align: middle;"><fmt:formatNumber
								pattern="###,###,###" value="${cartList.gdsPrice}" /></td>
						<td
							style="display: table-cell; text-align: center; vertical-align: middle;">${cartList.cartStock}</td>
						<td
							style="display: table-cell; text-align: center; vertical-align: middle;"><fmt:formatNumber
								pattern="###,###,###"
								value="${cartList.gdsPrice * cartList.cartStock}" /></td>
					</tr>
					<c:set var="sum"
						value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />




				</c:forEach>

			</tbody>
		</table>
		<div class="sum">
			총 합계 :
			<fmt:formatNumber pattern="###,###,###" value="${sum }" />
			원



		</div>
		<br>



		<script>
			$("#allCheck").click(function() {
				var chk = $("#allCheck").prop("checked");
				if (chk) {
					$(".chBox").prop("checked", true);
				} else {
					$(".chBox").prop("checked", false);
				}
			});

			<c:forEach items="${cartList}" var="cartList">
			<c:set var="gdsNames"
			value="${cartList.gdsName}" />
			</c:forEach>
		</script>



		<div class="delBtn">
			<div class="d-grid gap-2 d-md-block" style="float: right;">
				<button class="btn btn-info orderOpne_bnt" type="button">구매하기</button>
				<button class="btn btn-danger selectDelete_btn" type="button">선택한
					항목 삭제</button>
			</div>
			<br> <br> <br> <br>


			<script>
				var csrfHeaderName = "${_csrf.headerName}";
				var csrfTokenValue = "${_csrf.token}";
				$(".selectDelete_btn").click(
						function() {
							var confirm_val = confirm("정말 삭제하시겠습니까?");

							if (confirm_val) {
								var checkArr = new Array();

								$("input[class = 'chBox']:checked").each(
										function() {
											checkArr.push($(this).attr(
													"data-cartNum"));
										});

								$.ajax({
									url : "/shopdetail/deleteCart",
									type : "post",
									data : {
										chbox : checkArr
									},
									beforeSend : function(xhr) {
										xhr.setRequestHeader(csrfHeaderName,
												csrfTokenValue);
									},
									success : function(result) {

										location.href = "/shopdetail/cartList";

									}

								});
							}

						});
			</script>

		</div>





		<script>
			$(".chBox").click(function() {
				$("#allCheck").prop("checked", false);
			});
		</script>





		<div class="listResult">

			<div class="orderOpne">



				<script>
					$(".orderOpne_bnt").click(function() {
						$(".orderInfo").slideDown();
						$(".orderOpne_bnt").slideUp();
					});
				</script>

			</div>
		</div>

		<div class="orderInfo" style="">
			<form role="form" method="post" autocomplete="off">
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token}" /> <input type="hidden" name="amount"
					value="${sum}" /> <input type="hidden" name="gdsNames"
					value="${gdsNames} ">

				<h1>주문하기</h1>
				<br>
				<hr>
				<h4 style="margin-bottom: 50px;">수령자 정보</h4>


				<div style="margin-left: 10px;">
					<div class="inputArea mb-3" style="width: 50%;">
						<label>수령인</label> <input type="text" class="form-control"
							placeholder="이름" name="orderRec" id="orderRec"
							required="required">
					</div>
					<div class="inputArea mb-3" style="width: 50%;">
						<label>휴대전화</label> <input type="text" class="form-control"
							placeholder="전화번호" name="orderPhon" id="orderPhon"
							required="required">
					</div>

					<div class="inputArea mb-3">
						<p>
							<label class="mb-3">배송지 주소</label><br>
							<button class="btn btn-info mb-3" type="button"
								onclick="sample2_execDaumPostcode()" style="color: white">우편번호
								찾기</button>

							<input type="text" class="form-control" id="sample2_postcode"
								placeholder="우편번호" style="width: 30%;">
						</p>


						<p>
							<input type="text" class="form-control mb-3" name="userAddr1"
								id="sample2_address" placeholder="주소"> <input
								type="text" name="userAddr2" id="sample2_detailAddress"
								class="form-control mb-3" placeholder="상세주소"> <input
								type="text" name="userAddr3" class="form-control mb-3"
								id="sample2_extraAddress" placeholder="참고항목">
						</p>
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer"
							style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
								id="btnCloseLayer"
								style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
								onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
					</div>

					<div class="d-grid gap-2 d-md-block" style="float: right;">
						<button class="btn btn-info order_btn" type="submit">주문하기</button>
						<button class="btn btn-danger cancel_btn" type="button">취소하기</button>
					</div>
					<br> <br>

					<script
						src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
						// 우편번호 찾기 화면을 넣을 element
						var element_layer = document.getElementById('layer');

						function closeDaumPostcode() {
							// iframe을 넣은 element를 안보이게 한다.
							element_layer.style.display = 'none';
						}

						function sample2_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if (data.userSelectedType === 'R') {
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if (extraAddr !== '') {
													extraAddr = ' ('
															+ extraAddr + ')';
												}
												// 조합된 참고항목을 해당 필드에 넣는다.
												document
														.getElementById("sample2_extraAddress").value = extraAddr;

											} else {
												document
														.getElementById("sample2_extraAddress").value = '';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document
													.getElementById('sample2_postcode').value = data.zonecode;
											document
													.getElementById("sample2_address").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById(
													"sample2_detailAddress")
													.focus();

											// iframe을 넣은 element를 안보이게 한다.
											// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
											element_layer.style.display = 'none';
										},
										width : '100%',
										height : '100%',
										maxSuggestItems : 5
									}).embed(element_layer);

							// iframe을 넣은 element를 보이게 한다.
							element_layer.style.display = 'block';

							// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
							initLayerPosition();
						}

						// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
						// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
						// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
						function initLayerPosition() {
							var width = 300; //우편번호서비스가 들어갈 element의 width
							var height = 400; //우편번호서비스가 들어갈 element의 height
							var borderWidth = 5; //샘플에서 사용하는 border의 두께

							// 위에서 선언한 값들을 실제 element에 넣는다.
							element_layer.style.width = width + 'px';
							element_layer.style.height = height + 'px';
							element_layer.style.border = borderWidth
									+ 'px solid';
							// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
							element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
									+ 'px';
							element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
									+ 'px';
						}
					</script>
				</div>
				<div class="inputArea">

					<script>
						$(".cancel_btn").click(function() {
							$(".orderInfo").slideUp();
							$(".orderOpne_bnt").slideDown();
						});
					</script>


				</div>

			</form>
		</div>
	</div>




</body>

<%@ include file="../includes/footer.jsp"%>
</html>
