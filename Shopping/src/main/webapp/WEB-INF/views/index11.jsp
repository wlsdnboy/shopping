<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/navbar.jsp"%>
<!doctype html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/style.css" rel="stylesheet">





<title>Hello, world!</title>



</head>

<body>





	<video class="video-container" autoplay muted loop>
		<source src="resources/img/2022050315302500000091957.mp4">
	</video>
	<section>
		<div class="main_container" data-aos="fade-up">

			<img src="resources/img/i4p.jpg" class="imagesection">
			<div class="middle">
				<button class="Book-Button">LOOKBOOK</button>
			</div>
		</div>


		<div class="main_container" data-aos="fade-up">
			<img src="resources/img/stussy.webp" class="imagesection_1">
			<div class="middle-text">
				<button class="Book-Button">NEW</button>
			</div>
		</div>



		<div class="main_container" data-aos="fade-up">

			<img src="resources/img/stussy_next.webp" class="imagesection_2">
			<div class="middle-text_1">
				<button class="Book-Button">STORY</button>
			</div>
		</div>


		<div class="main_container" data-aos="fade-up">
			<img src="resources/img/i4p1.jpg" class="imagesection_3">
			<div class="middle_1">
				<button class="Book-Button">SALE</button>
			</div>
		</div>


	</section>








	<%@ include file="includes/footer.jsp"%>





	<script>
		AOS.init({
			duration : 1500
		});
	</script>



</body>

</html>
