<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.buttonRed {
	background: red;
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

	<hgroup>
		<br>
		<br>
		<h1>JINWOO SHOP</h1>
		<h3>상품 등록 화면</h3>
	</hgroup>

	<form role="form" method="post" autocomplete="off"
		enctype="multipart/form-data">



		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token}" />
		<div class="group">
			<input type="text" id="gdsName" name="gdsName"><span
				class="highlight"></span><span class="bar"></span> <label>상품명</label>
		</div>
		<div class="group">
			<input type="text" id="gdsPrice" name="gdsPrice"><span
				class="highlight"></span><span class="bar"></span> <label>상품
				가격</label>
		</div>
		<div class="group">
			<input type="text" id="gdsStock" name="gdsStock"><span
				class="highlight"></span><span class="bar"></span> <label>상품
				수량</label>
		</div>

		<div class="group">
			<span>상품 이미지</span> <input type="file" id="gdsImg" name="file"
				multiple="multiple">
			<div class="select_img">
				<img src="" />
			</div>
			<span class="highlight"></span><span class="bar"></span>
		</div>
		<div class="group">
			<span>이미지 저장 위치</span> <input type="text"
				value="<%=request.getRealPath("/")%>" readonly><span
				class="highlight"></span><span class="bar"></span>
		</div>

		<textarea class="form-control mb-3" aria-label="With textarea"
			id="gdsDes" name="gdsDes" rows="5" cols="50" style="resize: none;"> </textarea>

		1차 분류<select class="category1 form-select mb-3"
			aria-label="Default select example">
			<option value="">전체</option>



		</select><span>2차분류</span> <select class="category2 form-select mb-4"
			name="cateCode" aria-label="Default select example">
			<option value="">전체</option>
		</select>


		<button type="submit" class="button buttonBlue" id="register_Btn">
			등록
			<div class="ripples buttonRipples">
				<span class="ripplesCircle"></span>
			</div>
		</button>

		<button type="button" class="button buttonRed"
			onclick="history.back();">
			취소
			<div class="ripples buttonRipples">
				<span class="ripplesCircle"></span>
			</div>
		</button>


	</form>

	<script>
		$(window, document, undefined)
				.ready(
						function() {

							$('input').blur(function() {
								var $this = $(this);
								if ($this.val())
									$this.addClass('used');
								else
									$this.removeClass('used');
							});

							var $ripples = $('.ripples');

							$ripples.on('click.Ripples', function(e) {

								var $this = $(this);
								var $offset = $this.parent().offset();
								var $circle = $this.find('.ripplesCircle');

								var x = e.pageX - $offset.left;
								var y = e.pageY - $offset.top;

								$circle.css({
									top : y + 'px',
									left : x + 'px'
								});

								$this.addClass('is-active');

							});

							$ripples
									.on(
											'animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd',
											function(e) {
												$(this)
														.removeClass(
																'is-active');
											});

						});
	</script>















	<%-- <div style="width: 70%;" class="mx-auto">
		<br>


		<form role="form" method="post" autocomplete="off"
			enctype="multipart/form-data">



			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" /> <label>1차분류</label> <select
				class="category1 form-select mb-3"
				aria-label="Default select example">
				<option value="">전체</option>



			</select> <label>2차분류</label><select class="category2 form-select mb-4"
				name="cateCode" aria-label="Default select example">
				<option value="">전체</option>
			</select>

			<div class="input-group mb-4">
				<span class="input-group-text" id="basic-addon1"><svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-box-seam" viewBox="0 0 16 16">
  <path
							d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5l2.404.961L10.404 2l-2.218-.887zm3.564 1.426L5.596 5 8 5.961 14.154 3.5l-2.404-.961zm3.25 1.7-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z" />
</svg> </span> <input type="text" id="gdsName" name="gdsName" class="form-control"
					placeholder="상품 명을 입력해 주세요" aria-label="Username"
					aria-describedby="basic-addon1">
			</div>


			<div class="input-group mb-4">
				<span class="input-group-text" id="basic-addon1">￦ </span> <input
					type="text" id="gdsPrice" name="gdsPrice" class="form-control"
					placeholder="상품 가격을 입력해 주세요" aria-label="Username"
					aria-describedby="basic-addon1">
			</div>

			<div class="input-group mb-4">
				<span class="input-group-text" id="basic-addon1"><svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-123" viewBox="0 0 16 16">
  <path
							d="M2.873 11.297V4.142H1.699L0 5.379v1.137l1.64-1.18h.06v5.961h1.174Zm3.213-5.09v-.063c0-.618.44-1.169 1.196-1.169.676 0 1.174.44 1.174 1.106 0 .624-.42 1.101-.807 1.526L4.99 10.553v.744h4.78v-.99H6.643v-.069L8.41 8.252c.65-.724 1.237-1.332 1.237-2.27C9.646 4.849 8.723 4 7.308 4c-1.573 0-2.36 1.064-2.36 2.15v.057h1.138Zm6.559 1.883h.786c.823 0 1.374.481 1.379 1.179.01.707-.55 1.216-1.421 1.21-.77-.005-1.326-.419-1.379-.953h-1.095c.042 1.053.938 1.918 2.464 1.918 1.478 0 2.642-.839 2.62-2.144-.02-1.143-.922-1.651-1.551-1.714v-.063c.535-.09 1.347-.66 1.326-1.678-.026-1.053-.933-1.855-2.359-1.845-1.5.005-2.317.88-2.348 1.898h1.116c.032-.498.498-.944 1.206-.944.703 0 1.206.435 1.206 1.07.005.64-.504 1.106-1.2 1.106h-.75v.96Z" />
</svg> </span> <input type="text" id="gdsStock" name="gdsStock" class="form-control"
					placeholder="상품 수량을 입력해 주세요" aria-label="Username"
					aria-describedby="basic-addon1">
			</div>

			<div class="input-group mb-1">
				<span class="input-group-text"><svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-vector-pen" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
							d="M10.646.646a.5.5 0 0 1 .708 0l4 4a.5.5 0 0 1 0 .708l-1.902 1.902-.829 3.313a1.5 1.5 0 0 1-1.024 1.073L1.254 14.746 4.358 4.4A1.5 1.5 0 0 1 5.43 3.377l3.313-.828L10.646.646zm-1.8 2.908-3.173.793a.5.5 0 0 0-.358.342l-2.57 8.565 8.567-2.57a.5.5 0 0 0 .34-.357l.794-3.174-3.6-3.6z" />
  <path fill-rule="evenodd"
							d="M2.832 13.228 8 9a1 1 0 1 0-1-1l-4.228 5.168-.026.086.086-.026z" />
</svg></span>
				<textarea class="form-control" aria-label="With textarea"
					id="gdsDes" name="gdsDes" rows="5" cols="50" style="resize: none;"> </textarea>
			</div>

			<div class="mb-4">
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token}" /> <label for="formFile" class="form-label">썸네일</label>
				<input class="form-control" type="file" id="gdsImg" name="file"
					multiple="multiple">
				<div class="select_img">
					<img src="" />
				</div>

				<div class="mb-4">
					<label>상세 화면 이미지</label> <input class="form-control" name="file1"
						type="file" id="gdsImgs" multiple>


				</div>

				<div class="input-group mb-4">
					<span class="input-group-text" id="basic-addon1">이미지 저장 위치</span> <input
						class="form-control" type="text"
						value="<%=request.getRealPath("/")%>"
						aria-label="readonly input example" readonly>
				</div>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-light" id="register_Btn">등록</button>
					<button type="button" class="btn btn-danger"
						onclick="history.back();">취소</button>
				</div>

				<br> <br>


				<script>
					$("#gdsImg").change(
							function() {
								if (this.files && this.files[0]) {
									var reader = new FileReader;
									reader.onload = function(data) {
										$(".select_img img").attr("src",
												data.target.result).width(300);
									}
									reader.readAsDataURL(this.files[0]);
								}
							});
				</script>
			</div>






		</form> --%>
	</div>
	<script>
		var regExp = /[^0-9]/gi;

		$("#gdsPrice").keyup(function() {
			numCheck($(this));
		});
		$("#gdsStock").keyup(function() {
			numCheck($(this));
		});

		function numCheck(selector) {
			var tempVal = selector.val();
			selector.val(tempVal.replace(regExp, ""));

		}
	</script>




	<script>
		// 컨트롤러에서 데이터 받기
		var jsonData = JSON.parse('${category}');
		console.log(jsonData);

		var cate1Arr = new Array();
		var cate1Obj = new Object();

		// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
		for (var i = 0; i < jsonData.length; i++) {

			if (jsonData[i].level == "1") {
				cate1Obj = new Object(); //초기화
				cate1Obj.cateCode = jsonData[i].cateCode;
				cate1Obj.cateName = jsonData[i].cateName;
				cate1Arr.push(cate1Obj);
			}
		}

		// 1차 분류 셀렉트 박스에 데이터 삽입
		var cate1Select = $("select.category1")

		for (var i = 0; i < cate1Arr.length; i++) {
			cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
					+ cate1Arr[i].cateName + "</option>");
		}

		$(document)
				.on(
						"change",
						"select.category1",
						function() {
							var cate2Arr = new Array();
							var cate2Obj = new Object();

							for (var i = 0; i < jsonData.length; i++) {

								if (jsonData[i].level == "2") {
									cate2Obj = new Object();
									cate2Obj.cateCode = jsonData[i].cateCode;
									cate2Obj.cateName = jsonData[i].cateName;
									cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;

									cate2Arr.push(cate2Obj);
								}
							}

							var cate2Select = $("select.category2")

							cate2Select.children().remove();

							$("option:selected", this)
									.each(
											function() {
												var selectVal = $(this).val();
												cate2Select
														.append("<option value='" + selectVal +"'>전체</option>");
												for (var i = 0; i < cate2Arr.length; i++) {
													if (selectVal == cate2Arr[i].cateCodeRef) {
														cate2Select
																.append("<option value='" + cate2Arr[i].cateCode + "'>"
																		+ cate2Arr[i].cateName
																		+ "</option>");
													}
												}

											});

						});
	</script>



	<%@ include file="../../includes/footer.jsp"%>
</body>

</html>