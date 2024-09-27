<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../resources/css/stylec.css" rel="stylesheet" />
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Helvetica;
	background: #eee;
	-webkit-font-smoothing: antialiased;
}

hgroup {
	text-align: center;
}

h1, h3 {
	font-weight: 300;
}

h1 {
	color: #636363;
}

h3 {
	color: #4a89dc;
}

form {
	width: 380px;
	margin: 4em auto;
	padding: 3em 2em 2em 2em;
	background: #fafafa;
	border: 1px solid #ebebeb;
	box-shadow: rgba(0, 0, 0, 0.14902) 0px 1px 1px 0px,
		rgba(0, 0, 0, 0.09804) 0px 1px 2px 0px;
}

.group {
	position: relative;
	margin-bottom: 45px;
}

input {
	font-size: 18px;
	padding: 10px 10px 10px 5px;
	-webkit-appearance: none;
	display: block;
	background: #fafafa;
	color: #636363;
	width: 100%;
	border: none;
	border-radius: 0;
	border-bottom: 1px solid #757575;
}

input:focus {
	outline: none;
}

/* Label */
label {
	color: #999;
	font-size: 18px;
	font-weight: normal;
	position: absolute;
	pointer-events: none;
	left: 5px;
	top: 10px;
	transition: all 0.2s ease;
}

/* active */
input:focus ~ label, input.used ~ label {
	top: -20px;
	transform: scale(.75);
	left: -2px;
	/* font-size: 14px; */
	color: #4a89dc;
}

/* Underline */
.bar {
	position: relative;
	display: block;
	width: 100%;
}

.bar:before, .bar:after {
	content: '';
	height: 2px;
	width: 0;
	bottom: 1px;
	position: absolute;
	background: #4a89dc;
	transition: all 0.2s ease;
}

.bar:before {
	left: 50%;
}

.bar:after {
	right: 50%;
}

/* active */
input:focus ~ .bar:before, input:focus ~ .bar:after {
	width: 50%;
}

/* Highlight */
.highlight {
	position: absolute;
	height: 60%;
	width: 100px;
	top: 25%;
	left: 0;
	pointer-events: none;
	opacity: 0.5;
}

/* active */
input:focus ~ .highlight {
	animation: inputHighlighter 0.3s ease;
}

/* Animations */
@
keyframes inputHighlighter {from { background:#4a89dc;
	
}

to {
	width: 0;
	background: transparent;
}

}

/* Button */
.button {
	position: relative;
	display: inline-block;
	padding: 12px 24px;
	margin: .3em 0 1em 0;
	width: 100%;
	vertical-align: middle;
	color: #fff;
	font-size: 16px;
	line-height: 20px;
	-webkit-font-smoothing: antialiased;
	text-align: center;
	letter-spacing: 1px;
	background: transparent;
	border: 0;
	border-bottom: 2px solid #3160B6;
	cursor: pointer;
	transition: all 0.15s ease;
}

.button:focus {
	outline: 0;
}

/* Button modifiers */
.buttonBlue {
	background: #4a89dc;
	text-shadow: 1px 1px 0 rgba(39, 110, 204, .5);
}

.buttonBlue:hover {
	background: #357bd8;
}

/* Ripples container */
.ripples {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
	background: transparent;
}

/* Ripples circle */
.ripplesCircle {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	opacity: 0;
	width: 0;
	height: 0;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.25);
}

.ripples.is-active .ripplesCircle {
	animation: ripples .4s ease-in;
}

/* Ripples animation */
@
keyframes ripples { 0% {
	opacity: 0;
}

25


























%
{
opacity


























:


























1
























;
}
100


























%
{
width


























:


























200
























%;
padding-bottom


























:


























200
























%;
opacity


























:


























0
























;
}
}
footer {
	text-align: center;
}

footer p {
	color: #888;
	font-size: 13px;
	letter-spacing: .4px;
}

footer a {
	color: #4a89dc;
	text-decoration: none;
	transition: all .2s ease;
}

footer a:hover {
	color: #666;
	text-decoration: underline;
}

footer img {
	width: 80px;
	transition: all .2s ease;
}

footer img:hover {
	opacity: .83;
}

footer img:focus, footer a:focus {
	outline: none;
}
</style>
</head>
<body>
	<div style="width: 70%;" class="mx-auto">

		<hgroup>
			<br>
			<br>
			<h1>JINWOO SHOP</h1>
			<h3>상품 화면</h3>
		</hgroup>

		<form role="form" method="post" autocomplete="off">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" /><input type="hidden" name="gdsNum"
				value="${goods.gdsNum }" />

			<div class="group">
				<span>상품명</span> <input type="text" id="gdsName" name="gdsName"
					value="${goods.gdsName }" readonly><span class="highlight"></span><span
					class="bar"></span>
			</div>
			<div class="group">
				<span>상품 가격</span> <input type="text" id="gdsPrice" name="gdsPrice"
					value="${goods.gdsPrice }" readonly><span class="highlight"></span><span
					class="bar"></span>
			</div>
			<div class="group">
				<span>상품 수량</span> <input type="text" id="gdsStock" name="gdsStock"
					value="${goods.gdsStock }" readonly><span class="highlight"></span><span
					class="bar"></span>
			</div>


			<span>상품 이미지</span>
			<div class="group">
				<img src="${goods.gdsThumbImg }" />
			</div>
			<div class="group">
				<span>이미지 저장 위치</span> <input type="text"
					value="<%=request.getRealPath("/")%>" readonly><span
					class="highlight"></span><span class="bar"></span>
			</div>

			<textarea class="form-control mb-3" aria-label="With textarea"
				id="gdsDes" name="gdsDes" rows="5" cols="50" style="resize: none;"
				readonly>${goods.gdsDes }</textarea>


			<div class="group">
				<input type="text" value="${goods.cateCodeRef }" readonly><span
					class="highlight"></span><span class="bar"></span>
			</div>

			<div class="group">
				<input type="text" value="${goods.cateCode }" readonly><span
					class="highlight"></span><span class="bar"></span>
			</div>

			<div style="text-align: center;">
				<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
				<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
			</div>
		</form>


	</div>
	<script>
		var formObj = $("form[role='form']");

		$("#modify_Btn").click(function() {
			formObj.attr("action", "/admin/goods/modify");
			formObj.attr("method", "get")
			formObj.submit();

		});

		$("#delete_Btn").click(function() {

			var con = confirm("삭제하시겠습니까");
			console.log(true);
			if (con) {

				formObj.attr("action", "/admin/goods/delete");
				formObj.submit();
			}

		})
	</script>



	<%@ include file="../../includes/footer.jsp"%>
</body>

<script src="/resources/js/script.js"></script>
</html>